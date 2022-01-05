CREATE DATABASE Gamerary

CREATE TABLE Account (
    accountID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    firstName nvarchar(50) NOT NULL,
	lastName nvarchar(50) NOT NULL,
	birthdate nvarchar(10) NOT NULL,
    userAddress nvarchar(200),
	phoneNumber nvarchar(10) NOT NULL,
	eMail nvarchar (50) NOT NULL,
	passwrd nvarchar (50) NOT NULL,
	uAccountID int
);

CREATE TABLE UserAccount (
	uAccountID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    uFirstName nvarchar(50) NOT NULL,
	uLastName nvarchar(50) NOT NULL,
	uBirthdate nvarchar(10) NOT NULL,
    uUserAddress nvarchar(200),
	uPhoneNumber nvarchar(10) NOT NULL,
	uEMail nvarchar (50) NOT NULL,
	uPasswrd nvarchar (50) NOT NULL

);

CREATE TABLE GameList (
	gameListID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    uAccountID int,
	gameID int,
);

CREATE TABLE Game (
    gameID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	platformID int,
	genreID int,
	gameName nvarchar(50) NOT NULL,
	publisherName nvarchar(50) NOT NULL,
	developerName nvarchar(50) NOT NULL,
	releaseDate nvarchar(10) NOT NULL,
	price money NOT NULL,
	rating float,
	content nvarchar(500) NOT NULL,
);

CREATE TABLE Genre (
	genreID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	genre nvarchar(30) NOT NULL
);


CREATE TABLE GamePlatform (
	platformID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	platformName nvarchar(30),
);




ALTER TABLE Game
ADD CONSTRAINT
FK_Game_GamePlatform
FOREIGN KEY(platformID)
REFERENCES GamePlatform(platformID);

ALTER TABLE Game
ADD CONSTRAINT
FK_Game_Genre
FOREIGN KEY(genreID)
REFERENCES Genre(genreID);

ALTER TABLE GameList
ADD CONSTRAINT
FK_GameList_Game
FOREIGN KEY(gameID)
REFERENCES Game(gameID);

ALTER TABLE GameList
ADD CONSTRAINT
FK_GameList_UserAccount
FOREIGN KEY(uAccountID)
REFERENCES UserAccount(uAccountID);

ALTER TABLE Account
ADD CONSTRAINT
FK_Account_UserAccount
FOREIGN KEY(uAccountID)
REFERENCES UserAccount(uAccountID);




INSERT INTO Account(firstName, lastName, birthdate, userAddress, phoneNumber, eMail, passwrd) 
values ('Büşra', 'Çetinkaya', '01-01-2001', 'New York', '5554443322', 'busra_cetinkaya@hotmail.com', '_CtNKyBsR?'),

('Alperen', 'Bayrakdar', '01-01-2000', 'Kyoto', '5552223311', 'alperen_bayrakdar@hotmail.com', '?_ByRkDr35!'),

('Turgutefe', 'Akşit', '01-01-1999', 'Konya/Kadınhanı/4312. Sk', '555446699', 'turgutefe_aksit@hotmail.com', 'TeFe!_?.')




INSERT INTO Genre (genre) values ('Abstract'), ('Action'), ('Adventure'), ('Bluffing'), ('Casual'), 
('MOBA'), ('Cooperative'), ('Deck Building'), ('Dexterity'), ('Dungeon Crawler'), ('Economic'), ('Exploration'), 
('Indie'), ('Roguelike'), ('RPG'), ('Sandbox'), ('Sports'), ('Story Rich'), ('Strategy'), ('Shooter')




INSERT INTO GamePlatform(platformName) values ('PC'), ('Console'), ('Board Game') 




INSERT INTO Game(platformID, gameName, genreID, publisherName, developerName, releaseDate, price, content) values ((select platformID from
GamePlatform where platformName = 'Board Game'), 'Shobu', 
(select genreID from Genre where genre = 'Abstract'), 'Smirk & Laughter Games', 'Manolis Vranas, Jamie Sajdak', '2019-08-21', '$52', '2 oyuncu için güzel hazırlanmış bir soyut strateji oyunudur. Oyunda 4 kare ahşap tahta (her renkten 2 adet) ve her oyuncu için iki renkte 16 doğal nehir taşı bulunur ve oyun alanını ikiye bölen bir ip bulunur. GO veya SATRANÇ hissini uyandırır, ancak kendine özgü bir meydan okuma sağlar. Hemen tanıdık geliyor ve yine de tamamen farklı ve ilgi çekici.'),

((select platformID from
GamePlatform where platformName = 'Board Game'), 'Santorini', 
(select genreID from Genre where genre = 'Abstract'), 'Roxley', 'Unknown', '2004-01-01', '$30', 'Yunanistan daki Santorini Adası ndaki kayalık köylerin mimarisinden esinlenen ve esas olarak iki oyuncu için tasarlanan oyun, oyuncuların her turda üç seviyeye kadar yapı parçaları yerleştirerek bir kasaba inşa ettiği bir ızgarada oynanır. Oyunu kazanmak için oyuncuların iki karakterden birini şehrin üçüncü seviyesine taşıyın.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Hive', 
(select genreID from Genre where genre = 'Abstract'), 'Gen42 Games', 'John Yianni', '2001-01-01', '$31', 'Bir tahta ile sınırlandırılmamış ve herhangi bir düz yüzeyde herhangi bir yerde oynanabilen, iki oyuncu için oldukça bağımlılık yapan bir stratejik oyundur. Kovan, her biri benzersiz bir hareket tarzına sahip çeşitli canlılara benzeyen on bir siyah ve on bir beyaz olmak üzere yirmi iki parçadan oluşur.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Azur', 
(select genreID from Genre where genre = 'Abstract'), 'Plan B Games', 'Michael Kiesling', '2017-01-01', '$35', 'Azul oyununda, oyuncular sırayla tedarikçilerden kendi oyuncu tahtalarına renkli fayanslar hazırlarlar. Turun ilerleyen saatlerinde oyuncular, sarayı dekore etmek için taşlarını nasıl yerleştirdiklerine bağlı olarak puan kazanırlar. Belirli kalıplar ve tamamlama setleri için ekstra puanlar verilir; boşa harcanan malzemeler oyuncunun puanına zarar verir. Oyunun sonunda en çok puana sahip olan oyuncu kazanır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Tak', 
(select genreID from Genre where genre = 'Abstract'), 'Cheapass Games', 'James Ernest, Patrick Rothfuss', '2017-01-01', '$89', 'Tak, Pat Rothfuss tarafından "The Wise Man s Fear" da hayal edilen ve James Ernest tarafından gerçeğe dönüştürülen iki oyunculu soyut bir strateji oyunudur. Oyuncular, tahtanın iki karşıt tarafını birbirine bağlayan taşlarından bir yol yapmaya çalışırlar.'),




((select platformID from
GamePlatform where platformName = 'Board Game'), 'Monopoly', 
(select genreID from Genre where genre = 'Economic'), 'Alga', 'Charles Darrow, Elizabeth J. Magie (Phillips)', '1933-01-01', '$21', 'Oyuncular arazi sahiplerinin rolünü alarak arazilerini satın almaya ve sonra geliştirmeye çalışırlar. Diğer oyuncular mülklerini ziyaret ederek gelir elde eder ve diğer oyunculara ait mülkleri ziyaret ettiklerinde para harcanır. Zaman zorlaştığında, oyuncular para cezaları, vergiler ve diğer talihsizlikler için nakit toplamak için mülklerini ipotek etmek zorunda kalabilirler.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Brass: Birmingham', 
(select genreID from Genre where genre = 'Economic'), 'Roxley', 'Gavan Brown, Matt Tolman, Martin Wallace', '2018-01-01', '$156', 'Brass: Birmingham, Martin Wallace ın 2007 başyapıtı Brass in devamı niteliğinde bir ekonomik strateji oyunudur. Brass: Birmingham, 1770-1870 yılları arasında sanayi devrimi sırasında Birmingham da rekabet eden girişimcilerin hikayesini anlatıyor.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Terraforming Mars', 
(select genreID from Genre where genre = 'Economic'), 'FryxGames', 'Jacob Fryxelius', '2016-01-01', '$68', '2400 lerde insanlık Mars gezegenini dünyalaştırmaya başlar. Dünya Hükümeti tarafından desteklenen dev şirketler, çevre yaşanabilir hale gelene kadar sıcaklığı, oksijen seviyesini ve okyanus kapsamını artırmak için büyük projeler başlatıyor. Terraforming Mars ta, bu şirketlerden birini oynuyorsunuz.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Great Western Trail', 
(select genreID from Genre where genre = 'Economic'), 'eggertspiele', 'Alexander Pfister', '2016-01-01', '$90', 'Sürünüzü akıllıca yönetir ve Great Western Trail in fırsatları ve tuzakları arasında gezinirseniz, kesinlikle en fazla zafer puanı kazanacak ve oyunu kazanacaksınız.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Gaia Project', 
(select genreID from Genre where genre = 'Economic'), 'Feuerland Spiele', 'Jens Drögemüller, Helge Ostertag', '2017-01-01', '$150', 'Gaia Project, Terra Mystica çizgisinde yeni bir oyundur. Orijinal Terra Mystica da olduğu gibi, on dört farklı grup yedi farklı gezegende yaşıyor ve her grup kendi gezegenlerine bağlı, bu yüzden gelişmek ve büyümek için komşu gezegenleri diğer gruplarla rekabet halinde kendi ev ortamlarına dönüştürmeleri gerekiyor. . Ek olarak, Gaia gezegenleri kolonizasyon için tüm fraksiyonlar tarafından kullanılabilir ve Boyutötesi gezegenler Gaia gezegenlerine dönüştürülebilir.'),




