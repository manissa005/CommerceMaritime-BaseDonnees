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