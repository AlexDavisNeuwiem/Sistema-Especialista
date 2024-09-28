; DISCIPLINA:
;  - Inteligência Artificial (INE5430)
;
; ALUNOS:
;  - Alex Davis Neuwiem da Silva (21202103)
;  - Luan Diniz Moraes (21204000)
;  - Pedro Nack Martins (21200081)
;
; PROFESSORA:
;  - Jerusa Marchi
;
; DOMÍNIOS MODELADOS:
;  - Doenças respiratórias mais comuns
;  - Sintomas das doenças apresentadas
;  - Tratamentos para as doenças apresentadas


; Doenças
(deftemplate Doenca
	(slot doenca))

; Tratamentos
(deftemplate Tratamento
	(slot tratamento))

; Sintomas
(deftemplate Sintoma
	(slot Tosse)
	(slot Febre)
	(slot Presenca_de_Muco)
	(slot Dor_de_Garganta)
	(slot Dor_ou_Aperto_no_Peito)
	(slot Dificuldade_para_Respirar)
	(slot Chiado_ao_Respirar)
	(slot Cansaco)
	(slot Perda_de_Peso))


; Regras para obter os sintomas do paciente
(defrule ObterSintomaTosse
	(declare (salience 9))
	=>
	(printout t crlf "Você anda tossindo ultimamente? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Tosse ?resposta))))

(defrule ObterSintomaFebre
	(declare (salience 9))
	=>
	(printout t crlf "Você está com febre? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Febre ?resposta))))

(defrule ObterSintomaPresencaDeMuco
	(declare (salience 9))
	=>
	(printout t crlf "Você tem presença de muco? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Presenca_de_Muco ?resposta))))

(defrule ObterSintomaDorDeGarganta
	(declare (salience 9))
	=>
	(printout t crlf "Você está com dor de garganta? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Dor_de_Garganta ?resposta))))

(defrule ObterSintomaDorOuApertoNoPeito
	(declare (salience 9))
	=>
	(printout t crlf "Você sente dor ou aperto no peito? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Dor_ou_Aperto_no_Peito ?resposta))))

(defrule ObterSintomaDificuldadeParaRespirar
	(declare (salience 9))
	=>
	(printout t crlf "Você tem dificuldade para respirar? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Dificuldade_para_Respirar ?resposta))))

(defrule ObterSintomaChiadoAoRespirar
	(declare (salience 9))
	=>
	(printout t crlf "Você percebe chiado ao respirar? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Chiado_ao_Respirar ?resposta))))

(defrule ObterSintomaCansaco
	(declare (salience 9))
	=>
	(printout t crlf "Você sente cansaço frequentemente? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Cansaco ?resposta))))

(defrule ObterSintomaPerdaDePeso
	(declare (salience 9))
	=>
	(printout t crlf "Você tem tido perda de peso? (yes/no)" crlf crlf)
	(bind ?resposta (read))
	(assert(Sintoma(Perda_de_Peso ?resposta))))


; Regras para descobrir a possível doença
(defrule Asma
	(or (Sintoma(Tosse yes))
	(Sintoma(Dor_ou_Aperto_no_Peito yes))
	(Sintoma(Dificuldade_para_Respirar yes))
	(Sintoma(Chiado_ao_Respirar yes)))
	=>
	(assert(Doenca(doenca asma)))
	(printout t crlf "Possível doença: Asma" crlf))

(defrule Enfisema_Pulmonar
	(or (Sintoma(Tosse yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_ou_Aperto_no_Peito yes))
	(Sintoma(Dificuldade_para_Respirar yes))
	(Sintoma(Chiado_ao_Respirar yes))
	(Sintoma(Cansaco yes))
	(Sintoma(Perda_de_Peso yes)))
	=>
	(assert(Doenca(doenca enfisema_pulmonar)))
	(printout t crlf "Possível doença: Enfisema Pulmonar" crlf))

(defrule Bronquite
	(or (Sintoma(Tosse yes))
	(Sintoma(Febre yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_ou_Aperto_no_Peito yes))
	(Sintoma(Chiado_ao_Respirar yes)))
	=>
	(assert(Doenca(doenca bronquite)))
	(printout t crlf "Possível doença: Bronquite" crlf))

(defrule Pneumonia
	(or (Sintoma(Tosse yes))
	(Sintoma(Febre yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_ou_Aperto_no_Peito yes)))
	=>
	(assert(Doenca(doenca pneumonia)))
	(printout t crlf "Possível doença: Pneumonia" crlf))

(defrule Gripe_Influenza
	(or (Sintoma(Tosse yes))
	(Sintoma(Febre yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_de_Garganta yes))
	(Sintoma(Cansaco yes)))
	=>
	(assert(Doenca(doenca gripe_influenza)))
	(printout t crlf "Possível doença: Gripe (Influenza)" crlf))

(defrule Tuberculose
	(or (Sintoma(Tosse yes))
	(Sintoma(Febre yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_ou_Aperto_no_Peito yes))
	(Sintoma(Cansaco yes))
	(Sintoma(Perda_de_Peso yes)))
	=>
	(assert(Doenca(doenca tuberculose)))
	(printout t crlf "Possível doença: Tuberculose" crlf))

(defrule Fibrose_Pulmonar
	(or (Sintoma(Tosse yes))
	(Sintoma(Dificuldade_para_Respirar yes))
	(Sintoma(Perda_de_Peso yes)))
	=>
	(assert(Doenca(doenca fibrose_pulmonar)))
	(printout t crlf "Possível doença: Fibrose Pulmonar" crlf))

(defrule Sinusite
	(or (Sintoma(Tosse yes))
	(Sintoma(Febre yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dificuldade_para_Respirar yes))
	(Sintoma(Cansaco yes)))
	=>
	(assert(Doenca(doenca sinusite)))
	(printout t crlf "Possível doença: Sinusite" crlf))

(defrule Rinite
	(or (Sintoma(Tosse yes))
	(Sintoma(Presenca_de_Muco yes))
	(Sintoma(Dor_de_Garganta yes))
	(Sintoma(Cansaco yes)))
	=>
	(assert(Doenca(doenca rinite)))
	(printout t crlf "Possível doença: Rinite" crlf))


; Regras para definir os tratamentos
(defrule Antibiotico
	(or (Doenca(doenca bronquite)) 
	(Doenca(doenca pneumonia)) 
	(Doenca(doenca tuberculose)) 
	(Doenca(doenca sinusite)))
	=>
	(assert(Tratamento(tratamento antibiotico)))
	(printout t "Tratamento: Antibiótico" crlf))

(defrule Antialergico
	(or (Doenca(doenca sinusite)) 
	(Doenca(doenca rinite)))
	=>
	(assert(Tratamento(tratamento antialergico)))
	(printout t "Tratamento: Antialérgico" crlf))

(defrule Anti_Inflamatorio
	(or (Doenca(doenca asma)) 
	(Doenca(doenca bronquite)) 
	(Doenca(doenca fibrose_pulmonar)) 
	(Doenca(doenca sinusite)))
	=>
	(assert(Tratamento(tratamento anti_inflamatorio)))
	(printout t "Tratamento: Anti-inflamatório" crlf))

(defrule Broncodilatador
	(or (Doenca(doenca asma)) 
	(Doenca(doenca enfisema_pulmonar)) 
	(Doenca(doenca bronquite)) 
	(Doenca(doenca pneumonia)) 
	(Doenca(doenca tuberculose)))
	=>
	(assert(Tratamento(tratamento broncodilatador)))
	(printout t "Tratamento: Broncodilatador" crlf))

(defrule Corticosteroide
	(or (Doenca(doenca asma)) 
	(Doenca(doenca enfisema_pulmonar)) 
	(Doenca(doenca bronquite)) 
	(Doenca(doenca sinusite)))
	=>
	(assert(Tratamento(tratamento corticosteroide)))
	(printout t "Tratamento: Corticosteróide" crlf))

(defrule Antiviral
	(Doenca(doenca gripe_influenza))
	=>
	(assert(Tratamento(tratamento antiviral)))
	(printout t "Tratamento: Antiviral" crlf))

(defrule Anti_Histaminico
	(or (Doenca(doenca pneumonia)) 
	(Doenca(doenca sinusite)) 
	(Doenca(doenca rinite)))
	=>
	(assert(Tratamento(tratamento anti_histaminico)))
	(printout t "Tratamento: Anti-histamínico" crlf))

(defrule Descongestionante
	(Doenca(doenca rinite))
	=>
	(assert(Tratamento(tratamento descongestionante)))
	(printout t "Tratamento: Descongestionante" crlf))


; Título
(defrule titulo
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "Sistema Especialista - Doenças Respiratórias")
	(printout t crlf))
