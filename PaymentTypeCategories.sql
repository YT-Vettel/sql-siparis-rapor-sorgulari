-- �DEME T�R�NE G�RE DA�ILIM

SELECT
    DATEPART(YEAR, DATE_) AS YIL,             -- Sipari� tarihinden y�l� al�r ve "YIL" olarak isimlendirir.
    DATEPART(MONTH, DATE_) AS AY,             -- Sipari� tarihinden ay� al�r ve "AY" olarak isimlendirir.

    CASE
        WHEN PAYMENTTYPE = 1 THEN 'KRED� KARTI'       -- PAYMENTTYPE 1 ise "KRED� KARTI" olarak g�ster
        WHEN PAYMENTTYPE = 2 THEN 'BANKA HAVALES�'    -- PAYMENTTYPE 2 ise "BANKA HAVALES�" olarak g�ster
    END AS ODEMETURU_ACIKLAMA,              -- CASE sonucu "ODEMETURU_ACIKLAMA" s�tunu olarak adland�r�l�r

    SUM(PAYMENTTOTAL) AS TOPLAMTUTAR        -- Ayn� y�l, ay ve �deme t�r�ndeki toplam �deme tutar�n� hesaplar

FROM PAYMENTS                                -- Veriler "PAYMENTS" tablosundan al�n�r

-- Y�l, ay ve �deme t�r�ne g�re gruplan�r (bu �ekilde toplam al�nabilir)
GROUP BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_),
    PAYMENTTYPE

-- Sonu�lar� �nce aya, sonra y�la g�re s�ralar (�rne�in Ocak aylar� en �stte olur)
ORDER BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_)
