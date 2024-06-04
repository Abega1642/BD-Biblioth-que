drop database if exists gestion_bibliotheque;

create database gestion_bibliotheque;

\c gestion_bibliotheque;

create table book (
    id_book varchar(255) primary key,
    title varchar(150) not null,
    number_of_pages int not null,
    release_date date not null,
    printing_house varchar(200),
    "language" varchar(100),
    "status"varchar(1)
);
create table edition (
    id_edition varchar(100) primary key,
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
    id_section varchar(200) primary key
);


create table written_by (
    id_author varchar(150),
    id_book varchar(255),
    foreign key(id_author) references author(id_author),
    foreign key(id_book) references book(id_book)
);
create table belong (
    id_book varchar(255),
    id_genre varchar(150),
    foreign key (id_book) references book (id_book),
    foreign key (id_genre) references genre (id_genre)
);
create table borrow (
    id_book varchar(255),
    id_member varchar(150),
    "start_date" date not null,
    end_date date not null,
    foreign key(id_book) references book(id_book),
    foreign key(id_member) references member(id_member)
);

INSERT INTO book VALUES
('a', 'To Kill a Mockingbird', 336, '1960-07-11', 'Harper Perennial Modern Classics', 'English', 'Y'),
('b', '1984', 328, '1949-06-08', 'Signet Classic', 'English', 'Y'),
('c', 'The Great Gatsby', 180, '1925-04-10', 'Scribner', 'English', 'Y'),
('d', 'The Catcher in the Rye', 277, '1951-07-16', 'Back Bay Books', 'English', 'Y'),
('e', 'Pride and Prejudice', 279, '1813-01-28', 'Penguin Classics', 'English', 'Y'),
('f', 'To the Lighthouse', 209, '1927-05-05', 'Harvest Books', 'English', 'Y'),
('g', 'Moby-Dick', 720, '1851-10-18', 'Penguin Classics', 'English', 'Y'),
('h', 'Ulysses', 732, '1922-02-02', 'Vintage', 'English', 'Y'),
('i', 'The Sound and the Fury', 326, '1929-10-07', 'Vintage', 'English', 'Y'),
('j', 'The Picture of Dorian Gray', 253, '1890-07-20', 'Dover Publications', 'English', 'Y');

insert into author values
('a', 'George', 'hey', '1990-08-15', 'Malagasy'),
('b', 'Georgee', 'hey', '1990-08-15', 'Malagasy'),
('c', 'Georgeee', 'hey', '1990-08-15', 'Malagasy');
insert into written_by values
('a', 'a'),
('b','b');

select * from author where not exists
(select * from written_by where author.id_author = written_by.id_author);

select * from book where

