/* Sélectionne la moyenne des durées des voyages continantales et intercontinentales */
select classe, avg(duree) from Voyage group by classe;