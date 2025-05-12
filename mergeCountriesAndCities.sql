SELECT ITEMNAME, SUM(UNITPRICE) AS TOPLAM_FIYAT, COUNT(*) AS SATIS_ADEDI
FROM ITEMS
GROUP BY ITEMNAME
HAVING COUNT(*) >= 4
ORDER BY SATIS_ADEDI DESC;
-- satýþ adedi en az 4 olan ürünler listenir ve her birinin toplam fiyatý hesaplanýr.

-- SUM() fonksiyonu, bir veri kümesindeki belirli bir sütunun toplamlarýný toplamak için kullanýlýr.

SELECT ITEMNAME, COUNT(ITEMCODE) AS adet
FROM ITEMS
GROUP BY ITEMNAME
ORDER BY adet DESC;
--Örneðin en çok satýlan veya ürünler
-- Temel alýnan sorgudaki kayýt sayýsýný saymak için Count kullanabilirsiniz. 

SELECT
    COUNTRIES.COUNTRY AS ÜLKE,
    USERS.NAMESURNAME AS ADSOYAD,
    ORDERS.DATE_ AS SÝPARÝÞTARÝHÝ
FROM 
    ORDERS
JOIN 
    USERS ON ORDERS.USERID = USERS.ID
JOIN 
    COUNTRIES ON USERS.COUNTRYID = COUNTRIES.ID;


UPDATE USERS
SET COUNTRYID = NULL
WHERE ID = '9679';
-- Ýçini null yapma kodu.

DELETE USERS WHERE ID = '9679';
-- Verilen ýd'yi silme kodu.

SELECT * FROM USERS
SELECT * FROM CITIES