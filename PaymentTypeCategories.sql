-- ÖDEME TÜRÜNE GÖRE DAÐILIM

SELECT
    DATEPART(YEAR, DATE_) AS YIL,             -- Sipariþ tarihinden yýlý alýr ve "YIL" olarak isimlendirir.
    DATEPART(MONTH, DATE_) AS AY,             -- Sipariþ tarihinden ayý alýr ve "AY" olarak isimlendirir.

    CASE
        WHEN PAYMENTTYPE = 1 THEN 'KREDÝ KARTI'       -- PAYMENTTYPE 1 ise "KREDÝ KARTI" olarak göster
        WHEN PAYMENTTYPE = 2 THEN 'BANKA HAVALESÝ'    -- PAYMENTTYPE 2 ise "BANKA HAVALESÝ" olarak göster
    END AS ODEMETURU_ACIKLAMA,              -- CASE sonucu "ODEMETURU_ACIKLAMA" sütunu olarak adlandýrýlýr

    SUM(PAYMENTTOTAL) AS TOPLAMTUTAR        -- Ayný yýl, ay ve ödeme türündeki toplam ödeme tutarýný hesaplar

FROM PAYMENTS                                -- Veriler "PAYMENTS" tablosundan alýnýr

-- Yýl, ay ve ödeme türüne göre gruplanýr (bu þekilde toplam alýnabilir)
GROUP BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_),
    PAYMENTTYPE

-- Sonuçlarý önce aya, sonra yýla göre sýralar (örneðin Ocak aylarý en üstte olur)
ORDER BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_)
