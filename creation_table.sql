drop table if exists Nation cascade;
drop table if exists Relation cascade;
drop table if exists Port cascade;
drop table if exists Navire cascade;
drop table if exists Voyage cascade;
drop table if exists Voyage_C cascade;
drop table if exists Voyage_ML cascade;
drop table if exists Effectue cascade;
drop table if exists Produit cascade;
drop table if exists Contient cascade;
drop table if exists Etape cascade;
create table Nation (
    id_nation serial,
    nom text not null,
    primary key (id_nation)
);
create table Relation (
    id_nation1 integer not null,
    id_nation2 integer not null,
    relation text not null,
    check (
        relation = 'alliés'
        or relation = 'neutre'
        or relation = 'en guerre'
    ),
    primary key (id_nation1, id_nation2),
    foreign key (id_nation1) references nation(id_nation),
    foreign key (id_nation2) references nation(id_nation)
);
create table Port (
    id_port serial,
    id_nation integer not null,
    nom text not null,
    categorie integer not null,
    check (
        categorie BETWEEN 1 AND 5
    ),
    primary key (id_port),
    foreign key (id_nation) references nation(id_nation)
);
create table Navire (
    id_navire serial,
    id_nation integer not null,
    type text not null,
    categorie integer not null,
    marchandise_max integer not null,
    passagers_max integer not null,
    check (
        categorie BETWEEN 1 AND 5
    ),
    primary key (id_navire),
    foreign key (id_nation) references nation(id_nation)
);
create table Voyage (
    id_voyage serial,
    duree integer not null,
    /* qui depend de la distance */
    debut date not null,
    fin date not null,
    classe text not null,
    check (fin > debut),
    primary key (id_voyage)
);
create table Voyage_C (
    id_voyage integer not null,
    type_cargaison text not null,
    foreign key (id_voyage) references voyage(id_voyage),
    check (
        type_cargaison = 'seche'
        or type_cargaison = 'perissable'
    )
);
create table Voyage_ML (
    id_voyage integer not null,
    foreign key (id_voyage) references voyage(id_voyage)
);
create table Effectue (
    id_voyage integer not null,
    id_navire integer not null,
    provenance text not null,
    destination text not null,
    primary key (id_voyage, id_navire),
    foreign key (id_navire) references navire(id_navire),
    foreign key (id_voyage) references voyage(id_voyage)
);
create table Produit (
    id_produit serial,
    nom text not null,
    type text not null,
    /* (sec et perissable) */
    conservation integer not null,
    poids float not null,
    check (
        type = 'sec'
        or type = 'perissable'
    ),
    primary key (id_produit)
);
create table Etape (
    id_etape serial,
    nb_etape integer not null,
    id_voyage integer not null,
    id_port integer not null,
    personnes_montantes integer not null,
    personnes_descentes integer not null,
    primary key (id_etape),
    check (
        personnes_montantes >= 0
        and personnes_descentes >= 0
    ),
    foreign key (id_voyage) references voyage(id_voyage),
    foreign key (id_port) references port(id_port)
);
create table Contient (
    id_contient integer not null,
    id_etape integer not null,
    id_produit integer not null,
    quantite float,
    check (quantite >= 0),
    primary key (id_contient),
    foreign key (id_etape) references etape(id_etape),
    foreign key (id_produit) references produit(id_produit)
);