((select platformID from
GamePlatform where platformName = 'Board Game'), 'Deception: Murder In Hong Kong', 
(select genreID from Genre where genre = 'Bluffing'), 'Jolly Thinkers', 'Tobey Ho', '2014-01-01', '$31', 'Yaklaşık 20 dakika içinde oynanan 4-12 oyuncu için bir tümdengelim ve aldatma oyunudur. Oyunda oyuncular, bir cinayet davasını çözmeye çalışan müfettişlerin rollerini üstlenirler ancak bir terslik var. Katil dedektiflerden biri! Her oyuncunun rolü ve ekibi oyunun başında rastgele atanır ve Adli Bilim Adamı, Tanık, Araştırmacı, Katil ve Suç Ortağı nın benzersiz rollerini içerir. Müfettişler gerçeği ortaya çıkarmaya çalışırken, katilin ekibi aldatmak ve yanıltmak zorundadır. Bu bir zeka savaşı!'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Battlestar Galactica: The Board Game', 
(select genreID from Genre where genre = 'Bluffing'), 'Fantasy Flight Games', 'Corey Konieczka', '2008-01-01', '$190', 'Battlestar Galactica: The Board Game güvensizlik, entrika ve hayatta kalma mücadelesinin heyecan verici bir oyunudur.  Her oynanabilir karakterin kendi yetenekleri ve zayıflıkları vardır ve insanlığın hayatta kalma umuduna sahip olması için hep birlikte çalışmalıdır. Ancak, her oyunda bir veya daha fazla oyuncu gizlice Cylonların yanında yer alır. Yakıt kıtlığı, gıda kirliliği ve siyasi huzursuzluk filoyu parçalamakla tehdit ederken, oyuncular haini ifşa etmeye çalışmalıdır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'The Resistance', 
(select genreID from Genre where genre = 'Bluffing'), 'Indie Boards & Cards', 'Don Eskridge', '2009-01-01', '$16', 'The Resistance is a party game of social deduction. It is designed for five to ten players, lasts about 30 minutes, and has no player elimination. The Resistance is inspired by Mafia/Werewolf, yet it is unique in its core mechanics, which increase the resources for informed decisions, intensify player interaction, and eliminate player elimination.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Dead Last', 
(select genreID from Genre where genre = 'Bluffing'), 'Smirk & Dagger Games', 'Matthew Grosso, Andy Patton', '2016-01-01', '$46', 'Dead Last, oyuncuların her turda kimi öldürecekleri konusunda komplo kurmaları ve oy kullanmaları gereken, ihanetleri ve cinayetleri değiştiren bir "sosyal gizli anlaşma" oyunudur. Herhangi bir açık veya gizli iletişim aracına izin verilir ama hedeften ipucu vermediğinizden emin olun yoksa sizi pusuya düşürebilirler! Sonunda, bir veya iki oyuncu kalacak, ya tüm altınları alacak ya da bir sonraki oyun turuna başlamadan önce son bir hesaplaşmada kare alacak. 24 puana ulaşan ilk oyuncu kazanır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Shadows Over Camelot', 
(select genreID from Genre where genre = 'Bluffing'), 'Days of Wonder', 'Bruno Cathala, Serge Laget', '2005-01-01', '$375', 'Shadows over Camelot, 3-7 oyuncu için işbirlikçi/yarı işbirlikçi bir el yönetimi ve kesinti tabanlı masa oyunudur. Her oyuncu Yuvarlak Masa şövalyesini temsil eder ve Siyah ı yenmekten çeşitli görevlerin üstesinden gelmek için işbirliği yapmalıdırlar.'),





((select platformID from
GamePlatform where platformName = 'Board Game'), 'Dominion', 
(select genreID from Genre where genre = 'Deck Building'), 'Rio Grande Games', 'Donald X. Vaccarino', '2008-01-01', '$31', 'Dominion da her oyuncu aynı, çok küçük bir kart destesi ile başlar. Masanın ortasında, oyuncuların karşılayabilecekleri kadar satın alabilecekleri diğer kartların bir seçimi var. Satın alınacak kartların seçimi ve onları çizerken ellerini nasıl oynadıkları ile oyuncular, oyun sonunda değerli zafer noktalarına giden en verimli yol için çabalayarak destelerini anında oluştururlar.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Star Realms', 
(select genreID from Genre where genre = 'Deck Building'), 'Wise Wizard Games', 'Robert Dougherty, Darwin Kastle', '2014-01-01', '$15', 'Star Realms, hızlı tempolu bir deste oluşturma, dış uzay savaşı kart oyunudur. Oynarken, Ticaret Destesinden Ticaret Sırasında açık olan kartlardan yeni Gemiler ve Üsler almak için Ticareti kullanırsınız. Edindiğiniz Gemileri ve Üsleri, daha fazla Ticaret oluşturmak veya rakibinize ve üslerine saldırmak için Savaş oluşturmak için kullanırsınız. Rakibinizin puanını (Otorite denir) sıfıra indirdiğinizde kazanırsınız!'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Undaunted: Normandy', 
(select genreID from Genre where genre = 'Deck Building'), 'Osprey Games', 'Trevor Benjamin, David Thompson', '2019-01-01', '$34', 'Undaunted: Normandy, sizi ve rakibinizi, II. İnisiyatifi ele geçirmek, güçlerinizi desteklemek veya savaş alanında birliklerinizi kontrol etmek için kartlarınızı kullanın. Güçlü liderlik, savaşın gidişatını lehinize çevirebilir, ancak aldığınız her zayiat destenizden bir kart çıkardığı için pervasız kararlar felaket olabilir. Savaşın kaosunun ortasında kontrolü ele alın, muhalefet karşısında sımsıkı tutun ve yılmayın.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Magic: The Gathering', 
(select genreID from Genre where genre = 'Deck Building'), 'Wizards of the Coast', 'Richard Garfield', '1993-01-01', '$70', 'Bu oyun, tahsil edilebilir kart oyunu (veya CCG) türünün dedesidir. Kartlar yaygın, yaygın olmayan, nadir ve efsanevi nadir olarak sınıflandırılır. Oyuncular kart toplar ve koleksiyonlarından desteler oluşturur. Oyuncular bir kart destesi oluşturur ve rakibin destesine karşı düello yapar. Oyuncular, rakiplerinin toplam ömrünü sıfıra indirmeye çalışan sihirbazlardır. Rakibinin canını sıfıra indiren (veya başka bir set kazanma koşulunu karşılayan) ilk oyuncu oyunu kazanır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Harry Potter: Hogwarts Battle', 
(select genreID from Genre where genre = 'Deck Building'), 'The Op', 'Forrest-Pruzan Creative, Kami Mandell, Andrew Wolf', '2016-01-01', '$75', 'Oyuncular destelerine ikonik karakterler, büyüler ve büyülü öğeler şeklinde daha fazla kart ekler. Diğer kartlar, sağlıklarını yeniden kazanmalarına veya kötü adamlara karşı savaşmalarına izin vererek güç kazanmalarını engeller. Kötüler, oyuncuları saldırıları ve Karanlık Sanatlar ile geri aldı. Oyuncular ancak birlikte çalışarak tüm kötüleri yenebilir ve kaleyi kötü güçlerden koruyabilirler.'),





((select platformID from
GamePlatform where platformName = 'Board Game'), 'Cube Quest', 
(select genreID from Genre where genre = 'Dexterity'), 'Gamewright', 'Oliver Sibthorpe, Gary Sibthorpe', '2013-01-01', '$65', 'Oyun, basit bir puan sistemi kullanarak özel ordu oluşturmaya izin veriyor. Savaş öncesi kurulum, krallarının yanında savaşmak için maksimum toplam 40 puan değerinde taktiksel bir küp seçimini içerir. Her oyuncu ayrıca küplerini nasıl konumlandıracağını seçer, bireysel saldırı ve savunma oluşumları ve yapıları yaratır!'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Catacombs', 
(select genreID from Genre where genre = 'Dexterity'), 'Elzra Corp.', 'Ryan Amos, Marc Kelsey, Aron West', '2010-01-01', '$93', 'Catacombs, aksiyon ve el becerisi tabanlı bir macera masa oyunudur. Bir oyuncu Overseer ı kontrol ederek yeraltı mezarlıklarının canavarlarını kontrol eder. Diğer oyuncular, işbirliği içinde canavarları ve sonunda Yeraltı Mezarı Lordunu yenmeye çalışan dört kahramanı kontrol eder. Kahramanların her birinin, galip gelmeleri için etkili bir şekilde kullanılması gereken özel yetenekleri vardır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Flip Ships', 
(select genreID from Genre where genre = 'Dexterity'), 'Renegade Game Studios', 'Kane Klenko', '2017-01-01', '$45', 'Flip Ships, oyuncuların gezegenlerini bir ateş gücü saldırısına karşı koruyan cesur pilotların rollerini üstlendiği işbirlikçi bir el becerisi oyunudur. Saldıran düşmanları alt etmek ve güçlü ana gemiyi çok geç olmadan alt etmek için gemilerinizi çevirin.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Beasts of Balance', 
(select genreID from Genre where genre = 'Dexterity'), 'Modern Games', 'George Buckenham, Alex Fleetwood', '2016-01-01', '$90', 'Bir ila beş oyuncu için ortak bir oyun, amaç, yaratıklarınızı stratejik olarak besleyerek ve geliştirerek ve kuleniz çökmeden önce beceriye dayalı mucizeler yaratarak yapabileceğiniz en muhteşem dünyayı yapmaktır.'),


