PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE moz_origins ( id INTEGER PRIMARY KEY, prefix TEXT NOT NULL, host TEXT NOT NULL, frecency INTEGER NOT NULL, UNIQUE (prefix, host) );
INSERT INTO moz_origins VALUES(1,'https://','www.mozilla.org',411);
INSERT INTO moz_origins VALUES(2,'https://','support.mozilla.org',146);
INSERT INTO moz_origins VALUES(3,'http://','www.ubuntu.com',6);
INSERT INTO moz_origins VALUES(4,'http://','wiki.ubuntu.com',6);
INSERT INTO moz_origins VALUES(5,'https://','answers.launchpad.net',6);
INSERT INTO moz_origins VALUES(6,'http://','www.debian.org',140);
INSERT INTO moz_origins VALUES(7,'http://','127.0.0.1:5001',500);
INSERT INTO moz_origins VALUES(8,'about:','home',3);
INSERT INTO moz_origins VALUES(9,'https://','www.downloadhelper.net',100);
INSERT INTO moz_origins VALUES(10,'https://','www.wappalyzer.com',710);
INSERT INTO moz_origins VALUES(11,'https://','www.google.com',2150);
INSERT INTO moz_origins VALUES(12,'https://','es.wikipedia.org',200);
INSERT INTO moz_origins VALUES(13,'https://','www.bing.com',200);
INSERT INTO moz_origins VALUES(14,'https://','www.baidu.com',100);
INSERT INTO moz_origins VALUES(15,'https://','yandex.com',200);
INSERT INTO moz_origins VALUES(16,'https://','www.tineye.com',25);
INSERT INTO moz_origins VALUES(17,'https://','www.shutterstock.com',225);
INSERT INTO moz_origins VALUES(18,'https://','pic.sogou.com',200);
INSERT INTO moz_origins VALUES(19,'https://','tineye.com',300);
INSERT INTO moz_origins VALUES(20,'https://','www.alamy.com',200);
INSERT INTO moz_origins VALUES(21,'https://','graph.baidu.com',100);
INSERT INTO moz_origins VALUES(22,'https://','lastpass.com',100);
INSERT INTO moz_origins VALUES(23,'https://','mybrowseraddon.com',300);
CREATE TABLE moz_places (   id INTEGER PRIMARY KEY, url LONGVARCHAR, title LONGVARCHAR, rev_host LONGVARCHAR, visit_count INTEGER DEFAULT 0, hidden INTEGER DEFAULT 0 NOT NULL, typed INTEGER DEFAULT 0 NOT NULL, frecency INTEGER DEFAULT -1 NOT NULL, last_visit_date INTEGER , guid TEXT, foreign_count INTEGER DEFAULT 0 NOT NULL, url_hash INTEGER DEFAULT 0 NOT NULL , description TEXT, preview_image_url TEXT, origin_id INTEGER REFERENCES moz_origins(id));
INSERT INTO moz_places VALUES(1,'https://www.mozilla.org/privacy/firefox/',NULL,'gro.allizom.www.',1,1,0,23,1622543806055574,'x6QMp5g63W5_',0,47356411089529,NULL,NULL,1);
INSERT INTO moz_places VALUES(2,'https://www.mozilla.org/es-ES/privacy/firefox/','Aviso de privacidad de Firefox — Mozilla','gro.allizom.www.',1,0,0,96,1622543806421848,'OJzvmTASv_gs',0,47360088379120,replace('\n  Our Privacy Notices describe the data our products and services receive, share, and use, as well as choices available to you.\n','\n',char(10)),'https://www.mozilla.org/media/img/mozorg/mozilla-256.4720741d4108.jpg',1);
INSERT INTO moz_places VALUES(3,'https://support.mozilla.org/es-ES/products/firefox',NULL,'gro.allizom.troppus.',0,0,0,134,NULL,'w0Ff8XfFPArp',1,47358497311954,NULL,NULL,2);
INSERT INTO moz_places VALUES(4,'https://support.mozilla.org/es-ES/kb/customize-firefox-controls-buttons-and-toolbars?utm_source=firefox-browser&utm_medium=default-bookmarks&utm_campaign=customize',NULL,'gro.allizom.troppus.',0,0,0,0,NULL,'SCjce2Pkypza',0,47356426271614,NULL,NULL,2);
INSERT INTO moz_places VALUES(5,'https://www.mozilla.org/es-ES/contribute/',NULL,'gro.allizom.www.',0,0,0,134,NULL,'NOB6UGJvAxjQ',1,47359268356403,NULL,NULL,1);
INSERT INTO moz_places VALUES(6,'https://www.mozilla.org/es-ES/about/',NULL,'gro.allizom.www.',0,0,0,134,NULL,'1vvgrxG4IMyL',1,47358639445863,NULL,NULL,1);
INSERT INTO moz_places VALUES(7,'http://www.ubuntu.com/',NULL,'moc.utnubu.www.',0,0,0,0,NULL,'T9M-5Nbbj0JG',0,125508050257634,NULL,NULL,3);
INSERT INTO moz_places VALUES(8,'http://wiki.ubuntu.com/',NULL,'moc.utnubu.ikiw.',0,0,0,0,NULL,'7bEMpQt8sMHM',0,125511519733047,NULL,NULL,4);
INSERT INTO moz_places VALUES(9,'https://answers.launchpad.net/ubuntu/+addquestion',NULL,'ten.daphcnual.srewsna.',0,0,0,0,NULL,'u6JtXOq-qRZu',0,47359338650210,NULL,NULL,5);
INSERT INTO moz_places VALUES(10,'http://www.debian.org/',NULL,'gro.naibed.www.',0,0,0,134,NULL,'euA6gm8NyoKO',1,125508165346216,NULL,NULL,6);
INSERT INTO moz_places VALUES(11,'https://www.mozilla.org/es-ES/firefox/central/',NULL,'gro.allizom.www.',0,0,0,0,NULL,'Mg7UbMv4gM2D',0,47358724282746,NULL,NULL,1);
INSERT INTO moz_places VALUES(12,'http://127.0.0.1:5001/','SpiderFoot v3.3.0','1.0.0.721.',1,0,0,96,1625740650243652,'noWDnOu12lH_',0,125508804792892,NULL,NULL,7);
INSERT INTO moz_places VALUES(13,'http://127.0.0.1:5001/newscan','SpiderFoot v3.3.0','1.0.0.721.',1,0,0,96,1625740657670304,'YgOZKkIMYCVp',0,125509194932142,NULL,NULL,7);
INSERT INTO moz_places VALUES(14,'http://127.0.0.1:5001/newscan#','SpiderFoot v3.3.0','1.0.0.721.',2,0,0,190,1625740693628961,'28-GguNlALgP',0,125510638874807,NULL,NULL,7);
INSERT INTO moz_places VALUES(15,'http://127.0.0.1:5001/scaninfo?id=BDE499FC','SpiderFoot v3.3.0','1.0.0.721.',1,0,0,96,1625740702995577,'vN6IzgfUT5Ai',0,125511126088673,NULL,NULL,7);
INSERT INTO moz_places VALUES(16,'about:home',NULL,'.',0,0,0,0,NULL,'4at8x5D25HMH',0,175533355016793,NULL,NULL,8);
INSERT INTO moz_places VALUES(17,'https://www.downloadhelper.net/welcome?browser=firefox&version=7.6.0','DownloadHelper - Video download browser extension','ten.replehdaolnwod.www.',1,0,0,98,1625758532099772,'SlDCPrMfqzhU',0,47357951745052,'DownloadHelper: the easy way to Web videos. Download tons of videos from most of YouTube like sites.',NULL,9);
INSERT INTO moz_places VALUES(18,'https://www.wappalyzer.com/installed/?utm_source=installed&utm_medium=extension&utm_campaign=wappalyzer','Installation successful - Wappalyzer','moc.rezylappaw.www.',4,0,0,400,1625836031383002,'YYyZvpm7I3Td',0,47360488869919,NULL,NULL,10);
INSERT INTO moz_places VALUES(19,'https://www.wappalyzer.com/installed?utm_source=installed&utm_medium=extension&utm_campaign=wappalyzer','Installation successful - Wappalyzer','moc.rezylappaw.www.',3,0,0,300,1625835163864210,'VxUL16S7OxKl',0,47360410894994,NULL,NULL,10);
INSERT INTO moz_places VALUES(20,'https://www.google.com/search?channel=fs&client=ubuntu&q=castillo+villena','castillo villena - Buscar con Google','moc.elgoog.www.',1,0,1,1950,1625820512512588,'OzO-oqvqRyyM',0,47360021159877,NULL,NULL,11);
INSERT INTO moz_places VALUES(21,'https://www.google.com/url?sa=t&source=web&cd=&ved=2ahUKEwjpifCwzdXxAhUDcBQKHWnXB8gQFjAAegQIBhAD&url=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FCastillo_de_la_Atalaya&usg=AOvVaw1E9FdWs8tFb6jnOWtAzuCT',NULL,'moc.elgoog.www.',1,1,0,24,1625820517431657,'vBBuac9M7Aa-',0,47359434548124,NULL,NULL,11);
INSERT INTO moz_places VALUES(22,'https://es.wikipedia.org/wiki/Castillo_de_la_Atalaya','Castillo de la Atalaya - Wikipedia, la enciclopedia libre','gro.aidepikiw.se.',1,0,0,98,1625820517674493,'n4G6sArNyi1U',0,47357675973494,NULL,'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Castillo_de_la_Atalaya%2C_Villena.JPG/1200px-Castillo_de_la_Atalaya%2C_Villena.JPG',12);
INSERT INTO moz_places VALUES(23,'https://es.wikipedia.org/wiki/Archivo:Castillo_de_la_Atalaya,_Villena.JPG','Archivo:Castillo de la Atalaya, Villena.JPG - Wikipedia, la enciclopedia libre','gro.aidepikiw.se.',1,0,0,98,1625820521685761,'PpGB_kqZQ0yS',0,47357678586315,NULL,'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Castillo_de_la_Atalaya%2C_Villena.JPG/1200px-Castillo_de_la_Atalaya%2C_Villena.JPG',12);
INSERT INTO moz_places VALUES(24,'https://www.bing.com/images/search?q=imgurl:https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG&view=detailv2&iss=sbi&FORM=IRSBIQ&redirecturl=https%3A%2F%2Fwww.bing.com%2Fimages%2Fdiscover%3Fform%3DHDRSC2#enterInsights','imgurl:https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Castillo_de_la_Atalaya%2C_Villena.JPG/800px-Castillo_de_la_Atalaya%2C_Villena.JPG - Bing','moc.gnib.www.',1,0,0,98,1625820531073971,'8lWcXAEZp6Er',0,47358786170231,'Busca imágenes, fotos y GIF animados de alta calidad con Imágenes de Bing',NULL,13);
INSERT INTO moz_places VALUES(25,'https://www.google.com/searchbyimage?image_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG',NULL,'moc.elgoog.www.',1,1,0,24,1625820532436997,'_MpV-QPjXWX6',0,47358177127166,NULL,NULL,11);
INSERT INTO moz_places VALUES(26,'https://www.baidu.com/','百度一下，你就知道','moc.udiab.www.',1,0,0,98,1625820534256637,'kXRP5X4GgQ3L',0,47359496662664,'全球领先的中文搜索引擎、致力于让网民更便捷地获取信息，找到所求。百度超过千亿的中文网页数据库，可以瞬间找到相关的搜索结果。',NULL,14);
INSERT INTO moz_places VALUES(27,'https://yandex.com/images/search?url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG&rpt=imageview','Yandex.Images: image search','moc.xednay.',1,0,0,98,1625820535552780,'Et98nJYUAOsX',0,47358262293235,'Image search for clothes and similar products, text recognition and translation, unique image check, image copy search, identification for items in images. Image and photo search. #yandexvision',NULL,15);
INSERT INTO moz_places VALUES(28,'https://www.tineye.com/search/?&url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG',NULL,'moc.eyenit.www.',1,1,0,24,1625820535580539,'PX2YqwUstbx0',0,47360318762634,NULL,NULL,16);
INSERT INTO moz_places VALUES(29,'https://www.google.com/search?tbs=sbi:AMhZZivddIvyiLRiAvNxBycppSiXXViY1E6chmpCtsERik05NmM0rA6fXmDQ474X1A9Bczqu8Xixa3b2hgQeI962vfDVws4SEkKYlTTb3ASBeSBpyMzJdQyQJuKUbnV9V0lwx1EAbU_1QE_1iyk3avqPiJm1BtskeZSdhsCEqeJGC3CrY8sQF5RS6D6PcgQskaLiIw2TqfEuwW6tKAaPtIrYdyR02dMJDyX6gPhp1U116qgejXORWDxza7Bk8lHEsX5HH0zK05hYa_15UlYrKGVulBGZeelygC7KN7izHKxbg6hTnLu7pHggOFvXSzPGAsoW_1EeXNwUD2YkxtZjyVbmm6ybl-Ph4UUxpw','Buscar con Google','moc.elgoog.www.',1,0,0,98,1625820535610703,'PsM4oOLYtPHS',0,47358165999441,NULL,NULL,11);
INSERT INTO moz_places VALUES(30,'https://www.shutterstock.com/',NULL,'moc.kcotsrettuhs.www.',1,1,0,24,1625820536322039,'UhcOuPPhnDFS',0,47356444712643,NULL,NULL,17);
INSERT INTO moz_places VALUES(31,'https://pic.sogou.com/','搜狗图片搜索 - 上网从搜狗开始','moc.uogos.cip.',1,0,0,98,1625820537212209,'wSUNeFsr3s4X',0,47356902887874,NULL,NULL,18);
INSERT INTO moz_places VALUES(32,'https://tineye.com/search/?&url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG','TinEye - Search','moc.eyenit.',1,0,0,98,1625820537868860,'wIIaKC-LRyQe',0,47358476841036,NULL,NULL,19);
INSERT INTO moz_places VALUES(33,'https://www.alamy.com/','Alamy – Stock Photos, Stock Images & Vectors','moc.ymala.www.',1,0,0,98,1625820537964793,'WKji5s-gTijN',0,47358007239742,'263.07 million stock images, vectors and videos. Greater choice from Alamy, the world’s most diverse stock photo collection.',NULL,20);
INSERT INTO moz_places VALUES(34,'https://www.shutterstock.com/es/','Imágenes, fotos, vectores, videos y música de stock | Shutterstock','moc.kcotsrettuhs.www.',1,0,0,98,1625820538850715,'PmuaZe9FXvJK',0,47359046093903,'Descargue las mejores imágenes libres de regalías de Shutterstock. Se incluyen fotos, vectores e ilustraciones. Disfrute de precios justos y licencias simples.','https://images.ctfassets.net/hrltx12pl8hq/77GggTyKiJLd3dttVDYKDd/3e0e32d2c3e2f08d566b154e4f3e70dc/sstklogo_og.jpg',17);
INSERT INTO moz_places VALUES(35,'https://www.bing.com/images/search?q=imgurl:https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG&view=detailv2&iss=sbi&form=IRSBIQ&redirecturl=https%3A%2F%2Fwww.bing.com%2Fimages%2Fdiscover%3Fform%3DHDRSC2&selectedindex=0&id=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG&ccid=jBWjeW1N&simid=607994866164447225&ck=C881BC981A2259D5BDC557CEEBD93626&thid=OIP.jBWjeW1NYNYnOHR3lJpZGAHaFj&mediaurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG&exph=600&expw=800&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.8c15a3796d4d60d627387477949a5918%3Frik%3DzRgMRpqvQI%252fJow%26pid%3DImgRaw&vt=2&sim=11','imgurl:https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Castillo_de_la_Atalaya%2C_Villena.JPG/800px-Castillo_de_la_Atalaya%2C_Villena.JPG - Bing','moc.gnib.www.',1,0,0,98,1625820539473504,'WnhTkLbOjA5U',0,47359869039853,NULL,NULL,13);
INSERT INTO moz_places VALUES(36,'https://tineye.com/search/?url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F74%2FCastillo_de_la_Atalaya%252C_Villena.JPG%2F800px-Castillo_de_la_Atalaya%252C_Villena.JPG','TinEye - Search','moc.eyenit.',1,0,0,98,1625820554214993,'ZIsh0Zalij4W',0,47359910811214,NULL,NULL,19);
INSERT INTO moz_places VALUES(37,'https://yandex.com/images/search?rpt=imageview&url=https%3A%2F%2Favatars.mds.yandex.net%2Fget-images-cbir%2F4669333%2F2SUOh8cwaH1GymKqAtrprA6438%2Forig&cbir_id=4669333%2F2SUOh8cwaH1GymKqAtrprA6438','Yandex.Images: image search','moc.xednay.',1,0,0,98,1625820554552318,'BzczlMBlR_uA',0,47360259663712,NULL,NULL,15);
INSERT INTO moz_places VALUES(38,'https://tineye.com/search/15afbe0b2b2095321e8270fee73d7fabf6213c11?sort=score&order=desc&page=1','4 TinEye search results','moc.eyenit.',1,0,0,98,1625820560572482,'dqn3I13O4C74',0,47358564148887,NULL,NULL,19);
INSERT INTO moz_places VALUES(39,'https://www.shutterstock.com/es/search/ris/13406041%2C617959283%2C1245699316%2C1658444890%2C1267739491%2C149518991%2C1683376945%2C1270488205%2C536071573%2C1880314372%2C449092894%2C1309294099%2C718463344%2C264747968%2C704199133%2C605265314%2C1177396144%2C617959367%2C1116873614%2C460875868%2C1133556233%2C1165475170%2C1342250438%2C1089469736%2C712990483%2C144590882%2C1503485168%2C45524464%2C1931781392%2C706989289%2C1601666185%2C1475489381%2C497571100%2C1245686122%2C99146114%2C1799799283%2C740741179%2C160063145%2C752909503%2C1067835482%2C1897174195%2C1548429335%2C1838412817%2C465190163%2C423177991%2C423177934%2C25785100%2C625863887%2C45049990%2C1543566719%2C1337611847%2C518926795%2C733324111%2C749483335%2C39660367%2C733614217%2C157021514%2C179244422%2C1594872451%2C55159717%2C89162350%2C418420849%2C1313624246%2C379565437%2C11649676%2C1245699190%2C143279773%2C449254771%2C1197057373%2C356520584%2C1555179239%2C613097138%2C72087304%2C119834938%2C4422679%2C150606353%2C1014856879%2C118618570%2C223917394%2C282446768%2C359792786%2C373689412%2C218542225%2C1342250483%2C704199091%2C1156155613%2C1545311987%2C745540936%2C1089468161%2C42003754%2C1676653564%2C105872894%2C1467673763%2C150077552%2C339174053%2C237872098%2C1869250129%2C616362665%2C160648826%2C728711722','Imágenes, fotos, vectores, videos y música de stock | Shutterstock','moc.kcotsrettuhs.www.',1,0,0,98,1625820570055034,'bOXXrrfNkSBd',0,47359801132331,NULL,NULL,17);
INSERT INTO moz_places VALUES(40,'https://graph.baidu.com/s?sign=126851c19d2fdd7f957e801625820569&f=degrade&srcp=&tn=pc&idctag=gz&sids=10006_10801_10600_10915_10913_11006_10924_10905_10018_10901_10942_10907_11012_10970_10968_10972_11031_12201_17850_17070_18013_18101_19102_17201_17202_18300_18400_18312_18332_18412_19118_19120_19131_19300_19132_19148_19163_19200_19211_19213_19215_19217_19219_9999&logid=2512375592&srcp=&tn=pc&idctag=gz&sids=10006_10801_10600_10915_10913_11006_10924_10905_10018_10901_10942_10907_11012_10970_10968_10972_11031_12201_17850_17070_18013_18101_19102_17201_17202_18300_18400_18312_18332_18412_19118_19120_19131_19300_19132_19148_19163_19200_19211_19213_19215_19217_19219_9999&logid=2512375592&pageFrom=graph_upload_pcshitu&extUiData%5BisLogoShow%5D=1&tpl_from=pc&entrance=general','百度识图搜索结果','moc.udiab.hparg.',1,0,0,98,1625820571586267,'Ris1nxk4heex',0,47356801232272,'百度图像搜索-领先的图像识别技术连接人与信息-为你搜寻所见',NULL,21);
INSERT INTO moz_places VALUES(41,'https://www.alamy.com/search.html?imageurl=d34afe50-ab02-4cab-be69-eca435c7210b.jpg&mode=0','High Resolution Stock Photography and Images - Alamy','moc.ymala.www.',1,0,0,98,1625820572728433,'Q9JxIh5uoykF',0,47356683908578,'Your search did not return any results.',NULL,20);
INSERT INTO moz_places VALUES(42,'https://pic.sogou.com/ris?flag=1&&from=pic_result_list&query=http%3A%2F%2Fimg01.sogoucdn.com%2Fapp%2Fa%2F100520146%2F8c15a3796d4d60d627387477949a5918',NULL,'moc.uogos.cip.',1,0,0,98,1625820574511551,'-krkzicutfKH',0,47359358759970,NULL,NULL,18);
INSERT INTO moz_places VALUES(43,'https://lastpass.com/automatic-login','Automatic Extension Login | LastPass','moc.ssaptsal.',1,0,0,98,1625830465277597,'OgQARctGwp-L',0,47358816566693,'LastPass es un gestor de contraseñas y una herramienta para completar formularios en línea que hace que navegar resulte más sencillo y seguro.',NULL,22);
INSERT INTO moz_places VALUES(44,'https://mybrowseraddon.com/useragent-switcher.html?v=0.2.7&type=install','User-Agent Switcher :: MyBrowserAddon','moc.noddaresworbym.',2,0,0,200,1625836008687927,'v9WuXHRCtzvW',0,47360544470058,'Quickly and easily switch between popular user-agent strings.','https://cdn.mybrowseraddon.com/images/useragent-switcher-small.png',23);
INSERT INTO moz_places VALUES(45,'https://mybrowseraddon.com/useragent-switcher.html?v=0.2.7&type=uninstall','User-Agent Switcher :: MyBrowserAddon','moc.noddaresworbym.',1,0,0,100,1625835961456617,'315YwvLKOzDZ',0,47359215881427,'Quickly and easily switch between popular user-agent strings.','https://cdn.mybrowseraddon.com/images/useragent-switcher-small.png',23);
CREATE TABLE moz_historyvisits (  id INTEGER PRIMARY KEY, from_visit INTEGER, place_id INTEGER, visit_date INTEGER, visit_type INTEGER, session INTEGER);
INSERT INTO moz_historyvisits VALUES(1,0,1,1622543806055574,1,0);
INSERT INTO moz_historyvisits VALUES(2,1,2,1622543806421848,5,0);
INSERT INTO moz_historyvisits VALUES(3,0,12,1625740650243652,1,0);
INSERT INTO moz_historyvisits VALUES(4,3,13,1625740657670304,1,0);
INSERT INTO moz_historyvisits VALUES(5,0,14,1625740690992486,1,0);
INSERT INTO moz_historyvisits VALUES(6,0,14,1625740693628961,1,0);
INSERT INTO moz_historyvisits VALUES(7,6,15,1625740702995577,1,0);
INSERT INTO moz_historyvisits VALUES(8,0,17,1625758532099772,1,0);
INSERT INTO moz_historyvisits VALUES(9,0,18,1625820217586718,1,0);
INSERT INTO moz_historyvisits VALUES(10,9,19,1625820220565924,1,0);
INSERT INTO moz_historyvisits VALUES(11,0,20,1625820512512588,2,0);
INSERT INTO moz_historyvisits VALUES(12,11,21,1625820517431657,1,0);
INSERT INTO moz_historyvisits VALUES(13,12,22,1625820517674493,6,0);
INSERT INTO moz_historyvisits VALUES(14,13,23,1625820521685761,1,0);
INSERT INTO moz_historyvisits VALUES(15,0,24,1625820531073971,1,0);
INSERT INTO moz_historyvisits VALUES(16,0,25,1625820532436997,1,0);
INSERT INTO moz_historyvisits VALUES(17,0,26,1625820534256637,1,0);
INSERT INTO moz_historyvisits VALUES(18,0,27,1625820535552780,1,0);
INSERT INTO moz_historyvisits VALUES(19,0,28,1625820535580539,1,0);
INSERT INTO moz_historyvisits VALUES(20,16,29,1625820535610703,6,0);
INSERT INTO moz_historyvisits VALUES(21,0,30,1625820536322039,1,0);
INSERT INTO moz_historyvisits VALUES(22,0,31,1625820537212209,1,0);
INSERT INTO moz_historyvisits VALUES(23,19,32,1625820537868860,5,0);
INSERT INTO moz_historyvisits VALUES(24,0,33,1625820537964793,1,0);
INSERT INTO moz_historyvisits VALUES(25,21,34,1625820538850715,6,0);
INSERT INTO moz_historyvisits VALUES(26,15,35,1625820539473504,1,0);
INSERT INTO moz_historyvisits VALUES(27,23,36,1625820554214993,1,0);
INSERT INTO moz_historyvisits VALUES(28,18,37,1625820554552318,1,0);
INSERT INTO moz_historyvisits VALUES(29,27,38,1625820560572482,1,0);
INSERT INTO moz_historyvisits VALUES(30,25,39,1625820570055034,1,0);
INSERT INTO moz_historyvisits VALUES(31,17,40,1625820571586267,1,0);
INSERT INTO moz_historyvisits VALUES(32,24,41,1625820572728433,1,0);
INSERT INTO moz_historyvisits VALUES(33,22,42,1625820574511551,1,0);
INSERT INTO moz_historyvisits VALUES(34,0,18,1625828149680640,1,0);
INSERT INTO moz_historyvisits VALUES(35,34,19,1625828152445392,1,0);
INSERT INTO moz_historyvisits VALUES(36,0,43,1625830465277597,1,0);
INSERT INTO moz_historyvisits VALUES(37,0,18,1625835161633777,1,0);
INSERT INTO moz_historyvisits VALUES(38,37,19,1625835163864210,1,0);
INSERT INTO moz_historyvisits VALUES(39,0,44,1625835535597812,1,0);
INSERT INTO moz_historyvisits VALUES(40,0,45,1625835961456617,1,0);
INSERT INTO moz_historyvisits VALUES(41,0,44,1625836008687927,1,0);
INSERT INTO moz_historyvisits VALUES(42,0,18,1625836031383002,1,0);
CREATE TABLE moz_inputhistory (  place_id INTEGER NOT NULL, input LONGVARCHAR NOT NULL, use_count INTEGER, PRIMARY KEY (place_id, input));
CREATE TABLE moz_bookmarks (  id INTEGER PRIMARY KEY, type INTEGER, fk INTEGER DEFAULT NULL, parent INTEGER, position INTEGER, title LONGVARCHAR, keyword_id INTEGER, folder_type TEXT, dateAdded INTEGER, lastModified INTEGER, guid TEXT, syncStatus INTEGER NOT NULL DEFAULT 0, syncChangeCounter INTEGER NOT NULL DEFAULT 1);
INSERT INTO moz_bookmarks VALUES(1,2,NULL,0,0,'',NULL,NULL,1622543805990000,1626104017856000,'root________',1,1);
INSERT INTO moz_bookmarks VALUES(2,2,NULL,1,0,'menu',NULL,NULL,1622543805990000,1626104017856000,'menu________',1,3);
INSERT INTO moz_bookmarks VALUES(3,2,NULL,1,1,'toolbar',NULL,NULL,1622543805990000,1626104002887000,'toolbar_____',1,6);
INSERT INTO moz_bookmarks VALUES(4,2,NULL,1,2,'tags',NULL,NULL,1622543805990000,1622543805990000,'tags________',1,1);
INSERT INTO moz_bookmarks VALUES(5,2,NULL,1,3,'unfiled',NULL,NULL,1622543805990000,1622543807242000,'unfiled_____',1,2);
INSERT INTO moz_bookmarks VALUES(6,2,NULL,1,4,'mobile',NULL,NULL,1622543806005000,1622543807242000,'mobile______',1,2);
INSERT INTO moz_bookmarks VALUES(7,2,NULL,2,0,'Mozilla Firefox',NULL,NULL,1622543807538000,1626104014789000,'S5qPSj8u21hL',0,2);
INSERT INTO moz_bookmarks VALUES(8,1,3,7,0,'Obtener ayuda',NULL,NULL,1622543807538000,1622543807538000,'-zi4XhvEEnXA',0,1);
INSERT INTO moz_bookmarks VALUES(9,1,4,7,1,'Personalice Firefox',NULL,NULL,1622543807538000,1622543807538000,'V-HIJNuThVKQ',0,1);
INSERT INTO moz_bookmarks VALUES(10,1,5,7,1,'¡Involúcrese!',NULL,NULL,1622543807538000,1622543807538000,'Y4yl0h6cr-rd',0,1);
INSERT INTO moz_bookmarks VALUES(11,1,6,7,2,'Acerca de nosotros',NULL,NULL,1622543807538000,1622543807538000,'yIuPosG2Tbq9',0,1);
INSERT INTO moz_bookmarks VALUES(12,2,NULL,2,1,'Ubuntu and Free Software links',NULL,NULL,1622543807538000,1626104017856000,'HAJbgZNmrGrx',0,4);
INSERT INTO moz_bookmarks VALUES(13,1,7,12,0,'Ubuntu',NULL,NULL,1622543807538000,1622543807538000,'wx-cyDf8lDHI',0,1);
INSERT INTO moz_bookmarks VALUES(14,1,8,12,1,'Ubuntu Wiki (community-edited website)',NULL,NULL,1622543807538000,1622543807538000,'wxDpfbPWhpbb',0,1);
INSERT INTO moz_bookmarks VALUES(15,1,9,12,2,'Make a Support Request to the Ubuntu Community',NULL,NULL,1622543807538000,1622543807538000,'talM3mxAp3_X',0,1);
INSERT INTO moz_bookmarks VALUES(16,1,10,12,0,'Debian (Ubuntu is based on Debian)',NULL,NULL,1622543807538000,1622543807538000,'4cB4BE7Au2jw',0,1);
INSERT INTO moz_bookmarks VALUES(17,1,11,3,0,'Comenzar a usar Firefox',NULL,NULL,1622543807983000,1622543807983000,'4AMOxWPC9oeN',0,1);
INSERT INTO moz_bookmarks VALUES(18,1,16,3,1,'prueba',NULL,NULL,1625757534744000,1625757543400000,'TjK9BKWBZrK4',1,2);
CREATE TABLE moz_bookmarks_deleted (  guid TEXT PRIMARY KEY, dateRemoved INTEGER NOT NULL DEFAULT 0);
CREATE TABLE moz_keywords (  id INTEGER PRIMARY KEY AUTOINCREMENT, keyword TEXT UNIQUE, place_id INTEGER, post_data TEXT);
CREATE TABLE moz_anno_attributes (  id INTEGER PRIMARY KEY, name VARCHAR(32) UNIQUE NOT NULL);
CREATE TABLE moz_annos (  id INTEGER PRIMARY KEY, place_id INTEGER NOT NULL, anno_attribute_id INTEGER, content LONGVARCHAR, flags INTEGER DEFAULT 0, expiration INTEGER DEFAULT 0, type INTEGER DEFAULT 0, dateAdded INTEGER DEFAULT 0, lastModified INTEGER DEFAULT 0);
CREATE TABLE moz_items_annos (  id INTEGER PRIMARY KEY, item_id INTEGER NOT NULL, anno_attribute_id INTEGER, content LONGVARCHAR, flags INTEGER DEFAULT 0, expiration INTEGER DEFAULT 0, type INTEGER DEFAULT 0, dateAdded INTEGER DEFAULT 0, lastModified INTEGER DEFAULT 0);
CREATE TABLE moz_meta (key TEXT PRIMARY KEY, value NOT NULL) WITHOUT ROWID ;
INSERT INTO moz_meta VALUES('origin_frecency_count',23);
INSERT INTO moz_meta VALUES('origin_frecency_sum',6327.9999999999999998);
INSERT INTO moz_meta VALUES('origin_frecency_sum_of_squares',6057803.9999999999999);
ANALYZE sqlite_master;
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_originidindex','11 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_guid_uniqueindex','11 1');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_lastvisitdateindex','11 4');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_frecencyindex','11 4');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_visitcount','11 6');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_hostindex','11 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_url_hashindex','11 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_dateindex','2 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_fromindex','2 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_placedateindex','2 1 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_guid_uniqueindex','17 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_dateaddedindex','17 5');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemlastmodifiedindex','17 2 2');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_parentindex','17 3 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemindex','17 2 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_originidindex','11 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_guid_uniqueindex','11 1');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_lastvisitdateindex','11 4');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_frecencyindex','11 4');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_visitcount','11 6');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_hostindex','11 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_url_hashindex','11 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_dateindex','2 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_fromindex','2 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_placedateindex','2 1 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_guid_uniqueindex','17 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_dateaddedindex','17 5');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemlastmodifiedindex','17 2 2');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_parentindex','17 3 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemindex','17 2 2');
DELETE FROM sqlite_sequence;
CREATE INDEX moz_places_url_hashindex ON moz_places (url_hash);
CREATE INDEX moz_places_hostindex ON moz_places (rev_host);
CREATE INDEX moz_places_visitcount ON moz_places (visit_count);
CREATE INDEX moz_places_frecencyindex ON moz_places (frecency);
CREATE INDEX moz_places_lastvisitdateindex ON moz_places (last_visit_date);
CREATE UNIQUE INDEX moz_places_guid_uniqueindex ON moz_places (guid);
CREATE INDEX moz_places_originidindex ON moz_places (origin_id);
CREATE INDEX moz_historyvisits_placedateindex ON moz_historyvisits (place_id, visit_date);
CREATE INDEX moz_historyvisits_fromindex ON moz_historyvisits (from_visit);
CREATE INDEX moz_historyvisits_dateindex ON moz_historyvisits (visit_date);
CREATE INDEX moz_bookmarks_itemindex ON moz_bookmarks (fk, type);
CREATE INDEX moz_bookmarks_parentindex ON moz_bookmarks (parent, position);
CREATE INDEX moz_bookmarks_itemlastmodifiedindex ON moz_bookmarks (fk, lastModified);
CREATE INDEX moz_bookmarks_dateaddedindex ON moz_bookmarks (dateAdded);
CREATE UNIQUE INDEX moz_bookmarks_guid_uniqueindex ON moz_bookmarks (guid);
CREATE UNIQUE INDEX moz_keywords_placepostdata_uniqueindex ON moz_keywords (place_id, post_data);
CREATE UNIQUE INDEX moz_annos_placeattributeindex ON moz_annos (place_id, anno_attribute_id);
CREATE UNIQUE INDEX moz_items_annos_itemattributeindex ON moz_items_annos (item_id, anno_attribute_id);
COMMIT;
