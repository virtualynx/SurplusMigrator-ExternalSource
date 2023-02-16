CREATE INDEX IF NOT EXISTS master_account_name_idx ON master_account USING btree (name);

CREATE INDEX IF NOT EXISTS transaction_journal_bookdate_idx ON transaction_journal USING btree (bookdate DESC NULLS LAST);
CREATE INDEX IF NOT EXISTS transaction_journal_created_date_idx ON transaction_journal USING btree (created_date DESC NULLS LAST);

CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_detail_id_idx ON transaction_journal_detail USING btree (ref_detail_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_id_idx ON transaction_journal_detail USING btree (ref_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_subreference_id_idx ON transaction_journal_detail USING btree (subreference_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_subdetail_id_idx ON transaction_journal_detail USING btree (ref_subdetail_id);