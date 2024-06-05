drop database if exists gestion_bibliotheque;

create database gestion_bibliotheque;

\c gestion_bibliotheque;

create table book (
    id_book varchar(150) primary key,
    title varchar(150) not null,
    number_of_pages int not null,
    release_date date not null,
    printing_house varchar(200),
    "language" varchar(100),
    "status"varchar(1),
    synopsis text
);
create table edition (
    id_edition varchar(150) primary key,
    edition_name varchar(200) not null
);

create table genre (
    id_genre varchar(150) primary key,
    genre_name varchar(150) not null
);

create table author (
    id_author varchar(150) primary key,
    last_name varchar(200) not null,
    first_name varchar(200),
    birthday date not null,
    nationality varchar(150) not null
);

create table member (
    id_member varchar(150) primary key,
    last_name varchar(200) not null,
    first_name varchar(150),
    date_of_membership date not null,
    membership_expiration date not null,
    occupation varchar(200) not null,
    "address" varchar(255) not null,
    phone_number varchar(10) not null,
    email varchar(50) not null
);

create table section (
    id_section varchar(150) primary key
);


create table written_by (
    id_author varchar(150),
    id_book varchar(150),
    foreign key(id_author) references author(id_author),
    foreign key(id_book) references book(id_book)
);
create table belong (
    id_book varchar(150),
    id_genre varchar(150),
    foreign key (id_book) references book (id_book),
    foreign key (id_genre) references genre (id_genre)
);
create table borrow (
    id_book varchar(150),
    id_member varchar(150),
    "start_date" date not null,
    end_date date not null,
    foreign key(id_book) references book(id_book),
    foreign key(id_member) references member(id_member)
);

