/* Séléctionne les produits qui peuvent se périmer en premier*/
select nom, conservation from Produit where Produit.conservation = (select min(Produit.conservation) from Produit);