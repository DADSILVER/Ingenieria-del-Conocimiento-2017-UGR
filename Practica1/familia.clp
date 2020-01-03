;##############################################################################;
; David Castro Salazar
;	Practica 1
;	Ejecicio Familia
;##############################################################################;

(deftemplate persona
	(field Nombre)
	(field Sexo)
	(multifield Hijo-De)
	(multifield Matrimonio-Con)
)

(deffacts familia
		;Mi familia
		(persona
			(Nombre David)
			(Sexo hombre)
			(Hijo-De Francisco Eugenia)
		)
		(persona
			(Nombre Pablo)
			(Sexo hombre)
			(Hijo-De Francisco Eugenia)
		)
		(persona
			(Nombre Francisco)
			(Sexo hombre)
			(Hijo-De Paco Maruja)
			(Matrimonio-Con Eugenia Francisco)
		)
		(persona
			(Nombre Eugenia)
			(Sexo mujer)
			(Hijo-De Manolo Fina)
			(Matrimonio-Con Francisco Eugenia)
		)
		;Familia tito Jose
		(persona
			(Nombre Alvaro)
			(Sexo hombre)
			(Hijo-De Jose Paz)
		)
		(persona
			(Nombre Lucia)
			(Sexo mujer)
			(Hijo-De Jose Paz)
		)
		(persona
			(Nombre Jose)
			(Sexo hombre)
			(Hijo-De Manolo Fina)
			(Matrimonio-Con Paz Jose)
		)
		(persona
			(Nombre Paz)
			(Sexo mujer)
			(Matrimonio-Con Jose Paz)
		)
		;Abuelos Madre
		(persona
			(Nombre Manolo)
			(Sexo hombre)
			(Matrimonio-Con Fina Manolo)
		)
		(persona
			(Nombre Fina)
			(Sexo mujer)
			(Matrimonio-Con Manolo Fina)
		)
		;Tita Esther
		(persona
			(Nombre Esther)
			(Sexo mujer)
			(Hijo-De Manolo Fina)
		)

)


;###############################################################################
;Rules

	;Hijos
	;----------------------------------------------------------------------------;
	; Se busca el el Nombre1 sea hijo de Nombre2
(defrule Hijo-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De $? ?Nombre2 $?)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then (printout t crlf ?Nombre1 " es hijo de " ?Nombre2 crlf)
		else (printout t crlf ?Nombre1 " es hija de " ?Nombre2 crlf)
	)
)

;Padres
;----------------------------------------------------------------------------;
; Se busca que Nombre2 sea hijo de Nombre1
(defrule Padre-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De $? ?Nombre1 $?)
	)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then (printout t crlf ?Nombre1 " es padre de " ?Nombre2 crlf)
		else (printout t crlf ?Nombre1 " es madre de " ?Nombre2 crlf)
	)
)


;Hermano
;----------------------------------------------------------------------------;
; Se busca que Nombre1 y Nombre2 sean hijos de Prog1
(defrule Hermano-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De ?Prog1 $?)
	)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De ?Prog1 $?)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then (printout t crlf ?Nombre1 " es hermano de " ?Nombre2 " porque son hijos de " ?Prog1 crlf)
		else (printout t crlf ?Nombre1 " es hermana de " ?Nombre2 " porque son hijos de " ?Prog1 crlf)
	)
)


;Abuelos
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre2, y que prog sea hijo de Nombre1
(defrule Abuelo-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
	)
	;prog es el padre
	(persona
		(Nombre ?Nombre2)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Sexo ?sexo1)
		(Hijo-De $? ?Nombre1 $?)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then(if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es Abuelo de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?Nombre1 crlf)
				else (printout t crlf ?Nombre1 " es Abuelo de " ?Nombre2 " porque su Madre es " ?prog " y ella es hija de " ?Nombre1 crlf)
			)
		else (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es Abuela de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?Nombre1 crlf)
				else (printout t crlf ?Nombre1 " es Abuela de " ?Nombre2 " porque su Madre es " ?prog " y ella es hija de " ?Nombre1 crlf)
			)
	)
)