((select platformID from
GamePlatform where platformName = 'Board Game'), 'Crokinole', 
(select genreID from Genre where genre = 'Dexterity'), 'Public Domain', 'Eckhardt Wettlaufer', '1876-01-01', '$177', 'Oyuncular, diskleri parmaklarıyla hafifçe vurarak dairesel tahta üzerinde sırayla atış yaparlar. Oyuncular disklerini tahtadaki puanlama bölgelerine indirmeye çalışırlar, en yüksek puanlama alanı tahtanın tam ortasındaki girintili deliğe sahiptir. Her turda, her oyuncu/taraf dönüşümlü olarak belirli sayıda disk (genellikle 12 veya 8) atar, her turda bir disk çeker.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Propnight', 
(select genreID from Genre where genre = 'Action'), 'MYTONA', 'FNTASTIC', '2021-12-01', '$20', 'Klasik korkudan hayatta kalma ile karışık çok oyunculu fizik tabanlı bir pervane avı olan Propnight ta heyecan verici bir partiye katılın.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Chorus', 
(select genreID from Genre where genre = 'Action'), 'Deep Silver', 'Deep Silver Fishlabs', '2021-12-03', '$40', 'Onu yaratan karanlık tarikatı yok etme arayışında Nara nın kontrolünü elinize alın. Uzay savaşı nişancının evriminde yıkıcı silahların ve akıl almaz yeteneklerin kilidini açın. Duyarlı yıldız savaşçısı Forsaken ile birlikte antik tapınakları keşfedin ve uyanık gerçekliğin ötesine geçin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'After the Fall - Launch Edition', 
(select genreID from Genre where genre = 'Action'), 'Vertigo Games', 'Vertigo Games', '2021-12-09', '$36', 'Size Arizona Sunshine ı getiren ekipten, özünde yoğun işbirliğine dayalı oynanışa sahip destansı bir VR aksiyon FPS geliyor. Arkadaşlarınızla takım kurun ve acımasız soğuk tarafından mutasyona uğramış ve bükülmüş vahşi ölümsüzlerle dolu düşmanca bir VR dünyasına katılın.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Archvale', 
(select genreID from Genre where genre = 'Action'), 'Humble Games', 'idoz & phops', '2021-12-02', '$15', 'Bu kurşun cehenneminde silahını kuşan ve uzun zaman önce doğru yanlışlara doğru bir yolculuğa çık. Ölümsüz muhafızların kötü güçlerini sadece sen yenebilir ve dünyayı efsanevi Archvale ile yeniden birleştirebilirsin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Arma 3', 
(select genreID from Genre where genre = 'Action'), 'Bohemia Interactive', 'Bohemia Interactive', '2013-09-12', '$30', 'Devasa bir askeri sanal alanda gerçek savaş oyununu deneyimleyin. Çok çeşitli tek ve çok oyunculu içerik, 20 den fazla araç ve 40 silah ve içerik oluşturma için sınırsız fırsatlar sunan bu, PC nin önde gelen askeri oyunudur.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Tomb Raider', 
(select genreID from Genre where genre = 'Adventure'), 'Square Enix', 'Crystal Dynamics', '2013-03-05', '$15', 'Tomb Raider, Lara Croft un yoğun başlangıç ​​hikayesini ve genç bir kadından sert bir hayatta kalana yükselişini araştırıyor.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Sea of Thieves', 
(select genreID from Genre where genre = 'Adventure'), 'Xbox Game Studios', 'Rare Ltd', '2020-06-03', '$40', 'Sea of ​​Thieves, yelkencilik ve savaştan keşif ve yağmalamaya kadar, korsan hayatını yaşamak ve kendi başınıza bir efsane olmak için ihtiyacınız olan her şeyi temel korsan deneyimi sunuyor. Belirlenmiş roller olmadan, dünyaya ve diğer oyunculara istediğiniz şekilde yaklaşma özgürlüğüne sahipsiniz.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Ori and the Blind Forest', 
(select genreID from Genre where genre = 'Adventure'), 'Xbox Game Studios', 'Moon Studios GmbH', '2015-03-11', '$20', 'Ori and the Blind Forest, PC için Moon Studios tarafından hazırlanmış, görsel olarak çarpıcı bir aksiyon-platform oyunu aracılığıyla, kaderi kahramanlık olan genç bir yetimin hikayesini anlatıyor.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Kindergarten 2', 
(select genreID from Genre where genre = 'Adventure'), 'SmashGames', 'Con Man Games, SmashGames', '2019-07-30', '$15', 'Salı günü gerçekleşen Kindergarten 2 ye hoş geldiniz! Pazartesi günkü olaylardan sonra, kendinizi yeni arkadaşlarla yeni bir okulda ve acımasızca öldürülmenin yeni yollarında bulacaksınız.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'The Coma 2: Vicious Sisters', 
(select genreID from Genre where genre = 'Adventure'), 'Headup, WhisperGames', 'Devespresso Games', '2020-01-28', '$15', 'The Coma 2: Vicious Sisters, Koreli bir hayatta kalma korku-macera oyunudur. Gecenin dehşetinden kurtulmak için terkedilmiş okulunuzdan yola çıkın. Çevredeki Sehwa bölgesini keşfedin ve gölge aleminin karanlık sırlarını ortaya çıkarın. Seni öldürmeye kararlı bir iblisten kaçınmak için elindeki her şeyi kullan!'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Mini Motorways', 
(select genreID from Genre where genre = 'Casual'), 'Dinosaur Polo Club', 'Dinosaur Polo Club', '2021-07-20', '$10', 'Mini Otoyollar, büyüyen bir şehir için yol haritasını tasarlamaya yönelik bir strateji simülasyon oyunudur. Hareketli bir metropol oluşturmak için her seferinde bir yol olacak şekilde bir trafik ağı oluşturun. Yollarınızı yeniden tasarlayın ve herkesin gitmesi gereken yere ulaşması için otoyollarınızı yerleştirin. Şehri ne kadar süre hareket ettirebilirsin?'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Insaniquarium Deluxe', 
(select genreID from Genre where genre = 'Casual'), 'PopCap Games, Inc., Electronic Arts', 'PopCap Games, Inc.', '2006-08-30', '$5', 'Şimdiye kadarki en çılgın akvaryum oyunu! Balığınız ile ilgilenin, onları mutlu edin, sizi madeni para ve mücevherlerle ödüllendirsinler. Farklı tank içi evcil hayvanları yumurtadan çıkaran tank yükseltmeleri veya yumurta parçaları satın alın. Bu evcil hayvanlar balığınızı beslemenize, madeni para toplamanıza ve hatta tankınızı istila edecek uzaylılara karşı korunmanıza yardımcı olabilir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Peggle Deluxe', 
(select genreID from Genre where genre = 'Casual'), 'PopCap Games, Inc., Electronic Arts', 'PopCap Games, Inc.', '2007-02-27', '$5', 'Enerji veren atari eğlencesiyle en iyi atışınızı yapın! Nişan al, ateş et, turuncu mandalları temizle, sonra arkana yaslan ve 10 tuhaf öğretmen seni Peggle ın büyüklüğüne yönlendirirken tezahürat yap.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Draw & Guess', 
(select genreID from Genre where genre = 'Casual'), 'Acureus','Acureus','2021-03-12','$3','Draw & Guess, çoklu oyun modları ile 2-16 kişilik sıradan bir çizim oyunudur! Çin Fısıltıları modunu (4-16 oyuncu) seçin veya rekabete girin ve herkes olabildiğince hızlı tahmin ederken berabere çekin!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Idle Slayer', 
(select genreID from Genre where genre = 'Casual'), 'Pablo Leban', 'Pablo Leban', '2020-12-22', '$0', 'Idle Slayer, boşta ve aktif oyun tarzı mekaniği, orta çağ piksel sanatı görselleri ve retro 8-bit sesler ve müzik ile artan bir oyundur.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Monster Hunter: World', 
(select genreID from Genre where genre = 'Cooperative'), 'CAPCOM Co., Ltd.','CAPCOM Co., Ltd.', '2018-08-09', '$30', 'Yeni bir dünyaya hoş geldiniz! Serinin en son bölümü olan Monster Hunter: world de sürprizler ve heyecanlarla dolu yeni bir dünyada canavarları avlamak için elinizdeki her şeyi kullanarak nihai av deneyiminin keyfini çıkarabilirsiniz.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Deep Rock Galactic', 
(select genreID from Genre where genre = 'Cooperative'), 'Coffee Stain Publishing', 'Ghost Ship Games', '2020-05-13', '$30', 'Deep Rock Galactic, zorlu uzay Cüceleri, %100 yok edilebilir ortamlar, prosedürle oluşturulmuş mağaralar ve sonsuz uzaylı canavar sürülerini içeren 1-4 oyunculu bir kooperatif FPS dir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'PAYDAY 2', 
(select genreID from Genre where genre = 'Cooperative'), 'Starbreeze Publishing AB','OVERKILL - a Starbreeze Studio.', '2013-08-13', '$10', 'PAYDAY 2, oyuncuların epik bir suç çılgınlığı için Washington DC ye inerken bir kez daha orijinal PAYDAY ekibinin (Dallas, Hoxton, Wolf ve Chains) maskelerini takmalarına izin veren, aksiyon dolu, dört oyunculu bir kooperatif nişancı oyunudur.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'It Takes Two', 
(select genreID from Genre where genre = 'Cooperative'), 'Electronic Arts', 'Hazelight', '2021-03-26', '$40', 'It Takes Two da hayatınızın en çılgın yolculuğuna çıkın. Bir arkadaşınızı Friends Pass ile ücretsiz olarak katılmaya davet edin ve çok çeşitli neşeli, yıkıcı oyun mücadelelerinde birlikte çalışın. 2021 Oyun Ödüllerinde YILIN OYUNU galibi.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'GTFO', 
(select genreID from Genre where genre = 'Cooperative'), '10 Chambers', '10 Chambers', '2021-12-10', '$30', 'GTFO, sizi bir kalp atışında sürükleyici bir gerilimden patlayıcı aksiyona fırlatan aşırı işbirlikçi bir korku nişancı oyunudur. Ölümcül yeraltı hapishanenizde hayatta kalmak için gizlilik, strateji ve ekip çalışması gereklidir. Birlikte çalışın ya da birlikte ölün.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Minecraft Dungeons', 
(select genreID from Genre where genre = 'Dungeon Crawler'), 'Xbox Game Studios', 'Mojang Studios, ‪Double Eleven', '2021-09-22', '$19', 'Klasik zindan tarayıcılarından ilham alan ve Minecraft evreninde geçen heyecan verici bir aksiyon-macera oyununda savaşın!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Ring of Pain', 
(select genreID from Genre where genre = 'Dungeon Crawler'), 'Humble Games', 'Simon Boxer, Twice Different', '2020-10-15', '$20', 'Karşılaşmaların size geldiği roguelike bir kart tarayıcısı olan Ring of Pain e girin. Ringin etrafındaki her adım korkunç bir karar. Yağmalamak mı yoksa sürünen bir korkuyu arkadan bıçaklamak mı? Hediyeler ve hazine taşıyan garip arkadaşlarla tanışın. Hayatta kalmak ve Ring of Pain in sırlarını keşfetmek için teçhizatınızı akıllıca seçin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Barony', 
(select genreID from Genre where genre = 'Dungeon Crawler'), 'Turning Wheel LLC', 'Turning Wheel LLC', '2015-06-23', '$15', 'Barony, işbirlikçi oyun ile birinci şahıs roguelike RPG dir. Şifreli eşyalar, acımasız tuzaklar ve sinsi canavarlar sizi bekliyor. Tek başına zindanı fethedin ya da ikonik ve egzotik RPG sınıflarıyla kooperatifte mükemmel bir parti toplayın.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Gauntlet Slayer Edition', 
(select genreID from Genre where genre = 'Dungeon Crawler'), 'WB Games', 'Arrowhead Game Studios', '2014-09-23', '$20', 'Klasik Gauntlet 4 oyunculu co-op aksiyon oyunu tamamen yeni bir deneyimle geri dönüyor! Hem yerel hem de çevrimiçi eşli çok oyunculu modda siz ve arkadaşlarınız hazine ve zafer için savaşırken sonsuz düşman ordularıyla savaşın. Karanlığı istila et!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Legend of Grimrock 2', 
(select genreID from Genre where genre = 'Dungeon Crawler'), 'Almost Human Games', 'Almost Human Games', '2014-10-15', '$24', 'Legend of Grimrock 2, modern bir yürütme ama eski bir okul kalbi olan bir zindan tarama rol yapma oyunudur. Dört mahkumdan oluşan bir grup, gözlerden uzak Nex Adası nda gemi kazası geçirdi. Ada, ufalanmış antik kalıntılar, gizemli tapınaklar ve geniş bir yeraltı zindan ve maden ağıyla doludur. Mahkumlar hayatta kalmak istiyorlarsa, adanın uğursuz beyni tarafından tasarlanan zorlukların üstesinden gelmeleri gerekir.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Fallout 4', 
(select genreID from Genre where genre = 'Exploration'), 'Bethesda Softworks', 'Bethesda Game Studios', '2015-11-10', '$20', 'Fallout 3 ve The Elder Scrolls V: Skyrim in ödüllü yaratıcıları Bethesda Game Studios, sizi şimdiye kadarki en iddialı oyunları ve yeni nesil açık dünya oyunları olan Fallout 4 dünyasına hoş geldiniz.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'The Long Dark', 
(select genreID from Genre where genre = 'Exploration'), 'Hinterland Studio Inc.', 'Hinterland Studio Inc.', '2017-08-01', '$35', 'Gece gökyüzünde parlak ışıklar parlıyor. Rüzgar, ahşap kulübenizin ince duvarlarının dışında esiyor. Uzakta bir kurt uluyor. Çantanızdaki kıt erzaklara bakarsınız ve esrarengiz bir şekilde elektrikler kesilmeden önceki günleri dilersiniz. Daha ne kadar hayatta kalacaksın?'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Slime Rancher', 
(select genreID from Genre where genre = 'Exploration'), 'Monomi Park', 'Monomi Park', '2017-08-01', '$20', 'Slime Rancher, Dünya dan bin ışıkyılı uzaktaki Far, Far Range de bir yaşam için yola çıkan cesur ve genç bir çiftlik sahibi olan Beatrix LeBeau nun hikayesidir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Empyrion - Galactic Survival', 
(select genreID from Genre where genre = 'Exploration'), 'Eleon Game Studios', 'Eleon Game Studios', '2020-08-05', '$20', 'Empyrion - Galactic Survival, bir 3D açık dünya uzay sanal alanı hayatta kalma macerasıdır. Çeşitli farklı gezegenleri keşfetmek, fethetmek veya sömürmek ve Empyrion un gizemlerini keşfetmek için güçlü gemiler, güçlü uzay istasyonları ve geniş gezegen yerleşimleri inşa edin!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Trailmakers', 
(select genreID from Genre where genre = 'Exploration'), 'Flashbulb', 'Flashbulb', '2019-09-18','$25','Spor arabalar, jet uçakları, helikopterler veya yürüyen robotlar yapın ve onları keşif görevlerine veya zorlu ralli yarışlarına götürün.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Bright Memory: Infinite', 
(select genreID from Genre where genre = 'Indie'), 'FYQD-Studio, PLAYISM', 'YQD-Studio', '2021-11-12', '$20', 'Bright Memory: Infinite is an all-new lightning-fast fusion of the FPS and action genres, created by FYQD-Studio. Combine a wide variety of skills and abilities to unleash dazzling combo attacks.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'The Binding of Isaac: Rebirth', 
(select genreID from Genre where genre = 'Indie'), 'Nicalis, Inc.', 'Nicalis, Inc., Edmund McMillen', '2014-11-04', '$15', 'The Binding of Isaac, ağır Rogue benzeri unsurlara sahip, rastgele oluşturulmuş bir aksiyon RPG nişancı oyunudur. Isaac i yolculuğunda takip eden oyuncular, Isaac in şeklini değiştiren ve ona süper insan yetenekleri kazandıran ve onun gizemli yaratık sürüleriyle savaşmasını, sırları keşfetmesini ve güvenli bir şekilde savaşmasını sağlayan tuhaf hazineler bulacaklar.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Hades', 
(select genreID from Genre where genre = 'Indie'), 'Supergiant Games', 'Supergiant Games', '2020-09-17', '$25', 'Bastion, Transistor ve Pyre ın yaratıcılarından bu haydut benzeri zindan tarayıcısında Yeraltı Dünyasını kesip biçerken ölülerin tanrısına meydan okuyun.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Hollow Knight', 
(select genreID from Genre where genre = 'Indie'), 'Team Cherry', 'Team Cherry', '2014-02-24', '$15', 'Hollow Knight da kendi yolunuzu oluşturun! Böcekler ve kahramanlardan oluşan devasa bir harap krallığın içinden geçen destansı bir aksiyon macerası. Klasik, elle çizilmiş 2D stilinde dönen mağaraları keşfedin, kusurlu yaratıklarla savaşın ve tuhaf böceklerle arkadaş olun.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Papers, Please', 
(select genreID from Genre where genre = 'Indie'), '3909', 'Lucas Pope', '2013-08-08', '$10', 'Tebrikler. Ekim işçi piyangosu tamamlandı. Adın çekildi. Derhal yerleştirme için, Grestin Sınır Kontrol Noktasındaki Kabul Bakanlığına rapor verin. Doğu Grestin de siz ve aileniz için bir daire sağlanacaktır. 8. Sınıf bir konut bekleyin.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Slay the Spire', 
(select genreID from Genre where genre = 'Roguelike'), 'Mega Crit Games', 'Mega Crit Games', '2019-01-23', '$25', 'Yapabileceğimiz en iyi tek oyunculu deste oluşturucuyu yapmak için kart oyunlarını ve roguelike ları bir araya getirdik. Eşsiz bir güverte oluşturun, tuhaf yaratıklarla karşılaşın, muazzam gücün kalıntılarını keşfedin ve Slay the Spire!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Dead Cells', 
(select genreID from Genre where genre = 'Roguelike'), 'Motion Twin', 'Motion Twin', '2018-08-07', '$25', 'Genişleyen, sürekli değişen bir kaleyi keşfedeceksiniz. Kontrol noktası yok. Öldür, öl, öğren, tekrar et.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Enter the Gungeon', 
(select genreID from Genre where genre = 'Roguelike'), 'Devolver Digital', 'Dodge Roll', '2016-04-05', '$15', 'Geçmişi öldürebilen silahı elde etmek için ateş etmek ve yağmalama.'),

