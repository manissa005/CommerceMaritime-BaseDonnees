\COPY nation FROM './CSV/nation.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY relation FROM './CSV/relation.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY port FROM './CSV/port.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY navire FROM './CSV/navire.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);

\COPY voyage FROM './CSV/voyage.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY voyage_c FROM './CSV/voyage_c.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY voyage_ml FROM './CSV/voyage_ml.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY effectue FROM './CSV/effectue.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);

\COPY produit FROM './CSV/produit.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY etape FROM './CSV/etape.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
\COPY contient FROM './CSV/contient.csv' WITH (DELIMITER ',', FORMAT csv, HEADER true);
