SELECT
-- O.ID AS SÝPARÝÞID,                     -- Her bir sipariþin benzersiz ID'si
-- O.DATE_ AS SÝPARÝÞTARÝHÝ,             -- Sipariþin verildiði tarih
-- I.DATE_ AS FATURATARÝHÝ,             -- Sipariþe ait faturanýn kesildiði tarih

-- DATEPART(YEAR,O.DATE_) AS YIL,       -- Sipariþin yýlý
-- DATEPART(MONTH,O.DATE_) AS AY,       -- Sipariþin ayý
-- DATEPART(HOUR,O.DATE_) AS SAAT,      -- Sipariþin saati

CT.CITY, -- Þehir ismi
AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ORTALAMA_SIPARIS_SURESI, -- Ortalama sipariþ süresi (saat olarak)
MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENKISA_TESLIMATSURESÝ_SAAT, -- En kýsa teslimat süresi
MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENUZUN_TESLIMATSURESÝ_SAAT, -- En uzun teslimat süresi
SUM(O.TOTALPRICE) AS TOPLAM_SIPARIS_TUTARI,                       -- Þehre ait toplam sipariþ tutarý
COUNT(O.ID) AS SIPARISSAYISI                                      -- Þehirdeki toplam sipariþ sayýsý

FROM ORDERS O
	INNER JOIN USERS U ON U.ID = O.USERID                  -- Sipariþi veren kullanýcý bilgisi
	INNER JOIN ADDRESS A ON A.ID = O.ADDRESSID             -- Sipariþin gönderildiði adres
	INNER JOIN CITIES CT ON CT.ID = A.CITYID               -- Adrese karþýlýk gelen þehir bilgisi
	INNER JOIN TOWNS T ON T.ID = A.TOWNID                  -- Ýlçe bilgisi (kullanýlmýyor ama JOIN edilmiþ)
	INNER JOIN DISTRICTS D ON D.ID = A.DISTRICTID          -- Mahalle bilgisi (kullanýlmýyor ama JOIN edilmiþ)
	INNER JOIN PAYMENTS P ON P.ORDERID = O.ID              -- Sipariþin ödeme bilgisi
	INNER JOIN INVOICES I ON I.ORDERID = O.ID              -- Sipariþe ait fatura bilgisi

GROUP BY CT.CITY                                           -- Veriler þehir bazýnda gruplanýyor

-- DATEPART(YEAR,O.DATE_) ,DATEPART(MONTH,O.DATE_),DATEPART(HOUR,O.DATE_) -- Zaman bazlý grup için kullanýlabilir (þu an yorum satýrýnda)
-- HAVING AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_))>=34          -- Ortalama teslimat süresi 34 saatten büyük olanlar (þu an devre dýþý)

ORDER BY 6 DESC                                             -- TOPLAM_SIPARIS_TUTARI sütununa göre azalan þekilde sýralanýr
