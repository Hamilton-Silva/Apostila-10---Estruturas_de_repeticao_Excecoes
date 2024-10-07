DROP TABLE IF EXISTS matriz;

CREATE TABLE matriz (
    linha INTEGER,
    coluna INTEGER,
    valor INTEGER
);

-- Populando a matriz com valores aleatórios entre 1 e 12
INSERT INTO matriz (linha, coluna, valor)
SELECT i, j, floor(random() * 12 + 1)::int
FROM generate_series(1, 3) i,
     generate_series(1, 3) j;

SELECT 
    ( (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 1) * 
      (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 2) * 
      (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 3) +
      (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 2) * 
      (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 3) * 
      (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 1) +
      (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 3) * 
      (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 1) * 
      (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 2) ) 
    - ( (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 3) * 
        (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 2) * 
        (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 1) +
        (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 2) * 
        (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 1) * 
        (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 3) +
        (SELECT valor FROM matriz WHERE linha = 1 AND coluna = 1) * 
        (SELECT valor FROM matriz WHERE linha = 2 AND coluna = 3) * 
        (SELECT valor FROM matriz WHERE linha = 3 AND coluna = 2) ) 
    AS determinante;


