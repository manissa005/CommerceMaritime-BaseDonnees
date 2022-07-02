/* Sélectionne les navires qui ne font que des voyages continentales*/
select id_navire
from (effectue natural join navire) natural join voyage
where voyage.classe = 'continental';