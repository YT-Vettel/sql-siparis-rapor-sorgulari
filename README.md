# sql-siparis-rapor-sorgulari
Sipariş verilerinin tarih, konum ve ürün kategorisine göre analizine yönelik "Fake data" ile yapılan SQL sorguları koleksiyonu. 
Uygulamalı pratik için şablon olarak kullanılabilir.

SQL Sipariş Raporu Sorguları
Bu depo, sipariş verilerinden raporlar ve analizler oluşturmayı amaçlayan bir dizi SQL sorgusu içerir. Sorgular, zaman, konum, ürün kategorileri ve müşteri arama işlemleri gibi başlıklara göre gruplanmıştır.

📂 Sorgu Listesi
Dosya Adı	Açıklama
getOrdersByDate.sql = 	Belirli tarihlere göre filtrelenmiş siparişleri listeler.
getOrdersByMonthAndDate.sql = 	Ay ve tarihe göre gruplanmış sipariş özetlerini gösterir.
getTotalOrdersGroupedByCity.sql =	Şehre göre gruplanmış toplam siparişleri toplar.
getOrderDistributionByProductCategory.sql =	Siparişlerin ürün kategorilerine göre nasıl dağıldığını gösterir.
mergeCountriesAndCities.sql	= Ülke ve şehir verilerini ilişkilendirilmiş şekilde birleştirir.
searchCustomerByName.sql = Müşterileri isimlerine göre kısmi eşleşme kullanarak arar.

🛠️ Teknolojiler
SQL (Standart SQL sözdizimi)

MySQL, SQL Server veya PostgreSQL gibi sistemlerle uyumludur (küçük sözdizimi değişiklikleriyle).

📌 Amaç
Bu sorgular şunlar için tasarlanmıştır:

SQL raporlama öğrenme

Gösterge panoları oluşturma

İlişkisel veritabanlarıyla analitik becerilerini geliştirme

Çoğaltabilir, özelleştirebilir veya katkıda bulunabilirsiniz!
