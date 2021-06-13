/*
Luis Gustavo Peçanha 9806763
*/

SELECT nm_candidato AS nome_do_candidato,
       nm_ue AS estado,
       nm_partido AS nome_do_partido,
       SUM (qt_votos_nominais) AS quantidade_de_votos
FROM candmz_m2018
WHERE ds_cargo = 'Senador'
  AND nr_turno = 1
GROUP BY nm_candidato,
         nm_ue,
         nm_partido
ORDER BY nm_ue ASC,
         quantidade_de_votos DESC;