((select platformID from
GamePlatform where platformName = 'PC'), 'Caves of Qud', 
(select genreID from Genre where genre = 'Roguelike'), 'Freehold Games', 'Freehold Games', '2015-07-15', '$15', 'Caves of Qud, retrofütürizm, derin simülasyon ve duyarlı bitkilerle dolu bir bilim-fantezi, haydut benzeri bir destandır. Gel, egzotik bir dünyada yaşa ve bin yıllık medeniyetlerin katmanlarını delip geç.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'FTL: Faster Than Light', 
(select genreID from Genre where genre = 'Roguelike'), 'Subset Games', 'Subset Games', '2012-09-14', '$10', 'Bu roguelike uzay gemisi simülasyonu, geminizi ve mürettebatınızı zafer ve acı yenilgilerle dolu rastgele oluşturulmuş bir galakside bir maceraya çıkarmanıza izin verir.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'The Witcher 3: Wild Hunt', 
(select genreID from Genre where genre = 'RPG'), 'CD PROJEKT RED', 'CD PROJEKT RED', '2015-05-18', '$40', 'Northern Realms de savaş şiddetlenirken, hayatınızın en büyük sözleşmesini üstleniyorsunuz. Dünyanın şeklini değiştirebilecek canlı bir silah olan Child of Prophecy nin izini sürüyorsunuz.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Mount & Blade: Warband', 
(select genreID from Genre where genre = 'RPG'), 'TaleWorlds Entertainment', 'TaleWorlds Entertainment', '2014-03-31', '$5', 'Bitmeyen savaşlarla parçalanan bir ülkede, kendi sert savaşçı grubunu bir araya getirme ve savaşa girme zamanı. Adamlarınızı savaşa yönlendirin, krallığınızı genişletin ve nihai ödülü talep edin!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Fallout: New Vegas', 
(select genreID from Genre where genre = 'RPG'), 'Bethesda Softworks', 'Obsidian Entertainment', '2010-10-22', '$10', 'Vegas a hoş geldiniz. New Vegas. Tadını çıkarın!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'DARK SOULS III', 
(select genreID from Genre where genre = 'RPG'), 'FromSoftware, Inc., BANDAI NAMCO Entertainment', 'FromSoftware, Inc.', '2016-04-11', '$60', 'Dark Souls, eleştirmenlerce beğenilen ve kendi oyun türünü tanımlayan dizinin en son ve iddialı bölümüyle sınırları zorlamaya devam ediyor. Kendinizi hazırlayın ve Karanlığı Kucaklayın!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Assassins Creed Odyssey', 
(select genreID from Genre where genre = 'RPG'), 'Ubisoft', 'Ubisoft', '2018-10-05', '$15', 'Assassins Creed Odyssey de kendi kaderine hükmet. Kimsesiz bir garip adamdan yaşayan bir efsane olmaya giden bir yolculuğa çık. Kendi geçmişinin sırlarını keşfederken Antik Yunanistan ın kaderini de değiştir.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'People Playground', 
(select genreID from Genre where genre = 'Sandbox'), 'Studio Minus', 'mestiez', '2019-07-23', '$10', 'Büyük bir açık alanda bez bebekleri vurun, bıçaklayın, yakın, zehirleyin, yırtın, buharlaştırın veya ezin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Totally Accurate Battle Simulator', 
(select genreID from Genre where genre = 'Sandbox'), 'Landfall', 'Landfall', '2021-04-01', '$20', 'Antik topraklardan, ürkütücü yerlerden ve fantezi dünyalarından yalpalayanların lideri olun. Şimdiye kadar yaratılmış en sallantılı fizik sistemiyle yapılmış simülasyonlarda savaşmalarını izleyin, birim yaratıcısında kendi yalpalayıcılarınızı yaratın ve çok oyunculu modda arkadaşlarınızla savaşmak için ordunuzu gönderin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Starbound', 
(select genreID from Genre where genre = 'Sandbox'), 'Chucklefish', 'Chucklefish', '2016-07-22', '$15', 'Starbound da kendi hikayenizi yaratırsınız, oynamanın yanlış bir yolu yoktur! Bu süreçte daha büyük galaktik gizemleri ortaya çıkararak, evinizi yok eden güçlerden evreni kurtarmayı seçebilir veya keşfedilmemiş gezegenleri kolonileştirme lehine tamamen kahramanca bir yolculuktan vazgeçmeyi isteyebilirsiniz.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Space Engineers', 
(select genreID from Genre where genre = 'Sandbox'), 'Keen Software House', 'Keen Software House', '2019-02-28', '$20', 'Space Engineers, uzayda ve gezegenlerde mühendislik, inşaat, keşif ve hayatta kalma hakkında bir sandbox oyunudur. Oyuncular uzay gemileri, uzay istasyonları, çeşitli boyut ve kullanımlarda gezegen karakolları inşa eder, gemilere pilotluk yapar ve gezegenleri keşfetmek ve hayatta kalmak için kaynakları toplamak için uzayda seyahat eder.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Universe Sandbox', 
(select genreID from Genre where genre = 'Sandbox'), 'Giant Army', 'Giant Army', '2015-08-24', '$30', 'Akıl almaz bir ölçekte yarat ve yok et... evrenimizin güzelliğini ve gezegenimizin narinliğini göstermek için gerçek zamanlı yer çekimini, iklimi, çarpışmayı ve materyal etkileşimlerini birleştiren bir uzay simülatörü ile. HTC Vive, Oculus Rift+Touch ve Windows Mixed Reality için VR desteği içerir.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'FIFA 22', 
(select genreID from Genre where genre = 'Sports'), 'Electronic Arts', 'Electronic Arts', '2021-10-1', '$60', 'FIFA 22 Oynayın, Yeni Nesil Oyuncu Ögesi Elde Edin: 15 Aralık tan itibaren 14 Ocak 2022 ye kadar FIFA 22 oynayarak FIFA Ultimate Team de satılamayan Yeni Nesil Oyuncu Ögesi elde edin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'F1 2021', 
(select genreID from Genre where genre = 'Sports'), 'Electronic Arts', 'Codemasters', '2021-07-15', '$60', '2021 FIA FORMULA ONE WORLD CHAMPIONSHIP in resmi oyunu olan F1 2021 de her hikayenin bir başlangıcı var. F1 2021 in sunduğu heyecan verici hikaye deneyimi Braking Point ve iki oyunculu Kariyer gibi yeni çarpıcı özelliklerin tadını çıkar. Gerçek Sezon Başlangıcı ile grid e daha da yaklaş.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'MotoGP 20', 
(select genreID from Genre where genre = 'Sports'), 'Milestone S.r.l.', 'Milestone S.r.l.', '2020-04-23', '$10', 'Bu yıl eksiksiz hale getirilen menajerlik kariyeri modunun tüm heyecanını yaşa ve yeni teknik iyileştirmelerin ve grafiklerin tadını çıkar. Motosikletini ve kıyafetini özelleştir! İster MotoGP efsanelerine karşı yarış ya da istersen çevrimiçi arkadaşlarına meydan oku!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Golf It!', 
(select genreID from Genre where genre = 'Sports'), 'Perfuse Entertainment', 'Perfuse Entertainment', '2017-02-17', '$9', 'Dinamik, eğlenceli ve yaratıcı bir çok oyunculu deneyime odaklanan çok oyunculu bir Minigolf oyunudur. En heyecan verici özelliklerden biri, arkadaşlarınızla birlikte özel haritalar oluşturabileceğiniz ve oynayabileceğiniz Çok Oyunculu Düzenleyicidir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'NBA 2K21', 
(select genreID from Genre where genre = 'Sports'), '2K', 'Visual Concepts', '2020-09-04', '$60', 'Sınıfının en iyisi grafik ve oynanış, rekabetçi ve topluluk çevrimiçi özellikleri ve derin, çeşitli oyun modları üzerine yapılan kapsamlı geliştirmeler ile NBA 2K21, Everything is Game konsepti ile NBA basketbolu ve kültürünün tüm yönlerini benzersiz bir şekilde yaşamanızı sağlıyor.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'DEATH STRANDING', 
(select genreID from Genre where genre = 'Story Rich'), '505 Games', 'KOJIMA PRODUCTIONS', '2020-07-14', '$60', 'Efsanevi oyun yapımcısı Hideo Kojima’dan yepyeni, türlere meydan okuyan bir deneyim. Sam Bridges, Ölüm Kıyısı nın tamamen değiştirdiği bir dünyaya göğüs germek zorunda. Geleceğimizin dağılmış parçalarını taşıyarak, parçalanmış dünyayı adım adım bir araya getirecek bir yolculuğa çıkıyor.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Life is Strange - Episode 1', 
(select genreID from Genre where genre = 'Story Rich'), 'Square Enix', 'DONTNOD Entertainment', '2015-01-30', '$0', '1. Bölüm şimdi ÜCRETSİZ! Life is Strange, oyuncunun zamanı geri almasına ve geçmişi, bugünü ve geleceği etkilemesine olanak tanıyan, ödüllü ve eleştirmenlerce beğenilen epizodik bir macera oyunudur.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Divinity: Original Sin 2 - Definitive Edition', 
(select genreID from Genre where genre = 'Story Rich'), 'Larian Studios', 'Larian Studios', '2017-09-14', '$45', 'Baldurs Gate 3 ün yaratıcılarından, çıtayı yükselten, eleştirmenlerce beğenilen RPG. Partinizi toplayın. Derin, taktik savaşta ustalaşın. Dört kişiye kadar bir grup olarak girişimde bulunun - ancak yalnızca birinizin Tanrı olma şansına sahip olacağını bilin.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'BioShock Infinite', 
(select genreID from Genre where genre = 'Story Rich'), '2K', 'Irrational Games', '2013-03-26', '$30', 'Yanlış insanlara borçlu, hayatı tehlikede, ABD Süvari gazisi ve şimdi kiralık bir silah olan Booker DeWitt in geçmişini temizlemek için tek bir fırsatı var. Çocukluğundan beri hapsedilmiş ve uçan şehir Columbia da kilitli olan gizemli bir kız olan Elizabeth i kurtarması gerekiyor.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'To the Moon', 
(select genreID from Genre where genre = 'Story Rich'), 'Freebird Games', 'Freebird Games', '2011-11-01', '$10', 'Ölmekte olan bir adamın son arzusunu yapay olarak yerine getirmek için hatıralarında geriye doğru giden iki doktor hakkında hikaye odaklı bir deneyim.'),





