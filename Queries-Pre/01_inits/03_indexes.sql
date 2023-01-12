CREATE INDEX IF NOT EXISTS transaction_journal_bookdate_idx ON transaction_journal USING btree (bookdate);
CREATE INDEX IF NOT EXISTS master_account_name_idx ON master_account USING btree (name);
CREATE INDEX IF NOT EXISTS transaction_journal_created_date ON transaction_journal USING btree (created_date DESC NULLS LAST);
