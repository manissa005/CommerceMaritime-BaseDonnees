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