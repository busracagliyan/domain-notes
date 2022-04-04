ACTIVE DIRECTORY 
------

### Active Directory Nedir? 

Active directory bir dizin servisidir. İçerisinde server (sucunu), client, printer ve user gibi bilgileri tutar. Aynı zamanda veri tabanı görevi görür. AD içerisinde yer alan Group Policy yönetim aracı ile çeşitli kısıtlamalar yapabilir veya tek bir noktadan istediğimiz uygulamanın dağıtımını gerçekleştirebiliriz. Kaynakların kontrolünü sağlar, yönetiminin merkezileştirir ve kolaylaştırır. Bu yüzden çok tercih edilen bir servistir.

### Active Directory hizmeti:

- Diğer dizin servislerine erişmek için kullanılan açık bir standart olan Lightweight Directory Access Protocol (LDAP) ile ağdaki kullanıcı nesneleri, bilgisayarlar ve hizmetler hakkında bilgi sağlar. Bu bilgileri güvenli bir veri tabanında saklar ve dizini yönetmek ve aramak için araçlar sunar,
- Kullanıcı hesaplarını ve kaynaklarını yönetmeye izin verir, bir kuruluşun ihtiyaç duyduğu şekilde tutarlı politikalar uygular.
- Secure Sockets Layer (SSL) ve Kerberos tabanlı kimlik doğrulama ilkelerini kullanarak güvenlik protokolü uygular,
- Daha iyi ölçeklenebilirlik sağlamak için eş zamanlı güncellemeleri olan birden fazla sunucuda veri kullanılabilirliği avantajlarını sağlar.

### Active Directory Özellikleri 

> - Yönetilebilirlik
> - Ölçeklenebilirlik 
> - Genişletilebilirlik
> - Güvenlik Entegrasyonu
> - Diğer Dizin Servisleriyle Birlikte Çalışabilme 
> - Güvenli Kimlik Doğrulama ve Yetkilendirme 
> - Group Policy ile Yönetim 
> - Dns ve Dhcp gibi Servislerle Birlikte Çalışabilme Özelliği 

### Active Directory Yapısı 
    
  #### Mantıksal Yapısı
  
  - Domain:  
      Active Directory’nin en temel bileşenidir. Domain sistem yöneticisi tarafından benzersiz bir isim seçilerek oluşturulmalıdır.				
  
  - Organizational Unit:  
      Bir domain içerisindeki kullanıcıları, grupları veya bilgisayarları organize etmek amacıyla oluşturulmuş objelerdir. Organizasyonun ihtiyacını karşılamak ve yönetimi kolaylaştırmak noktasında objeleri gruplamak amacıyla kullanılır.
  
  - Tree:   
      Yapısına yeni bir Domain eklendiği zaman, yeni eklenen Domain sondan eklendiği Domain’inin Child Domain’i durumunda olur ve eklendiği Domain de eklenen Domain için Parent Domain olur. Yeni oluşturulan Child Domain’in ismi Parent Domain’den gelen isimle birleştirilir ve yeni oluşan Domain’in DNS ismi ortaya çıkar.						
  
  - Forest:    
      Birden fazla Tree’nin birleşmiş halidir.
  
  - Global Catalog:   
      Genelde ilk domain controller'dır. AD foresttaki her objeyi içerisinde bulundurur. Kullanıcıların foresttaki kaynakları bulmasına yardımcı olan dc'dir.
  
  - Trust Relationship
       İki farklı domain arasında veri ve kaynak paylaşımı için kurulan güven ilişkisine denir.
  
  - LDAP:  
      TCP/IP üzerinde çalışan dizin servislerini sorgulama ve değiştirme amacıyla kullanılan uygulama katmanı protokolüdür. Active Directory mimarisi içerisinde ise sorgulama (query) ve güncelleme (update) için kullanılan, temel bir directory servis protokolüdür.
  
      - Distinguished Name:         
          Tüm Active Directory objeleri, network ortamında kendilerine ulaşılmasını sağlayan komple path içeren, distinguished name’e sahiptir. 

            CN=busrapc, OU=pardus, DC=pardus, DC=test DC=tr 

      - Relative Distinguished Name:   
          LDAP distinguished name içerisinde yer alır ve objeye ait eşsiz (unique) tanımlamayı içerir. Yani Active Directory içinde belirtilen Domain içinde tektir. 

            CN=busrapc, OU=pardus, DC=pardus, DC=test DC=tr 

          pardus.test.tr içinde tek olan Relative Distingished Name busrapc‘dir. 

  #### Fiziksel Yapısı 
  
  - Domain Controller:   
      Üzerinde Active Directory veritabanının bir kopyasını bulunduran sunucudur. Domain’de yapılan herhangi bir değişiklik bir Domain Controller üzerinde gerçekleştirilir ve daha sonra domain’deki tüm Domain Controller’lar bu değişiklikleri replikasyon yoluyla birbirlerine kopyalarlar.
  
  - Sites:   
      Birbirlerine yüksek bant genişliğine sahip dış hatlarla bağlanmış bir veya birden fazla IP alt ağlarını ifade etmektedir. Site’ları doğru bir şekilde yapılandırarak kullanıcıların logon işlemlerinde oluşan ağ trafiğini ve replikasyon işlemleri sırasında oluşan yoğunluğu en aza indirgemek için Active Directory’nin alt ağlar arasındaki fiziksel bağlantıları en efektif şekilde kullanmasını sağlayabiliriz. Site oluşturmaktaki başlıca sebepler şunlardır: 
    
    - Replikasyon trafiğinin optimize edilmesi 
    
    - Kullanıcıların logon esnasında en hızlı ve en güvenilir bağlantıyı kullanarak doğru Domain Controller’ı bulabilmeleri 
  
  - Active Directory ve DNS:   
      Active Directory ve DNS entegrasyonu Windows Server sisteminin en önemli özelliklerinden biridir. Active Directory ve DNS, objelerin hem Active Directory objeleri hem de DNS domainleri ve kaynak kayıtları (Resource Records) olarak sunulabilecek şekilde benzer bir hiyerarşik isimlendirme yapısına sahiptirler. Bu entegrasyonun sonucu olarak Windows Server ağındaki bilgisayarlar, Active Directory’ye özgü birtakım servisleri çalıştıran bilgisayarların yerini öğrenmek için DNS sunucuları kullanmaktadırlar.
      

### Active Directory FSMO (Flexible Single Master of Operation) Rolleri 
- Schema Master:   
    AD DS yapıdaki nesnelerin sahip olacağı özellikleri belirleyen bileşendir. Örneğin, kullanıcı nesnesinde ad, soyad, şehir, görev gibi bilgilerin olacağını Schema belirler. Bu rol üzerinde sadece Domain Admins ve Enterprice Admins grubu üyelerinin yetkileri vardır. 

- Domain Naming Master:     
    Domain isimlerini bünyesinde tutar. Domainlerin isimlerinin aynı olmasını engeller. 

- PDC Emulator:   
    Ağda bulunan dcler arasında replikasyon sağlar. Windows oturumlarını kontrol eder. 

- RID Master:  
    Ağda bulunan nesnelerin SID numarası vardır. Nesnelerin benzersiz SID numarası almasını sağlar ve çakışmayı önler. 

- Infrastructure Master:  
    Farklı domainden gelen kullanıcıların SID ayarlamalarını gerçekleştirir. Global catalog ile replikasyon sağlar. 
