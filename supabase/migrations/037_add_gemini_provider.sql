-- ============================================================
-- 035_add_gemini_provider.sql — Allow Gemini in AI constraints
--
-- Relaxes the CHECK constraints on ai_configs and ai_usage_log
-- to support the 'gemini' provider in addition to 'openai' and 'anthropic'.
-- ============================================================

-- ai_configs provider check
ALTER TABLE ai_configs DROP CONSTRAINT IF EXISTS ai_configs_provider_check;
ALTER TABLE ai_configs ADD CONSTRAINT ai_configs_provider_check 
  CHECK (provider IN ('openai', 'anthropic', 'gemini'));

-- ai_usage_log provider check
ALTER TABLE ai_usage_log DROP CONSTRAINT IF EXISTS ai_usage_log_provider_check;
ALTER TABLE ai_usage_log ADD CONSTRAINT ai_usage_log_provider_check 
  CHECK (provider IN ('openai', 'anthropic', 'gemini'));
