



local NAMES = {
	male = {"Ackerley", "Adney", "Aeduuard", "Aeduuin", "Aelfraed", "Aland", "Alderney", "Aldis", "Aldred", "Aldrich", "Aldwin", "Algernon", "Alistair", "Allard", "Allister", "Alston", "Amherst", "Archer", "Arledge", "Arley", "Arnette", "Arthur", "Arundel", "Ascot", "Ashton", "Atherton", "Atkins", "Atwater", "Auden", "Audrey", "Audric", "Aylmer", "Aylwin", "Badrick", "Bancroft", "Barden", "Barlow", "Barney", "Barric", "Barrington", "Barse", "Bartley", "Bartram", "Bassett", "Baul", "Bavol", "Baxter", "Bayard", "Beaman", "Beasley", "Beaver", "Bentley", "Berkeley", "Berwick", "Beval", "Bickford", "Birkitt", "Birley", "Birney", "Birtle", "Blakely", "Blaxton", "Blythe", "Bolton", "Booker", "Bosley", "Boswell", "Bowman", "Bradburn", "Braden", "Bradford", "Bradshaw", "Bradyn", "Brainard", "Bramwell", "Brandon", "Brantley", "Branton", "Brawley", "Braxton", "Brayden", "Brayton", "Brenner", "Brentley", "Bridgely", "Brigham", "Brinley", "Brishen", "Brockton", "Bronson", "Buckminster", "Burbank", "Burdan", "Burleigh", "Burne", "Byram", "Cadby", "Caldwell", "Carleton", "Carlyle", "Carnell", "Carsen", "Cartland", "Cartwright", "Cederic", "Chancellor", "Chandler", "Channing", "Chanse", "Charlton", "Chaucey", "Cheston", "Chilton", "Clayborne", "Clayton", "Cleavon", "Clifford", "Clifton", "Clinton", "Colton", "Cranley", "Cuthbert", "Dalton", "Darby", "Darren", "Darthmouth", "Darwyn", "Davidson", "Dawson", "Dayton", "Delbert", "Denver", "Denzel", "Devon", "Drake", "Dudley", "Durriken", "Durwin", "Dwennon", "Easton", "Edgar", "Edmundus", "Egbert", "Eldon", "Elton", "Erwan", "Filmore", "Franklin", "Galore", "Galorian", "Garman", "Garrett", "Garrick", "Garridan", "Garroway", "Gerard", "Godwin", "Golding", "Gordon", "Hadden", "Haelan", "Hammond", "Harding", "Hartley", "Haylan", "Hazlitt", "Hearst", "Heathcliff", "Heathcote", "Holden", "Houston", "Howard", "Hunter", "Hyde", "Irving", "Irwin", "Jackson", "Jagger", "Jamie", "Jamison", "Jarrett", "Jaxon", "Jayden", "Jeffrey", "Jerald", "Jeremy", "Jerold", "Jerrard", "Johnson", "Judson", "Keaton", "Kelton", "Kelvin", "Kendall", "Kipling", "Kirby", "Kolby", "Lander", "Landon", "Lanford", "Langston", "Layne", "Leland", "London", "Lyman", "Lyndon", "Macon", "Maddox", "Madison", "Malin", "Manfield", "Manley", "Manning", "Marden", "Maven", "Mavis", "Maxwell", "Meldon", "Mendel", "Mitchell", "Moreland", "Nilson", "Oakes", "Oakley", "Paige", "Parker", "Payton", "Pearson", "Peyton", "Pierson", "Preston", "Quentin", "Radley", "Ramsey", "Randall", "Raymond", "Rhett", "Richard", "Ricker", "River", "Robert", "Robinson", "Robyn", "Rodney", "Roldan", "Royston", "Rudd", "Rudyard", "Rylan", "Sawyer", "Sedgewick", "Severin", "Shelton", "Sherman", "Sherrod", "Silas", "Sinjin", "Somerville", "Southwell", "Spalding", "Spencer", "Sterling", "Stewart", "Strong", "Stuart", "Tanner", "Tilton", "Trowbridge", "Twyford", "Udolf", "Ulmer", "Unwin", "Upton", "Upwood", "Usher", "Walden", "Wallace", "Warden", "Warrick", "Wayland", "Waylon", "Wayne", "Wesley", "Weston", "Whitcombe", "Whitfield", "Willard", "William", "Winston", "Winthrop", "Witter", "Wolfe", "Woodruff", "Woolsey", "Wylie", "Wymer", "Yates"},
	female = {"Abelena", "Abellana", "Aelfgifu", "Aelflaed", "Aethelburh", "Aetheldaeg", "Aetheldreda", "Aethelfled", "Aethelfrith", "Aethelgifu", "Aethelgyth", "Aethelswith", "Aethelu", "Aethylswith", "Afreda", "Ailith", "Alditha", "Aldyth", "Alfreda", "Alvar", "Alvina", "Amice", "Amity", "Anice", "Annis", "Arethusa", "Arietta", "Ashton", "Avellana", "Avery", "Balthilda", "Batilda", "Bega", "Beverly", "Bliss", "Blossom", "Braeden", "Breena", "Brighton", "British", "Brucie", "Cade", "Carling", "Cedrica", "Ceola", "Channel", "Chauncey", "Cinnamon", "Codie", "Corliss", "Cwenburg", "Cwenburh", "Cwenhild", "Cyneburg", "Cyneburh", "Dae", "Daisy", "Daralis", "Dawn", "Delight", "Dena", "Deorwynn", "Devon", "Diana", "Doanne", "Donella", "Duette", "Dulcina", "Eadburg", "Eadburga", "Eadburgh", "Eadburh", "Eadgifu", "Eadu", "Eadwynn", "Eald", "Easter", "Ebba", "Eda", "Edeva", "Edith", "Edmunda", "Edwena", "Edwina", "Egberta", "Eglantine", "Elfreda", "Elfredda", "Elfrida", "Elfrieda", "Elga", "Elgifu", "Ella", "Ellette", "Elmina", "Elvina", "Eolande", "Eostre", "Erline", "Ermengard", "Ethelberga", "Ethelburg", "Ethelburga", "Ethelburh", "Etheldreda", "Ethelfleda", "Ethelfrith", "Ethelgifu", "Ethelgyth", "Ethelinda", "Evelyn", "Everild", "Everilda", "Faerydae", "Farah", "Fay", "Faye", "Fayette", "Faylinn", "Fayre", "Fira", "Fleta", "Forestyne", "Garnet", "Gelsey", "Geretrudis", "Gidget", "Githa", "Gode", "Godelief", "Godeliff", "Godeliva", "Godelva", "Godgifu", "Godgyth", "Goditha", "Golda", "Golde", "Goldevia", "Goldwine", "Gullveig", "Gunilda", "Gunnhild", "Gytha", "Hadley", "Harley", "Hawkins", "Hazel", "Helewis", "Helewise", "Heloise", "Hereswith", "Hilaria", "Hildred", "Hodierna", "Hollis", "Hopkins", "Hulda", "Idla", "Ingrede", "Ingrith", "Ivy", "Jetta", "Jolecia", "Jolenta", "Kandi", "Kauanoe", "Keaton", "Kelby", "Kenley", "Kinsey", "Kip", "Kyneburg", "Laila", "Langgifu", "Lark", "Lee", "Letha", "Leuedai", "Liliana", "Lilli", "Lilly", "Lily", "Linden", "Lindsey", "Linsey", "Long", "Lorelle", "Lorica", "Lovedaia", "Lovedaya", "Lovedie", "Luella", "Lufu", "Lulie", "Madison", "Magge", "Marden", "Marigold", "Marigold", "Marlow", "Maurelle", "Maven", "Mercia", "Merewald", "Merry", "Mildburg", "Mildgyth", "Mildred", "Misty", "Myla", "Naida", "Nerida", "Nerida", "Nissa", "Nixie", "Norma", "Nyx", "Odile", "Oletha", "Orla", "Osgifu", "Oswalda", "Payton", "Peace", "Posy", "Princess", "Questa", "Radella", "Raisa", "Raisie", "Randall", "Raven", "Rhiannon", "Rhoslyn", "Rhoswen", "Rhyannon", "Rikki", "Rosa", "Rosalba", "Rosalie", "Rosetta", "Rosina", "Rossa", "Roxanne", "Royale", "Rusalka", "Sable", "Saelufu", "Sapphire", "Sebille", "Shaylee", "Shea", "Shelby", "Sigourney", "Sinnie", "Siusan", "Stanburg", "Stanburh", "Star", "Storm", "Sungyevo", "Sunngifu", "Sunny", "Susane", "Susanna", "Suzanne", "Suzette", "Swete", "Tana", "Tandy", "Tania", "Tanya", "Tatiana", "Taylor", "Tenanye", "Theode", "Tianna", "Timothea", "Titania", "Tuesday", "Unity", "Utta", "Velma", "Vulpine", "Wasila", "Wesley", "Whitney", "Will", "Willow", "Windy", "Wren", "Wynflaeth", "Wynnfrith", "Xantho", "Zanna", "Zenith", "Zuzana"},
	male_young = {"Acky", "Adney", "Aedy", "Ael", "Ally", "Alderney", "Aldy", "Ald", "Alger", "Alisty", "Alston", "Amhey", "Arch", "Arley", "Arney", "Arthy", "Arundy", "Ascy", "Ashty", "Ather", "Atty", "At", "Audy", "Aud", "Ayl", "Bady", "Banny", "Bardy", "Barly", "Barney", "Bar", "Barry", "Bartley", "Bart", "Bassy", "Baul", "Bavol", "Bax", "Bay", "Beam", "Beasy", "Beav", "Benny", "Berky", "Ber", "Bevy", "Bicky", "Birky", "Birley", "Birney", "Birt", "Blakey", "Blaxy", "Bly", "Bolty", "Booky", "Bosey", "Bowy", "Bradey", "Braden", "Brad", "Bradyn", "Brainy", "Brammy", "Bran", "Branny", "Brant", "Bray", "Brax", "Bren", "Brenny", "Bridgey", "Briggy", "Brinny", "Brish", "Brocky", "Bronny", "Bucky", "Burry", "Bur", "Byr", "Caddy", "Caldy", "Car", "Carny", "Carty", "Ceddy", "Chancey", "Channy", "Chanse", "Charly", "Ches", "Chilty", "Clay", "Cleavy", "Cliffy", "Clifty", "Clint", "Colty", "Cranny", "Cuthy", "Dalty", "Darby", "Darr", "Darthy", "Darry", "Davey", "Dawsey", "Delly", "Denny", "Dev", "Drake", "Dud", "Durry", "Dwenny", "Eddy", "Eggy", "Eldy", "Elty", "Erwy", "Filly", "Franky", "Gally", "Garmy", "Gary", "Ger", "Gory", "Haddy", "Haely", "Hammy", "Hardy", "Hay", "Hazly", "Hearsty", "Heathy", "Holdy", "Housty", "Howy", "Hunty", "Irvy", "Irwy", "Jack", "Jaggy", "Jay", "Jarry", "Jaxy", "Jaydey", "Jeffy", "Johnny", "Jud", "Keaty", "Kelty", "Kelvy", "Kenny", "Kiply", "Kirb", "Kolb", "Landy", "Lanny", "Langy", "Layney", "Ley", "Londy", "Maddy", "Mal", "Manny", "Mar", "Mavey", "Max", "Mel", "Mendy", "Mitchy", "Morey", "Nilly", "Oakey", "Parky", "Pay", "Pearsie", "Peytie", "Presty", "Quenty", "Rady", "Rammy", "Randy", "Ray", "Richy", "Rickey", "Robbie", "Roddy", "Ruddy", "Ry", "Seddy", "Sevy", "Shelty", "Shermy", "Siley", "Siney", "Sommy", "Spaldy", "Spenny", "Sterly", "Stewy", "Stuey", "Tanny", "Tilty", "Trowy", "Ywyfie", "Uey", "Uppy", "Ushy", "Wally", "Ward", "Warry", "Way", "Waylie", "Wes", "Westy", "Whitey", "Willy", "Wittie", "Wolfie", "Woody", "Woolie", "Wy", "Yatey"},
	female_young = {"Abey", "Aelfie", "Aethie", "Ailie", "Aldie", "Alvie", "Amie", "Annie", "Arethie", "Arietie", "Ashie", "Avely", "Avey", "Baley", "Battie", "Beggie", "Bevvie", "Blissie", "Blossy", "Brae", "Breenie", "Bri", "Cadey", "Carlie", "Ceddie", "Ceolie", "Channie", "Cinny", "Corlie", "Cwennie", "Daisy", "Dara", "Dawnnie", "Dellie", "Dennie", "Deorie", "Devvie", "Di", "Doie", "Donnie", "Dulcie", "Eadie", "Ealdie", "Eastie", "Ebbie", "Eddie", "Edevy", "Eggie", "Elfie", "Ellie", "Elmie", "Elvie", "Eolandie", "Eostie", "Erlie", "Ermie", "Ethie", "Evie", "Faerie", "Fay", "Faye", "Firrie", "Flettie", "Forrie", "Garnie", "Gellie", "Gidgie", "Githie", "Godie", "Goldie", "Gullie", "Gunnie", "Gythie", "Hadie", "Harley", "Hazie", "Hellie", "Hilarie", "Hildie", "Hodie", "Hollie", "Hoppie", "Huldie", "Iddie", "Innie", "Ivy", "Jettie", "Jolie", "Jolenie", "Kandie", "Kauanie", "Keatie", "Kelbie", "Kinsey", "Kippie", "Kynnie", "Lailie", "Langie", "Larrie", "Lethie", "Leuedie", "Lillie", "Lindie", "Lorie", "Lorcie", "Lovie", "Luellie", "Lufie", "Maddie", "Maggie", "Marrie", "Mavie", "Mercie", "Merie", "Mildie", "Missie", "Mylie", "Naidie", "Nerrie", "Nissie", "Nixie", "Normie", "Nyxie", "Oddie", "Olethie", "Orlie", "Ossie", "Paytie", "Princess", "Quessie", "Raddie", "Raisie", "Rannie", "Ravie", "Rhianie", "Rhosie", "Rhy", "Rikki", "Rosie", "Roxie", "Sabie", "Saelie", "Sapphie", "Sebie", "Shea", "Shellie", "Siggie", "Sinnie", "Siusie", "Stannie", "Starrie", "Sunnie", "Susie", "Swete", "Tannie", "Tandie", "Tattie", "Tay", "Tennie", "Thie", "Ti", "Timothea", "Titania", "Tuesday", "Unity", "Utta", "Velma", "Vulpine", "Wasila", "Wesley", "Whitney", "Will", "Willow", "Windy", "Wren", "Wynflaeth", "Wynnie", "Xanthie", "Zannie", "Zennie", "Zuzie"},
	male_native = {"Acacitlu", "Achcauhtli", "Ahuiliztli", "Ameo", "Ameone", "Ametane", "Ami", "Amoxtli", "Anaba", "Aquene", "Ashenee", "Astina", "Ayita", "Bena", "Calfuray", "Cayfutray", "Centehua", "Chalchiuitl", "Chava", "Chenoa", "Cherokee", "Cheyanna", "Cheyenne", "Chi", "Chicahua", "Chimala", "Chipahua", "Cholena", "Cihuaton", "Citali", "Citlamina", "Collipal", "Cozamalotl", "Cuicatl", "Curipan", "Cuyen", "Dakota", "Dakota", "Echa", "Eleuia", "Eloxochitl", "Emetaly", "Emona", "Emonah", "Etapali", "Eyota", "Golotina", "Hanata", "Haseya", "Hateya", "Helaku", "Helki", "Heltu", "Heta", "Hialeah", "Hiawatha", "Hola", "Honovi", "Hopi", "Huata", "Iara", "Ichika", "Ichtaca", "Icnoyotl", "Iina", "Ilchahueque", "Ilhuitl", "Inka", "Ipi", "Iracema", "Itotia", "Iuitl", "Ixcatzin", "Iyanke", "Izel", "Izta", "Jacaranda", "Jalana", "Kachina", "Kaliska", "Kamata", "Kamenna", "Kaya", "Kayaweta", "Kayawi", "Kiche", "Kika", "Kimana", "Kimani", "Kiona", "Kiya", "Kolaki", "Kumara", "Kuyani", "Kuyen", "Lakota", "Lefitray", "Leflay", "Leotie", "Litonya", "Llanquipan", "Llanquiray", "Luyu", "Macawi", "Macuilxochitl", "Mahala", "Mahaway", "Maheona", "Mahuitzic", "Malinalxochitl", "Mamani", "Manay", "Manisa", "Manque", "Mati", "Matisa", "Matisoon", "Mawusi", "Mecatl", "Meda", "Meona", "Meztli", "Michante", "Millaray", "Mimala", "Minal", "Minnehaha", "Minowa", "Minya", "Mixcoatl", "Momoztli", "Moneva", "Moyolehuani", "Moztla", "Munay", "Nahuatl", "Nakota", "Nanoka", "Nashota", "Nataani", "Nawaji", "Nelli", "Nenetl", "Neosha", "Netis", "Niabi", "Nichena", "Nituna", "Nochtli", "Nokomis", "Nuna", "Ogin", "Ohtli", "Olathe", "Olowa", "Omba", "Onatah", "Onawa", "Oneida", "Onsi", "Ontario", "Opa", "Orneda", "Osceola", "Osha", "Oya", "Oyama", "Pachama", "Pakuna", "Pala", "Pamoon", "Paniya", "Papan", "Papina", "Pati", "Patli", "Paveena", "Peta", "Petunia", "Peyeche", "Piro", "Pitrel", "Pocahontas", "Qocha", "Quetroman", "Quetza", "Quimey", "Quintruy", "Quintuqueo", "Raxka", "Rayen", "Rewuri", "Sacnite", "Sakuna", "Salali", "Sapata", "Saqui", "Satinka", "Sedna", "Seneca", "Sequoia", "Sequoya", "Sesapa", "Shadia", "Shaianne", "Shanay", "Shasta", "Shenandoa", "Sheyanne", "Shian", "Shiana","Shiann", "Shiko", "Shoteka", "Shy", "Shyanna", "Sihu", "Sikina", "Somoche", "Sora", "Soso", "Tadita", "Taima", "Taipa", "Taki", "Takiya", "Tala", "Taleebin", "Tallula", "Tallulah", "Tamarack", "Tamaya", "Tashina", "Teoxihuitl", "Tepin", "Teuicui", "Tika", "Tiponya", "Tirranna", "Tiwaka", "Tlachinolli", "Tlaco", "Tlacotl", "Tlahutli", "Tlalli", "Tlazohtzin", "Tlexictli", "Toltecatl", "Tonatzin", "Toski", "Totsi", "Tsintah", "Urika", "Utina", "Wakanda", "Wakiya", "Waluta", "Waneta", "Waseya", "Wauna", "Weeko", "Wicaka", "Wiconi", "Winema", "Winona", "Wiyaka","Wynonna", "Wyoming", "Xihuitl", "Xipil", "Xitlali", "Xiuhcoatl", "Xochi", "Xochicotzin", "Xochilt", "Xochitl", "Xochiyotl", "Xoco", "Xocoyotl", "Yachaya", "Yaminta", "Yana", "Yanaba", "Yaotl", "Yaxkin", "Yayauhqui", "Yenene", "Yoki", "Yolihuani", "Yoloxochitl", "Yoltzin", "Yoluta", "Yolyamanitzin", "Yucala", "Zaltana", "Zama", "Zeltzin", "Zihna", "Zintkala", "Zyanya"},
	female_native = {"Achaana", "Adahy", "Aenoh", "Agna-iyanke", "Ahanu", "Ahmik", "Ahusaka", "Akando", "Akecheta", "Akocha", "Akule", "Alam", "Almika", "Alowan", "Anca", "Anoki", "Anpona", "Ansale", "Anunka", "Apalani", "Apenimon", "Apiatan", "Atsa", "Avali", "Awan", "Bedagi", "Biminak", "Bodaway", "Chankoowashtay", "Chash-chunk-a", "Chava", "Chayton", "Cheyenne", "Chimal", "Chirapa", "Ciqala", "Dakota", "Dasan", "Degan", "Delsin", "Demothi", "Dichali", "Diyin", "Dohosan", "Dowan", "Dyami", "Echa", "Echahow", "Eisu", "Elki", "Elsu", "Eme", "Emetal", "Enapay", "Enyeto", "Etu", "Eyota", "Ezhno", "Fochik", "Gomda", "Gosheven", "Hache-hi", "Hakan", "Han", "Handowan", "Hasiin", "Helaku", "Helki", "He-lush-ka", "Hesutu", "Hiamovi", "Hiawatha", "Hinto", "Hinun", "Hokama", "Honon", "Honovi", "Hosa", "Hotah", "Hototo", "Howahkan", "Howi", "Huhuseca-ska", "Hute", "Ichante", "Ichik", "Igasho", "Ikan", "Imasu", "Inteus", "Isekemu", "Istu", "Itan", "Itanale", "Iye", "Iztali", "Jacy", "Jolon", "Kaga", "Kalmanu", "Kanen", "Kangee", "Kele", "Keyan", "Kibbe", "Kiche", "Kijika", "Kika", "Kinan", "Knoton", "Kohana", "Kola", "Kono", "Kosumi", "Kuruk", "Kuyani", "Lakota", "Langundo", "Lanu", "Len", "Lenno", "Lesharo", "Leyati", "Lise", "Liwanu", "Lohan", "Lokni", "Lonan", "Lonato", "Lootah", "Luyu", "Mahaway", "Mahkah", "Mahpee", "Makya", "Manipi", "Maona", "Maone", "Maska", "Masou", "Mato", "Mato-nazin", "Matoskah", "Mazablaska", "Menashen", "Metikla", "Michante", "Mika", "Mikasi", "", "Milap", "Mingen", "Misu", "Mohkave", "Mojag", "Molimo", "Momuso", "Mona", "Motave", "Motega", "Muata", "Muraco", "Nagan", "Nahele", "Nahios-si", "Nahko", "Nahma", "Nairen", "Nakin", "Nakos", "Nakota", "Namid", "Namiid", "Nanose", "Nantan", "Napayshni", "Nashashuk", "Nashoba", "Nataani", "Nawat", "Nawkaw", "Nayati", "Naylay", "Nayra", "Neka", "Neosho", "Nibaw", "Nigan", "Nijuga", "Nikan", "Nikiq", "Nikiti", "Nimakin", "Nitis", "Nodin", "Notaku", "Odakota", "Ogaleesha", "Ogima", "Ohanzee", "Ohitekah", "Olowan", "Onsi", "Otadan", "Otaktay", "Otu", "Ouray", "Oya", "Oyam", "Oyamal", "Oyate", "Pamoon", "Pat", "Patakasu", "Patamon", "Patwin", "Payat", "Paytah", "Pilan", "Pinon", "Quanah", "Raini", "Raxka", "Sahele", "Sakima", "Sakuruta", "Sandiin", "Sewati", "Shanah", "Shanahwane", "Shandiin", "Shepen", "Shotek", "Sikin", "Siwili", "Skah", "Skiriki", "Songan", "Sunkwa", "Tadi", "Taima", "Takoda", "Talli", "Tasunke", "Tatanka", "Tate", "Tawachi", "Teetonka", "Telutci", "Tennesy", "Tika", "Tilmu", "Tokala", "Tooantuh", "Tuari", "Tuketu", "Tukuli", "Tumu", "Tupac", "Tupi", "Tyee", "Uzumati", "Viho", "Vohpe", "Vohpey", "Waban", "Wahchinksapa", "Wahchintonka", "Wahkan", "Wahkoowah", "Wajiwa", "Wakiza", "Waluta", "Wamani", "Wamblee", "Wambleeska", "Wambli-waste", "Wanageeska", "Wanahton", "Wanikiya", "Wapi", "Waseya", "Weayaya", "Wehinahpay", "Wemilat", "Wenutu", "Wicaka", "Wicasa", "Wichado", "Wiconi", "Wilanu", "Wilu", "Wuliton", "Wunand", "Wuyi", "Wynono", "Yahto", "Yochi", "Yoskolo", "Yotimo", "Yuma", "Yutu", "Zebi"},
	male_desert = {"Aadi", "Aarav", "Aarnav", "Aarush", "Aayush", "Abdul", "Abeer", "Abhimanyu", "Abhiramnew", "Aditya", "Advaith", "Advay", "Advik", "Agastya", "Akshay", "Amol", "Anay", "Anirudhnew", "Anmol", "Ansh", "Arin", "Arjun", "Arnav", "Aryan", "Atharv", "Avi", "Ayaan", "Ayush", "Ayushman", "Azaan", "Azad", "Daksh", "Darsh", "Dev", "Dev", "Devansh", "Dhruv", "Farhan", "Gautam", "Harsh", "Harshil", "Hredhaan", "Isaac", "Ishaan", "Jainew", "Jason", "Kabir", "Kalpit", "Karan", "Kiaan", "Krish", "Krishna", "Laksh", "Lakshay", "Manannew", "Mohammed", "Nachiket", "Naksh", "Nakul", "Neel", "Om", "Parth", "Pranav", "Praneel", "Pranit", "Pratyush", "Rachit", "Raghav", "Ranbir", "Ranveer", "Rayaan", "Rehaannew", "Reyansh", "Rishi", "Rohan", "Ronith", "Rudranew", "Rushil", "Ryan", "Sai", "Saksham", "Samaksh", "Samar", "Samarth", "Samesh", "Sarthak", "Sathviknew", "Shaurya", "Shivansh", "Siddharth", "Tejas", "Vedant", "Veer", "Viaannew", "Vihaan", "Viraj", "Vivaan", "Yash", "Yug", "Zayan"},
	female_desert = {"Aadhya", "Aahana", "Aalia", "Aanya", "Aaradhya", "Aarna", "Aarohi", "Aditi", "Advika", "Adweta", "Adya", "Ahana", "Akshara", "Amaira", "Amaya", "Amrita", "Amruta", "Anaisha", "Ananya", "Anaya", "Andrea", "Angel", "Anika", "Anushka", "Anvi", "Anya", "Aria", "Arunima", "Arya", "Avni", "Bhavna", "Daksha", "Dhriti", "Divya", "Diya", "Gauri", "Hiral", "Ira", "Isha", "Ishani", "Ishanvi", "Ishita", "Jasmine", "Jhanvi", "Kashvi", "Kavya", "Khushi", "Kiara", "Krisha", "Krishna", "Kyra", "Lakshmi", "Mahika", "Manya", "Maryam", "Meera", "Megha", "Meghana", "Meher", "Mishka", "Mitali", "Myra", "Naira", "Navya", "Nayantara", "Niharika", "Nisha", "Nitara", "Olivia", "Pari", "Pihu", "Pratyusha", "Prisha", "Rachita", "Raveena", "Ridhi", "Riya", "Saanvi", "Sahana", "Sai", "Saira", "Samaira", "Sarah", "Saumya", "Shanaya", "Shravya", "Shreya", "Siya", "Sneha", "Suhana", "Suhani", "Tanvi", "Trisha", "Vaishnavi", "Vansha", "Vanya", "Vedhika", "Vinaya", "Zara", "Zoya"},
}

