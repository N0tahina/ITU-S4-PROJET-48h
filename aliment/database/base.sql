create database aliment;
use aliment;

create table user(
    id_user     int auto_increment primary key,
    nickname    varchar(20),
    email       varchar(100),
    pass_word   varchar(8),
    is_admin    int default 0
);

create table details(
    id          int auto_increment primary key,
    id_user     int,
    genre       int,
    age         int,
    taille      float,
    poids       float,
    foreign key (id_user) references user(id_user)
);

create table composant(
    id_composant    int auto_increment primary key,
    nom             varchar(20),
);

create table plat(
    id_plat     int auto_increment primary key,
    nom         varchar(20),
    prix        double precision,
    categorie   int
);

create table composition(
    id_composition  int auto_increment primary key,
    id_plat         int,
    id_composant    int,
    foreign key (id_plat) references user(id_plat),
    foreign key (id_composant) references composant(id_composant)
);

