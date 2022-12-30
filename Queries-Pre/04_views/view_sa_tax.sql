DROP VIEW IF EXISTS view_sa_tax;

CREATE VIEW view_sa_tax AS
	SELECT  
		SUBSTRING(LTRIM(RTRIM(R.fakturid)), 1, 2) AS KD_JENIS_TRANSAKSI, 
		'0' AS FG_PENGGANTI, 
		SUBSTRING(LTRIM(RTRIM(REPLACE(REPLACE(R.fakturid, '.', ''), '-', ''))), 
		4, 
		LENGTH(LTRIM(RTRIM(REPLACE(REPLACE(R.fakturid, '.', ''), '-', ''))))) AS NOMOR_FAKTUR, 
		to_char(A.bookdate, 'YYYY-MM') AS MASA_PAJAK,
		to_char(A.bookdate, 'YYYY') AS TAHUN_PAJAK,
	    R."date" AS TANGGAL_FAKTUR, 
	    II.vendorid, 
	    LTRIM(RTRIM(REPLACE(REPLACE(II.npwp, '.', ''), '-', ''))) AS NPWP,       
	    (
	    	SELECT     
	    		REPLACE(LTRIM(RTRIM(name)), '"', '') AS Expr1      
	    	FROM          
	    		master_vendor_tax
	        WHERE      
	        	(vendorid = A.vendorid)
	        limit 1
		) AS NAMA,
		(
			SELECT     
				address
			FROM          
				master_vendor_tax
			WHERE      
	        	(vendorid = A.vendorid)
	        limit 1
		) AS ALAMAT_LENGKAP, 
		R.dasarpengenaan AS JUMLAH_DPP, 
		R.ppnamount AS JUMLAH_PPN, 
		0 AS JUMLAH_PPNBM, 
		'' AS ID_KETERANGAN_TAMBAHAN, 
		0 AS FG_UANG_MUKA, 
		0 AS UANG_MUKA_DPP, 
		0 AS UANG_MUKA_PPN, 
		0 AS UANG_MUKA_PPNBM, 
		A.tjournalid AS REFERENSI, 
		A.created_by,   
		A.periodid
	FROM         
		transaction_journal AS A 
		INNER join transaction_journal_tax AS R ON A.tjournalid = R.tjournaltaxid  
		INNER join master_vendor AS II ON A.vendorid = II.vendorid
	WHERE 
		A.is_disabled = false
;