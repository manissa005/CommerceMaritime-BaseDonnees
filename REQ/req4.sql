/* Compte le nombre d'étape des voyages */
select id_voyage,
    count(nb_etape)
from voyage
    natural join etape
group by id_voyage;