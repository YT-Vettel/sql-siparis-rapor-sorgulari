SELECT ITEMNAME, SUM(UNITPRICE) AS TOPLAM_FIYAT, COUNT(*) AS SATIS_ADEDI
FROM ITEMS
GROUP BY ITEMNAME
HAVING COUNT(*) >= 4
ORDER BY SATIS_ADEDI DESC;
-- sat�� adedi en az 4 olan �r�nler listenir ve her birinin toplam fiyat� hesaplan�r.

-- SUM() fonksiyonu, bir veri k�mesindeki belirli bir s�tunun toplamlar�n� toplamak i�in kullan�l�r.

SELECT ITEMNAME, COUNT(ITEMCODE) AS adet
FROM ITEMS
GROUP BY ITEMNAME
ORDER BY adet DESC;
--�rne�in en �ok sat�lan veya �r�nler
-- Temel al�nan sorgudaki kay�t say�s�n� saymak i�in Count kullanabilirsiniz. 

SELECT
    COUNTRIES.COUNTRY AS �LKE,
    USERS.NAMESURNAME AS ADSOYAD,
    ORDERS.DATE_ AS S�PAR��TAR�H�
FROM 
    ORDERS
JOIN 
    USERS ON ORDERS.USERID = USERS.ID
JOIN 
    COUNTRIES ON USERS.COUNTRYID = COUNTRIES.ID;


UPDATE USERS
SET COUNTRYID = NULL
WHERE ID = '9679';
-- ��ini null yapma kodu.

DELETE USERS WHERE ID = '9679';
-- Verilen �d'yi silme kodu.

SELECT * FROM USERS
SELECT * FROM CITIES