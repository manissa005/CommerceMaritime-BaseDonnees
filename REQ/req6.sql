/* Sélectionne les nations qui ont des ports de catégorie 5 */
select nation.nom
from port
    join nation on port.id_nation = nation.id_nation
where categorie = 5;