((select platformID from
GamePlatform where platformName = 'PC'), 'Age of Empires IV', 
(select genreID from Genre where genre = 'Strategy'), 'Xbox Game Studios', 'Relic Entertainment, Worlds Edge', '2021-10-28', '$60', 'Age of Empires IV ile en sevilen gerçek zamanlı strateji oyunlarından biri, sizi dünyayı şekillendiren destansı tarihi savaşların merkezine koyarak tüm ihtişamıyla geri dönüyor.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Bloons TD 6', 
(select genreID from Genre where genre = 'Strategy'), 'Ninja Kiwi', 'Ninja Kiwi', '2018-12-18', '$10', 'Müthiş Başarılı Atıcı Savunması Oyunu'),

((select platformID from
GamePlatform where platformName = 'PC'), 'Crusader Kings III', 
(select genreID from Genre where genre = 'Strategy'), 'Paradox Interactive', 'Paradox Development Studio', '2020-09-01', '$50', 'Sev, savaş, entrika çevir ve yücel. Crusader Kings III ün büyük stratejisinde soylu hanenin mirasını belirle. Orta Çağ ın geniş ve destansı simülasyonunda hanedanlığının soyunu yönetirken ölüm yalnızca bir başlangıç.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'RimWorld', 
(select genreID from Genre where genre = 'Strategy'), 'Ludeon Studios', 'Ludeon Studios', '2018-10-17', '$35', 'Akıllı bir AI hikaye anlatıcısı tarafından yönlendirilen bir bilim kurgu kolonisi simülasyonu. Psikoloji, ekoloji, silahlı çatışma, yakın dövüş, iklim, biyomlar, diplomasi, kişilerarası ilişkiler, sanat, tıp, ticaret ve daha fazlasını simüle ederek hikayeler üretir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Total War: WARHAMMER II', 
(select genreID from Genre where genre = 'Strategy'), 'SEGA', 'CREATIVE ASSEMBLY', '2017-09-28', '$60', 'Strateji oyunları mükemmelleştirildi. Bir fantezi dünyasında nefes kesici bir keşif, genişleme ve fetih kampanyası. Sıra tabanlı medeniyet yönetimi ve emrinizde binlerce birlik ve canavarla gerçek zamanlı destansı strateji savaşları.'),






