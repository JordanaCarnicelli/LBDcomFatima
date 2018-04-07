-- 1. Uso do comando LIKE como forma de busca de informação em campos do tipo texto.
-- Enunciado: liste o id, o tipo, o titulo, data, hora do inicio, cpf e nome do palestrante
-- de todas as atividades que tenham 'tecnologia' como parte do tema.

select a.id_atividade, a.tipo_atividade, p.titulo_palestra, a.data_atividade, a.hora_inicio
from atividade as a
inner join palestrante as p on p.cpf = a.cpf_palestrante
where tema_palestra like '%tecnologia%';


-- 2. Uso de comandos de pertinência a conjuntos (IN ou ALL). 
-- Enunciado: liste o nome do participante, o modelo e a marca de sua barraca, desde que
-- o participante tenha como ocupação 'estudante' e tenha se inscrito com a categoria pagante com barraca.

select p.nome, b.modelo as modelo_barraca, b.marca as marca_barraca
from participante as p, barraca as b
where p.cpf = b.cpf and p.cpf in (
	select p.cpf
	from participante
	where ocupacao like '%estudante%') and p.cpf in (
	select cpf
	from efetua
	where id_inscricao in (
		select id_inscricao
		from inscricao
		where categoria like 'pagante com barraca'
	);


-- 3. Qual o custo médio pago pelos participantes em suas inscrições?
-- Faça uma consulta levando em consideração todos os participantes e depois os divida utilizando como
-- critério os que alugaram barraca e os que não e encontre os valores mínimo e máximo para cada grupo.

-- Custo médio das inscrições geral

select avg(custo)
from efetua;

select avg(custo), min(custo), max(custo)
from efetua as e
where e.cpf in (
	select p.cpf
	from participante as p
	inner join barraca as b on p.cpf = b.cpf
	);

select avg(custo) min(custo), max(custo)
from efetua as e
where e.cpf in (
	select p.cpf
	from participante as p
	left join barraca as b on p.cpf = b.cpf
	where b.cpf is null
	);


-- 4. Retorne o nome, a cidade de origem e a quantidade de pessoas transportadas da caravana que apresenta a
--    maior quantidade de ônibus utilizados para o evento.

select nome, cidade_origem, qtd_pessoas
from caravana
where id_caravana in 
	(SELECT id_caravana
		FROM
		 	(select	id_carava, count(distinct id_onibus) as count_onibus
		 	from onibus
		 	group by id_caravana
		 	order by count(distinct id_onibus) desc
		 	)
		limit 1
	)