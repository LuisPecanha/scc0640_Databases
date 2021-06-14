/*
Luis Gustavo Peçanha 9806763
*/

SELECT votos_no_para.nome_do_candidato,
       votos_no_para.nome_do_municipio,
       votos_no_para.total_de_votos
FROM votos_no_para,

  (SELECT nome_do_municipio,
          MAX (total_de_votos)
   FROM votos_no_para
   GROUP BY nome_do_municipio) AS q1
WHERE q1.nome_do_municipio = votos_no_para.nome_do_municipio
  AND q1.max = votos_no_para.total_de_votos
ORDER BY votos_no_para.nome_do_municipio ASC,
         votos_no_para.total_de_votos DESC;