INSERT INTO book VALUES
('0000-db8-85a3-0000-0000-8a2e-0370-0001', 'To Kill a Mockingbird', 336, '1960-07-11', 'Harper Perennial Modern Classics', 'English', 'Y', 'Un roman poignant qui explore les thèmes de la justice, de la discrimination et de l''enfance dans le sud des États-Unis pendant les années 1930, raconté à travers les yeux de la jeune Scout Finch.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0002', '1984', 328, '1949-06-08', 'Signet Classic', 'English', 'Y', 'Un classique dystopique qui présente une vision sombre et totalitaire de l''avenir, où la surveillance étatique et la manipulation de la vérité sont omniprésentes.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0003', 'The Great Gatsby', 180, '1925-04-10', 'Scribner', 'English', 'Y', 'Une exploration des illusions de la richesse et de l''amour dans les années folles de l''Amérique, mettant en scène le mystérieux millionnaire Jay Gatsby et son obsession pour Daisy Buchanan.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0004', 'The Catcher in the Rye', 277, '1951-07-16', 'Back Bay Books', 'English', 'Y', 'Le récit désillusionné et sarcastique de l''adolescent Holden Caulfield alors qu''il navigue à travers la société et cherche un sens à sa vie.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0005', 'Pride and Prejudice', 279, '1813-01-28', 'Penguin Classics', 'English', 'Y', 'Une comédie romantique classique de Jane Austen qui explore les thèmes de l''amour, du mariage et de la classe sociale dans l''Angleterre du début du XIXe siècle.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0006', 'To the Lighthouse', 209, '1927-05-05', 'Harvest Books', 'English', 'Y', 'Une méditation profonde sur le passage du temps, la perception humaine et les relations interpersonnelles, racontée à travers les pensées et les expériences des membres d''une famille en vacances sur l''île de Skye.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0007', 'Moby-Dick', 720, '1851-10-18', 'Penguin Classics', 'English', 'Y', 'Une épopée maritime classique qui suit la quête obsessionnelle du capitaine Achab pour chasser et tuer la baleine blanche légendaire, Moby Dick.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0008', 'Ulysses', 732, '1922-02-02', 'Vintage', 'English', 'Y', 'Une exploration complexe et expérimentale d''une journée dans la vie de plusieurs personnages à Dublin, écrite par James Joyce et considérée comme l''une des œuvres littéraires les plus importantes du XXe siècle.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0009', 'The Sound and the Fury', 326, '1929-10-07', 'Vintage', 'English', 'Y', 'Un roman expérimental et complexe qui explore la décadence et la désintégration de la famille Compson dans le sud des États-Unis, raconté à travers les perspectives de plusieurs narrateurs.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0010', 'The Picture of Dorian Gray', 253, '1890-07-20', 'Dover Publications', 'English', 'Y', 'Une histoire gothique sur la vanité, le narcissisme et la corruption morale, mettant en scène le jeune Dorian Gray dont le portrait vieillit tandis qu''il reste éternellement jeune.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0011', 'War and Peace', 1225, '1869-01-01', 'Vintage', 'English', 'Y', 'Un vaste roman historique de Léon Tolstoï qui suit les destins entrelacés de plusieurs personnages pendant la période des guerres napoléoniennes en Russie.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0012', 'Crime and Punishment', 671, '1866-01-01', 'Penguin Classics', 'English', 'Y', 'Un thriller psychologique qui explore les motivations et les conséquences du crime à travers l''histoire de Rodion Raskolnikov, un étudiant russe tourmenté par sa conscience.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0013', 'The Brothers Karamazov', 796, '1880-01-01', 'Vintage', 'English', 'Y', 'Un roman philosophique et spirituel de Fiodor Dostoïevski qui examine les questions de foi, de moralité et de libre arbitre à travers les relations complexes entre les trois frères Karamazov.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0014', 'Anna Karenina', 864, '1877-01-01', 'Penguin Classics', 'English', 'Y', 'Un roman tragique sur l''adultère et le désir, mettant en scène la belle et insatisfaite Anna Karenina qui tombe amoureuse du jeune officier Vronski, déclenchant une série d''événements dévastateurs.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0015', 'Madame Bovary', 328, '1857-01-01', 'Penguin Classics', 'English', 'Y', 'Un portrait réaliste et critique de la vie provinciale française, mettant en scène Emma Bovary, une femme insatisfaite en quête de passion et de romantisme.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0016', 'The Adventures of Huckleberry Finn', 366, '1884-12-10', 'Penguin Classics', 'English', 'Y', 'Un récit d''aventures sur la rivière Mississippi, mettant en scène le jeune Huck Finn et l''esclave en fuite Jim alors qu''ils cherchent la liberté et l''identité dans le sud esclavagiste des États-Unis.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0017', 'Don Quixote', 992, '1605-01-16', 'Penguin Classics', 'English', 'Y', 'Un roman satirique sur les aventures d''un chevalier errant idéaliste et de son fidèle écuyer Sancho Panza, écrit par Miguel de Cervantes et considéré comme l''un des premiers romans modernes.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0018', 'Les Misérables', 1463, '1862-01-01', 'Penguin Classics', 'English', 'Y', 'Un roman épique sur l''amour, le sacrifice et la rédemption, mettant en scène le personnage emblématique de Jean Valjean et ses luttes pour trouver la rédemption dans la France du XIXe siècle.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0019', 'The Iliad', 704, '0762-01-01', 'Penguin Classics', 'English', 'Y', 'Une épopée poétique de la Grèce antique qui raconte les événements de la guerre de Troie, mettant en scène des héros légendaires comme Achille, Hector et Agamemnon.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0020', 'The Odyssey', 560, '0720-01-01', 'Penguin Classics', 'English', 'Y', 'Un récit épique de voyage et d''aventure qui suit le héros grec Odysseus lors de son voyage de retour mouvementé chez lui après la guerre de Troie, affrontant des monstres, des dieux et des obstacles mortels.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0021', 'One Hundred Years of Solitude', 417, '1967-06-05', 'Harper Perennial', 'English', 'Y', 'Un chef-d''œuvre du réalisme magique qui raconte l''histoire de la famille Buendía sur plusieurs générations dans la ville fictive de Macondo, explorant les thèmes du temps, de la mémoire et de l''isolement.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0022', 'The Divine Comedy', 798, '1320-01-01', 'Penguin Classics', 'English', 'Y', 'Une œuvre épique de Dante Alighieri qui décrit son voyage à travers l''enfer, le purgatoire et le paradis, guidé par le poète romain Virgile et l''amour'),
('0000-db8-85a3-0000-0000-8a2e-0370-0023', 'The Trial', 304, '1925-01-01', 'Schocken', 'English', 'Y', 'Un roman surréaliste de Franz Kafka qui suit le protagoniste Josef K., qui est arrêté et jugé pour un crime mystérieux dans un système judiciaire kafkaïen et absurde.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0024', 'The Metamorphosis', 201, '1915-01-01', 'Schocken', 'English', 'Y', 'Une novella de Franz Kafka qui raconte l''histoire de Gregor Samsa, un voyageur de commerce qui se réveille un jour transformé en un énorme insecte.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0025', 'Frankenstein', 280, '1818-01-01', 'Penguin Classics', 'English', 'Y', 'Un roman gothique de Mary Shelley qui explore les thèmes de la création, de la responsabilité et de la nature humaine à travers l''histoire du scientifique Victor Frankenstein et de sa créature monstrueuse.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0026', 'Brave New World', 268, '1932-01-01', 'Harper Perennial', 'English', 'Y', 'Un roman dystopique d''Aldous Huxley qui dépeint une société futuriste où les individus sont conditionnés et contrôlés de manière oppressive pour maintenir l''ordre social et politique.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0027', 'Wuthering Heights', 416, '1847-12-01', 'Penguin Classics', 'English', 'Y', 'Un roman romantique sombre d''Emily Brontë qui explore les thèmes de l''amour, de la vengeance et de l''obsession à travers l''histoire tumultueuse des amants Heathcliff et Catherine.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0028', 'Jane Eyre', 532, '1847-10-16', 'Penguin Classics', 'English', 'Y', 'Un roman classique de Charlotte Brontë qui raconte l''histoire de Jane Eyre, une jeune femme orpheline qui devient gouvernante et tombe amoureuse de son mystérieux employeur, M. Rochester.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0029', 'The Hobbit', 310, '1937-09-21', 'Houghton Mifflin', 'English', 'Y', 'Un roman de fantasy de J.R.R. Tolkien qui suit le hobbit Bilbo Baggins alors qu''il est entraîné dans une aventure épique pour récupérer un trésor gardé par le dragon Smaug.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0030', 'Fahrenheit 451', 194, '1953-10-19', 'Simon & Schuster', 'English', 'Y', 'Un roman dystopique de Ray Bradbury qui décrit une société où les livres sont interdits et brûlés par les pompiers, et où la pensée critique est réprimée.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0031', 'Animal Farm', 112, '1945-08-17', 'Signet Classic', 'English', 'Y', 'Une fable politique de George Orwell qui utilise l''allégorie pour critiquer le totalitarisme et le pouvoir corrompu à travers l''histoire des animaux d''une ferme qui se révoltent contre leurs maîtres humains.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0032', 'Dracula', 418, '1897-05-26', 'Penguin Classics', 'English', 'Y', 'Un roman gothique de Bram Stoker qui a popularisé le mythe du vampire, mettant en scène le comte Dracula qui voyage de Transylvanie à l''Angleterre pour semer la terreur et la mort.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0033', 'Heart of Darkness', 96, '1899-01-01', 'Dover Publications', 'English', 'Y', 'Une nouvelle de Joseph Conrad qui explore les thèmes de la colonisation, de la civilisation et de la barbarie à travers le voyage du marin Charles Marlow le long du fleuve Congo pour retrouver le mystérieux Kurtz.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0034', 'Great Expectations', 544, '1861-01-01', 'Penguin Classics', 'English', 'Y', 'Un roman de Charles Dickens qui suit les aventures de Pip, un jeune orphelin élevé dans la pauvreté, alors qu''il aspire à une vie meilleure et navigue à travers les complexités sociales de l''Angleterre victorienne.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0035', 'Lolita', 336, '1955-09-15', 'Vintage', 'English', 'Y', 'Un roman controversé de Vladimir Nabokov qui raconte l''histoire de Humbert Humbert, un homme obsédé par une jeune fille nommée Lolita, explorant les thèmes de l''amour interdit et de la perversion.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0036', 'A Tale of Two Cities', 489, '1859-04-30', 'Penguin Classics', 'English', 'Y', 'Un roman historique de Charles Dickens qui se déroule à Londres et à Paris avant et pendant la Révolution française, mettant en scène des personnages tels que Charles Darnay, Sydney Carton et Madame Defarge.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0037', 'Gulliver''s Travels', 306, '1726-10-28', 'Penguin Classics', 'English', 'Y', 'Un roman satirique de Jonathan Swift qui suit les voyages du capitaine Lemuel Gulliver dans des terres étranges et fantastiques peuplées de géants, de nains, de Houyhnhnms et de Yahoos.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0038', 'The Count of Monte Cristo', 1276, '1844-01-01', 'Penguin Classics', 'English', 'Y', 'Un roman d''aventure d''Alexandre Dumas qui raconte l''histoire d''Edmond Dantès, un marin injustement emprisonné qui cherche vengeance contre ceux qui l''ont trahi.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0039', 'The Scarlet Letter', 279, '1850-03-16', 'Penguin Classics', 'English', 'Y', 'Un roman de Nathaniel Hawthorne qui explore les thèmes du péché, de la culpabilité et de la rédemption dans la colonie puritaine de Boston, mettant en scène Hester Prynne, une femme condamnée pour adultère.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0040', 'The Sun Also Rises', 251, '1926-10-22', 'Scribner', 'English', 'Y', 'Un roman de l''écrivain américain Ernest Hemingway qui suit un groupe d''expatriés américains et britanniques alors qu''ils voyagent de Paris à Pampelune pour assister aux fêtes de San Fermín.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0041', 'Beloved', 324, '1987-09-16', 'Vintage', 'English', 'Y', 'Un roman de Toni Morrison qui explore les effets durables de l''esclavage et du traumatisme sur la vie d''une ancienne esclave nommée Sethe, hantée par le souvenir de sa fille décédée, Beloved.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0042', 'A Clockwork Orange', 192, '1962-01-01', 'W. W. Norton & Company', 'English', 'Y', 'Un roman dystopique d''Anthony Burgess qui suit le voyou Alex alors qu''il commet des actes de violence dans une société futuriste, explorant les thèmes de la libre volonté, de la moralité et du contrôle social.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0043', 'Catch-22', 453, '1961-11-10', 'Simon & Schuster', 'English', 'Y', 'Un roman satirique de Joseph Heller qui suit les exploits du capitaine John Yossarian et de ses camarades de l''US Air Force alors qu''ils tentent de survivre à la folie de la guerre et de la bureaucratie militaire.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0044', 'Slaughterhouse-Five', 275, '1969-03-31', 'Dell', 'English', 'Y', 'Un roman de science-fiction de Kurt Vonnegut qui suit les voyages temporels de Billy Pilgrim, un soldat américain capturé par les extraterrestres lors de la Seconde Guerre mondiale, explorant les thèmes de la guerre, de la mort et de la libre volonté.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0045', 'Lord of the Flies', 224, '1954-09-17', 'Penguin Books', 'English', 'Y', 'Un roman de William Golding qui décrit le naufrage d''un groupe de jeunes garçons sur une île déserte et leur descente dans la violence et le chaos alors qu''ils luttent pour survivre et maintenir l''ordre social.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0046', 'Gone with the Wind', 1037, '1936-06-30', 'Scribner', 'English','Y', 'Un roman épique de Margaret Mitchell qui se déroule pendant la guerre de Sécession et la période de la Reconstruction, mettant en scène Scarlett O''Hara, une femme forte et obstinée, et Rhett Butler, un séducteur cynique, dans une histoire d''amour tumultueuse et de survie.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0047', 'The Grapes of Wrath', 464, '1939-04-14', 'Penguin Classics', 'English', 'Y', 'Un roman de John Steinbeck qui suit la famille Joad, des fermiers déplacés par la Grande Dépression, alors qu''ils migrent de l''Oklahoma vers la Californie dans l''espoir d''une vie meilleure, explorant les thèmes de la pauvreté, de l''injustice et de la solidarité humaine.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0048', 'The Old Man and the Sea', 127, '1952-09-01', 'Scribner', 'English', 'Y', 'Une novella d''Ernest Hemingway qui raconte l''histoire d''un vieux pêcheur cubain nommé Santiago et de son épique lutte pour attraper un énorme marlin dans les eaux du Golfe du Mexique.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0049', 'On the Road', 320, '1957-09-05', 'Penguin Classics', 'English', 'Y', 'Un roman semi-autobiographique de Jack Kerouac qui décrit les voyages de Sal Paradise et de Dean Moriarty à travers l''Amérique dans les années 1950, explorant les thèmes de la liberté, de la jeunesse et de la recherche de soi.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0050', 'Rebecca', 449, '1938-08-01', 'William Morrow Paperbacks', 'English', 'Y', 'Un roman gothique de Daphne du Maurier qui raconte l''histoire d''une jeune femme sans nom qui épouse Maxim de Winter et devient la nouvelle Mme de Winter, seulement pour découvrir que l''ombre de sa première épouse, Rebecca, hante toujours Manderley.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0051', 'The Bell Jar', 288, '1963-01-14', 'Harper Perennial', 'English', 'Y', 'Un roman semi-autobiographique de Sylvia Plath qui suit l''histoire d''Esther Greenwood, une jeune femme brillante mais mentalement instable qui lutte contre la pression sociale et les attentes sexistes dans les années 1950.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0052', 'The Stranger', 123, '1942-01-01', 'Vintage', 'English', 'Y', 'Un roman existentialiste d''Albert Camus qui suit l''histoire de Meursault, un homme apathique et détaché qui devient un étranger dans sa propre vie après avoir commis un meurtre apparemment sans motif.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0053', 'La Vie devant soi', 280, '1975-01-01', 'Mercure de France', 'French', 'Y', 'Un roman émouvant d''Émile Ajar (pseudonyme de Romain Gary) qui raconte l''histoire d''une amitié improbable entre un jeune arabe, Momo, et Madame Rosa, une ancienne prostituée juive et survivante des camps de concentration.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0054', 'Le Soleil des Scorta', 256, '2004-01-01', 'Gallimard', 'French', 'Y', 'Un roman de Laurent Gaudé qui retrace l''histoire de la famille Scorta, une lignée de paysans pauvres du sud de l''Italie, et leur quête de dignité et de reconnaissance à travers les générations.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0055', 'Chéri', 218, '1920-01-01', 'Gallimard', 'French', 'Y', 'Un roman de l''écrivaine française Colette qui explore les thèmes de l''amour, de la passion et de la société parisienne du début du XXe siècle à travers l''histoire d''une liaison entre une femme mûre, Léa de Lonval, et un jeune homme, Chéri.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0056', 'Le Lion', 229, '1958-01-01', 'Gallimard', 'French', 'Y', 'Un roman de Joseph Kessel qui raconte l''histoire de Morel, un chasseur blanc au Kenya, et de son obsession pour la traque d''un lion surnommé "Le Fantôme", explorant les thèmes de l''aventure, de la loyauté et du respect de la nature.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0057', 'La Route des Flandres', 272, '1960-01-01', 'Minuit', 'French', 'Y', 'Un roman de Claude Simon qui décrit les horreurs de la guerre à travers les souvenirs fragmentés et les perceptions déformées des soldats français pendant la Seconde Guerre mondiale, explorant les thèmes de la mémoire et de la représentation de l''histoire.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0058', 'Les Rois maudits', 383, '1955-01-01', 'Gallimard', 'French', 'Y', 'Une série de romans historiques de Maurice Druon qui retrace les intrigues politiques, les luttes de pouvoir et les trahisons de la royauté française au XIVe siècle, mettant en scène des personnages tels que Philippe IV le Bel, Robert d''Artois et Jacques de Molay.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0059', 'Le Rivage des Syrtes', 311, '1951-01-01', 'Gallimard', 'French', 'Y', 'Un roman de Julien Gracq qui se déroule dans une république imaginaire au bord de la mer Méditerranée, mettant en scène Aldo, un jeune diplomate, et sa découverte de l''ennui et de la stagnation de la vie provinciale, explorant les thèmes de la nostalgie, de l''attente et de la frustration.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0060', 'Le Hussard sur le toit', 439, '1951-01-01', 'Gallimard', 'French', 'Y', 'Un roman de Jean Giono qui suit Angelo Pardi, un jeune aristocrate italien, alors qu''il voyage à travers la Provence au XIXe siècle en proie à une épidémie de choléra, explorant les thèmes de l''aventure, de l''amour et de la résilience.'),
('0000-db8-85a3-0000-0000-8a2e-0370-0061', 'La Plage', 408, '2000-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0062', 'Les Bienveillantes', 915, '2006-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0063', 'Plateforme', 352, '2001-01-01', 'Flammarion', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0064', 'Les Arcanes du chaos', 526, '2006-01-01', 'XO', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0065', 'Les Âmes grises', 264, '2003-01-01', 'Stock', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0066', 'HHhH', 440, '2010-01-01', 'Grasset', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0067', 'L''Homme-dé', 432, '1971-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0068', 'L''Énigme des Blancs-Manteaux', 399, '2000-01-01', '10/18', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0069', 'La Délicatesse', 210, '2009-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0070', 'La Nuit des temps', 507, '1968-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0071', 'Le Nom de la rose', 523, '1980-01-01', 'Grasset', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0072', 'Les Déracinés', 491, '1897-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0073', 'L''Île mystérieuse', 416, '1874-01-01', 'Hachette', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0074', 'La Chute', 179, '1956-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0075', 'L''Insoutenable légèreté de l''être', 393, '1984-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0076', 'Les Rivières pourpres', 405, '1998-01-01', 'Pocket', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0077', 'La Vérité sur l''affaire Harry Quebert', 666, '2012-01-01', 'Fallois', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0078', 'Le Livre de ma mère', 148, '1954-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0079', 'Les Thanatonautes', 448, '1994-01-01', 'Albin Michel', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0080', 'Le Livre des Baltimore', 480, '2015-01-01', 'Fallois', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0081', 'La Horde du Contrevent', 736, '2004-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0082', 'L''Appel de l''ange', 432, '2011-01-01', 'Pocket', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0083', 'Le Sang des autres', 320, '1945-01-01', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0084', 'La Peste', 352, '1947-06-10', 'Gallimard', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0085', 'Les Bidochon', 48, '1979-01-01', 'Fluide Glacial', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0086', 'Les Piliers de la terre', 1050, '1989-01-01', 'Robert Laffont', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0087', 'Le Vol des cigognes', 320, '1994-01-01', 'Pocket', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0088', 'Le Cercle littéraire des amateurs d''épluchures de patates', 411, '2008-01-01', 'Nil', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0089', 'Les Thanatonautes', 448, '1994-01-01', 'Albin Michel', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0090', 'Le Parfum', 263, '1985-01-01', 'Livre de Poche', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0091', 'Les Enfants de la terre', 543, '1980-01-01', 'Pocket', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0092', 'Der Steppenwolf', 237, '1927-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0093', 'Die Verwandlung', 201, '1915-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0094', 'Der Zauberberg', 1024, '1924-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0095', 'Berlin Alexanderplatz', 600, '1929-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0096', 'Siddhartha', 152, '1922-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0097', 'Der Prozess', 304, '1925-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0098', 'Der Tod in Venedig', 72, '1912-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0099', 'Im Westen nichts Neues', 296, '1928-01-01', 'Ullstein', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0100', 'Das Parfum', 263, '1985-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0101', 'Die Blechtrommel', 592, '1959-01-01', 'Steidl', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0102', 'Faust: Der Tragödie erster Teil', 192, '1808-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0103', 'Effi Briest', 368, '1896-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0104', 'Buddenbrooks', 768, '1901-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0105', 'Die Räuber', 112, '1781-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0106', 'Die Leiden des jungen Werther', 144, '1774-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0107', 'Michael Kohlhaas', 128, '1810-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0108', 'Der Untertan', 320, '1918-01-01', 'Ullstein', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0109', 'Mephisto', 288, '1936-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0110', 'Die verlorene Ehre der Katharina Blum', 140, '1974-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0111', 'Die Physiker', 80, '1962-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0112', 'Homo Faber', 192, '1957-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0113', 'Der Butt', 672, '1977-01-01', 'Steidl', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0114', 'Der Zauberlehrling', 56, '1797-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0115', 'Nathan der Weise', 160, '1779-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0116', 'Der Sandmann', 104, '1816-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0117', 'Tonio Kröger', 96, '1903-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0118', 'Die Marquise von O...', 80, '1808-01-01', 'Reclam', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0119', 'Bekenntnisse des Hochstaplers Felix Krull', 416, '1954-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0120', 'Die Schachnovelle', 120, '1942-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0121', 'Die Aufzeichnungen des Malte Laurids Brigge', 272, '1910-01-01', 'Insel', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0122', 'Berlin Alexanderplatz', 600, '1929-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0123', 'Die Blendung', 496, '1935-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0124', 'Der Vorleser', 208, '1995-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0125', 'Die Entdeckung der Currywurst', 224, '1993-01-01', 'DTV', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0126', 'Der Schwarm', 1008, '2004-01-01', 'Fischer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0127', 'Tintenherz', 576, '2003-01-01', 'Dressler', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0128', 'Das Leben der Anderen', 368, '2006-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0129', 'Die unendliche Geschichte', 528, '1979-01-01', 'Thienemann', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0130', 'Momo', 304, '1973-01-01', 'Thienemann', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0131', 'Das Glasperlenspiel', 576, '1943-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0132', 'Der Name der Rose', 576, '1980-01-01', 'Hanser', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0133', 'Die verlorene Ehre der Katharina Blum', 140, '1974-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0134', 'Das Versprechen', 160, '1958-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0135', 'Der Vorleser', 208, '1995-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0136', 'Leben des Galilei', 128, '1940-01-01', 'Suhrkamp', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0137', 'Der Richter und sein Henker', 124, '1950-01-01', 'Diogenes', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0138', 'Éléments de mathématique', 1000, '1970-01-01', 'Hermann', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0139', 'Calcul différentiel et intégral', 800, '1945-01-01', 'Dunod', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0140', 'Théorie des ensembles', 450, '1968-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0141', 'Topologie générale', 560, '1971-01-01', 'Masson', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0142', 'Algèbre linéaire', 320, '1980-01-01', 'Armand Colin', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0143', 'Analyse fonctionnelle', 700, '1981-01-01', 'Presses Universitaires de France', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0144', 'Les fondements de la géométrie', 360, '1899-01-01', 'Hermann', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0145', 'Cours d''analyse', 720, '1922-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0146', 'Géométrie algébrique', 480, '1960-01-01', 'Hermann', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0147', 'Algèbre commutative', 640, '1956-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0148', 'Analyse complexe', 540, '1970-01-01', 'Dunod', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0149', 'Les structures fondamentales de l''analyse', 680, '1964-01-01', 'Dunod', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0150', 'Probabilités et statistiques', 400, '1973-01-01', 'Masson', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0151', 'Théorie des probabilités', 450, '1939-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0152', 'Méthodes de calcul différentiel', 600, '1957-01-01', 'Presses Universitaires de France', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0153', 'Théorie analytique des nombres', 300, '1901-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0154', 'Théorie des distributions', 720, '1950-01-01', 'Hermann', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0155', 'Introduction à la topologie algébrique', 480, '1952-01-01', 'Masson', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0156', 'Espaces vectoriels topologiques', 580, '1954-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0157', 'Géométrie différentielle', 520, '1961-01-01', 'Hermann', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0158', 'Algèbre homologique', 650, '1956-01-01', 'Masson', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0159', 'Calcul matriciel', 400, '1931-01-01', 'Dunod', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0160', 'Théorie des graphes', 540, '1962-01-01', 'Presses Universitaires de France', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0161', 'Introduction à la théorie des ensembles', 300, '1949-01-01', 'Dunod', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0162', 'Analyse harmonique', 610, '1957-01-01', 'Gauthier-Villars', 'French', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0163', 'Elements of Mathematics', 1000, '1970-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0164', 'Differential and Integral Calculus', 800, '1945-01-01', 'Dover', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0165', 'Set Theory', 450, '1968-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0166', 'General Topology', 560, '1971-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0167', 'Linear Algebra', 320, '1980-01-01', 'Prentice Hall', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0168', 'Functional Analysis', 700, '1981-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0169', 'Foundations of Geometry', 360, '1899-01-01', 'Open Court', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0170', 'Course in Analysis', 720, '1922-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0171', 'Algebraic Geometry', 480, '1960-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0172', 'Commutative Algebra', 640, '1956-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0173', 'Complex Analysis', 540, '1970-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0174', 'Fundamental Structures of Analysis', 680, '1964-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0175', 'Probability and Statistics', 400, '1973-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0176', 'Theory of Probability', 450, '1939-01-01', 'Dover', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0177', 'Methods of Differential Calculus', 600, '1957-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0178', 'Analytic Number Theory', 300, '1901-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0179', 'Theory of Distributions', 720, '1950-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0180', 'Introduction to Algebraic Topology', 480, '1952-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0181', 'Topological Vector Spaces', 580, '1954-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0182', 'Differential Geometry', 520, '1961-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0183', 'Homological Algebra', 650, '1956-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0184', 'Matrix Calculus', 400, '1931-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0185', 'Graph Theory', 540, '1962-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0186', 'Introduction to Set Theory', 300, '1949-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0187', 'Harmonic Analysis', 610, '1957-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0188', 'Methods of Linear Algebra', 520, '1965-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0189', 'Prime Numbers', 340, '1942-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0190', 'Theory of Transcendental Numbers', 400, '1959-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0191', 'Calculus of Probability', 540, '1968-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0192', 'Algebra and Number Theory', 600, '1951-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0193', 'Projective Geometry', 420, '1954-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0194', 'Differential Calculus', 510, '1960-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0195', 'Real and Complex Analysis', 630, '1955-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0196', 'Introduction to Mathematical Logic', 370, '1938-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0197', 'Algebraic Structures', 480, '1943-01-01', 'Springer', 'English', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0198', 'Elemente der Mathematik', 1000, '1970-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0199', 'Differential- und Integralrechnung', 800, '1945-01-01', 'Dover', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0200', 'Mengenlehre', 450, '1968-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0201', 'Allgemeine Topologie', 560, '1971-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0202', 'Lineare Algebra', 320, '1980-01-01', 'Prentice Hall', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0203', 'Funktionalanalysis', 700, '1981-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0204', 'Grundlagen der Geometrie', 360, '1899-01-01', 'Open Court', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0205', 'Kurs der Analysis', 720, '1922-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0206', 'Algebraische Geometrie', 480, '1960-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0207', 'Kommutative Algebra', 640, '1956-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0208', 'Komplexe Analysis', 540, '1970-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0209', 'Fundamentale Strukturen der Analysis', 680, '1964-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0210', 'Wahrscheinlichkeit und Statistik', 400, '1973-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0211', 'Wahrscheinlichkeitstheorie', 450, '1939-01-01', 'Dover', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0212', 'Methoden der Differentialrechnung', 600, '1957-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0213', 'Analytische Zahlentheorie', 300, '1901-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0214', 'Theorie der Distributionen', 720, '1950-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0215', 'Einführung in die Algebraische Topologie', 480, '1952-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0216', 'Topologische Vektorräume', 580, '1954-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0217', 'Differentialgeometrie', 520, '1961-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0218', 'Homologische Algebra', 650, '1956-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0219', 'Matrixkalkül', 400, '1931-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0220', 'Graphentheorie', 540, '1962-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0221', 'Einführung in die Mengenlehre', 300, '1949-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0222', 'Harmonische Analyse', 610, '1957-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0223', 'Methoden der Linearen Algebra', 520, '1965-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0224', 'Primzahlen', 340, '1942-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0225', 'Theorie der Transzendenten Zahlen', 400, '1959-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0226', 'Wahrscheinlichkeitskalkül', 540, '1968-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0227', 'Algebra und Zahlentheorie', 600, '1951-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0228', 'Projektive Geometrie', 420, '1954-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0229', 'Differentialkalkül', 510, '1960-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0230', 'Reelle und Komplexe Analysis', 630, '1955-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0231', 'Einführung in die Mathematische Logik', 370, '1938-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0232', 'Algebraische Strukturen', 480, '1943-01-01', 'Springer', 'German', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0233', 'Ny Ainga', 320, '2015-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0234', 'Sahasika', 250, '2010-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0235', 'Raha tiana', 200, '2008-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0236', 'Ny Fahalalana', 400, '2012-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0237', 'Kambana', 150, '2013-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0238', 'Andriamanitrio', 340, '2017-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0239', 'Vahinala', 210, '2019-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0240', 'Tantara Malagasy', 380, '2020-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0241', 'Ambodiafenitra', 220, '2016-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0242', 'Ambalavelona', 180, '2018-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0243', 'Izy Ireo', 260, '2014-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0244', 'Madagasikara', 300, '2011-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0245', 'Ravao', 240, '2015-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0246', 'Ny Mpanjaka', 200, '2010-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0247', 'Voninkazo', 170, '2018-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0248', 'Avo lenta', 280, '2012-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0249', 'Tsy miala', 320, '2019-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0250', 'Ireo Tiana', 300, '2016-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0251', 'Andrianiko', 220, '2021-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0252', 'Anjaran''ny Tany', 270, '2017-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0253', 'I Vola', 320, '1901-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0254', 'Ny Teny Soa', 250, '1902-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0255', 'Finoana', 200, '1903-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0256', 'Hazo Voaloboka', 400, '1904-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0257', 'Lohataona', 150, '1905-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0258', 'Manga Volana', 340, '1906-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0259', 'Raiso Ny Teny', 210, '1907-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0260', 'Voninahitra', 380, '1908-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0261', 'Fahendrena', 220, '1909-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0262', 'Sariaka', 180, '1910-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0263', 'Lapan''ny Hasina', 260, '1911-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0264', 'Antsan''ny Tany', 300, '1912-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0265', 'Fitaratra', 240, '1913-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0266', 'Vonton''aina', 200, '1914-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0267', 'Dinitra', 170, '1915-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0268', 'Fanantenana', 280, '1916-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0269', 'Ny Fitarikandro', 320, '1917-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0270', 'Tandroka', 300, '1918-01-01', 'Trano Printy', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0271', 'Vokatsoa', 220, '1919-01-01', 'Havatsa', 'Malagasy', 'Y'),
('0000-db8-85a3-0000-0000-8a2e-0370-0272', 'Anjoria', 270, '1920-01-01', 'Trano Printy', 'Malagasy', 'Y');



