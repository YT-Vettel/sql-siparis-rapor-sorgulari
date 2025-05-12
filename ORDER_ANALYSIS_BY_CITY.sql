SELECT
-- O.ID AS S�PAR��ID,                     -- Her bir sipari�in benzersiz ID'si
-- O.DATE_ AS S�PAR��TAR�H�,             -- Sipari�in verildi�i tarih
-- I.DATE_ AS FATURATAR�H�,             -- Sipari�e ait faturan�n kesildi�i tarih

-- DATEPART(YEAR,O.DATE_) AS YIL,       -- Sipari�in y�l�
-- DATEPART(MONTH,O.DATE_) AS AY,       -- Sipari�in ay�
-- DATEPART(HOUR,O.DATE_) AS SAAT,      -- Sipari�in saati

CT.CITY, -- �ehir ismi
AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ORTALAMA_SIPARIS_SURESI, -- Ortalama sipari� s�resi (saat olarak)
MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENKISA_TESLIMATSURES�_SAAT, -- En k�sa teslimat s�resi
MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENUZUN_TESLIMATSURES�_SAAT, -- En uzun teslimat s�resi
SUM(O.TOTALPRICE) AS TOPLAM_SIPARIS_TUTARI,                       -- �ehre ait toplam sipari� tutar�
COUNT(O.ID) AS SIPARISSAYISI                                      -- �ehirdeki toplam sipari� say�s�

FROM ORDERS O
	INNER JOIN USERS U ON U.ID = O.USERID                  -- Sipari�i veren kullan�c� bilgisi
	INNER JOIN ADDRESS A ON A.ID = O.ADDRESSID             -- Sipari�in g�nderildi�i adres
	INNER JOIN CITIES CT ON CT.ID = A.CITYID               -- Adrese kar��l�k gelen �ehir bilgisi
	INNER JOIN TOWNS T ON T.ID = A.TOWNID                  -- �l�e bilgisi (kullan�lm�yor ama JOIN edilmi�)
	INNER JOIN DISTRICTS D ON D.ID = A.DISTRICTID          -- Mahalle bilgisi (kullan�lm�yor ama JOIN edilmi�)
	INNER JOIN PAYMENTS P ON P.ORDERID = O.ID              -- Sipari�in �deme bilgisi
	INNER JOIN INVOICES I ON I.ORDERID = O.ID              -- Sipari�e ait fatura bilgisi

GROUP BY CT.CITY                                           -- Veriler �ehir baz�nda gruplan�yor

-- DATEPART(YEAR,O.DATE_) ,DATEPART(MONTH,O.DATE_),DATEPART(HOUR,O.DATE_) -- Zaman bazl� grup i�in kullan�labilir (�u an yorum sat�r�nda)
-- HAVING AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_))>=34          -- Ortalama teslimat s�resi 34 saatten b�y�k olanlar (�u an devre d���)

ORDER BY 6 DESC                                             -- TOPLAM_SIPARIS_TUTARI s�tununa g�re azalan �ekilde s�ralan�r
