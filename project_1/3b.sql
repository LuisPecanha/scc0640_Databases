/*
Luis Gustavo Peçanha 9806763
Acreditei que fosse para manter a proporção da maneira como está. O resultado obtido foi 0.04, ou seja 4%.
*/

SELECT q1.populacao_total,
       q1.votos_computados_para_presidencia,
       ROUND (q1.votos_computados_para_presidencia / q1.populacao_total, 2) AS proporcao
FROM
  (SELECT SUM (brcidades.populacao) AS populacao_total,
     (SELECT SUM (candmz_m2018.qt_votos_nominais) AS votos_computados_para_presidencia
      FROM candmz_m2018
      RIGHT JOIN brcidades ON (candmz_m2018.sg_uf = brcidades.uf)
      AND ((LOWER (candmz_m2018.nm_municipio)) = (LOWER (brcidades.municipio)))
      WHERE candmz_m2018.ds_cargo = 'Presidente'
        AND candmz_m2018.nr_turno = 1
        AND brcidades.uf = 'MA'
        AND brcidades.populacao > 100000
        AND brcidades.pcthomem > 48.4 )
   FROM brcidades
   WHERE brcidades.uf = 'MA') AS q1;