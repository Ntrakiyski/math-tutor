-- Math Tutor MVP database schema
-- Single learner, no authentication, no RLS.
-- Intended for InsForge Postgres. All IDs are application-generated UUIDs unless stated.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS app_config (
  id text PRIMARY KEY DEFAULT 'singleton',
  content_version text NOT NULL DEFAULT '0.1.0',
  primary_learner_id text NOT NULL DEFAULT 'learner_sister',
  current_mode text NOT NULL DEFAULT 'onboarding',
  settings jsonb NOT NULL DEFAULT '{}'::jsonb,
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK (id = 'singleton')
);

CREATE TABLE IF NOT EXISTS learners (
  id text PRIMARY KEY,
  display_name text NOT NULL,
  language text NOT NULL DEFAULT 'bg',
  current_school_grade integer,
  onboarding_completed boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS learner_profiles (
  learner_id text PRIMARY KEY REFERENCES learners(id) ON DELETE CASCADE,
  explicit_preferences jsonb NOT NULL DEFAULT '{}'::jsonb,
  operational_persona jsonb NOT NULL DEFAULT '{}'::jsonb,
  placement_summary jsonb NOT NULL DEFAULT '{}'::jsonb,
  current_session_state jsonb NOT NULL DEFAULT '{}'::jsonb,
  profile_version integer NOT NULL DEFAULT 1,
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS persona_hypotheses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  category text NOT NULL,
  scope jsonb NOT NULL DEFAULT '{}'::jsonb,
  claim_bg text NOT NULL,
  source_type text NOT NULL CHECK (source_type IN ('explicit','observed','operator','derived')),
  status text NOT NULL DEFAULT 'forming' CHECK (status IN ('forming','active','conflicted','rejected','superseded')),
  confidence numeric(5,4) NOT NULL DEFAULT 0.25 CHECK (confidence BETWEEN 0 AND 1),
  evidence_count integer NOT NULL DEFAULT 0,
  evidence_event_ids uuid[] NOT NULL DEFAULT '{}',
  last_confirmed_at timestamptz,
  supersedes_id uuid REFERENCES persona_hypotheses(id),
  operator_note text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_persona_hypotheses_learner_status
  ON persona_hypotheses(learner_id, status);

CREATE TABLE IF NOT EXISTS learning_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  mode text NOT NULL CHECK (mode IN ('onboarding','diagnostic','teaching','assessment','reflection')),
  status text NOT NULL DEFAULT 'active' CHECK (status IN ('active','completed','abandoned','interrupted')),
  objective jsonb NOT NULL DEFAULT '{}'::jsonb,
  started_at timestamptz NOT NULL DEFAULT now(),
  ended_at timestamptz,
  summary jsonb NOT NULL DEFAULT '{}'::jsonb
);
CREATE INDEX IF NOT EXISTS idx_learning_sessions_learner_started
  ON learning_sessions(learner_id, started_at DESC);

CREATE TABLE IF NOT EXISTS chat_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES learning_sessions(id) ON DELETE CASCADE,
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  role text NOT NULL CHECK (role IN ('learner','agent','system','operator')),
  content text,
  structured_payload jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_chat_messages_session_created
  ON chat_messages(session_id, created_at);

CREATE TABLE IF NOT EXISTS learning_blocks (
  id text PRIMARY KEY,
  response_id text NOT NULL,
  session_id uuid NOT NULL REFERENCES learning_sessions(id) ON DELETE CASCADE,
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  content_item_id text,
  block_type text NOT NULL,
  topic_ids text[] NOT NULL DEFAULT '{}',
  thinking_competency_ids text[] NOT NULL DEFAULT '{}',
  support_level integer NOT NULL DEFAULT 0 CHECK (support_level BETWEEN 0 AND 6),
  payload jsonb NOT NULL,
  expected_answer jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz
);
CREATE INDEX IF NOT EXISTS idx_learning_blocks_session
  ON learning_blocks(session_id, created_at);

CREATE TABLE IF NOT EXISTS interaction_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES learning_sessions(id) ON DELETE CASCADE,
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  block_id text NOT NULL REFERENCES learning_blocks(id) ON DELETE CASCADE,
  content_item_id text,
  event_type text NOT NULL,
  payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  duration_ms integer NOT NULL DEFAULT 0,
  change_count integer NOT NULL DEFAULT 0,
  hint_count integer NOT NULL DEFAULT 0,
  confidence text CHECK (confidence IN ('guess','unsure','mostly','certain')),
  support_level integer NOT NULL DEFAULT 0 CHECK (support_level BETWEEN 0 AND 6),
  occurred_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_interaction_events_learner_time
  ON interaction_events(learner_id, occurred_at DESC);
CREATE INDEX IF NOT EXISTS idx_interaction_events_content_item
  ON interaction_events(content_item_id);

CREATE TABLE IF NOT EXISTS attempts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES learning_sessions(id) ON DELETE CASCADE,
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  block_id text NOT NULL REFERENCES learning_blocks(id) ON DELETE CASCADE,
  content_item_id text,
  topic_ids text[] NOT NULL DEFAULT '{}',
  submitted_answer jsonb NOT NULL,
  correct boolean,
  score numeric(6,4),
  independent boolean NOT NULL DEFAULT false,
  support_level integer NOT NULL DEFAULT 0,
  hint_count integer NOT NULL DEFAULT 0,
  confidence text,
  misconception_tags text[] NOT NULL DEFAULT '{}',
  representation text,
  familiarity text CHECK (familiarity IN ('familiar','varied','novel')),
  evaluation jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_attempts_learner_created
  ON attempts(learner_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_attempts_topics
  ON attempts USING gin(topic_ids);

CREATE TABLE IF NOT EXISTS learner_skill_states (
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  topic_id text NOT NULL,
  state text NOT NULL DEFAULT 'unseen'
    CHECK (state IN ('unseen','observed','developing','provisional_mastery','reliable_mastery','fragile','needs_remediation')),
  mastery numeric(5,4) NOT NULL DEFAULT 0 CHECK (mastery BETWEEN 0 AND 1),
  conceptual_understanding numeric(5,4) NOT NULL DEFAULT 0 CHECK (conceptual_understanding BETWEEN 0 AND 1),
  procedural_accuracy numeric(5,4) NOT NULL DEFAULT 0 CHECK (procedural_accuracy BETWEEN 0 AND 1),
  independence numeric(5,4) NOT NULL DEFAULT 0 CHECK (independence BETWEEN 0 AND 1),
  retention numeric(5,4) NOT NULL DEFAULT 0 CHECK (retention BETWEEN 0 AND 1),
  confidence numeric(5,4) NOT NULL DEFAULT 0 CHECK (confidence BETWEEN 0 AND 1),
  support_level integer NOT NULL DEFAULT 6 CHECK (support_level BETWEEN 0 AND 6),
  misconception_tags text[] NOT NULL DEFAULT '{}',
  evidence_summary jsonb NOT NULL DEFAULT '{}'::jsonb,
  last_attempt_at timestamptz,
  next_review_at timestamptz,
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (learner_id, topic_id)
);
CREATE INDEX IF NOT EXISTS idx_skill_states_review
  ON learner_skill_states(learner_id, next_review_at)
  WHERE next_review_at IS NOT NULL;

CREATE TABLE IF NOT EXISTS learner_thinking_states (
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  competency_id text NOT NULL,
  mastery numeric(5,4) NOT NULL DEFAULT 0 CHECK (mastery BETWEEN 0 AND 1),
  independence numeric(5,4) NOT NULL DEFAULT 0 CHECK (independence BETWEEN 0 AND 1),
  support_level integer NOT NULL DEFAULT 6 CHECK (support_level BETWEEN 0 AND 6),
  evidence_summary jsonb NOT NULL DEFAULT '{}'::jsonb,
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (learner_id, competency_id)
);

CREATE TABLE IF NOT EXISTS diagnostic_runs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES learning_sessions(id) ON DELETE CASCADE,
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  content_version text NOT NULL,
  start_grade integer NOT NULL DEFAULT 4,
  recommended_grade_band integer,
  confidence numeric(5,4) CHECK (confidence BETWEEN 0 AND 1),
  domain_results jsonb NOT NULL DEFAULT '{}'::jsonb,
  critical_gaps text[] NOT NULL DEFAULT '{}',
  surface_dependence jsonb NOT NULL DEFAULT '{}'::jsonb,
  result_explanation_bg text,
  completed_at timestamptz
);

CREATE TABLE IF NOT EXISTS strategy_trials (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  session_id uuid REFERENCES learning_sessions(id) ON DELETE SET NULL,
  topic_id text,
  strategy jsonb NOT NULL,
  before_state jsonb NOT NULL DEFAULT '{}'::jsonb,
  after_state jsonb NOT NULL DEFAULT '{}'::jsonb,
  outcome text CHECK (outcome IN ('improved','unchanged','worse','inconclusive')),
  evidence_event_ids uuid[] NOT NULL DEFAULT '{}',
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_strategy_trials_learner
  ON strategy_trials(learner_id, created_at DESC);

CREATE TABLE IF NOT EXISTS review_queue (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  topic_id text NOT NULL,
  review_type text NOT NULL CHECK (review_type IN ('retention_direct','retention_transfer','misconception_recheck')),
  due_at timestamptz NOT NULL,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','completed','cancelled')),
  source_attempt_id uuid REFERENCES attempts(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz
);
CREATE INDEX IF NOT EXISTS idx_review_queue_due
  ON review_queue(learner_id, status, due_at);

CREATE TABLE IF NOT EXISTS achievements (
  id text PRIMARY KEY,
  name_bg text NOT NULL,
  description_bg text NOT NULL,
  trigger_key text NOT NULL,
  xp integer NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS learner_achievements (
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  achievement_id text NOT NULL REFERENCES achievements(id) ON DELETE CASCADE,
  evidence jsonb NOT NULL DEFAULT '{}'::jsonb,
  earned_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (learner_id, achievement_id)
);

CREATE TABLE IF NOT EXISTS learner_gamification (
  learner_id text PRIMARY KEY REFERENCES learners(id) ON DELETE CASCADE,
  xp integer NOT NULL DEFAULT 0,
  current_streak integer NOT NULL DEFAULT 0,
  longest_streak integer NOT NULL DEFAULT 0,
  last_active_date date,
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS admin_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id text NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
  note text NOT NULL,
  related_topic_ids text[] NOT NULL DEFAULT '{}',
  related_hypothesis_id uuid REFERENCES persona_hypotheses(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS content_versions (
  version text PRIMARY KEY,
  manifest jsonb NOT NULL,
  activated_at timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE VIEW admin_skill_overview AS
SELECT
  s.learner_id,
  s.topic_id,
  s.state,
  s.mastery,
  s.conceptual_understanding,
  s.procedural_accuracy,
  s.independence,
  s.retention,
  s.confidence,
  s.support_level,
  s.misconception_tags,
  s.last_attempt_at,
  s.next_review_at,
  s.updated_at
FROM learner_skill_states s;

CREATE OR REPLACE VIEW admin_persona_overview AS
SELECT
  p.learner_id,
  p.id AS hypothesis_id,
  p.category,
  p.scope,
  p.claim_bg,
  p.source_type,
  p.status,
  p.confidence,
  p.evidence_count,
  p.last_confirmed_at,
  p.operator_note,
  p.updated_at
FROM persona_hypotheses p;

CREATE OR REPLACE VIEW admin_recent_sessions AS
SELECT
  s.id,
  s.learner_id,
  s.mode,
  s.status,
  s.objective,
  s.started_at,
  s.ended_at,
  s.summary,
  count(DISTINCT a.id) AS attempt_count,
  count(DISTINCT e.id) AS event_count
FROM learning_sessions s
LEFT JOIN attempts a ON a.session_id = s.id
LEFT JOIN interaction_events e ON e.session_id = s.id
GROUP BY s.id;