INSERT INTO author VALUES
('0000-da8-85a7-0000-0000-8a2e-0370-0001', 'Hemingway', 'Ernest', '1899-07-21', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0002', 'Fitzgerald', 'F. Scott', '1896-09-24', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0003', 'Steinbeck', 'John', '1902-02-27', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0004', 'Twain', 'Mark', '1835-11-30', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0005', 'Hawthorne', 'Nathaniel', '1804-07-04', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0006', 'Whitman', 'Walt', '1819-05-31', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0007', 'Poe', 'Edgar Allan', '1809-01-19', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0008', 'Melville', 'Herman', '1819-08-01', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0009', 'Dickinson', 'Emily', '1830-12-10', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0011', 'Hugo', 'Victor', '1802-02-26', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0012', 'Dumas', 'Alexandre', '1802-07-24', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0013', 'Balzac', 'Honoré de', '1799-05-20', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0014', 'Zola', 'Émile', '1840-04-02', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0015', 'Camus', 'Albert', '1913-11-07', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0016', 'Proust', 'Marcel', '1871-07-10', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0017', 'Flaubert', 'Gustave', '1821-12-12', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0018', 'Voltaire', NULL, '1694-11-21', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0019', 'Molière', NULL, '1622-01-15', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0020', 'Rousseau', 'Jean-Jacques', '1712-06-28', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0021', 'Rajaonarimanana', 'Jean-Luc', '1964-03-01', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0022', 'Rakotomalala', 'Eugène', '1910-12-24', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0023', 'Rabe', 'Ny Avana', '1957-08-05', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0024', 'Rasamoelina', 'Elie', '1962-05-12', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0025', 'Rakotozafy', 'Andrianary', '1933-07-12', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0026', 'Randriamihaja', 'Norbert', '1937-10-22', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0027', 'Rakotomalala', 'Marcellin', '1930-06-16', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0028', 'Razafindratsima', 'Marie-Thérèse', '1958-09-18', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0029', 'Rakotozandriny', 'Richard', '1969-12-31', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0030', 'Razafy', 'Jean Joseph', '1940-04-25', 'Malagasy'),
('0000-da8-85a7-0000-0000-8a2e-0370-0031', 'Goethe', 'Johann Wolfgang von', '1749-08-28', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0032', 'Kafka', 'Franz', '1883-07-03', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0033', 'Schiller', 'Friedrich', '1759-11-10', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0034', 'Nietzsche', 'Friedrich', '1844-10-15', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0035', 'Mann', 'Thomas', '1875-06-06', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0036', 'Heine', 'Heinrich', '1797-12-13', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0037', 'Hesse', 'Hermann', '1877-07-02', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0038', 'Grass', 'Günter', '1927-10-16', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0039', 'Brecht', 'Bertolt', '1898-02-10', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0105', 'Müller', 'Herta', '1953-08-17', 'German');
('0000-da8-85a7-0000-0000-8a2e-0370-0040', 'Asimov', 'Isaac', '1920-01-02', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0041', 'Hemingway', 'Ernest', '1899-07-21', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0042', 'Fitzgerald', 'F. Scott', '1896-09-24', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0043', 'King', 'Stephen', '1947-09-21', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0049', 'Wolfe', 'Tom', '1900-10-03', 'American'),
('0000-da8-85a7-0000-0000-8a2e-0370-0052', 'Proust', 'Marcel', '1871-07-10', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0058', 'Verne', 'Jules', '1828-02-08', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0067', 'Heine', 'Heinrich', '1797-12-13', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0068', 'Böll', 'Heinrich', '1917-12-21', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0069', 'Musil', 'Robert', '1880-11-06', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0070', 'Sartre', 'Jean-Paul', '1905-06-21', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0071', 'Pascal', 'Blaise', '1623-06-19', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0072', 'Bourbaki', 'Nicolas', '1900-11-01', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0073', 'Dieudonné', 'Jean', '1906-07-01', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0074', 'Cartan', 'Henri', '1904-07-08', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0075', 'Weil', 'André', '1906-05-06', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0076', 'Serre', 'Jean-Pierre', '1926-09-15', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0077', 'Grothendieck', 'Alexander', '1928-03-28', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0078', 'Lang', 'Serge', '1927-05-19', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0079', 'Schwartz', 'Laurent', '1915-03-05', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0080', 'Tits', 'Jacques', '1930-08-12', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0081', 'Lions', 'Jacques-Louis', '1928-05-03', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0082', 'Borel', 'Armand', '1923-05-21', 'Swiss'),
('0000-da8-85a7-0000-0000-8a2e-0370-0083', 'Frobenius', 'Georg', '1849-10-26', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0084', 'Noether', 'Emmy', '1882-03-23', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0085', 'Gauss', 'Carl Friedrich', '1777-04-30', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0086', 'Euler', 'Leonhard', '1707-04-15', 'Swiss'),
('0000-da8-85a7-0000-0000-8a2e-0370-0087', 'Riemann', 'Bernhard', '1826-09-17', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0088', 'Hilbert', 'David', '1862-01-23', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0089', 'Klein', 'Felix', '1849-04-25', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0090', 'Poincaré', 'Henri', '1854-04-29', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0091', 'Laplace', 'Pierre-Simon', '1749-03-23', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0092', 'Fourier', 'Joseph', '1768-03-21', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0093', 'Cauchy', 'Augustin', '1789-08-21', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0094', 'Leibniz', 'Gottfried Wilhelm', '1646-07-01', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0095', 'Newton', 'Isaac', '1643-01-04', 'British'),
('0000-da8-85a7-0000-0000-8a2e-0370-0096', 'Galois', 'Évariste', '1811-10-25', 'French'),
('0000-da8-85a7-0000-0000-8a2e-0370-0097', 'Abel', 'Niels Henrik', '1802-08-05', 'Norwegian'),
('0000-da8-85a7-0000-0000-8a2e-0370-0098', 'Cantor', 'Georg', '1845-03-03', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0099', 'Dedekind', 'Richard', '1831-10-06', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0100', 'Kronecker', 'Leopold', '1823-12-07', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0101', 'Möbius', 'August', '1790-11-17', 'German'),
('0000-da8-85a7-0000-0000-8a2e-0370-0102', 'Bernoulli', 'Johann', '1667-08-06', 'Swiss'),
('0000-da8-85a7-0000-0000-8a2e-0370-0103', 'Erdős', 'Paul', '1913-03-26', 'Hungarian'),
('0000-da8-85a7-0000-0000-8a2e-0370-0104', 'Ramanujan', 'Srinivasa', '1887-12-22', 'Indian');




INSERT INTO written_by (id_author, id_book) VALUES
('0000-da8-85a7-0000-0000-8a2e-0370-0009', '0000-db8-85a3-0000-0000-8a2e-0370-0001'), -- Emily Dickinson, To Kill a Mockingbird
('0000-da8-85a7-0000-0000-8a2e-0370-0017', '0000-db8-85a3-0000-0000-8a2e-0370-0002'), -- Victor Hugo, 1984
('0000-da8-85a7-0000-0000-8a2e-0370-0018', '0000-db8-85a3-0000-0000-8a2e-0370-0003'), -- Alexandre Dumas, The Great Gatsby
('0000-da8-85a7-0000-0000-8a2e-0370-0013', '0000-db8-85a3-0000-0000-8a2e-0370-0004'), -- Honoré de Balzac, The Catcher in the Rye
('0000-da8-85a7-0000-0000-8a2e-0370-0001', '0000-db8-85a3-0000-0000-8a2e-0370-0005'), -- Ernest Hemingway, Pride and Prejudice
('0000-da8-85a7-0000-0000-8a2e-0370-0002', '0000-db8-85a3-0000-0000-8a2e-0370-0006'), -- F. Scott Fitzgerald, To the Lighthouse
('0000-da8-85a7-0000-0000-8a2e-0370-0003', '0000-db8-85a3-0000-0000-8a2e-0370-0007'), -- John Steinbeck, Moby-Dick
('0000-da8-85a7-0000-0000-8a2e-0370-0004', '0000-db8-85a3-0000-0000-8a2e-0370-0008'), -- Mark Twain, Ulysses
('0000-da8-85a7-0000-0000-8a2e-0370-0005', '0000-db8-85a3-0000-0000-8a2e-0370-0009'), -- Nathaniel Hawthorne, The Sound and the Fury
('0000-da8-85a7-0000-0000-8a2e-0370-0006', '0000-db8-85a3-0000-0000-8a2e-0370-0010'), -- Walt Whitman, The Picture of Dorian Gray
('0000-da8-85a7-0000-0000-8a2e-0370-0007', '0000-db8-85a3-0000-0000-8a2e-0370-0011'), -- Edgar Allan Poe, War and Peace
('0000-da8-85a7-0000-0000-8a2e-0370-0008', '0000-db8-85a3-0000-0000-8a2e-0370-0012'), -- Herman Melville, Crime and Punishment
('0000-da8-85a7-0000-0000-8a2e-0370-0009', '0000-db8-85a3-0000-0000-8a2e-0370-0013'), -- Emily Dickinson, The Brothers Karamazov
('0000-da8-85a7-0000-0000-8a2e-0370-0011', '0000-db8-85a3-0000-0000-8a2e-0370-0014'), -- Victor Hugo, Anna Karenina
('0000-da8-85a7-0000-0000-8a2e-0370-0012', '0000-db8-85a3-0000-0000-8a2e-0370-0015'), -- Alexandre Dumas, Madame Bovary
('0000-da8-85a7-0000-0000-8a2e-0370-0013', '0000-db8-85a3-0000-0000-8a2e-0370-0016'), -- Honoré de Balzac, The Adventures of Huckleberry Finn
('0000-da8-85a7-0000-0000-8a2e-0370-0014', '0000-db8-85a3-0000-0000-8a2e-0370-0017'), -- Émile Zola, Don Quixote
('0000-da8-85a7-0000-0000-8a2e-0370-0015', '0000-db8-85a3-0000-0000-8a2e-0370-0018'), -- Albert Camus, Les Misérables
('0000-da8-85a7-0000-0000-8a2e-0370-0016', '0000-db8-85a3-0000-0000-8a2e-0370-0019'), -- Marcel Proust, The Iliad
('0000-da8-85a7-0000-0000-8a2e-0370-0017', '0000-db8-85a3-0000-0000-8a2e-0370-0020'), -- Gustave Flaubert, The Odyssey
('0000-da8-85a7-0000-0000-8a2e-0370-0018', '0000-db8-85a3-0000-0000-8a2e-0370-0021'), -- Voltaire, One Hundred Years of Solitude
('0000-da8-85a7-0000-0000-8a2e-0370-0019', '0000-db8-85a3-0000-0000-8a2e-0370-0022'), -- Molière, The Divine Comedy
('0000-da8-85a7-0000-0000-8a2e-0370-0020', '0000-db8-85a3-0000-0000-8a2e-0370-0023'), -- Jean-Jacques Rousseau, The Trial 
('0000-da8-85a7-0000-0000-8a2e-0370-0041', '0000-db8-85a3-0000-0000-8a2e-0370-0040'), -- Hemingway - The Old Man and the Sea
('0000-da8-85a7-0000-0000-8a2e-0370-0042', '0000-db8-85a3-0000-0000-8a2e-0370-0041'), -- Fitzgerald - The Bell Jar
('0000-da8-85a7-0000-0000-8a2e-0370-0052', '0000-db8-85a3-0000-0000-8a2e-0370-0063'), -- Proust - Plateforme
('0000-da8-85a7-0000-0000-8a2e-0370-0058', '0000-db8-85a3-0000-0000-8a2e-0370-0010'), -- Verne - Journey to the Center of the Earth
('0000-da8-85a7-0000-0000-8a2e-0370-0067', '0000-db8-85a3-0000-0000-8a2e-0370-0056'), -- Heine - Le Lion
('0000-da8-85a7-0000-0000-8a2e-0370-0068', '0000-db8-85a3-0000-0000-8a2e-0370-0065'), -- Böll - Les Âmes grises
('0000-da8-85a7-0000-0000-8a2e-0370-0069', '0000-db8-85a3-0000-0000-8a2e-0370-0066'), -- Musil - HHhH
('0000-da8-85a7-0000-0000-8a2e-0370-0070', '0000-db8-85a3-0000-0000-8a2e-0370-0051'), -- Sartre - The Stranger 
('0000-da8-85a7-0000-0000-8a2e-0370-0011', '0000-db8-85a3-0000-0000-8a2e-0370-0039'), -- Hugo - The Scarlet Letter
('0000-da8-85a7-0000-0000-8a2e-0370-0012', '0000-db8-85a3-0000-0000-8a2e-0370-0038'), -- Dumas - The Count of Monte Cristo
('0000-da8-85a7-0000-0000-8a2e-0370-0013', '0000-db8-85a3-0000-0000-8a2e-0370-0036'), -- Balzac - A Tale of Two Cities
('0000-da8-85a7-0000-0000-8a2e-0370-0014', '0000-db8-85a3-0000-0000-8a2e-0370-0045'), -- Zola - Lord of the Flies
('0000-da8-85a7-0000-0000-8a2e-0370-0015', '0000-db8-85a3-0000-0000-8a2e-0370-0052'), -- Camus - The Stranger
('0000-da8-85a7-0000-0000-8a2e-0370-0016', '0000-db8-85a3-0000-0000-8a2e-0370-0061'), -- Proust - La Plage
('0000-da8-85a7-0000-0000-8a2e-0370-0017', '0000-db8-85a3-0000-0000-8a2e-0370-0081'), -- Flaubert - La Horde du Contrevent
('0000-da8-85a7-0000-0000-8a2e-0370-0040', '0000-db8-85a3-0000-0000-8a2e-0370-0053'), -- Asimov - La Vie devant soi
('0000-da8-85a7-0000-0000-8a2e-0370-0071', '0000-db8-85a3-0000-0000-8a2e-0370-0054'), -- Pascal - Le Soleil des Scorta
('0000-da8-85a7-0000-0000-8a2e-0370-0072', '0000-db8-85a3-0000-0000-8a2e-0370-0140'),
('0000-da8-85a7-0000-0000-8a2e-0370-0073', '0000-db8-85a3-0000-0000-8a2e-0370-0141'),
('0000-da8-85a7-0000-0000-8a2e-0370-0074', '0000-db8-85a3-0000-0000-8a2e-0370-0142'),
('0000-da8-85a7-0000-0000-8a2e-0370-0075', '0000-db8-85a3-0000-0000-8a2e-0370-0143'),
('0000-da8-85a7-0000-0000-8a2e-0370-0076', '0000-db8-85a3-0000-0000-8a2e-0370-0144'),
('0000-da8-85a7-0000-0000-8a2e-0370-0077', '0000-db8-85a3-0000-0000-8a2e-0370-0145'),
('0000-da8-85a7-0000-0000-8a2e-0370-0078', '0000-db8-85a3-0000-0000-8a2e-0370-0146'),
('0000-da8-85a7-0000-0000-8a2e-0370-0079', '0000-db8-85a3-0000-0000-8a2e-0370-0147'),
('0000-da8-85a7-0000-0000-8a2e-0370-0080', '0000-db8-85a3-0000-0000-8a2e-0370-0148'),
('0000-da8-85a7-0000-0000-8a2e-0370-0081', '0000-db8-85a3-0000-0000-8a2e-0370-0149'),
('0000-da8-85a7-0000-0000-8a2e-0370-0082', '0000-db8-85a3-0000-0000-8a2e-0370-0150'),
('0000-da8-85a7-0000-0000-8a2e-0370-0083', '0000-db8-85a3-0000-0000-8a2e-0370-0151'),
('0000-da8-85a7-0000-0000-8a2e-0370-0084', '0000-db8-85a3-0000-0000-8a2e-0370-0152'),
('0000-da8-85a7-0000-0000-8a2e-0370-0085', '0000-db8-85a3-0000-0000-8a2e-0370-0153'),
('0000-da8-85a7-0000-0000-8a2e-0370-0086', '0000-db8-85a3-0000-0000-8a2e-0370-0154'),
('0000-da8-85a7-0000-0000-8a2e-0370-0087', '0000-db8-85a3-0000-0000-8a2e-0370-0155'),
('0000-da8-85a7-0000-0000-8a2e-0370-0088', '0000-db8-85a3-0000-0000-8a2e-0370-0156'),
('0000-da8-85a7-0000-0000-8a2e-0370-0089', '0000-db8-85a3-0000-0000-8a2e-0370-0157'),
('0000-da8-85a7-0000-0000-8a2e-0370-0090', '0000-db8-85a3-0000-0000-8a2e-0370-0158'),
('0000-da8-85a7-0000-0000-8a2e-0370-0091', '0000-db8-85a3-0000-0000-8a2e-0370-0159'),
('0000-da8-85a7-0000-0000-8a2e-0370-0092', '0000-db8-85a3-0000-0000-8a2e-0370-0160'),
('0000-da8-85a7-0000-0000-8a2e-0370-0093', '0000-db8-85a3-0000-0000-8a2e-0370-0161'),
('0000-da8-85a7-0000-0000-8a2e-0370-0094', '0000-db8-85a3-0000-0000-8a2e-0370-0162'),
('0000-da8-85a7-0000-0000-8a2e-0370-0095', '0000-db8-85a3-0000-0000-8a2e-0370-0163'),
('0000-da8-85a7-0000-0000-8a2e-0370-0096', '0000-db8-85a3-0000-0000-8a2e-0370-0164'),
('0000-da8-85a7-0000-0000-8a2e-0370-0097', '0000-db8-85a3-0000-0000-8a2e-0370-0165'),
('0000-da8-85a7-0000-0000-8a2e-0370-0098', '0000-db8-85a3-0000-0000-8a2e-0370-0166'),
('0000-da8-85a7-0000-0000-8a2e-0370-0099', '0000-db8-85a3-0000-0000-8a2e-0370-0167'),
('0000-da8-85a7-0000-0000-8a2e-0370-0100', '0000-db8-85a3-0000-0000-8a2e-0370-0168'),
('0000-da8-85a7-0000-0000-8a2e-0370-0101', '0000-db8-85a3-0000-0000-8a2e-0370-0169'),
('0000-da8-85a7-0000-0000-8a2e-0370-0102', '0000-db8-85a3-0000-0000-8a2e-0370-0170'),
('0000-da8-85a7-0000-0000-8a2e-0370-0103', '0000-db8-85a3-0000-0000-8a2e-0370-0171'),
('0000-da8-85a7-0000-0000-8a2e-0370-0104', '0000-db8-85a3-0000-0000-8a2e-0370-0172'),
('0000-da8-85a7-0000-0000-8a2e-0370-0072', '0000-db8-85a3-0000-0000-8a2e-0370-0173'),
('0000-da8-85a7-0000-0000-8a2e-0370-0073', '0000-db8-85a3-0000-0000-8a2e-0370-0174'),
('0000-da8-85a7-0000-0000-8a2e-0370-0074', '0000-db8-85a3-0000-0000-8a2e-0370-0175'),
('0000-da8-85a7-0000-0000-8a2e-0370-0075', '0000-db8-85a3-0000-0000-8a2e-0370-0176'),
('0000-da8-85a7-0000-0000-8a2e-0370-0076', '0000-db8-85a3-0000-0000-8a2e-0370-0177'),
('0000-da8-85a7-0000-0000-8a2e-0370-0077', '0000-db8-85a3-0000-0000-8a2e-0370-0178'),
('0000-da8-85a7-0000-0000-8a2e-0370-0078', '0000-db8-85a3-0000-0000-8a2e-0370-0179'),
('0000-da8-85a7-0000-0000-8a2e-0370-0079', '0000-db8-85a3-0000-0000-8a2e-0370-0180'),
('0000-da8-85a7-0000-0000-8a2e-0370-0080', '0000-db8-85a3-0000-0000-8a2e-0370-0181'),
('0000-da8-85a7-0000-0000-8a2e-0370-0081', '0000-db8-85a3-0000-0000-8a2e-0370-0182'),
('0000-da8-85a7-0000-0000-8a2e-0370-0082', '0000-db8-85a3-0000-0000-8a2e-0370-0183'),
('0000-da8-85a7-0000-0000-8a2e-0370-0083', '0000-db8-85a3-0000-0000-8a2e-0370-0184'),
('0000-da8-85a7-0000-0000-8a2e-0370-0084', '0000-db8-85a3-0000-0000-8a2e-0370-0185'),
('0000-da8-85a7-0000-0000-8a2e-0370-0085', '0000-db8-85a3-0000-0000-8a2e-0370-0186'),
('0000-da8-85a7-0000-0000-8a2e-0370-0086', '0000-db8-85a3-0000-0000-8a2e-0370-0187'),
('0000-da8-85a7-0000-0000-8a2e-0370-0087', '0000-db8-85a3-0000-0000-8a2e-0370-0188'),
('0000-da8-85a7-0000-0000-8a2e-0370-0088', '0000-db8-85a3-0000-0000-8a2e-0370-0189'),
('0000-da8-85a7-0000-0000-8a2e-0370-0089', '0000-db8-85a3-0000-0000-8a2e-0370-0190'),
('0000-da8-85a7-0000-0000-8a2e-0370-0090', '0000-db8-85a3-0000-0000-8a2e-0370-0191'),
('0000-da8-85a7-0000-0000-8a2e-0370-0091', '0000-db8-85a3-0000-0000-8a2e-0370-0192'),
('0000-da8-85a7-0000-0000-8a2e-0370-0092', '0000-db8-85a3-0000-0000-8a2e-0370-0193'),
('0000-da8-85a7-0000-0000-8a2e-0370-0093', '0000-db8-85a3-0000-0000-8a2e-0370-0194'),
('0000-da8-85a7-0000-0000-8a2e-0370-0094', '0000-db8-85a3-0000-0000-8a2e-0370-0195'),
('0000-da8-85a7-0000-0000-8a2e-0370-0095', '0000-db8-85a3-0000-0000-8a2e-0370-0196'),
('0000-da8-85a7-0000-0000-8a2e-0370-0096', '0000-db8-85a3-0000-0000-8a2e-0370-0197'),
('0000-da8-85a7-0000-0000-8a2e-0370-0097', '0000-db8-85a3-0000-0000-8a2e-0370-0198'),
('0000-da8-85a7-0000-0000-8a2e-0370-0098', '0000-db8-85a3-0000-0000-8a2e-0370-0199');




INSERT INTO genre (id_genre, genre_name) VALUES 
('0000-db8-35g3-0000-0000-7x2e-0370-0001', 'Romance'),
('0000-db8-35g3-0000-0000-7x2e-0370-0002', 'Science Fiction'),
('0000-db8-35g3-0000-0000-7x2e-0370-0003', 'Dystopian'),
('0000-db8-35g3-0000-0000-7x2e-0370-0004', 'Horror'),
('0000-db8-35g3-0000-0000-7x2e-0370-0005', 'Classic'),
('0000-db8-35g3-0000-0000-7x2e-0370-0006', 'Mystery'),
('0000-db8-35g3-0000-0000-7x2e-0370-0007', 'Adventure'),
('0000-db8-35g3-0000-0000-7x2e-0370-0008', 'Historical Fiction'),
('0000-db8-35g3-0000-0000-7x2e-0370-0009', 'Fantasy'),
('0000-db8-35g3-0000-0000-7x2e-0370-0010', 'Thriller'),
('0000-db8-35g3-0000-0000-7x2e-0370-0011', 'sciences'),
('0000-db8-35g3-0000-0000-7x2e-0370-0012', 'Logique'),
('0000-db8-35g3-0000-0000-7x2e-0370-0013', 'Éducation'),
('0000-db8-35g3-0000-0000-7x2e-0370-0014', 'Didactique');

INSERT INTO belong (id_book, id_genre) VALUES 
('0000-db8-85a3-0000-0000-8a2e-0370-0001', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0002', '0000-db8-35g3-0000-0000-7x2e-0370-0010'), -- Thriller
('0000-db8-85a3-0000-0000-8a2e-0370-0003', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0004', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0005', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0006', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0007', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0008', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0009', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0010', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0011', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0012', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0013', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0014', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0015', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0016', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0017', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0018', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0019', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0020', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0021', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0022', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0023', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0024', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0025', '0000-db8-35g3-0000-0000-7x2e-0370-0004'), -- Horror
('0000-db8-85a3-0000-0000-8a2e-0370-0026', '0000-db8-35g3-0000-0000-7x2e-0370-0003'), -- Dystopian
('0000-db8-85a3-0000-0000-8a2e-0370-0027', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0028', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0029', '0000-db8-35g3-0000-0000-7x2e-0370-0009'), -- Fantasy
('0000-db8-85a3-0000-0000-8a2e-0370-0030', '0000-db8-35g3-0000-0000-7x2e-0370-0003'), -- Dystopian
('0000-db8-85a3-0000-0000-8a2e-0370-0031', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0032', '0000-db8-35g3-0000-0000-7x2e-0370-0004'), -- Horror
('0000-db8-85a3-0000-0000-8a2e-0370-0033', '0000-db8-35g3-0000-0000-7x2e-0370-0004'), -- Horror
('0000-db8-85a3-0000-0000-8a2e-0370-0034', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0035', '0000-db8-35g3-0000-0000-7x2e-0370-0001'), -- Romance
('0000-db8-85a3-0000-0000-8a2e-0370-0036', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0037', '0000-db8-35g3-0000-0000-7x2e-0370-0007'), -- Adventure
('0000-db8-85a3-0000-0000-8a2e-0370-0038', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0039', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0040', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0041', '0000-db8-35g3-0000-0000-7x2e-0370-0001'), -- Romance
('0000-db8-85a3-0000-0000-8a2e-0370-0042', '0000-db8-35g3-0000-0000-7x2e-0370-0004'), -- Horror
('0000-db8-85a3-0000-0000-8a2e-0370-0043', '0000-db8-35g3-0000-0000-7x2e-0370-0010'), -- Thriller
('0000-db8-85a3-0000-0000-8a2e-0370-0044', '0000-db8-35g3-0000-0000-7x2e-0370-0002'), -- Science Fiction
('0000-db8-85a3-0000-0000-8a2e-0370-0045', '0000-db8-35g3-0000-0000-7x2e-0370-0009'), -- Fantasy
('0000-db8-85a3-0000-0000-8a2e-0370-0046', '0000-db8-35g3-0000-0000-7x2e-0370-0001'), -- Romance
('0000-db8-85a3-0000-0000-8a2e-0370-0047', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0048', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0049', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Classic
('0000-db8-85a3-0000-0000-8a2e-0370-0050', '0000-db8-35g3-0000-0000-7x2e-0370-0001'), -- Romance
('0000-db8-85a3-0000-0000-8a2e-0370-0051', '0000-db8-35g3-0000-0000-7x2e-0370-0010'), -- Thriller
('0000-db8-85a3-0000-0000-8a2e-0370-0052', '0000-db8-35g3-0000-0000-7x2e-0370-0010'), -- Thriller
('0000-db8-85a3-0000-0000-8a2e-0370-0053', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- La Vie devant soi (Classic)
('0000-db8-85a3-0000-0000-8a2e-0370-0054', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Le Soleil des Scorta (Classic)
('0000-db8-85a3-0000-0000-8a2e-0370-0055', '0000-db8-35g3-0000-0000-7x2e-0370-0001'), -- Chéri (Romance)
('0000-db8-85a3-0000-0000-8a2e-0370-0056', '0000-db8-35g3-0000-0000-7x2e-0370-0007'), -- Le Lion (Adventure)
('0000-db8-85a3-0000-0000-8a2e-0370-0057', '0000-db8-35g3-0000-0000-7x2e-0370-0006'), -- La Route des Flandres (Mystery)
('0000-db8-85a3-0000-0000-8a2e-0370-0058', '0000-db8-35g3-0000-0000-7x2e-0370-0008'), -- Les Rois maudits (Historical Fiction)
('0000-db8-85a3-0000-0000-8a2e-0370-0092', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Der Steppenwolf (Classic)
('0000-db8-85a3-0000-0000-8a2e-0370-0093', '0000-db8-35g3-0000-0000-7x2e-0370-0005'), -- Die Verwandlung (Classic)
('0000-db8-85a3-0000-0000-8a2e-0370-0094', '0000-db8-35g3-0000-0000-7x2e-0370-0010'), -- Der Zauberberg (Thriller)
('0000-db8-85a3-0000-0000-8a2e-0370-0095', '0000-db8-35g3-0000-0000-7x2e-0370-0006'), -- Berlin Alexanderplatz (Mystery)
('0000-db8-85a3-0000-0000-8a2e-0370-0140', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Théorie des ensembles
('0000-db8-85a3-0000-0000-8a2e-0370-0141', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Topologie générale
('0000-db8-85a3-0000-0000-8a2e-0370-0142', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Algèbre linéaire
('0000-db8-85a3-0000-0000-8a2e-0370-0143', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Analyse fonctionnelle
('0000-db8-85a3-0000-0000-8a2e-0370-0144', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Les fondements de la géométrie
('0000-db8-85a3-0000-0000-8a2e-0370-0145', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Cours d'analyse
('0000-db8-85a3-0000-0000-8a2e-0370-0146', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Géométrie algébrique
('0000-db8-85a3-0000-0000-8a2e-0370-0147', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Algèbre commutative
('0000-db8-85a3-0000-0000-8a2e-0370-0148', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Analyse complexe
('0000-db8-85a3-0000-0000-8a2e-0370-0149', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Les structures fondamentales de l'analyse
('0000-db8-85a3-0000-0000-8a2e-0370-0150', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Probabilités et statistiques
('0000-db8-85a3-0000-0000-8a2e-0370-0151', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Théorie des probabilités
('0000-db8-85a3-0000-0000-8a2e-0370-0152', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Méthodes de calcul différentiel
('0000-db8-85a3-0000-0000-8a2e-0370-0153', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Théorie analytique des nombres
('0000-db8-85a3-0000-0000-8a2e-0370-0154', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Théorie des distributions
('0000-db8-85a3-0000-0000-8a2e-0370-0155', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Introduction à la topologie algébrique
('0000-db8-85a3-0000-0000-8a2e-0370-0156', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Espaces vectoriels topologiques
('0000-db8-85a3-0000-0000-8a2e-0370-0157', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Géométrie différentielle
('0000-db8-85a3-0000-0000-8a2e-0370-0158', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Algèbre homologique
('0000-db8-85a3-0000-0000-8a2e-0370-0159', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Calcul matriciel
('0000-db8-85a3-0000-0000-8a2e-0370-0160', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Théorie des graphes
('0000-db8-85a3-0000-0000-8a2e-0370-0161', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Introduction à la théorie des ensembles
('0000-db8-85a3-0000-0000-8a2e-0370-0162', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Analyse harmonique
('0000-db8-85a3-0000-0000-8a2e-0370-0163', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Elements of Mathematics
('0000-db8-85a3-0000-0000-8a2e-0370-0164', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Differential and Integral Calculus
('0000-db8-85a3-0000-0000-8a2e-0370-0165', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Set Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0166', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- General Topology
('0000-db8-85a3-0000-0000-8a2e-0370-0167', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Linear Algebra
('0000-db8-85a3-0000-0000-8a2e-0370-0168', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Functional Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0169', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Foundations of Geometry
('0000-db8-85a3-0000-0000-8a2e-0370-0170', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Course in Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0171', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Algebraic Geometry
('0000-db8-85a3-0000-0000-8a2e-0370-0172', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Commutative Algebra
('0000-db8-85a3-0000-0000-8a2e-0370-0173', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Complex Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0174', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Fundamental Structures of Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0175', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Probability and Statistics
('0000-db8-85a3-0000-0000-8a2e-0370-0176', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Theory of Probability
('0000-db8-85a3-0000-0000-8a2e-0370-0177', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Differential Calculation Methods
('0000-db8-85a3-0000-0000-8a2e-0370-0178', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Analytical Number Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0179', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Distribution Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0180', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Introduction to Algebraic Topology
('0000-db8-85a3-0000-0000-8a2e-0370-0181', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Topological Vector Spaces
('0000-db8-85a3-0000-0000-8a2e-0370-0182', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Differential Geometry
('0000-db8-85a3-0000-0000-8a2e-0370-0183', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Homological Algebra
('0000-db8-85a3-0000-0000-8a2e-0370-0184', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Matrix Calculus
('0000-db8-85a3-0000-0000-8a2e-0370-0185', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Graph Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0186', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Introduction to Set Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0187', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Harmonic Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0188', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Elements of Mathematics
('0000-db8-85a3-0000-0000-8a2e-0370-0189', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Differential and Integral Calculus
('0000-db8-85a3-0000-0000-8a2e-0370-0190', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Set Theory
('0000-db8-85a3-0000-0000-8a2e-0370-0191', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- General Topology
('0000-db8-85a3-0000-0000-8a2e-0370-0192', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Linear Algebra
('0000-db8-85a3-0000-0000-8a2e-0370-0193', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Functional Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0194', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Foundations of Geometry
('0000-db8-85a3-0000-0000-8a2e-0370-0195', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Course in Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0196', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Algebraic Geometry
('0000-db8-85a3-0000-0000-8a2e-0370-0197', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Commutative Algebra
('0000-db8-85a3-0000-0000-8a2e-0370-0198', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Complex Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0199', '0000-db8-35g3-0000-0000-7x2e-0370-0011'), -- Fundamental Structures of Analysis
('0000-db8-85a3-0000-0000-8a2e-0370-0200', '0000-db8-35g3-0000-0000-7x2e-0370-0011'); -- Probability and Statistics

INSERT INTO member VALUES
('0000-zm8-25a1-0000-0000-3m2v-0000-0001', 'Razafindratelo', 'Abegà', '2024-01-01', '2025-01-01','Etudiant en MI - UA et Informatique HEI', 'Ambohipanja LOT 185 AS', '+261 38 22 694 35', 'a.razafindratelo@gmail.com');


INSERT INTO borrow VALUES
('0000-db8-85a3-0000-0000-8a2e-0370-0192', '0000-zm8-25a1-0000-0000-3m2v-0000-0001', '2024-06-03','2024-07-03'),
('0000-db8-85a3-0000-0000-8a2e-0370-0198', '0000-zm8-25a1-0000-0000-3m2v-0000-0001', '2024-04-05','2024-05-05'),
('0000-db8-85a3-0000-0000-8a2e-0370-0194', '0000-zm8-25a1-0000-0000-3m2v-0000-0001', '2024-01-20','2024-02-20'),
('0000-db8-85a3-0000-0000-8a2e-0370-0193', '0000-zm8-25a1-0000-0000-3m2v-0000-0001', '2024-05-17','2024-06-17');

INSERT INTO section VALUES
('S-0000-0001'),
('S-0000-0002'),
('S-0000-0003'),
('S-0000-0004'),
('S-0000-0005'),
('S-0000-0006'),
('S-0000-0007'),
('S-0000-0008'),
('S-0000-0009'),
('S-0000-0010');