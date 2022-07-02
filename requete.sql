/* Sélectionne toutes les nations qui ont au moins deux navires */
select nom,
    count(id_navire)
from nation
    natural join navire
group by nom
having count(id_navire) >= 2;
/* Sélectionne les noms des ports dont les nations sont en guerre contre la nation d'indentifiant 5 */
select nom
from port
where id_nation = (
        select id_nation1
        from relation
        where id_nation2 = 5
            and relation = 'en guerre'
    )
    or id_nation = (
        select id_nation2
        from relation
        where id_nation1 = 5
            and relation = 'en guerre'
    );
/* Sélectionne le nom et la quantité maximale des produits de tous les voyages à l'étape 1 */
select nom,
    max(quantite)
from (
        produit
        natural join contient
    )
    natural join etape
where nb_etape = 1
group by nom;
/* Compte le nombre d'étape des voyages */
select id_voyage,
    count(nb_etape)
from voyage
    natural join etape
group by id_voyage;
/* Compte le nombre de personnes montantes sur des navires à l'étape 3 d'un voyage */
select id_navire,
    sum(personnes_montantes)
from (
        select id_navire,
            id_voyage
        from effectue
            natural join navire
    ) as test
    natural join etape
where nb_etape = 3
group by id_navire;
/* Sélectionne les nations qui ont des ports de catégorie 5 */
select nation.nom
from port
    join nation on port.id_nation = nation.id_nation
where categorie = 5;
/* Sélectionne les nations qui font un voyage intercontinentale */
select id_navire
from (
        navire
        natural join effectue
    )
    natural join voyage
where voyage.classe = 'intercontinental';
/* Compte le nombre de personnes descendantes pendant les étapes d'un voyage dans des ports à condition qu'il y ait plus de 20 personnes montantes */
select nom,
    sum(personnes_descentes)
from (
        etape
        left join port on etape.id_port = port.id_port
    )
group by nom,
    personnes_montantes
having personnes_montantes > 20;
/* Sélectionne les noms des produits qui ont une conservation > à 300 */
select distinct nom
from produit
where conservation > 300;
/* Sélectionne les nations qui ont des relations 'neutres' avec les autres pays */
(
    select nom
    from nation N
        join relation R on N.id_nation = R.id_nation1
    where relation = 'neutre'
)
union
(
    select nom
    from nation N
        join relation R on N.id_nation = R.id_nation2
    where relation = 'neutre'
)

/* Séléctionne les produits qui peuvent se périmer en premier*/
select nom,
    conservation
from Produit
where Produit.conservation = (
        min(Produit.conservation)
        from Produit
    );
/* Séléctionne le nombre de passagers qui sont monté au port de Tokyo*/
select sum(e.personnes_montantes)
from Effectue ef
    join Etape e on ef.id_voyage = e.id_voyage
    join Port p on e.id_port = p.id_port
where ef.provenance = 'Tokyo';
/* Sélectionne les navires qui ne font que des voyages continentales*/
select id_navire
from Navire nav
    join Voyage voy on voy.id_navire = nav.id_navire
where(
        not exists(
            select *
            from Voyage v
            where v.id_navire = voy.id_navire
                and v.classe = 'Inercontinentale'
        )
    );
/* Séléctionne les navires qui ne font que des voyages intercontinentale */
select id_navire
from Voyage voy
    join navire nav on voy.id_navire = nav.id_navire
where voy.id_navire not in (
        select v.id_navire
        from Voyage v
        where v.classe = 'Continentale'
    );
/* Sélectionne la moyenne des durées des voyages continantales et intercontinentales */
select classe,
    avg(duree)
from Voyage
group by classe;
/* Sélectionne le nombre de Gabare, Flute et Galion de chaque pays*/
select nat.nom,
    nav.type,
    count(*) as nombre_navire
from Navire nav,
    Nation nat
where nav.id_nation = nat.id_nation
group by nat.nom,
    nav.type;