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