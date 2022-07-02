/* Sélectionne les nations qui font un voyage intercontinentale */
select id_navire
from (
        navire
        natural join effectue
    )
    natural join voyage
where voyage.classe = 'intercontinental';