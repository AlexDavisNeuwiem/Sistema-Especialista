;; DISCIPLINA:
;;	- Inteligência Artificial (INE5430)

;; ALUNOS:
;;	- Alex Davis Neuwiem da Silva (21202103)
;;	- Luan Diniz Moraes (21204000)
;;	- Pedro Nack Martins (21200081)

;; PROFESSORA:
;;	- Jerusa Marchi

;; DOMÍNIOS MODELADOS:
;;	- Sintomas das doenças respiratórias mais comuns
;;	- Tratamentos para as doenças apresentadas


(defclass Doenca (is-a USER)
  (slot nome))

(defclass Sintoma (is-a USER)
  (slot descricao))

(defclass Tratamento (is-a USER)
  (slot descricao))

;; Inicializando doenças, sintomas e tratamentos
(defrule inicializar-dados
   =>
   ;; Doenças
   (assert (Doenca (nome "Asma")))
   (assert (Doenca (nome "Enfisema Pulmonar")))
   (assert (Doenca (nome "Bronquite")))
   (assert (Doenca (nome "Pneumonia")))
   (assert (Doenca (nome "Gripe (Influenza)")))
   (assert (Doenca (nome "Tuberculose")))
   (assert (Doenca (nome "Fibrose Pulmonar")))
   (assert (Doenca (nome "Sinusite")))
   (assert (Doenca (nome "Rinite")))
   
   ;; Sintomas
   (assert (Sintoma (descricao "Tosse")))
   (assert (Sintoma (descricao "Febre")))
   (assert (Sintoma (descricao "Presença de Muco")))
   (assert (Sintoma (descricao "Dor de garganta")))
   (assert (Sintoma (descricao "Dor/Aperto no peito")))
   (assert (Sintoma (descricao "Dificuldade para respirar")))
   (assert (Sintoma (descricao "Chiado ao respirar")))
   (assert (Sintoma (descricao "Cansaço")))
   (assert (Sintoma (descricao "Perda de Peso")))
   
   ;; Tratamentos
   (assert (Tratamento (descricao "Antibiótico")))
   (assert (Tratamento (descricao "Antialérgico")))
   (assert (Tratamento (descricao "Anti-inflamatório")))
   (assert (Tratamento (descricao "Broncodilatador")))
   (assert (Tratamento (descricao "Corticosteróide")))
   (assert (Tratamento (descricao "Antiviral")))
   (assert (Tratamento (descricao "Descongestionante")))
   (assert (Tratamento (descricao "Anti-histaminico"))))

;; Base de sintomas associada às doenças
(defrule associar-sintomas-asma
   (Doenca (nome "Asma"))
   =>
   (assert (sintomas_da_doenca "Asma" (list "Tosse" "Dor/Aperto no peito" "Dificuldade para respirar" "Chiado ao respirar"))))

(defrule associar-sintomas-enfisema
   (Doenca (nome "Enfisema Pulmonar"))
   =>
   (assert (sintomas_da_doenca "Enfisema Pulmonar" (list "Tosse" "Presença de Muco" "Dor/Aperto no peito" "Dificuldade para respirar" "Chiado ao respirar" "Cansaço" "Perda de Peso"))))

(defrule associar-sintomas-bronquite
   (Doenca (nome "Bronquite"))
   =>
   (assert (sintomas_da_doenca "Bronquite" (list "Tosse" "Febre" "Presença de Muco" "Dor/Aperto no peito" "Chiado ao respirar"))))

(defrule associar-sintomas-pneumonia
   (Doenca (nome "Pneumonia"))
   =>
   (assert (sintomas_da_doenca "Pneumonia" (list "Tosse" "Febre" "Presença de Muco" "Dor/Aperto no peito"))))

(defrule associar-sintomas-gripe
   (Doenca (nome "Gripe (Influenza)"))
   =>
   (assert (sintomas_da_doenca "Gripe (Influenza)" (list "Tosse" "Febre" "Presença de Muco" "Dor de garganta" "Cansaço"))))

(defrule associar-sintomas-tuberculose
   (Doenca (nome "Tuberculose"))
   =>
   (assert (sintomas_da_doenca "Tuberculose" (list "Tosse" "Febre" "Presença de Muco" "Dor/Aperto no peito" "Cansaço" "Perda de Peso"))))

(defrule associar-sintomas-fibrose
   (Doenca (nome "Fibrose Pulmonar"))
   =>
   (assert (sintomas_da_doenca "Fibrose Pulmonar" (list "Tosse" "Dificuldade para respirar" "Perda de Peso"))))

(defrule associar-sintomas-sinusite
   (Doenca (nome "Sinusite"))
   =>
   (assert (sintomas_da_doenca "Sinusite" (list "Tosse" "Febre" "Presença de Muco" "Dificuldade para respirar" "Cansaço"))))

(defrule associar-sintomas-rinite
   (Doenca (nome "Rinite"))
   =>
   (assert (sintomas_da_doenca "Rinite" (list "Tosse" "Presença de Muco" "Dor de garganta" "Cansaço"))))

;; Base de tratamentos associada às doenças
(defrule associar-tratamentos-asma
   (Doenca (nome "Asma"))
   =>
   (assert (tratamento_da_doenca "Asma" (list "Anti-inflamatório" "Broncodilatador" "Corticosteróide"))))

(defrule associar-tratamentos-enfisema
   (Doenca (nome "Enfisema Pulmonar"))
   =>
   (assert (tratamento_da_doenca "Enfisema Pulmonar" (list "Broncodilatador" "Corticosteróide"))))

(defrule associar-tratamentos-bronquite
   (Doenca (nome "Bronquite"))
   =>
   (assert (tratamento_da_doenca "Bronquite" (list "Antibiótico" "Anti-inflamatório" "Broncodilatador" "Corticosteróide"))))

