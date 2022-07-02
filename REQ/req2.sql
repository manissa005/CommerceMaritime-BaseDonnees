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