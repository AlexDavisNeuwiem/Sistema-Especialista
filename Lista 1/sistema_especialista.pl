% Base de dados de sintomas e categorias de doenças

% Base de dados de sintomas e categorias de doenças

categoria_da_doenca(asma, cronica).
categoria_da_doenca(asma, alergica). % Asma também pode ser considerada uma doença alérgica

categoria_da_doenca(dpoc, cronica).

categoria_da_doenca(bronquite, cronica).
categoria_da_doenca(bronquite, aguda). % Bronquite pode ser aguda em alguns casos

categoria_da_doenca(pneumonia, bacteriana).
categoria_da_doenca(pneumonia, infecciosa). % Pneumonia pode ser bacteriana e infecciosa

categoria_da_doenca(gripe, viral).
categoria_da_doenca(gripe, contagiosa). % Gripe também é contagiosa

categoria_da_doenca(tuberculose, contagiosa).
categoria_da_doenca(tuberculose, infecciosa). % Tuberculose também é infecciosa

categoria_da_doenca(fibrose_pulmonar, genetica).

categoria_da_doenca(sinusite, bacteriana).

categoria_da_doenca(rinite_alergica, alergica).


% Base de sintomas associada às doenças (conforme exemplo anterior)
sintomas_da_doenca(asma, [tosse, dificuldade_para_respirar, muco_na_garganta]).
sintomas_da_doenca(dpoc, [tosse, dificuldade_para_respirar, muco_na_garganta, dor_no_peito]).
sintomas_da_doenca(bronquite, [tosse, muco_na_garganta, dificuldade_para_respirar]).
sintomas_da_doenca(pneumonia, [febre, tosse, dor_no_peito, dificuldade_para_respirar]).
sintomas_da_doenca(gripe, [febre, tosse, dor_de_garganta, congestao_nasal, secrecao_nasal]).
sintomas_da_doenca(tuberculose, [tosse, febre, dor_no_peito, dificuldade_para_respirar]).
sintomas_da_doenca(fibrose_pulmonar, [dificuldade_para_respirar, tosse, dor_no_peito]).
sintomas_da_doenca(sinusite, [congestao_nasal, secrecao_nasal, dor_de_garganta, dor_no_peito]).
sintomas_da_doenca(rinite_alergica, [congestao_nasal, secrecao_nasal, tosse]).

% Base de dados de tratamentos
tratamento_da_doenca(viral, [antiviral, anti_inflamatorio]).
tratamento_da_doenca(infecciosa, [antibiotico, anti_inflamatorio]).
tratamento_da_doenca(contagiosa, [antibiotico, antiviral]).
tratamento_da_doenca(alergica, [antialergico, descongestionante, anti_histaminico]).
tratamento_da_doenca(autoimune, [corticosteroide, anti_inflamatorio]).
tratamento_da_doenca(genetica, [tratamento_genetico]).
tratamento_da_doenca(bacteriana, [antibiotico, anti_inflamatorio]).
tratamento_da_doenca(cronica, [broncodilatador, corticosteroide]).
tratamento_da_doenca(aguda, [anti_inflamatorio, descongestionante]).
tratamento_da_doenca(_, [desconhecido]).

% Regra para buscar doenças com base nos sintomas
doenca_por_sintomas(Sintomas, Doenca) :-
    sintomas_da_doenca(Doenca, SintomasDoenca),
    subset(Sintomas, SintomasDoenca).

% Regra para buscar tratamentos com base nos sintomas
tratamento_por_sintomas(Sintomas, Tratamento) :-
    doenca_por_sintomas(Sintomas, Doenca),
    categoria_da_doenca(Doenca, Categoria),
    tratamento_da_doenca(Categoria, Tratamento).

% Função auxiliar para verificar se uma lista é subconjunto de outra
subset([], _).
subset([E|Tail], List) :- member(E, List), subset(Tail, List).