;Nietos
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre1, y que prog sea hijo de Nombre2
(defrule Nieta-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Sexo ?sexo1)
		(Hijo-De $? ?Nombre2 $?)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then(if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es nieto de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es nieto de " ?Nombre2 " porque su Madre es " ?prog " y ella es hija de " ?Nombre2 crlf)
			)
		else (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es nieta de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es nieta de " ?Nombre2 " porque su Madre es " ?prog " y ella es hija de " ?Nombre2 crlf)
			)
	)
)

;Titos
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre2, y que prog sea hijo de abuelo, al igual que nombre1
(defrule Tito-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Sexo ?sexo1)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De ?abuelo $?)
	)
	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es tito de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?abuelo " al igual que " ?Nombre1 crlf)
				else (printout t crlf ?Nombre1 " es tito de " ?Nombre2 " porque su madre es " ?prog " y ella es hija de " ?abuelo " al igual que " ?Nombre1  crlf)
			)
		else (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es tita de " ?Nombre2 " porque su padre es " ?prog " y el es hijo de " ?abuelo " al igual que " ?Nombre1 crlf)
				else (printout t crlf ?Nombre1 " es tita de " ?Nombre2 " porque su madre es " ?prog " y ella es hija de " ?abuelo " al igual que " ?Nombre1 crlf)
			)
	)
)

;Sobrinos
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre1, y que prog sea hijo de abuelo, al igual que nombre2

(defrule Sobrino-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Sexo ?sexo1)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De ?abuelo $?)
	)
	(test(neq ?Nombre2 ?Nombre1))
	=>
	(if (eq ?sexo hombre)
		then (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es Sobrino de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y el es hijo de " ?abuelo " al igual que " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es Sobrino de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y ella es hija de " ?abuelo " al igual que " ?Nombre2  crlf)
			)
		else (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es Sobrina de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y el es hijo de " ?abuelo " al igual que " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es Sobrina de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y ella es hija de " ?abuelo " al igual que " ?Nombre2  crlf)
			)
	)
)

;Primos
;----------------------------------------------------------------------------;
; Se busca al prog1 de Nombre2, y a prog2 de Nombre1, y que ambos prog sean hermanos

(defrule Primos-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Sexo ?sexo1)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?prog2)
		(Sexo ?sexo2)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De $? ?prog2 $?)
	)
	(test(neq ?Nombre2 ?Nombre1))
	=>
	(if (eq ?sexo hombre)
		then (if (eq ?sexo1 hombre)
				then (if (eq ?sexo2 hombre)
						then (printout t crlf ?Nombre1 " es Primo de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y el padre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						else (printout t crlf ?Nombre1 " es Primo de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y la madre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						)
				else (if (eq ?sexo2 hombre)
						then (printout t crlf ?Nombre1 " es Primo de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y el padre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						else (printout t crlf ?Nombre1 " es Primo de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y la madre de " ?Nombre2 " es " ?prog2 " y ambos son hijas de " ?abuelo   crlf)
						)
				)
		else (if (eq ?sexo1 hombre)
				then (if (eq ?sexo2 hombre)
						then (printout t crlf ?Nombre1 " es Prima de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y el padre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						else (printout t crlf ?Nombre1 " es Prima de " ?Nombre2 " porque el padre de " ?Nombre1 " es " ?prog " y la madre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						)
				else (if (eq ?sexo2 hombre)
						then (printout t crlf ?Nombre1 " es Prima de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y el padre de " ?Nombre2 " es " ?prog2 " y ambos son hijos de " ?abuelo   crlf)
						else (printout t crlf ?Nombre1 " es Prima de " ?Nombre2 " porque la madre de " ?Nombre1 " es " ?prog " y la madre de " ?Nombre2 " es " ?prog2 " y ambos son hijas de " ?abuelo   crlf)
						)
				)
		)
)


;Tito Politico
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre2, y la pareja de Nombre1, y que prog y pareja sean hermanos

(defrule Tito-Politico-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre2)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Matrimonio-Con ?pareja $?)
	)
	(persona
		(Nombre ?pareja)
		(Sexo ?sexo1)
		(Hijo-De ?abuelo $?)
	)

	(test(neq ?Nombre1 ?Nombre2))
	=>
	(if (eq ?sexo hombre)
		then (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es tito politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hijo es " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es tito politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hijo es " ?Nombre2 crlf)
			)
		else (if (eq ?sexo1 hombre)
				then (printout t crlf ?Nombre1 " es tita politica de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hijo es " ?Nombre2 crlf)
				else (printout t crlf ?Nombre1 " es tita politica de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hijo es " ?Nombre2 crlf)
			)
	)
)