((select platformID from
GamePlatform where platformName = 'PC'), 'Dota 2', 
(select genreID from Genre where genre = 'MOBA'), 'Valve', 'Valve', '2013-07-09', '$0', 'Her gün, dünya çapındaki milyonlarca oyuncu yüzden fazla Dota kahramanından birisiyle savaşa giriyor. Oynama süreniz ister 10 saati isterse 1000 saati bulsun, her zaman keşfedilecek yeni bir şeyler vardır. Düzenli güncellemelerle sürekli değişen ve evrilen oynanış, özellikler ve kahramanlar sayesinde Dota 2 sürekli olarak değişmektedir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'SMITE', 
(select genreID from Genre where genre = 'MOBA'), 'Hi-Rez Studios', 'Titan Forge Games', '2015-09-08', '$0', 'Tanrıların Savaş Alanı SMITE ta 35 milyondan fazla oyuncuya katıl! Thor’un çekicini savur, Medusa gibi düşmanlarını taşa çevir ya da 100’da fazla mitolojik ikondan birini seç. Bir Tanrı ol ve bugün ÜCRETSİZ oyna!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Battlerite', 
(select genreID from Genre where genre = 'MOBA'), 'Stunlock Studios', 'Stunlock Studios', '2017-11-08', '$0', 'BATTLERITE takımların arenalarda savaştığı aksiyon dolu bir oyun. Üstten bakış savaş oyunlarıyla tempolu dövüş oyunlarının birleşimi olan çatışmalarda arkadaşlarına ve rakiplere meydan oku. Arena seni bekliyor!'),


((select platformID from
GamePlatform where platformName = 'PC'), 'League of Legends', 
(select genreID from Genre where genre = 'MOBA'), 'Riot Games', 'Riot Games', '2009-10-27', '$0', 'League of Legends 3 boyutlu izometrik bakış açısı ile oynanır. Sihirdar Vadisi, Taktik Savaşları ve ARAM olmak üzere üç tane oyun modundan oluşur. Sihirdar Vadisi ve ARAM maçlarında, her biri beş oyuncu içeren iki takım birbirlerinin Nexus unu (merkez) patlatmak için savaşırlar. Bu bakış açısı değiştirilemez yalnız kamera kaydırılabilir veya yakınlaştırılabilir.'),


((select platformID from
GamePlatform where platformName = 'PC'), 'Warhammer 40,000: Dawn of War III', 
(select genreID from Genre where genre = 'MOBA'), 'SEGA', 'Relic Entertainment', '2017-04-27', '$40', 'Birbiriyle savaşan üç grup arasındaki vahşi bir savaşa katılın Dawn of War III te Acheron un gizemli dünyasında yıkıcı bir silah bulunduğunda düşmanlarınızla yüzleşmekten başka seçeneğiniz kalmayacak.'),





((select platformID from
GamePlatform where platformName = 'Console'), 'Minecraft', 
(select genreID from Genre where genre = 'Sandbox'), 'Microsoft Studios', 'Mojang', '2017-09-20', '$50', 'Rastgele oluşturulan dünyaları keşfedin ve en basit evlerden devasa şatolara kadar harika yapılar inşa edin. Sınırsız kaynakla yaratıcı modda oynayın veya hayatta kalma modunda dünyanın derinliklerinde maden çıkarın, tehlikeli düşmanları def etmek için silah ve zırhlar üretin.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Stardew Valley',
(select genreID from Genre where genre = 'Sandbox'), 'ConcernedApe', 'ConcernedApe', '2016-12-14', '$15', 'Sana büyükbabanın Stardew Valley deki eski çiflik arsası miras kaldı. Eski aletler ve birkaç bozuk para olan, yeni bir hayata başlamak için yola çıktın. Bu arazide kıt kanaat geçinmeyi ve evini büyütüp geliştirebilir misin? Bu kolay olmayacak. Joja Corporation şehre geldiğinden beri eski yolların hepsi kayboldu. Şehir merkezinin en hareketli noktası şu anda karışık durumda. Fakat vadi fırsatlarla dolu görünüyor. Biraz özveri ile, sadece Stardew Vadisi ni bile büyütüp geliştirebilirsin!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'The Sims 4', 
(select genreID from Genre where genre = 'Sandbox'), 'Electronic Arts', 'Maxis & Blind Squirrel', '2017-11-17', '$30', 'Hayal gücünüzü kullanarak sizi ifade eden o eşsiz Sims dünyasını yaratın! Sim lerden evlere kadar her detaya el atın ve özelleştirin. Sim lerin görünüşlerini, davranışlarını ve giysilerini seçin; sonra da her günü nasıl yaşayacaklarına karar verir. Her aileye harika evler tasarlayıp inşa edin, sonra da en sevdiğiniz mobilya ve dekorlarla döşeyin. Kendine özgü çevreye sahip çok güzel yerleri keşfedin ve aklınıza esince maceraya çıkın.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Grand Theft Auto V', 
(select genreID from Genre where genre = 'Sandbox'), 'Rockstar Games', 'Rockstar North', '2017-12-19', '$25', 'Genç bir dolandırıcı, eski bir banka soyguncusu ve acımasız bir psikopat. Başları büyük dertte. Başta birbirleri olmak üzere hiçkimseye güvenmedikleri bir şehirde hayatta kalabilmek için tehlikeli bir dizi soygun gerçekleştirmek zorundalar.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Terraria', 
(select genreID from Genre where genre = 'Sandbox'), '505 Games', 'DR Studios', '2014-11-14', '$20', 'Ganimet, zafer ve hayatta kalmak için savaşırken tüm dünya parmaklarının ucunda. Mağara yapılı derinliklere in, savaştaki cesaretini test et veya kendi şehrini inşa et; seçim senin!'),





