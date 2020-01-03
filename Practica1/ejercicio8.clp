;##############################################################################;
; David Castro Salazar
;	Practica 1
;	Ejecicio8
;##############################################################################;

(deftemplate TipoAnimal
	(slot Nombre)
	(slot Estructura)
)

(deffacts Tipos
	(TipoAnimal
		(Nombre mamifero)
		(Estructura vertebrado)
	)
	(TipoAnimal
		(Nombre felino)
	)
)

;###############################################################################
;Ser igual
;Se guarda en una varia el animal2 que es el que vamos a modificar, copiamso la estructura
;del animal2, y usamos el modify para cambiar la estructura del animal2

(defrule Ser-Igual
	(Es_un ?animal1 ?animal2)
	?dato <- (TipoAnimal
							(Nombre ?animal2)
							(Estructura nil)
						)
	(TipoAnimal
		(Nombre ?animal1)
		(Estructura ?estructura)
	)
	=>
	(modify ?dato
			(Nombre ?animal2)
			(Estructura ?estructura)
	)
	(retract ?dato)

)

;###############################################################################
;Lectura

(defrule lectura
	=>
	(printout t crlf "Introduce un tipo de animal que vas a modificar: ")
	(bind ?animal2 (read))
	(printout t crlf "Introduce un tipo de animal que exista: ")
	(bind ?animal1 (read))

	(assert (Es_un ?animal1 ?animal2))
)
