/*
Luis Gustavo Peçanha 9806763
*/

CREATE TABLE votos_no_para AS
SELECT candmz_m2020.nm_municipio AS nome_do_municipio,
       candmz_m2020.nm_candidato AS nome_do_candidato,
       SUM (candmz_m2020.qt_votos_nominais) AS total_de_votos
FROM candmz_m2020
RIGHT JOIN brcidades ON (candmz_m2020.sg_uf = brcidades.uf)
AND ((LOWER (candmz_m2020.nm_municipio)) = (LOWER (brcidades.municipio)))
WHERE candmz_m2020.ds_cargo = 'Vereador'
  AND candmz_m2020.nr_turno = 1
  AND brcidades.uf = 'PA'
  AND brcidades.pctrural > 80
GROUP BY nome_do_municipio,
         nome_do_candidato
ORDER BY nome_do_municipio ASC,
         total_de_votos DESC;