((select platformID from
GamePlatform where platformName = 'Console'), 'DOOM', 
(select genreID from Genre where genre = 'Shooter'), 'Bethesda Softworks', 'id Software', '2016-05-13', '$20', 'Birinci şahıs nişancı oyunlarının öncüsü ve çok oyunculu Deatmatch oyununun üreticisi id Software tarafından geliştirilen DOOM, ölümüne eğlenceli yeni nesil bir nişancı oyunu olarak geri dönüyor. Acımasız şeytanlar, tahrip gücü olağanüstü yüksek silahlar ve hızlı oyun akışı sayesinde çok yoğun bir birinci şahıs savaş deneyimi yaşayabilir, tek oyuncu modunda Cehennem in derinliklerinde şeytan sürülerini yok edebilir veya çok oyuncu modlarından birinde arkadaşlarınıza karşı oynayabilirsiniz.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Halo: The Master Chief Collection', 
(select genreID from Genre where genre = 'Shooter'), 'Xbox Game Studios', '343 Industries', '2019-12-03', '$40', 'The Master Chief Collection, Halo için en gelişmiş oyun deneyimidir.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Borderlands 3', 
(select genreID from Genre where genre = 'Shooter'), '2K', 'Gearbox Software', '2019-09-13', '$60', 'Borderlands 3 Xbox One kopyaları, Xbox Series X|S versiyonuna dijital yükseltme içerir! Xbox Series X te oyunu, tek oyunculu ve çevrimiçi iş birliği modunda 60 fps ye kadar muhteşem 4K çözünürlükte deneyimleyin. 4 oyuncuya kadar genişletilmiş yerel bölünmüş ekran desteği ile daha fazla aynı ekranda iş birliği eğlencesi ekleyin.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Call of Duty: Black Ops Cold War', 
(select genreID from Genre where genre = 'Shooter'), 'Activision', 'Treyarch, Raven', '2020-11-13', '$70', 'Black Ops Cold War, hayranlarını 1980 lerin başındaki Soğuk Savaş ın değişken jeopolitik çatışmasının derinliklerine bırakıyor. Oyuncuların 1980 lerin başında Doğu Berlin, Vietnam, Türkiye, Sovyet KGB üsleri ve daha fazla yerde dünya çapındaki ikonik bölgelerde savaşırken, tarihi kişiler ve zorlu gerçeklerle yüzleştiği tek oyunculu Senaryo Modu nda hiçbir şey göründüğü gibi değil.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'HITMAN 3 - Standard Edition', 
(select genreID from Genre where genre = 'Shooter'), 'IO Interactive A/S', 'IO Interactive A/S', '2021-01-20', '$52', 'HITMAN 3, World of Assassination üçlemesinin dramatik finalidir ve oyuncuları geniş açık dünya bölgelerinde dünya çapında bir maceraya çıkarır. Agent 47, tüm kariyerindeki en önemli işler için acımasız bir profesyonel olarak geri dönüyor.'),





((select platformID from
GamePlatform where platformName = 'Console'), 'The Witcher 3: Wild Hunt', 
(select genreID from Genre where genre = 'RPG'), 'CD PROJEKT S.A.', 'CD PROJEKT RED', '2015-05-19', '$25', 'The Witcher 3: Wild Hunt, tercihlerinin gidişatı etkilediği, çarpıcı görselleriyle fantastik bir evrende geçen, hikâye bazlı, yeni nesil bir rol yapma oyunu. The Witcher‘da profesyonel canavar avcısı Rivia’lı Geralt olarak ticaret şehirleriyle, korsan Viking adalarıyla, tehlikeli dağ geçitleriyle ve unutulmuş mağaralarla dolu devasa bir dünyada bir kehanet çocuğunun peşine düşeceksin.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Cyberpunk 2077', 
(select genreID from Genre where genre = 'RPG'), 'CD PROJEKT RED', 'CD PROJEKT RED', '2020-12-10', '$49', 'Cyberpunk 2077 güç, gösteriş ve vücut modifikasyonu çılgınlığına kapılmış Night City kümekentinde geçen bir açık dünya aksiyon macera hikâyesidir. Kanun kaçağı paralı asker V olarak oyna ve ölümsüzlüğün anahtarı olan eşsiz bir implantın peşine düş. Karakterinin sibergereçlerini, yeteneklerini ve oynanış stilini özelleştir; kararların hikâyeyi ve dünyayı değiştirdiği devasa bir şehri keşfet.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Monster Hunter: World', 
(select genreID from Genre where genre = 'RPG'), 'Capcom', 'Capcom', '2018-01-26', '$16', 'Yeni bir dünyaya hoş geldin! Bir avcı rolünde oyna ve avantaj kazanmak için yer şekillerini ve orada bulunan çeşitli canlıları kullanabileceğin canlı, nefes alan bir ekosistemdeki yırtıcı canavarları öldür. İster tek başına, ister üç diğer oyuncuyla ortak olarak avlan ve yeni ekipmanlar üretip daha büyük ve daha kötü yaratıkları öldürmek için katlettiğin düşmanlarından düşen malzemeleri kullan!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'ARK: Survival Evolved', 
(select genreID from Genre where genre = 'RPG'), 'Studio Wildcard', 'Studio Wildcard', '2017-08-29', '$25', 'Gizemli adanın kıyısında mahsur, hayatta kalmak için öğrenmek gerekir. Hayatta hakim öldürmek veya arazi dolaşım ilkel yaratıklar uysal ve diğer oyuncular karşılaşma için kurnaz kullanın ... ve kaçış!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Othercide', 
(select genreID from Genre where genre = 'RPG'), 'Focus Home Interactive', 'Lightbulb Crew', '2020-07-28', '$25', 'İnsanlığın son umuduna dönüş. Yaşamış en büyük savaşçının yankıları olan Kerimeler, Izdırap ve ölümün karşısında.'),





((select platformID from
GamePlatform where platformName = 'Console'), 'Cricket 22', 
(select genreID from Genre where genre = 'Sports'), 'Nacon', 'Big Ant Studios', '2021-12-02', '$50', 'Cricket 22, hayranların gördüğü en sağlam, önemli kriket oyununu sunuyor. Avustralya ve İngiltere arasındaki uzun süredir devam eden rekabetin zirvesi olan tam lisanslı Ashes yarışmasının tadını çıkarın.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'MXGP3', 
(select genreID from Genre where genre = 'Sports'), 'Milestone S.r.l.', 'Milestone S.r.l.', '2017-05-30', '$16', 'Resmi Şampiyonanın tek video oyunu ile Motocross adrenalinini dene! MXGP3 - The Official Motocross Videogame, Unreal® Engine 4 sayesinde tamamen yeni bir oynanış ve grafikler ile şimdiye kadarki en kapsamlı oyun deneyimini sunuyor. 2016 MXGP ve MX2 sezonlarındaki tüm sürücülerle ve motosikletlerle ve 10 tane özel 2 zamanlı motorla 18 resmi pistte ve MXoN da yarışma deneyimini ilk yaşayanlardan ol! 300 den fazla parçayla eksiksiz bir kişiselleştirme için sürücünü ve motosikletini elden geçir!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'WWE 2K20', 
(select genreID from Genre where genre = 'Sports'), '2K', 'Visual Concepts', '2019-10-22', '$55', '2K, oyuncuları WWE 2K20 de Ringe Girmeye davet ediyor. Favori WWE Superstar larınız, Legend lar, Hall of Famer lar ve NXT nin en iyileri, şenliklere katılacak ve WWE 2K serisinin yeniden doğuşunu kutlayacak! WWE 2K20 de temel oynanış geliştirmeleri, kolaylaştırılmış kontroller ve seride şimdiye kadarki en eğlenceli ve yaratıcı şekilde kapsamlı giriş olacak.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'PGA TOUR 2K21', 
(select genreID from Genre where genre = 'Sports'), '2K', 'HB Studios', '2020-08-21', '$50', 'Profesyonellere karşı oynayın. Ekibinizle oynayın. PGA TOUR 2K21 de kurallara göre oynayın veya kendi kurallarınızı yaratın!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'FIFA 22 Xbox One', 
(select genreID from Genre where genre = 'Sports'), 'Electronic Arts', 'EA Canada', '2021-10-01', '$60', 'FIFA 22 Oynayın, Yeni Nesil Oyuncu Ögesi Elde Edin: 15 Aralık tan itibaren 14 Ocak 2022 ye kadar FIFA 22 oynayarak FIFA Ultimate Team de satılamayan Yeni Nesil Oyuncu Ögesi elde edin.'),