local TEXTURES = {
		
		-----------------------------------
		-- BASE BODY STRUCTURE
		-----------------------------------
		
	-- base 'naked' body skin.
	body = {
		hot = { "body_medium_01.png" },
		cold = { "body_light_01.png" },
		normal = { "body_medium_01.png" },
		native = { "body_tan_01.png" },
		desert =  { "body_dark_01.png" }
	},

	-- vertical size of the whites of eyes, which later also determines the iris size
	eyes = {
		male = {
			young = { "eyes_whites_med.png" },
			adult = { "eyes_whites_sm.png", "eyes_whites_med.png" },
			old = { "eyes_whites_sm.png", "eyes_whites_med.png" }
		},
		
		female = {
			young = { "eyes_whites_med.png", "eyes_whites_med2.png", "eyes_whites_med2.png" }, -- more lashes
			adult = { "eyes_whites_med.png", "eyes_whites_med2.png" }, -- 50%/50%
			old = { "eyes_whites_med.png", "eyes_whites_med.png", "eyes_whites_med2.png" }, -- less lashes
		}
	},
	
	-- mouth 4 and 5 are slightly grinning, 1 - 3 are variations of horizontal lines
	mouth = {
		male = {
			young = {
				"mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png",
				"mouth_04.png", "mouth_05.png", -- <-- more chance of smiling 
			},
			adult = { 
				"mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png",
				"mouth_01.png", "mouth_02.png", "mouth_03.png" -- <-- more chance of neutral mouth
			},
			old = { "mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png" }
		},
		
		female = {
			young = {
				"mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png",
				"mouth_04.png", "mouth_05.png", -- <-- more chance of smiling 
			},
			adult = { "mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png" },
			old = { "mouth_01.png", "mouth_02.png", "mouth_03.png", "mouth_04.png", "mouth_05.png" }
		}
	},
	
	hair = {
		male = {
			young = {
				"hair_male_02.png", "hair_male_03.png", "hair_male_04.png", "hair_male_05.png", "hair_male_06.png", 
				"hair_male_07.png", "hair_male_08.png", "hair_male_09.png", "hair_male_11.png", "hair_male_13.png", 
				"hair_male_14.png", "hair_male_18.png", "hair_male_20.png", "hair_male_21.png", "hair_male_22.png"
			},
			adult = {
				"hair_male_02.png", "hair_male_03.png", "hair_male_04.png", "hair_male_05.png", "hair_male_06.png", 
				"hair_male_07.png", "hair_male_08.png", "hair_male_09.png", "hair_male_11.png", "hair_male_13.png", 
				"hair_male_14.png", "hair_male_18.png", "hair_male_20.png", "hair_male_21.png", "hair_male_22.png"
			},
			old = {
				"hair_male_old_01.png", "hair_male_old_02.png", "hair_male_old_03.png", "hair_male_old_04.png",
				"hair_male_old_05.png", "hair_male_old_06.png"
			}
			
		},
		female = {
			young = {
				"hair_female_00.png", "hair_female_02.png", "hair_female_03.png", "hair_female_04.png", "hair_female_05.png", 
				"hair_female_06.png", "hair_female_07.png", "hair_female_08.png", "hair_female_09.png", "hair_female_10.png", 
				"hair_female_11.png", "hair_female_12.png", "hair_female_13.png", "hair_female_14.png", "hair_female_15.png", 
				"hair_female_16.png", "hair_female_17.png", "hair_female_18.png", "hair_female_20.png", "hair_female_21.png", 
				"hair_female_22.png", "hair_female_23.png", "hair_female_27.png", "hair_female_28.png", "hair_female_28.png", 
				"hair_female_29.png", "hair_female_30.png", "hair_female_31.png", "hair_female_32.png"
			},
			adult = {
				"hair_female_00.png", "hair_female_02.png", "hair_female_03.png", "hair_female_04.png", "hair_female_05.png", 
				"hair_female_06.png", "hair_female_07.png", "hair_female_08.png", "hair_female_09.png", "hair_female_10.png", 
				"hair_female_11.png", "hair_female_12.png", "hair_female_13.png", "hair_female_14.png", "hair_female_15.png", 
				"hair_female_16.png", "hair_female_17.png", "hair_female_18.png", "hair_female_20.png", "hair_female_21.png", 
				"hair_female_22.png", "hair_female_23.png", "hair_female_27.png", "hair_female_28.png", "hair_female_28.png", 
				"hair_female_29.png", "hair_female_30.png", "hair_female_31.png", "hair_female_32.png"
				
			},
			old = {
				"hair_female_old_01.png", "hair_female_old_02.png", "hair_female_old_03.png", "hair_female_old_04.png",
				"hair_female_old_05.png", "hair_female_old_06.png"
			}
		}
	},

	
	-----------------------------------
	-- CLOTHING & ACCESSORIES
	-----------------------------------	
		
	-- Short and long sleeved full dresses
	-- texture of 'blank.png' means this type of villager will either not or have a chance of
	-- not wearing a full dress, thus this dress section will be skipped and villager will
	-- instead apply 'lower' and 'upper' clothing.
	dress = {
		hot = {
			male = {
				young = { "blank.png" },
				adult = { "blank.png" },
				old = { "blank.png" }
			},
			female = {
				young = { "blank.png" },
				adult = { "blank.png" },
				old = { "blank.png" }
			},
		},
		cold = {
			male = {
				young = { "blank.png" },
				adult = { "blank.png" },
				old = { "blank.png" }
			},
			female = {
				young = { "dress_longsleeves_dark_01.png" },
				adult = { "dress_longsleeves_dark_01.png" },
				old = { "dress_longsleeves_dark_01.png" }
			},
		},
		normal = {
			male = {
				young = { "blank.png" },
				adult = { "blank.png" },
				old = { "blank.png" }
			},
			female = {
				young = { "dress_shortsleeves_med2_01.png", "dress_longsleeves_med2_01.png" },
				adult = { "dress_shortsleeves_med2_01.png", "dress_longsleeves_med2_01.png" },
				old = { "dress_shortsleeves_med2_01.png", "dress_longsleeves_med2_01.png" }
			},
		},
		native = {
			male = {
				young = { "blank.png" },
				adult = { "blank.png" },
				old = { "blank.png" }
			},
			female = {
				young = { "dress_shortsleeves_dark_01.png", "dress_longsleeves_dark_01.png" },
				adult = { "dress_shortsleeves_dark_01.png", "dress_longsleeves_dark_01.png" },
				old = { "dress_shortsleeves_dark_01.png", "dress_longsleeves_dark_01.png" }
			},
		},
		desert = {
			male = {
				young = { "dress_longsleeves_med_02.png", "dress_longsleeves_med_02.png", "blank.png" },
				adult = { "dress_longsleeves_med_02.png", "dress_longsleeves_med_02.png", "blank.png" },
				old = { "dress_longsleeves_med_02.png" }
			},
			female = {
				young = { "dress_longsleeves_med_01.png", "dress_longsleeves_med_01.png", "blank.png" },
				adult = { "dress_longsleeves_med_01.png", "dress_longsleeves_med_01.png", "blank.png" },
				old = { "dress_longsleeves_med_01.png" }
			},
		}
	},
		
	-- Lower Body Clothing (pants, shorts, skirts, etc)
	lower = {
		hot = {
			male = {
				young = { -- 67% chance shorts, otherwise pants
					"shorts_dark_01.png", "shorts_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"pants_dark_01.png", "pants_dark_02.png"
				},
				adult = { -- 67% chance shorts, otherwise pants
					"shorts_dark_01.png", "shorts_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"pants_dark_01.png", "pants_dark_02.png"
				},
				old = { -- 67% chance shorts, otherwise pants
					"shorts_dark_01.png", "shorts_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"pants_dark_01.png", "pants_dark_02.png"
				}
			},
			female = {
				young = { -- 66% chance short skirts, otherwise shorts
					"skirt_short_dark_01.png", "skirt_short_dark_01.png",
					"skirt_short_dark_01.png", "skirt_short_dark_01.png",
					"shorts_dark_01.png", "shorts_dark_02.png"
				},
				adult = { -- 80% chance short skirts or shorts, otherwise long skirt
					"skirt_short_dark_01.png", "skirt_short_dark_01.png",
					"skirt_short_dark_01.png", "skirt_short_dark_01.png",
					"skirt_short_dark_01.png", "shorts_dark_01.png",
					"shorts_dark_01.png", "shorts_dark_02.png"
				},
				old = { -- 50% chance shorts, otherwise long skirt
					"shorts_dark_01.png", "shorts_dark_02.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png"
				}
			}
		},
		cold = {
			male = { -- 100% chance for dark colored pants
				young = { "pants_dark_01.png", "pants_dark_02.png" }, 
				adult = { "pants_dark_01.png", "pants_dark_02.png" },
				old = { "pants_dark_01.png", "pants_dark_02.png" }
			},
			female = {
				young = { -- 66% long skirt, otherwise pants
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"pants_01.png", "pants_02.png" 
				},
				adult = { -- 66% long skirt, otherwise pants
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"pants_01.png", "pants_02.png"
				},
				old = { -- 66% long skirt, otherwise pants
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"pants_01.png", "pants_02.png"
				}
			}
		},
		normal = {
			male = {-- 100% chance for pants
				young = { "pants_dark_01.png", "pants_dark_02.png" }, 
				adult = { "pants_dark_01.png", "pants_dark_02.png" },
				old = { "pants_dark_01.png", "pants_dark_02.png" }
			},
			female = {
				young = { -- 66% long skirt, otherwise short skirt
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_short_dark_01.png", "skirt_short_dark_01.png"
				},
				adult = { -- 80% skirts, otherwise pants
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_short_dark_01.png",
					"skirt_short_dark_01.png", "skirt_short_dark_01.png",
					"pants_dark_01.png", "pants_dark_02.png"
				},
				old = { -- 66% long skirt, otherwise pants
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"skirt_long_dark_01.png", "skirt_long_dark_01.png",
					"pants_dark_01.png", "pants_dark_02.png"
				}
			}
		},
		native = {
			male = {
				young = { -- 66% chance pants or shorts, otherwise skirts
					"pants_dark_01.png", "pants_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"skirt_long_dark_01.png", "skirt_short_dark_01.png"
				},
				adult = { -- 66% chance pants or shorts, otherwise skirts
					"pants_dark_01.png", "pants_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"skirt_long_dark_01.png", "skirt_short_dark_01.png"
				},
				old = { -- 66% chance pants or shorts, otherwise skirts
					"pants_dark_01.png", "pants_dark_02.png",
					"shorts_dark_01.png", "shorts_dark_02.png",
					"skirt_long_dark_01.png", "skirt_short_dark_01.png"
				}
			},
			female = {
				young = { -- 50% long skirts, otherwise short skirts
					"skirt_long_dark_01.png", "skirt_short_dark_01.png"
				},
				adult = { -- 50% long skirts, otherwise short skirts
					"skirt_long_dark_01.png", "skirt_short_dark_01.png"
				},
				old = { -- 100% long skirt
					"skirt_long_dark_01.png"
				}
			}
		},
		desert = {
			male = { -- 100% chance pants
				young = { "pants_med_01.png", "pants_med_02.png" }, 
				adult = { "pants_med_01.png", "pants_med_02.png" }, 
				old = { "pants_med_01.png", "pants_med_02.png" } 
			},
			female = { -- 100% long skirts
				young = { "skirt_long_med_01.png" }, 
				adult = { "skirt_long_med_01.png" },
				old = { "skirt_long_med_01.png" }
			}
		}
	},
	
	-- Upper Body Clothing (long, short and no sleeved shirts)
	upper = {
		hot = {
			male = {
				young = {
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png", "blank.png",
					"blank.png", "blank.png", "blank.png", "blank.png" -- <-- 31% chance of wearing no shirt
				},
				adult = {
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png", 
					"blank.png", "blank.png", "blank.png", -- <-- 21% chance of wearing no shirt at all
				},
				old = {
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png"
				}
			},
			female = {
				young = {
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
				},
				adult = {
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
				},
				old = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png", 
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png", 
					"shirt_short_med_female_01.png"
				}
			}
		},
		cold = {
			male = {
				young = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png"
				},
				adult = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png"
				},
				old = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png"
				}
			},
			female = {
				young = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png", "shirt_long_dark_female_01.png", 
					"shirt_long_dark_female_01.png", "shirt_long_dark_female_01.png"
				},
				adult = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png", "shirt_long_dark_female_01.png", 
					"shirt_long_dark_female_01.png", "shirt_long_dark_female_01.png"
				},
				old = {
					"shirt_long_dark_01.png", "shirt_long_dark_02.png", "shirt_long_dark_03.png", 
					"shirt_long_dark_04.png", "shirt_long_dark_05.png", "shirt_long_dark_female_01.png", 
					"shirt_long_dark_female_01.png", "shirt_long_dark_female_01.png"
				}
			}
		},
		normal = {
			male = {
				young = { -- 75% chance short sleeved shirt, otherwise long sleeved
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				},
				adult = { -- 75% chance short sleeved shirt, otherwise long sleeved
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				},
				old = { -- 67% chance short sleeved shirt, otherwise long sleeved
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png",
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				}
			},
			female = {
				young = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png"
				},
				adult = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png"
				},
				old = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png"
				}
			}
		},
		native = {
			male = {
				young = { -- 69% chance not wearing any shirt at all
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png", "blank.png",
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", 
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", 
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png",
					"blank.png", "blank.png", "blank.png"
					
				},
				adult = { -- 56% chance not wearing any shirt at all
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png",  
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", 
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png"
				},
				old = { -- 39% chance not wearing any shirt at all
					"shirt_tanktop_med_00.png", "shirt_tanktop_med_01.png", "shirt_tanktop_med_02.png", 
					"shirt_tanktop_med_03.png", "shirt_tanktop_med_04.png", "shirt_tanktop_med_05.png",
					"shirt_nosleeve_med_01.png", "shirt_nosleeve_med_02.png", "shirt_nosleeve_med_03.png",
					"shirt_nosleeve_med_04.png", "shirt_nosleeve_med_05.png",  
					"blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", "blank.png", 
				}
			},
			female = {
				young = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
				},
				adult = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
				},
				old = {
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
					"shirt_short_med_01.png", "shirt_short_med_02.png", "shirt_short_med_03.png", 
					"shirt_short_med_04.png", "shirt_short_med_05.png", "shirt_short_med_female_01.png",
					"shirt_short_med_female_01.png", "shirt_short_med_female_01.png",
				}
			}
		},
		desert = {
			male = {
				young = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				},
				adult = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				},
				old = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png"
				}
			},
			female = {
				young = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png", "shirt_long_med_female_01.png", 
					"shirt_long_med_female_01.png", "shirt_long_med_female_01.png"
				},
				adult = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png", "shirt_long_med_female_01.png", 
					"shirt_long_med_female_01.png", "shirt_long_med_female_01.png"
				},
				old = {
					"shirt_long_med_01.png", "shirt_long_med_02.png", "shirt_long_med_03.png", 
					"shirt_long_med_04.png", "shirt_long_med_05.png", "shirt_long_med_female_01.png", 
					"shirt_long_med_female_01.png", "shirt_long_med_female_01.png"
				}
			}
		}
	},
	
	-- Sandals, shoes and boots
	footwear = {
		hot = { "sandals_01.png", "sandals_02.png" },
		cold = { "boots_dark_01.png", "boots_dark_01.png", "boots_dark_01.png", "boots_dark_01.png", "shoes_01.png", "shoes_02.png" },
		normal = { "shoes_01.png", "shoes_02.png", "boots_dark_01.png", "sandals_01.png", "sandals_02.png" },
		native = { "sandals_01.png", "sandals_02.png" },
		desert = { "sandals_01.png", "sandals_02.png" }
	},
	
	-- Jackets
	jacket = {
		hot = { "blank.png" },
		cold = { "jacket_01.png", "blank.png" }, -- 50% chance to wear jacket
		normal = { "jacket_01.png", "blank.png", "blank.png", "blank.png" }, -- 25% chance to wear jacket
		native = { "blank.png" },
		desert = { "blank.png" }
	},

	-- base outfits of a certain theme that cannot be randomly pieced together
	outfit = {
		church = { -- more variations planned
			male = { "priest_01.png" },
			female = { "priest_01.png" }
		}
	},
	
	extra_layer = {
		empty = {
			male = {
				"strap_01.png", "strap_02.png", "strap_03.png", 
				"strap_04.png", "strap_05.png", "strap_06.png" 
			},
			female = {
				"strap_01.png", "strap_02.png", "strap_03.png", 
				"strap_04.png", "strap_05.png", "strap_06.png" 
			}
		},
		tower = {
			male = {
				"armor_01.png", "armor_01b.png", "armor_01c.png", "armor_02.png", 
				"armor_02b.png", "armor_02c.png", "armor_03.png", "armor_03b.png", 
				"armor_03c.png"
			},
			female = {
				"armor_fem_01.png", "armor_fem_01b.png", "armor_fem_01c.png",
				"armor_fem_01.png", "armor_fem_01b.png", "armor_fem_01c.png",
				"armor_01.png", "armor_01b.png", "armor_01c.png"
			}
		}
	},
	
	extra_head = {
		tower = {
			male = { "helmet_01.png", "helmet_02.png" },
			female = { "blank.png" }
		},
	},
	
	-- white collar for priests and other accessories (coming soon)
	extra_neck = {
		church = {
			male = { "collar_01.png" },
			female = { "blank.png" }
		}
	 },
	
	-- accessories worn in front
	extra_front = {
		church = {
			male = { "cross_01.png", "cross_01b.png", "cross_01c.png" },
			-- male = { "sash_01.png", "sash_01b.png", "sash_02.png", "sash_02b.png" },
			female = { "cross_01.png", "cross_01b.png", "cross_01c.png" }
		}
	},
	
	extra_back = {
		tower = { "sword_01.png", "sword_02.png", "sword_03.png", "sword_04.png" },
		empty = { 
			"backpack_01.png", "backpack_02.png", "backpack_03.png", 
			"backpack_04.png", "backpack_05.png", "backpack_06.png"
		}
	},
	
	extra_face = {
		male = {
			young = { "blank.png" },
			adult = { "blank.png" },
			old = { "eye_glasses_01.png", "blank.png" }
		},
		female = {
			young = { "blank.png" },
			adult = { "blank.png" },
			old = { "eye_glasses_01.png", "blank.png" }
		}
	}

}

