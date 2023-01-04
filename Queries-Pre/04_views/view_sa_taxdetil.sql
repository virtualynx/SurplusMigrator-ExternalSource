DROP VIEW IF EXISTS view_sa_taxdetil;

CREATE VIEW view_sa_taxdetil AS
	select
		trim(trim(A.tjournaltaxid)) as KD_JENIS_TRANSAKSI,
		0 as KODE_OBJEK,
		replace(replace(replace(trim(trim(upper(I.description ||' ' || I.invoicedescription))),';',' '),',',' ' ),'"','') as NAMA,
		(A.sellprice) as HARGA_SATUAN ,
		1 as JUMLAH_BARANG,
		( A.sellprice * 1 ) as HARGA_TOTAL,
		0 as DISKON,
		( A.sellprice * 1 )  as DPP,
		( A.ppnamount * 1 ) as PPN,
		0 as TARIF_PPNBM,
		0 as PPNBM
	from 
		transaction_journal_tax  as A
		inner join transaction_journal as I on A.tjournalid = I.tjournalid
	where 
		A.is_disabled = false
;