;Sobrino Politico
;----------------------------------------------------------------------------;
; Se busca el prog de Nombre1, y la pareja de Nombre2, y que prog y pareja sean hermanos


(defrule Sobrino-Politico-De
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(persona
		(Nombre ?Nombre1)
		(Sexo ?sexo)
		(Hijo-De $? ?prog $?)
	)
	(persona
		(Nombre ?prog)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?pareja)
		(Sexo ?sexo2)
		(Hijo-De ?abuelo $?)
	)
	(persona
		(Nombre ?Nombre2)
		(Sexo ?sexo1)
		(Matrimonio-Con ?pareja $?)
	)

	(test(neq ?Nombre2 ?Nombre1))
	=>
	(if (eq ?sexo hombre)
		then (if (eq ?sexo1 hombre)
				then (if (eq ?sexo2 hombre)
					then (printout t crlf ?Nombre1 " es sobrino politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hijo es " ?Nombre2 crlf)
					else (printout t crlf ?Nombre1 " es sobrino politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hijo es " ?Nombre2 crlf)
						)
				else (if (eq ?sexo2 hombre)
					then (printout t crlf ?Nombre1 " es sobrino politico de " ?Nombre2 " porque esta casada con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hijo es " ?Nombre2 crlf)
					else (printout t crlf ?Nombre1 " es sobrino politico de " ?Nombre2 " porque esta casada con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hijo es " ?Nombre2 crlf)
						)
				)
		else (if (eq ?sexo1 hombre)
				then (if (eq ?sexo2 hombre)
					then (printout t crlf ?Nombre1 " es sobrina politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hija es " ?Nombre2 crlf)
					else (printout t crlf ?Nombre1 " es sobrina politico de " ?Nombre2 " porque esta casado con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hija es " ?Nombre2 crlf)
						)
				else (if (eq ?sexo2 hombre)
					then (printout t crlf ?Nombre1 " es sobrina politico de " ?Nombre2 " porque esta casada con " ?pareja " Y " ?pareja " Es hermano de " ?prog " y su hija es " ?Nombre2 crlf)
					else (printout t crlf ?Nombre1 " es sobrina politico de " ?Nombre2 " porque esta casada con " ?pareja " Y " ?pareja " Es hermana de " ?prog " y su hija es " ?Nombre2 crlf)
						)
				)
		)
)


(defrule Mismo-Nombre
	(buscar_realaciones ?Nombre1 ?Nombre2)
	(test(eq ?Nombre2 ?Nombre1))
	=>
	(printout t crlf "Has puesto " ?Nombre1 " dos veces."crlf)
)

;###############################################################################

(defrule lectura
	=>
	(printout t crlf "Introduce el primer nombre: ")
	(bind ?Nombre1 (read))
	(printout t crlf "Introduce el segundo nombre: ")
	(bind ?Nombre2 (read))
	(assert (buscar_realaciones ?Nombre1 ?Nombre2))
)
