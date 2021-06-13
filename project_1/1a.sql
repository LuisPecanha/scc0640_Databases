/*
Luis Gustavo Peçanha 9806763
*/

SELECT nm_candidato AS nome_do_candidato,
       sg_uf AS uf,
       SUM (qt_votos_nominais) AS quantidade_de_votos
FROM candmz_m2018
WHERE ds_cargo = 'Presidente'
  AND nr_turno = 1
GROUP BY nm_candidato,
         sg_uf
ORDER BY sg_uf ASC,
         quantidade_de_votos DESC;