(defrule associar-tratamentos-pneumonia
   (Doenca (nome "Pneumonia"))
   =>
   (assert (tratamento_da_doenca "Pneumonia" (list "Antibiótico" "Broncodilatador" "Anti-histaminico"))))

(defrule associar-tratamentos-gripe
   (Doenca (nome "Gripe (Influenza)"))
   =>
   (assert (tratamento_da_doenca "Gripe (Influenza)" (list "Antiviral"))))

(defrule associar-tratamentos-tuberculose
   (Doenca (nome "Tuberculose"))
   =>
   (assert (tratamento_da_doenca "Tuberculose" (list "Antibiótico" "Broncodilatador"))))

(defrule associar-tratamentos-fibrose
   (Doenca (nome "Fibrose Pulmonar"))
   =>
   (assert (tratamento_da_doenca "Fibrose Pulmonar" (list "Anti-inflamatório"))))

(defrule associar-tratamentos-sinusite
   (Doenca (nome "Sinusite"))
   =>
   (assert (tratamento_da_doenca "Sinusite" (list "Antibiótico" "Antialérgico" "Anti-inflamatório" "Corticosteróide" "Anti-histaminico"))))

(defrule associar-tratamentos-rinite
   (Doenca (nome "Rinite"))
   =>
   (assert (tratamento_da_doenca "Rinite" (list "Antialérgico" "Descongestionante" "Anti-histaminico"))))

;; Função para coletar sintomas
(deffunction coletar-sintomas ()
   (printout t "Por favor, insira os sintomas do paciente, separados por vírgula:" crlf)
   (bind ?entrada (readline))
   (return (explode$ ?entrada ", ")))

;; Regra principal que coleta os sintomas do paciente
(defrule perguntar-sintomas
   (declare (salience 100))
   (not (sintomas-paciente ?))
   =>
   (bind ?sintomas (coletar-sintomas))
   (assert (sintomas-paciente ?sintomas))
   (printout t "Sintomas coletados: " ?sintomas crlf))

;; Regra para perguntar ao paciente se ele quer saber o diagnóstico ou o tratamento
(defrule perguntar-diagnostico-ou-tratamento
   (sintomas-paciente ?sintomas)
   (not (pergunta-diagnostico-ou-tratamento))
   =>
   (printout t "Você gostaria de saber o diagnóstico ou os tratamentos? (Digite 'diagnóstico' ou 'tratamento')" crlf)
   (bind ?resposta (readline))
   (assert (pergunta-diagnostico-ou-tratamento ?resposta)))

;; Regra para diagnóstico com base nos sintomas
(defrule diagnosticar-doenca
   (sintomas-paciente ?sintomas)
   (pergunta-diagnostico-ou-tratamento "diagnóstico")
   (sintomas_da_doenca ?doenca ?sintomasDoenca)
   (test (subset ?sintomas ?sintomasDoenca))
   =>
   (printout t "Baseado nos sintomas, a doença provável é: " ?doenca crlf))

;; Regra para tratamento com base nos sintomas
(defrule sugerir-tratamento
   (sintomas-paciente ?sintomas)
   (pergunta-diagnostico-ou-tratamento "tratamento")
   (sintomas_da_doenca ?doenca ?sintomasDoenca)
   (tratamento_da_doenca ?doenca ?tratamentos)
   (test (subset ?sintomas ?sintomasDoenca))
   =>
   (printout t "Baseado nos sintomas, os tratamentos recomendados para " ?doenca " são: " ?tratamentos crlf))

;; Função para coletar sintomas
(deffunction coletar-sintomas ()
   (printout t "Por favor, insira os sintomas do paciente, separados por vírgula:" crlf)
   (bind ?entrada (readline))
   (return (explode$ ?entrada ", ")))

;; Regra principal que coleta os sintomas do paciente
(defrule perguntar-sintomas
   (declare (salience 100))
   (not (sintomas-paciente ?))
   =>
   (bind ?sintomas (coletar-sintomas))
   (assert (sintomas-paciente ?sintomas))
   (printout t "Sintomas coletados: " ?sintomas crlf))

;; Regra para perguntar ao paciente se ele quer saber o diagnóstico ou o tratamento
(defrule perguntar-diagnostico-ou-tratamento
   (sintomas-paciente ?sintomas)
   (not (pergunta-diagnostico-ou-tratamento))
   =>
   (printout t "Você gostaria de saber o diagnóstico ou os tratamentos? (Digite 'diagnóstico' ou 'tratamento')" crlf)
   (bind ?resposta (readline))
   (assert (pergunta-diagnostico-ou-tratamento ?resposta)))

;; Regra para diagnóstico com base nos sintomas
(defrule diagnosticar-doenca
   (sintomas-paciente ?sintomas)
   (pergunta-diagnostico-ou-tratamento "diagnóstico")
   (sintomas_da_doenca ?doenca ?sintomasDoenca)
   (test (subset ?sintomas ?sintomasDoenca))
   =>
   (printout t "Baseado nos sintomas, a doença provável é: " ?doenca crlf))

;; Regra para sugerir tratamentos com base nos sintomas
(defrule sugerir-tratamento
   (sintomas-paciente ?sintomas)
   (pergunta-diagnostico-ou-tratamento "tratamento")
   (sintomas_da_doenca ?doenca ?sintomasDoenca)
   (test (subset ?sintomas ?sintomasDoenca))
   (tratamento_da_doenca ?doenca ?tratamentos)
   =>
   (printout t "Tratamentos recomendados para " ?doenca ": " ?tratamentos crlf))

;; Função auxiliar para verificar se uma lista é subconjunto de outra
(deffunction subset (?list1 ?list2)
   (if (subsetp ?list1 ?list2) then TRUE else FALSE))

