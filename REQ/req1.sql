/* Sélectionne toutes les nations qui ont au moins deux navires */
select nom,
    count(id_navire)
from nation
    natural join navire
group by nom
having count(id_navire) >= 2;