local COLORS = {

	body = {
		hot = { "#eb9678:128", "#ebaa78:128","#ebc178:128" }, -- pinkish, peach-ish, yellow-ish
		cold = { "#eb9678:64", "#ffd2af:64","#ffd091:64" }, -- pinkish, peach-ish, yellow-ish but more pale
		normal = { "#eb9678:128", "#ebaa78:128","#ebc178:128" }, -- pinkish, peach-ish, yellow-ish
		native = { "#800000:128", "#c02000:128","#c04000:128" }, -- dark red, reddish brown, brown tan
		desert = { "#804000:128", "#5f2705:128","#46280c:128" }, -- brown, dark reddish brown, dark brown
	},
	
	hair = {
		
		hot = { -- brown, dark brown, black
			young = { "#000000:128^[colorize:#804000:128", "#000000:192^[colorize:#804000:64", "#000000:192" }, 
			adult = { "#000000:128^[colorize:#804000:128", "#000000:192^[colorize:#804000:64", "#000000:192" }, 
			old = { "#000000:64^[colorize:#804000:64", "#000000:64" }, 
		},
		cold = { -- blonde, orange, brown
			young = { "#fff000:128", "#000000:128^[colorize:#ff4900:128", "#000000:128^[colorize:#804000:128" }, 
			adult = { "#fff000:128", "#000000:128^[colorize:#ff4900:128", "#000000:128^[colorize:#804000:128" },
			old = { "#fff000:64", "#ff4900:64", "#804000:64" },
		},
		normal = { 
			young = { 
				"#fff000:128", "#000000:128^[colorize:#ff4900:128", "#000000:128^[colorize:#804000:128", -- blonde, orange, brown
				"#000000:192^[colorize:#804000:64", "#000000:192" -- dark brown, black
			}, 
			adult = { 
				"#fff000:128", "#000000:128^[colorize:#ff4900:128", "#000000:128^[colorize:#804000:128", -- blonde, orange, brown
				"#000000:192^[colorize:#804000:64", "#000000:192" -- dark brown, black
			}, 
			old = { 
				"#fff000:64", "#ff4900:64", "#804000:64", -- graying blonde, orange, brown
				"#000000:64^[colorize:#804000:64", "#000000:64" -- graying dark brown and black
			},
		},
		native = {
			young = { "#000000:192^[colorize:#804000:64", "#000000:192" }, -- dark brown and black
			adult = { "#000000:192^[colorize:#804000:64", "#000000:192" }, -- dark brown and black
			old = { "#000000:64^[colorize:#804000:64", "#000000:64" } -- graying dark brown and black
		},
		desert = {
			young = { "#000000:192" }, -- black
			adult = { "#000000:192" }, -- black
			old = { "#000000:64" }, -- graying black
		}
	},
	
	eyes = { 
		hot = { "#000000:256", "#402000:256", "#402000:256" }, -- black and brown
		cold = { "#402000:256", "#000055:256", "#000055:256", "#005500:256" }, -- brown, blue, green
		normal = { "#000000:256", "#402000:256", "#402000:256", "#000055:256", "#005500:256" }, -- black, brown, blue, green
		native = { "#000000:256" }, -- black
		desert = { "#000000:256" } -- black
	},
	
	footwear = { -- 75% for brown, dark reddish brown, dark brown
		"#804000:128", "#5f2705:128","#46280c:128", 
		"#804000:128", "#5f2705:128","#46280c:128",
		"#804000:128", "#5f2705:128","#46280c:128",
		"#5c0000:128", "#004000:128" -- dark red and dark green
	}, 
	
	dress = { -- only desert regions do males wear dress, so other regions have 'blank' colorization layer
	
		hot = {
			male = { "#000000:0" },
			female = { "#000000:0" }
		},
		cold = {
			male = { "#000000:0" },
			-- dark brown, light brown, dark red, dark green, dark purple
			female = { "#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		normal = {
			male = { "#000000:0" },
			-- brown, red, green, blue, yellow, purple
			female = { "#402000:128", "#c00000:128","#005c00:128","#000080:128","#c0c000:128","#800080:128", }
		},
		native = {
			male = { "#000000:0" },
			-- dark brown, light brown, dark red, dark green, dark purple
			female = { "#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		desert = { -- light tan colors: brown, tan, yellow, and white
			male = { "#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128" },
			female = {
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128", 
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			}
		}
	
	},
	
	lower = {
		hot = {
			male = { "#5f2705:128", "#ff8040:128", "#ffb579:64" }, -- darkest brown, dark brown, light brown
			-- brown, tan, light brown, red, green, purple
			female = { "#804000:128", "#ff8040:128", "#ffb57a:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		cold = {
			male = { "#000000:0", "#46280c:128", "#5f2705:128" }, -- Black, darkest brown, dark brown
			-- dark brown, brown, red, green, purple
			female = {"#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		normal = {
			male = { "#46280c:128", "#5f2705:128", "#ff8040:128" }, -- darkest brown, dark brown, light brown
			female = {
				"#46280c:128", "#5f2705:128", "#ff8040:128", -- darkest brown, dark brown, light brown
				"#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128"
				-- dark brown, light brown, dark red, dark green, dark purple
			}
		},
		native = {
			-- dark brown, light brown, dark red, dark green, dark purple
			male = { "#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }, 
			-- dark brown, light brown, dark red, dark green, dark purple
			female = { "#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		desert = {
			-- light tan colors: reddish, brown, yellow, and white
			male = { "#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128" }, 
			female = {
				-- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128",
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			}
		}
	},
	
	upper = {
		hot = {
			male = { -- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128"
			},
			female = { -- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128", 
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			},
		},
		cold = {
			male = { "#46280c:128", "#5f2705:128", "#ff8040:128" }, -- darkest brown, dark brown, light brown
			-- dark brown, brown, red, green, purple
			female = {"#46280c:128", "#804000:128", "#800000:128", "#004000:128", "#400040:128" }
		},
		normal = {
			male = { 
				-- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128",
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			}, -- darkest brown, dark brown, light brown
			female = {
				-- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128",
				"#5c0000:128", "#5c0000:128", -- off reddish hue
				"#402000:128", "#c00000:128","#005c00:128","#000080:128","#c0c000:128","#800080:128"
				-- brown, red, green, blue, yellow, purple
			}
		},
		native = {
			male = { -- light tan colors: brown, tan, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128", 
				"#5c0000:128" -- off reddish hue
			}, 
			female = { -- light tan colors: brown, tan, yellow, and white
				
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128", 
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			}
		},
		desert = {
			-- light tan colors: reddish, brown, yellow, and white
			male = { "#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128" }, 
			female = {
				-- light tan colors: reddish, brown, yellow, and white
				"#3d1500:128", "#804000:128", "#c8a53a:128", "#ffffff:128",
				"#5c0000:128", "#5c0000:128" -- off reddish hue
			}
		}
	},
	
	jackets = { "#804000:64", "#402000:64",  "#201000:64", "#000000:64" },
	
}


-- villager entity's visual size based on age
local VISUAL_SIZES = {
	male = {
		young = {0.50, 0.65, 0.80}, 
		adult = {0.90, 1.05, 1.20}, 
		old = {0.90, 0.95, 1.00} 
	},
	female = {
		young = {0.50, 0.60, 0.70}, 
		adult = {0.90, 0.95, 1.00}, 
		old = {0.80, 0.85, 0.90} 
	}
}


mobs_npc.getVillagerName = function(gender, region)
	local name
	if region then
		local subgroup = gender.."_"..region
		local random_index = math.random(#NAMES[subgroup])
		name = NAMES[subgroup][random_index]
	else
		local random_index = math.random(#NAMES[gender])
		name = NAMES[gender][random_index]
	end
	return name
end



-- main function that randomly generates villager size and appearance
mobs_npc.getVillagerAppearance = function(building_type, region, gender, age)
	
	local final_texture
	local textures
	local colors
	
	-- base body texture
	textures = TEXTURES.body[region]
	local body_texture = textures[math.random(#textures)]
	colors = COLORS.body[region]
	local body_color = colors[math.random(#colors)]
	final_texture = "("..body_texture.."^[colorize:"..body_color..")^"
	
	-- apply eyes (small, med, and different color iris)
	textures = TEXTURES.eyes[gender][age]
	local eye_texture_whites = textures[math.random(#textures)]
	local eye_texture_iris
	if string.find(eye_texture_whites, "_sm") then eye_texture_iris = "eyes_iris_sm.png"
	else eye_texture_iris = "eyes_iris_med.png" end
	colors = COLORS.eyes[region]
	local eye_color = colors[math.random(#colors)]
	final_texture = final_texture .. "("..eye_texture_whites..")^("..eye_texture_iris.."^[colorize:"..eye_color..")^"
	
	-- apply mouth 
	textures = TEXTURES.mouth[gender][age]
	local mouth_texture = textures[math.random(#textures)]
	final_texture = final_texture .. "("..mouth_texture..")^"
	
	-- apply face accessories (eg. eye glasses)
	textures = TEXTURES.extra_face[gender][age]
	local extra_face_texture = textures[math.random(#textures)]
	final_texture = final_texture .. "("..extra_face_texture..")^"
	
	-- apply footwear
	textures = TEXTURES.footwear[region]
	local footwear_texture = textures[math.random(#textures)]
	colors = COLORS.footwear
	local footwear_color = colors[math.random(#colors)]
	final_texture = final_texture .. "("..footwear_texture.."^[colorize:"..footwear_color..")^"
	
	-- apply custom outfit if any
	local custom_outfit = TEXTURES.outfit[building_type]
	if custom_outfit then
		textures = custom_outfit[gender]
		local outfit_texture = textures[math.random(#textures)]
		colors = COLORS.jackets
		local outfit_color = colors[math.random(#colors)]
		final_texture = final_texture .. "("..outfit_texture.."^[colorize:"..outfit_color..")^"
	else
		-- apply full dress
		textures = TEXTURES.dress[region][gender][age]
		local dress_texture = textures[math.random(#textures)]
		if string.find(dress_texture, "dress_") then 
			colors = COLORS.dress[region][gender]
			local dress_color = colors[math.random(#colors)]
			final_texture = final_texture .. "("..dress_texture.."^[colorize:"..dress_color..")^"
		else
			
			-- apply lower body clothing
			textures = TEXTURES.lower[region][gender][age]
			local lower_texture = textures[math.random(#textures)]
			colors = COLORS.lower[region][gender]
			local lower_color = colors[math.random(#colors)]
			final_texture = final_texture .. "("..lower_texture.."^[colorize:"..lower_color..")^"
			
			-- apply upper body clothing
			textures = TEXTURES.upper[region][gender][age]
			local upper_texture = textures[math.random(#textures)]
			colors = COLORS.upper[region][gender]
			local upper_color = colors[math.random(#colors)]
			final_texture = final_texture .. "("..upper_texture.."^[colorize:"..upper_color..")^"
			
		end
		
		-- apply jacket
		textures = TEXTURES.jacket[region]
		local jacket_texture = textures[math.random(#textures)]
		colors = COLORS.jackets
		local jacket_color = colors[math.random(#colors)]
		final_texture = final_texture .. "("..jacket_texture.."^[colorize:"..jacket_color..")^"
	end
	
	-- apply hair
	textures = TEXTURES.hair[gender][age]
	local hair_texture = textures[math.random(#textures)]
	colors = COLORS.hair[region][age]
	local hair_color = colors[math.random(#colors)]
	final_texture = final_texture .. "("..hair_texture.."^[colorize:"..hair_color..")"
	
	local extra_layer = TEXTURES.extra_layer[building_type]
	if extra_layer then
		textures = extra_layer[gender]
		local extra_layer_texture = textures[math.random(#textures)]
		final_texture = final_texture .. "^("..extra_layer_texture..")"
	end
	
	local extra_head = TEXTURES.extra_head[building_type]
	if extra_head then
		textures = extra_head[gender]
		local extra_head_texture = textures[math.random(#textures)]
		final_texture = final_texture .. "^("..extra_head_texture..")"
	end
	
	local extra_neck = TEXTURES.extra_neck[building_type]
	if extra_neck then
		textures = extra_neck[gender]
		local extra_neck_texture = textures[math.random(#textures)]
		final_texture = final_texture .. "^("..extra_neck_texture..")"
	end
	
	local extra_front = TEXTURES.extra_front[building_type]
	if extra_front then
		textures = extra_front[gender]
		local extra_front_texture = textures[math.random(#textures)]
		final_texture = final_texture .. "^("..extra_front_texture..")"
	end
	
	local extra_back = TEXTURES.extra_back[building_type]
	if extra_back then
		textures = extra_back
		local extra_back_texture = textures[math.random(#textures)]
		final_texture = final_texture .. "^("..extra_back_texture..")"
	end

	-- determine visual_size
	local sizes = VISUAL_SIZES[gender][age]
	local new_size = sizes[math.random(#sizes)]
	local new_visual_size = {x = new_size, y = new_size}
	

	-- calculate collision_box based on new visual_size
	local new_collision_box = {
		-0.25*new_size, 0.00*new_size, -0.25*new_size, 
		 0.25*new_size, 1.75*new_size,  0.25*new_size
	}
	
	return final_texture, new_visual_size, new_collision_box
	
end




local p_genders = {
	"male",
	"female"
}
mobs_npc.jobs = {
	"child",
	"cleric",
	"soldier",
	"farmer",
	"herder",
	"miner",
	"lumberjack",
	"trader",
	"miller",
	"innkeeper",
	"tanner",
	"blacksmith",
	"weaver",
	"carpenter",
}
mobs_npc.soldiers = {
	"guard",
	"phalynx",
	"footman",
	"swordman",
	"lightaxeman",
	"heavyaxeman",
	"hammerman",
	"spearman",
	"light_archer",
	"heavy_archer",
}
local p_builds = {
	"empty",
	"tower",
	"church"
}
mobs_npc.regions = {
	"hot",
	"cold",
	"normal",
	"native",
	"desert"
}
p_ages = {
	"young",
	"adult",
	"old"
}

local p_jobs = mobs_npc.jobs
local p_soldiers = mobs_npc.soldiers
local p_regions = mobs_npc.regions

----mobs_npc.random_appearence = function(pbiome, pjob)
--mobs_npc.random_appearence = function(pbiome)
mobs_npc.random_appearence = function()

	local appearence = {}
	local chosen_skin = nil
	local chosen_armour = nil
	local chosen_tool = nil

	local skins = {
		"mobs_female1.png",
		"mobs_female2.png",
		"mobs_female3.png",
		"mobs_male1.png",
		"mobs_male2.png",
		"mobs_male3.png",
		"mobs_human_1.png",
		"mobs_human_2.png",
		"mobs_human_3.png",
		"mobs_human_4.png",
		"mobs_human_5.png",
		"mobs_human_6.png",
		"mobs_human_7.png",
		"mobs_human_8.png",
		"mobs_human_9.png",
		"mobs_human_10.png",
		"mobs_human_11.png",
		"mobs_human_12.png",
		"mobs_human_13.png",
	}

	local tools = {
		child =		"lib_ecology_food_apple_candied.png",
		cleric =	"default_book_brown.png",
		soldier =	"",
		farmer =	"lib_materials_tool_hoe_stone_paleo.png",
		herder =	"mobs_shears.png",
		miner =		"lib_materials_tool_pick_iron.png",
		lumberjack =	"lib_materials_tool_axe_iron.png",
		trader =	"maptools_copper_coin.png",
		--trader =	"3d_armor_trans.png",
		miller =	"lib_materials_tool_pitchfork.png",
		innkeeper =	"default_paper.png",
		tanner =	"lib_materials_tool_knife_steel.png",
		blacksmith =	"lib_materials_tool_hammer_steel.png",
		weaver =	"lib_materials_tool_shears_steel.png",
		carpenter =	"worktable_saw.png",
	}

	local weapons = {
		--soldier =	"lib_materials_tool_battleaxe.png",
		--archer =	"bows_bow_triple_steel.png",
		guard =		"lib_materials_tool_sword_steel.png",
		phalynx =	"lib_materials_tool_sword_bronze.png",
		footman =	"lib_materials_tool_club_wood.png",
		swordman =	"lib_materials_tool_sword_steel.png",
		lightaxeman =	"lib_materials_tool_battleaxe.png",
		heavyaxeman =	"lib_materials_tool_battleaxe_large.png",
		hammerman =	"lib_materials_tool_warhammer_stone.png",
		spearman = 	"lib_materials_tool_spear_stone_paleo.png",
		light_archer =	"bows_bow_steel.png",
		heavy_archer =	"bows_bow_triple_steel.png",
	}

--[[
		"lib_materials_tool_axe_flint.png",
		"lib_materials_tool_digstick_wood.png",
		"lib_materials_tool_pick_bone.png",
		"lib_materials_tool_shovel_bone.png",
		"lib_materials_tool_axe_stone_paleo.png",
		"lib_materials_tool_hoe_stone_paleo.png",
		"lib_materials_tool_pick_stone_paleo.png",
		"lib_materials_tool_shovel_stone_paleo.png",
		"lib_materials_tool_axe_bronze.png",
		"lib_materials_tool_hoe_bronze.png",
		"lib_materials_tool_pick_bronze.png",
		"lib_materials_tool_shovel_bronze.png",
		"lib_materials_tool_axe_iron.png",
		"lib_materials_tool_hoe_iron.png",
		"lib_materials_tool_pick_iron.png",
		"lib_materials_tool_shovel_iron.png",
		"lib_materials_tool_axe_steel.png",
		"lib_materials_tool_hoe_steel.png",
		"lib_materials_tool_pick_steel.png",
		"lib_materials_tool_shovel_steel.png",
		"lib_materials_tool_chisel.png",
		"lib_materials_tool_hammer_steel.png",
		"lib_materials_tool_knife_steel.png",
		"lib_materials_tool_pitchfork.png",
		"lib_materials_tool_saw_steel.png",
		"lib_materials_tool_shears_steel.png",
		"worktable_saw.png",
		"3d_armor_trans.png",
--



--
	local ARMOUR = "3d_armor_trans.png"

	local ARMOUR_HELMET = "3d_armor_trans.png"

	local ARMOUR_SHIELD = "npcf_skin_armor.png"

	local ARMOUR_HELMET_SHIELD = "npcf_skin_armor.png"

	local armours = {
		ARMOUR,
		ARMOUR_HELMET,
		ARMOUR_SHIELD,
		ARMOUR_HELMET_SHIELD
	}
--]]

	local armors = {
		emtpy = "3d_armor_trans.png",
		phalynx = "3d_armor_helmet_bronze.png" .. "^"
			.. "3d_armor_chestplate_bronze.png" .. "^"
			.. "3d_armor_leggings_bronze.png" .. "^"
			.. "3d_armor_boots_bronze.png" .. "^"
			.. "shields_shield_bronze.png" .. "^"
			.. "3d_armor_gloves_gloves_bronze.png",
		lightsoldier = "3d_armor_helmet_chainmail.png" .. "^"
			.. "lib_armor_chestplate_chainmail.png" .. "^"
			.. "lib_armor_leggings_chainmail.png" .. "^"
			.. "lib_armor_boots_chainmail.png" .. "^"
			.. "lib_armor_shield_chainmail.png",
		heavysoldier = "3d_armor_helmet_steel.png" .. "^"
			.. "3d_armor_chestplate_steel.png" .. "^"
			.. "3d_armor_leggings_steel.png" .. "^"
			.. "3d_armor_boots_steel.png" .. "^"
			.. "shields_shield_steel.png" .. "^"
			.. "3d_armor_gloves_gloves_steel.png",
		lightarcher = "lib_armor_helmet_leather_brown.png" .. "^"
			.. "lib_armor_chestplate_leather_brown.png" .. "^"
			.. "lib_armor_leggings_leather_brown.png" .. "^"
			.. "lib_armor_boots_leather_brown.png" .. "^"
			.. "lib_armor_shield_leather_brown.png",
		heavyarcher = "lib_armor_helmet_studded.png" .. "^"
			.. "lib_armor_chestplate_studded.png" .. "^"
			.. "lib_armor_leggings_studded.png" .. "^"
			.. "lib_armor_boots_studded.png" .. "^"
			.. "lib_armor_shield_studded.png",
	}
--[[
	local t_job = pjob or p_jobs[math.random(1,14)]
	local t_region = pbiome or p_regions[math.random(1,5)]
	local t_job
	local t_soldier
	if pjob and pjob ~="" then
		local n_job = pjob:split(';')
		if #n_job > 1 then
			t_job = n_job[1]
			t_soldier = n_job[2]
		else
			t_job = pjob
		end
	else
		t_job = p_jobs[math.random(1,14)]
	end
--]]


	local t_job = p_jobs[math.random(1,14)]
	local t_region = p_regions[math.random(1,5)]

	--local t_biome = pbiome
	--local t_biome = gal.mapgen.chunk_biome
	--local t_region
	--if string.find(t_biome, "_humid") then
	--	t_region = p_regions[4]
	--elseif string.find(t_biome, "_arid") then
	--	t_region = p_regions[5]
	--elseif string.find(t_biome, "hot_") then
	--	t_region = p_regions[1]
	--elseif string.find(t_biome, "cold_") then
	--	t_region = p_regions[2]
	--else
	--	t_region = p_regions[3]
	--end

	local t_gender = p_genders[math.random(1,2)]

	--local t_build = p_builds[math.random(1,3)]
	--local t_age = p_ages[math.random(1,3)]
	local t_build
	local t_age


	if t_job == "child" then
		t_build = "empty"
		t_age = "young"
	elseif t_job == "soldier" or t_job == "archer" then
		t_build = "tower"
		t_age = "adult"
	else
		if t_job == "cleric" then
			t_build = "church"
		else
			t_build = "empty"
		end
		t_age = p_ages[math.random(2,3)]
	end

	--get NAME and save to 'vName' object custom field
	local villager_name
	if (t_region == "native") or (t_region == "desert") then
		villager_name = mobs_npc.getVillagerName(t_gender, t_region)
	else
		if t_age == "young" then
			villager_name = mobs_npc.getVillagerName(t_gender, t_age)
		else
			villager_name = mobs_npc.getVillagerName(t_gender)
		end
	end

	local newTexture, newSize, newCollisionBox = mobs_npc.getVillagerAppearance(t_build, t_region, t_gender, t_age)

	local newNPCName = villager_name

	chosen_skin = newTexture

	--local s_desc = ""
	if t_job == "soldier" then
		--s_desc = t_job
		local s_type = t_soldier or math.random(1,10)
		if s_type <= 2 then
			chosen_armour = armors[2]
		elseif s_type == 4 or s_type == 5 then
			chosen_armour = armors[3]
		elseif s_type == 6 or s_type == 7 then
			chosen_armour = armors[4]
		elseif s_type == 9 then
			chosen_armour = armors[5]
		elseif s_type == 10 then
			chosen_armour = armors[6]
		else
			chosen_armour = armors[2]
		end
		chosen_tool = weapons[s_type]
		t_job = t_job .. " - " .. p_soldiers[s_type]

		--chosen_armour = armors[t_job]
	else
		chosen_armour = "3d_armor_trans.png"
		chosen_tool = tools[t_job]
	end


	local appearence_string = {chosen_skin, chosen_armour, chosen_tool}

	return appearence_string, newSize, newCollisionBox, t_gender, t_age, newNPCName, t_region, t_job

end


function mobs_npc.initialize(entity, pos, is_lua_entity, pregion, pjob)

	minetest.log("[mobs_npc] INFO: Initializing NPC at "..minetest.pos_to_string(pos))

	-- Get variables
	local ent = entity
	if not is_lua_entity then
		ent = entity:get_luaentity()
	end

	ent.initialized = true

	--local theat, thumid, tbiome
	--theat = minetest.get_heat(pos)
	--thumid = minetest.get_humidity(pos)
	--tbiome = gal.mapgen.get_biome_name(theat,thumid,pos.y)

	--local b_data = minetest.get_biome_data(pos)
	--local b_id = b_data.biome
	--local tbiome = minetest.get_biome_name(b_id)

	----local t_texture, t_vsize, t_collision, t_gender, t_age, t_name, t_region, t_job = mobs_npc.random_appearence(pregion, pjob)
	--local t_texture, t_vsize, t_collision, t_gender, t_age, t_name, t_region, t_job = mobs_npc.random_appearence(tbiome)
	local t_texture, t_vsize, t_collision, t_gender, t_age, t_name, t_region, t_job = mobs_npc.random_appearence()
	local i_text = t_name .. " - " .. t_gender
	if t_age and t_age ~= nil then
		i_text = i_text .. " - " .. t_age
	end
	if t_region and t_region ~= nil then
		i_text = i_text .. " - " .. t_region
	end
	if t_job and t_job ~= nil then
		i_text = i_text .. " - " .. t_job
	end

	ent.textures = {t_texture[1], t_texture[2], t_texture[3]}
	ent.visual_size = t_vsize
	ent.collisionbox = {t_collision[1], t_collision[2], t_collision[3], t_collision[4], t_collision[5], t_collision[6]}
	ent.infotext = i_text

	ent.v_texture = {t_texture[1], t_texture[2], t_texture[3]}
	ent.v_vsize = t_vsize
	ent.v_colbox = {t_collision[1], t_collision[2], t_collision[3], t_collision[4], t_collision[5], t_collision[6]}
	ent.v_name = t_name
	ent.v_gender = t_gender
	ent.v_age = t_age
	ent.v_region = t_region
	ent.v_job = t_job

	------ Determine sex based on textures
	--if (is_female_texture(ent.base_texture)) then
	--	ent.sex = a_npc.FEMALE
	--else
	--	ent.sex = a_npc.MALE
	--end
	ent.sex = t_gender

	---- Set name
	--ent.nametag = get_random_name(ent.sex)
	ent.nametag = t_name

	-- Set ID
	ent.npc_id = tostring(math.random(1000, 9999))..":"..ent.nametag

	-- This map will hold all the places for the NPC
	-- Map entries should be like: "bed" = {x=1, y=1, z=1}
	ent.places_map = {}

	-- Refreshes entity
	ent.object:set_properties(ent)

end


