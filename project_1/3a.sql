/*
Luis Gustavo Peçanha 9806763
*/

SELECT SUM (candmz_m2018.qt_votos_nominais) AS votos_computados_para_presidencia
FROM candmz_m2018
RIGHT JOIN brcidades ON (candmz_m2018.sg_uf = brcidades.uf)
AND ((LOWER (candmz_m2018.nm_municipio)) = (LOWER (brcidades.municipio)))
WHERE candmz_m2018.ds_cargo = 'Presidente'
  AND candmz_m2018.nr_turno = 1
  AND brcidades.uf = 'MA'
  AND brcidades.populacao > 100000
  AND brcidades.pcthomem > 48.4;