((select platformID from
GamePlatform where platformName = 'Console'), 'Insurgency: Sandstorm', 
(select genreID from Genre where genre = 'Strategy'), 'Focus Home Interactive', 'New World Interactive', '2021-09-29', '$35', 'Konsollara yönelik bu taktiksel FPS de gerçekçi modern silahlı çatışmalara girin! Bir dizi şiddetli kooperatif ve rekabete dayalı çok oyunculu modlarda günümüzde yaşanan kurgusal bir savaşın etkileriyle harabeye dönmüş mekanlarda savaşın. Eşsiz bir sürükleyicilik ile ölümcül yakın mesafe çatışmalarında her mermiyi hissedin ve her darbeden korkun.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Farming Simulator 19', 
(select genreID from Genre where genre = 'Strategy'), 'FOCUS Home Entertainment', 'GIANTS Software GmbH', '2018-11-20', '$25', 'Bir numaralı tarım simülasyonu, grafikleri baştan sona yenilenmiş olarak ve gelmiş geçmiş en kapsamlı tarım deneyimi ile geri dönüyor! Modern bir çiftçi olun ve heyecan verici yeni tarım faaliyetleri, hasat edilecek mahsuller ve ilginizi bekleyen hayvanlarla dolu iki devasa Amerika ve Avrupa yerleşiminde çiftliğinizi geliştirin.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Space Hulk: Tactics', 
(select genreID from Genre where genre = 'Strategy'), 'Focus Home Interactive', 'Cyanide Studio', '2018-10-09', '$12', 'Space Hulk: Tactics, Warhammer 40.000 evreninde geçen ve bu kült klasik formüle eşsiz bir sürpriz ögesi katan Space Hulk masaüstü oyununun aslına bağlı bir uyarlamasıdır. Bir Terminator Space Marines veya ölümcül bir uzaylı Genestealer takımı olarak kanlı çatışmalara katıl.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Surviving Mars', 
(select genreID from Genre where genre = 'Strategy'), 'Paradox Interactive', 'Haemimont Games', '2018-03-15', '$24', 'Evine hoş geldin! Kızıl Gezegen Mars a yolculuğa çıkıp oradaki ilk insan kolonilerini oluşturma zamanı geldi! Tek ihtiyacın olan erzak, oksijen, yılların eğitimi, kum fırtınaları hakkında deneyim ve apansız ortaya çıkan şu tuhaf siyah küplerin ne olduğunu keşfetme hevesi. Biraz çeki düzen verdikten sonra burası harika gözükecek!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'XCOM 2', 
(select genreID from Genre where genre = 'Strategy'), '2K', 'Firaxis Games', '2016-09-30', '$45', 'XCOM 2, ödüllü strateji oyunu XCOM: Enemy Unknown un devamıdır. Dünya değişti ve uzaylı hakimiyetinde. Zorluklara rağmen XCOM u yeniden inşa etmeli, dünyamızı yeniden ele geçirip insanlığı kurtarmak için küresel direnişi ateşlemelisiniz.'),





((select platformID from
GamePlatform where platformName = 'Console'), 'Space Engineers', 
(select genreID from Genre where genre = 'Indie'), 'Keen Software House', 'Keen Software House', '2020-04-15', '$17', 'Space Engineers, gerçekçi, hacimsel tabanlı bir fizik motoruna sahiptir: oyundaki her şey monte edilebilir, demonte edilebilir, hasar görebilir ve yok edilebilir. Oyun, tek veya çok oyunculu modlarda oynanabilir.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Untitled Goose Game', 
(select genreID from Genre where genre = 'Indie'), 'Panic', 'House House', '2019-12-17', '$17', 'Untitled Goose Game, masum bir köydeki kaçak bir kaz rolünde olduğun açık uçlu bir slapstick gizlilik oyunudur. İnsanların arka bahçelerinden, ana caddedeki mağazalara ve köy meydanlarına kadar kasabada dolaş, şakalar kurgula, şapkaları çal, bol bol vakla ve genel olarak insanların günlerini mahvet.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Huntdown', 
(select genreID from Genre where genre = 'Indie'), 'Coffee Stain Publishing AB', 'Easy Trigger AB', '2020-05-12', '$17', 'Kanunsuz çetelerin işgal ettiği ve polislerin girmeye cesaret edemediği geleceğin kaos dolu sokaklarına sadece kelle avcıları adım atarak şehri suç olaylarının esaretinden kurtarabilir. Çok iyi hazırlanmış aksiyon ve komediyle dolu bu arcade nişancı oyununda, kanunsuz yeraltı dünyasını talan edip turnayı gözünden vur.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Telling Lies', 
(select genreID from Genre where genre = 'Indie'), 'Annapurna Interactive', 'Sam Barlow', '2020-04-28', '$17', 'Doğrusal olmayan hikaye anlatımına sahip bir araştırmacı gerilim oyunu olan Telling Lies, gizlice kaydedilmiş görüntülü konuşmaların önbelleği etrafında dönüyor.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Deliver Us The Moon', 
(select genreID from Genre where genre = 'Indie'), 'Wired Productions', 'KeokeN Interactive', '2020-04-24', '$20', 'Deliver Us The Moon, Dünya nın kaynaklarının tükendiği apokaliptik yakın bir gelecekte geçen bir Bilim Kurgu gerilim oyunudur. Çok önemli bir enerji tedarikini sağlayan bir ay kolonisi ile iletişim kesildi. Bir astronot, insanlığı yok olmaktan kurtarmaya yönelik kritik bir görev için tek başına aya gönderildi. İnsanoğlunu kurtaracak mısın yoksa uzayın karanlık boşluğunda unutulacak mısın?'),





((select platformID from
GamePlatform where platformName = 'Console'), 'Among Us', 
(select genreID from Genre where genre = 'Action'), 'Innersloth', 'Innersloth', '2021-12-14', '$4', 'Çevrimiçi veya yerel WiFi ağı üzerinde 4-15 kişiyle oynayabileceğin bu oyunda uzay gemini yolculuğa hazırla. Dikkatli ol çünkü Ekibinden biri veya birkaçı herkesi öldürmeye niyetli Sahtekâr olabilir!'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Dying Light: Platinum Edition', 
(select genreID from Genre where genre = 'Action'), 'Techland', 'Techland', '2021-05-27', '$48', 'Sadece en güçlünün hayatta kaldığı istilaya uğramış bir dünyada dolaş. İnsan ya da zombi, her türlü canavarla dövüşme becerilerinde ustalaş. Çatılarda parkura çık, silahlar üret ve kendi kâbuslarınla yüzleşirken bir yandan diğer afetzedelere yardım et.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Far Cry 6', 
(select genreID from Genre where genre = 'Action'), 'Ubisoft', 'Ubisoft Toronto', '2021-10-07', '$60', 'Zamanın adeta geçmişte takılıp kaldığı tropikal bir cennete, Yara ya hoş geldin. Yara diktatörü Anton Castillo, kanlı adımlarını takip eden oğlu Diego ile birlikte, ülkeyi geçmişin parlak günlerine geri döndürme iddiasıyla demir yumrukla yönetiyor ve hiçbir zorbalıktan kaçınmıyor. Bu zalim rejim elbette devrimci bir kalkışmaya yol açıyor.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Rust Console Edition', 
(select genreID from Genre where genre = 'Action'), 'Double Eleven', 'Double Eleven, Facepunch Studios', '2021-05-21', '$40', 'Rust ın tek hedefi hayatta kalmak; açlık, susuzluk ve soğuk gibi zorlukların üstesinden gelmektir. Bir ateş yak. Bir sığınak inşa et. Hayvanları öldür. Kendini diğer oyunculardan koru.'),


((select platformID from
GamePlatform where platformName = 'Console'), 'Resident Evil Village', 
(select genreID from Genre where genre = 'Action'), 'Capcom', 'Capcom', '2021-05-07', '$55', 'Büyük beğeni toplayan Resident Evil 7 biohazard daki korkunç olaylardan birkaç yıl sonra geçen yepyeni hikaye örgüsü, geçmişteki kabuslarından kurtularak yeni bir yerde huzurlu bir hayat sürdüren Ethan Winters ve eşi Mia ile başlıyor. Tam yeni hayatlarını yoluna koymaya başlamışken bir kez daha bir trajediyle karşı karşıya kalıyorlar.')




 CREATE PROCEDURE sp_EnPahalıOyun
AS 
BEGIN 
SELECT TOP 1* FROM Game 
ORDER BY price DESC 
END
exec sp_EnPahalıOyun;




CREATE PROCEDURE sp_Platform_OyunSayisi
AS 
BEGIN 
SELECT count(*)as OyunSayisi,platformName   From Game INNER JOIN GamePlatform on Game.platformID=GamePlatform.platformID
GROUP BY platformName 
ORDER BY COUNT(*) DESC 
END
exec sp_Platform_OyunSayisi



CREATE PROCEDURE sp_EnYeniOyunPc
AS 
BEGIN 
SELECT top 1 gameName,releaseDate from Game INNER JOIN GamePlatform
on Game.platformID=GamePlatform.platformID where GamePlatform.platformID=1
Order by releaseDate desc
END
exec sp_EnYeniOyunPc



Create Trigger trg_AccountSilinmez on Account
after delete
as
begin
raiserror('Account Tablosu üzerinde kayıt silinmez',1,1)
rollback transaction
end

delete from Account
drop trigger trg_AccountSilinmez




Create trigger trg_TarihKontrolu on Game
after insert
as
if(exists(Select * from inserted,Game where inserted.gameID = Game.GameID and
inserted.releaseDate>GETDATE()))
begin
  raiserror('Geçerli tarih giriniz!',1,1);
  rollback transaction
End

insert Game(releaseDate,gameName,content,publisherName,developerName,price) values('2022-12-12','denemeIsim','djsds','sa','dasa',15)




create view EnPahalı 
AS 
select top(1)Game.price from Game
inner join Genre on
Game.genreID=Genre.genreID and Genre.genre='Bluffing'
order by Game.price 

SELECT*FROM EnPahalı
drop view EnPahalı
