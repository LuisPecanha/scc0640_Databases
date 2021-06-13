/*
Luis Gustavo Peçanha 9806763
*/

SELECT candmz_m2018.nm_candidato AS nome_do_candidato,
       SUM(candmz_m2018.qt_votos_nominais) AS total_de_votos_obtidos
FROM candmz_m2018
LEFT JOIN brestados ON candmz_m2018.sg_uf = brestados.uf
WHERE brestados.regiao = 'Sudeste'
  AND candmz_m2018.ds_cargo = 'Presidente'
  AND candmz_m2018.nr_turno = 1
GROUP BY candmz_m2018.nm_candidato
ORDER BY total_de_votos_obtidos DESC
LIMIT 5;