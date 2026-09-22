-- 005 · Repair the priority history constraint created by migration 004.
-- The original constraint contained a typo: "lsow" instead of "low".

ALTER TABLE request_history
DROP CONSTRAINT request_history_priority_values_check;

ALTER TABLE request_history
ADD CONSTRAINT request_history_priority_values_check
CHECK (
  (from_priority IS NULL OR from_priority IN ('low', 'medium', 'high')) AND
  (to_priority IS NULL OR to_priority IN ('low', 'medium', 'high'))
);