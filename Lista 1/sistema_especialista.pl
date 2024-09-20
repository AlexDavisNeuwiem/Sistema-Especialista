/*
DISCIPLINA:
    - Inteligência Artificial (INE5430)

ALUNOS:
    - Alex Davis Neuwiem da Silva (21202103)
    - Luan Diniz Moraes (21204000)
    - Pedro Nack Martins (21200081)

PROFESSORA:
    - Jerusa Marchi

DOMÍNIOS MODELADOS:
    - Sintomas das doenças respiratórias mais comuns
    - Tratamentos para as doenças apresentadas
*/

% Doenças
doenca('Asma').
doenca('Enfisema Pulmonar').
doenca('Bronquite').
doenca('Pneumonia').
doenca('Gripe (Influenza)').
doenca('Tuberculose').
doenca('Fibrose Pulmonar').
doenca('Sinusite').
doenca('Rinite').

% Sintomas
sintoma('Tosse').
sintoma('Febre').
sintoma('Presença de Muco').
sintoma('Dor de garganta').
sintoma('Dor/Aperto no peito').
sintoma('Dificuldade para respirar').
sintoma('Chiado ao respirar').
sintoma('Cansaço').
sintoma('Perda de Peso').

% Tratamentos
tratamento('Antibiótico').
tratamento('Antialérgico').
tratamento('Anti-inflamatório').
tratamento('Broncodilatador').
tratamento('Corticosteróide').
tratamento('Antiviral').
tratamento('Descongestionante').
tratamento('Anti-histaminico').

% Base de sintomas associada às doenças
sintomas_da_doenca('Asma', ['Tosse', 'Dor/Aperto no peito', 'Dificuldade para respirar', 'Chiado ao respirar']).
sintomas_da_doenca('Enfisema Pulmonar', ['Tosse', 'Presença de Muco', 'Dor/Aperto no peito', 'Dificuldade para respirar', 'Chiado ao respirar', 'Cansaço', 'Perda de Peso']).
sintomas_da_doenca('Bronquite', ['Tosse', 'Febre', 'Presença de Muco', 'Dor/Aperto no peito', 'Chiado ao respirar']).
sintomas_da_doenca('Pneumonia', ['Tosse', 'Febre', 'Presença de Muco', 'Dor/Aperto no peito']).
sintomas_da_doenca('Gripe (Influenza)', ['Tosse', 'Febre', 'Presença de Muco', 'Dor de garganta', 'Cansaço']).
sintomas_da_doenca('Tuberculose', ['Tosse', 'Febre', 'Presença de Muco', 'Dor/Aperto no peito', 'Cansaço', 'Perda de Peso']).
sintomas_da_doenca('Fibrose Pulmonar', ['Tosse', 'Dificuldade para respirar', 'Perda de Peso']).
sintomas_da_doenca('Sinusite', ['Tosse', 'Febre', 'Presença de Muco', 'Dificuldade para respirar', 'Cansaço']).
sintomas_da_doenca('Rinite', ['Tosse', 'Presença de Muco', 'Dor de garganta', 'Cansaço']).

% Base de dados de tratamentos
tratamento_da_doenca('Asma', ['Anti-inflamatório', 'Broncodilatador', 'Corticosteróide']).
tratamento_da_doenca('Enfisema Pulmonar', ['Broncodilatador', 'Corticosteróide']).
tratamento_da_doenca('Bronquite', ['Antibiótico', 'Anti-inflamatório', 'Broncodilatador', 'Corticosteróide']).
tratamento_da_doenca('Pneumonia', ['Antibiótico', 'Broncodilatador', 'Anti-histaminico']).
tratamento_da_doenca('Gripe (Influenza)', ['Antiviral']).
tratamento_da_doenca('Tuberculose', ['Antibiótico', 'Broncodilatador']).
tratamento_da_doenca('Fibrose Pulmonar', ['Anti-inflamatório']).
tratamento_da_doenca('Sinusite', ['Antibiótico', 'Antialérgico', 'Anti-inflamatório', 'Corticosteróide', 'Anti-histaminico']).
tratamento_da_doenca('Rinite', ['Antialérgico', 'Descongestionante', 'Anti-histaminico']).

% Regra para buscar doenças com base nos sintomas
doenca_por_sintomas(Sintomas, Doenca) :-
    sintomas_da_doenca(Doenca, SintomasDoenca),
    subset(Sintomas, SintomasDoenca).

% Regra para buscar tratamentos com base nos sintomas
tratamento_por_sintomas(Sintomas, Tratamento) :-
    doenca_por_sintomas(Sintomas, Doenca),
    tratamento_da_doenca(Doenca, Tratamento).
