CREATE INDEX IF NOT EXISTS master_account_name_idx ON master_account USING btree (name);
CREATE INDEX IF NOT EXISTS master_account_name_lowercase_idx ON master_account (lower(name));

CREATE INDEX IF NOT EXISTS transaction_journal_bookdate_idx ON transaction_journal USING btree (bookdate DESC NULLS LAST);
CREATE INDEX IF NOT EXISTS transaction_journal_created_date_idx ON transaction_journal USING btree (created_date DESC NULLS LAST);
--CREATE INDEX IF NOT EXISTS transaction_journal__idx_01 ON transaction_journal USING btree (strpos(tjournalid, 'SA'));

CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_detail_id_idx ON transaction_journal_detail USING btree (ref_detail_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_id_idx ON transaction_journal_detail USING btree (ref_id);
CREATE INDEX IF NOT exists transaction_journal_detail_ref_id_lower_idx ON transaction_journal_detail (lower(ref_id));
CREATE INDEX IF NOT EXISTS transaction_journal_detail_subreference_id_idx ON transaction_journal_detail USING btree (subreference_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_subdetail_id_idx ON transaction_journal_detail USING btree (ref_subdetail_id);
CREATE INDEX IF NOT exists transaction_journal_detail_tjournalidaccountid_idx ON transaction_journal_detail USING btree (tjournalid, accountid);
--CREATE INDEX IF NOT exists transaction_journal_detail__idx_01 ON transaction_journal_detail USING btree (strpos(subreference_id, 'SO'));

CREATE INDEX IF NOT EXISTS transaction_advance_refid_idx ON transaction_advance USING btree (refid);
CREATE INDEX IF NOT EXISTS transaction_advance_detail_refid_idx ON transaction_advance_detail USING btree (refid);
CREATE INDEX IF NOT EXISTS transaction_advance_detail_ref_detailid_idx ON transaction_advance_detail USING btree (ref_detailid);

CREATE INDEX IF NOT EXISTS sl_logproof_contract_idx ON "SL_Logproof" USING btree (contract);

CREATE INDEX IF NOT EXISTS transaction_payment_planning_detail_ref_id_idx ON transaction_payment_planning_detail USING btree (ref_id);
CREATE INDEX IF NOT EXISTS transaction_payment_planning_detail_ref_detail_id_idx ON transaction_payment_planning_detail USING btree (ref_detail_id);

CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_supplydetail_id_idx ON transaction_journal_detail USING btree (ref_supplydetail_id);
CREATE INDEX IF NOT EXISTS transaction_journal_detail_ref_supply_id_idx ON transaction_journal_detail USING btree (ref_supply_id);