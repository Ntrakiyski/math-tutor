INSERT INTO app_config (id, content_version, primary_learner_id, current_mode)
VALUES ('singleton', '0.1.0', 'learner_sister', 'onboarding')
ON CONFLICT (id) DO UPDATE
SET content_version = EXCLUDED.content_version,
    primary_learner_id = EXCLUDED.primary_learner_id,
    updated_at = now();

INSERT INTO learners (id, display_name, language, current_school_grade)
VALUES ('learner_sister', 'Learner', 'bg', 7)
ON CONFLICT (id) DO UPDATE
SET current_school_grade = EXCLUDED.current_school_grade,
    updated_at = now();

INSERT INTO learner_profiles (learner_id)
VALUES ('learner_sister')
ON CONFLICT (learner_id) DO NOTHING;

INSERT INTO learner_gamification (learner_id)
VALUES ('learner_sister')
ON CONFLICT (learner_id) DO NOTHING;
