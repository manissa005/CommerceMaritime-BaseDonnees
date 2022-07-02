/* Sélectionne les nations qui ont des relations 'neutres' avec les autres pays */
(
    select nom
    from nation N
        join relation R on N.id_nation = R.id_nation1
    where relation = 'neutre'
)
union
(
    select nom
    from nation N
        join relation R on N.id_nation = R.id_nation2
    where relation = 'neutre'
)