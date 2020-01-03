;##############################################################################;
; David Castro Salazar
;	Practica 1
;	Ejecicio1
;##############################################################################;

;Aqui estan todas la opciones del 1-6
(deffacts Opciones
	(Opcion 1)
	(Opcion 2)
	(Opcion 3)
	(Opcion 4)
	(Opcion 5)
	(Opcion 6)
	(volver empezar_de_nuevo)
)

;###############################################################################
;Opcion elegida
;Se escoge la opcion y se muestra la opcion que se ha escogido

(defrule Opcion-Escogida
	(escoge_opcion ?Opcion)
	(Opcion ?Opcion)
	?v <- (volver empezar_de_nuevo) ;Para que volver ver a empezar no se ejecute reppetidas veces
	=>
	(printout t crlf "Se ha escogido la opcion " ?Opcion crlf)
	(retract ?v)
)

;###############################################################################
;Volver a empezar
;Si la opcion escogida no existe se vuelve a mandar a lectura para introducir otra opcion

(defrule Volver-Empezar
	?e <- (escoge_opcion ?Opcion) ;esta opcion no vale
	(Opcion ~?Opcion)
	?v <- (volver empezar_de_nuevo) ;Para que volver ver a empezar no se ejecute reppetidas veces
	=>
	(retract ?e)
	(retract ?v)
	(printout t crlf "Esa opcion no es valida, intentalo otra vez." crlf)
	(assert (volver empezar_de_nuevo))
)

;###############################################################################
;Lectura

(defrule lectura
	(volver empezar_de_nuevo)
	=>
	(printout t crlf "Opcion 1")
	(printout t crlf "Opcion 2")
	(printout t crlf "Opcion 3")
	(printout t crlf "Opcion 4")
	(printout t crlf "Opcion 5")
	(printout t crlf "Opcion 6" crlf)
	(printout t crlf "Introduce Una de las opciones: ")
	(bind ?Opcion (read))

	(assert (escoge_opcion ?Opcion))
)
