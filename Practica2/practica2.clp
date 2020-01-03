;##############################################################################;
; David Castro Salazar
;	Practica Final
;
;##############################################################################;


(deftemplate Dato
  (field Nombre)
  (field Tipo)
  (field Seleccionado)
)

(deftemplate Aspectos
  (field Organizacion)
  (field Zona)
  (field Uso)
)

(deftemplate licencia
	(field Nombre)
	(field Uso-patente)
	(field Copyletf)
	(field Libre)
  (field Compatibilidad-GNU)
)

(deffacts opciones

  (Aspectos
    (Organizacion vacio)
    (Zona vacio)
    (Uso vacio)
    )

	(Dato
		(Nombre Ideologia)
		(Tipo Protegidos)
		(Seleccionado no)
	)

	(Dato
		(Nombre Religion)
		(Tipo Protegidos)
		(Seleccionado no)
	)

	(Dato
		(Nombre Vida_sexual)
		(Tipo Protegidos)
		(Seleccionado no)
	)


	(Dato
		(Nombre Salud)
		(Tipo Protegidos)
		(Seleccionado no)
	)

	(Dato
		(Nombre DNI)
		(Tipo Identificativo)
		(Seleccionado no)
	)

	(Dato
		(Nombre Direccion)
		(Tipo Identificativo)
		(Seleccionado no)
	)

	(Dato
		(Nombre Nombre_Apellidos)
		(Tipo Identificativo)
		(Seleccionado no)
	)

	(Dato
		(Nombre Estado_Civil)
		(Tipo Personal)
		(Seleccionado no)
	)

	(Dato
		(Nombre Fecha_Nacimiento)
		(Tipo Personal)
		(Seleccionado no)
	)


	(Dato
		(Nombre Sexo)
		(Tipo Personal)
		(Seleccionado no)
	)

	(Dato
		(Nombre Nacionalidad)
		(Tipo Personal)
		(Seleccionado no)
	)

	(Dato
		(Nombre Situacion_Familiar)
		(Tipo Social)
		(Seleccionado no)
	)

	(Dato
		(Nombre Aficiones)
		(Tipo Social)
		(Seleccionado no)
	)

	(Dato
		(Nombre Permisos_Autorizaciones)
		(Tipo Social)
		(Seleccionado no)
	)

	(Dato
		(Nombre Formacion)
		(Tipo Profesionales)
		(Seleccionado no)
	)

	(Dato
		(Nombre Titulacion)
		(Tipo Profesionales)
		(Seleccionado no)
	)

	(Dato
		(Nombre Profesion)
		(Tipo Empleo)
		(Seleccionado no)
	)

	(Dato
		(Nombre Puesto_trabajo)
		(Tipo Empleo)
		(Seleccionado no)
	)

	(Dato
		(Nombre Ingresos)
		(Tipo Economicos)
		(Seleccionado no)
	)

	(Dato
		(Nombre Datos_Bancarios)
		(Tipo Economicos)
		(Seleccionado no)
	)



  (licencia
    (Nombre GPL-v3)
    (Uso-patente si)
    (Copyletf normal)
    (Libre si)
    (Compatibilidad-GNU si)
  )

  (licencia
    (Nombre LGPL-v3)
    (Uso-patente si)
    (Copyletf debil)
    (Libre si)
    (Compatibilidad-GNU si)
  )

  (licencia
    (Nombre AGPL-v3)
    (Uso-patente si)
    (Copyletf fuerte)
    (Libre si)
    (Compatibilidad-GNU si)
  )

  (licencia
    (Nombre Apache)
    (Uso-patente si)
    (Copyletf nada)
    (Libre si)
    (Compatibilidad-GNU si)
  )

  (licencia
    (Nombre MIT)
    (Uso-patente no)
    (Copyletf nada)
    (Libre si)
    (Compatibilidad-GNU si)
  )

  (licencia
    (Nombre BSD)
    (Uso-patente no)
    (Copyletf nada)
    (Libre no)
    (Compatibilidad-GNU no)
  )

  (licencia
    (Nombre IBM)
    (Uso-patente si)
    (Copyletf normal)
    (Libre si)
    (Compatibilidad-GNU no)
  )

	(opcion 1)
	(opcion 2)
	(opcion 3)
  (opcion 0)
	(volver empezar_de_nuevo)
)



;##############################################################################;
;MODULO 1
;##############################################################################;

(defrule Eleccion-software1
	(Eleccion-software1)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que la licencia sea libre?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (assert (Eleccion-software2))
   else (assert (Eleccion BSD))
  )
)

(defrule Eleccion-software5
	(Eleccion-software5)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que sea compatible con GNU?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion no)
	 then (assert (Eleccion-software6))
   else (assert (Eleccion IBM))
  )
	(retract Eleccion-software1)
)

(defrule Eleccion-software2
	(Eleccion-software2)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que tenga uso de patente?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (assert (Eleccion-software3))
   else (assert (Eleccion MIT))
  )
)

(defrule Eleccion-software3
	(Eleccion-software3)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que tenga copyleft?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (assert (Eleccion-software4))
   else (assert (Eleccion Apache))
  )
)

(defrule Eleccion-software4
	(Eleccion-software4)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que el copyleft sea fuerte?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion no)
	 then (assert (Eleccion-software5))
   else (assert (Eleccion APGL-v3))
  )
)

(defrule Eleccion-software6
	(Eleccion-software6)
	=>
  (printout t "Responde si/no" crlf)
  (printout t "¿Quieres que el copyleft sea debil?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion no)
	 then (assert (Eleccion GPL-v3))
   else (assert (Eleccion LPGL-v3))
  )
)

(defrule Eleccion-licencia
	(Eleccion ?Nombre)
  (licencia
    (Nombre ?Nombre)
    (Uso-patente ?patente)
    (Copyletf ?copy)
    (Libre ?libre)
    (Compatibilidad-GNU ?compatibilidad)
  )
	=>
  (printout t crlf "La licencia que quiere es " ?Nombre ", esta licencia " ?patente
  "  tiene uso de patente, ademas su copyleft es " ?copy " , y " ?libre " es de sotfware
  libre, por ultimo " ?compatibilidad " tiene compatibilidad con GNU." crlf)
)


;##############################################################################;
;MODULO 2
;##############################################################################;


(defrule Compatibilidad-software1
	(Compatibilidad)
	=>
  (printout t crlf "Responde si/no" crlf)
  (printout t "¿Tiene compatibilidad con GNU la licencia 1?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion no)
	 then (printout t crlf "Las licencias no son compatibles" crlf)
   else (assert (Compatibilidad-software2))
  )
)


(defrule Compatibilidad-software2
	(Compatibilidad-software2)
	=>
  (printout t crlf "Responde si/no" crlf)
  (printout t "¿Tiene compatibilidad con GNU la licencia 2?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion no)
	 then (printout t crlf "Las licencias no son compatibles" crlf)
   else (assert (Compatibilidad-software3))
  )
)


(defrule Compatibilidad-software3
	(Compatibilidad-software3)
	=>
  (printout t crlf "Responde si/no" crlf)
  (printout t "¿Tiene copyleft la licencia 1?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (printout t crlf "Las licencias son compatibles" crlf)
   else (assert (Compatibilidad-software4))
  )
)


(defrule Compatibilidad-software4
	(Compatibilidad-software4)
	=>
  (printout t crlf "Responde si/no" crlf)
  (printout t "¿Tiene copyleft la licencia 2?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (printout t crlf "Las licencias no son compatibles" crlf)
   else (assert (Compatibilidad-software5))
  )
)


(defrule Compatibilidad-software5
	(Compatibilidad-software5)
	=>
  (printout t crlf "Responde si/no" crlf)
  (printout t "¿ Tiene uso de patente la licencia 1?" crlf)
  (bind ?opcion (read))
  (if (eq ?opcion si)
	 then (printout t crlf "Las licencias son compatibles" crlf)
   else (printout t crlf "Las licencias no son compatibles" crlf)
  )
)


;##############################################################################;
;MODULO 3
;##############################################################################;



(defrule Clasificar11
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Protegidos)
      (Seleccionado si)
   )
   =>
	 (printout t crlf " Datos protegidos:" crlf )
)

(defrule Clasificar12
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Protegidos)
      (Seleccionado si)
   )
   =>
	 (printout t ?nombre  crlf )
)


(defrule Clasificar21
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Identificativo)
      (Seleccionado si)
   )
   =>
	 (printout t crlf "Datos identificativos:" crlf )
)


(defrule Clasificar22
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Identificativo)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre  crlf )
)


(defrule Clasificar31
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Personal)
      (Seleccionado si)
   )
   =>
	 (printout t crlf "Datos personales:" crlf )
)


(defrule Clasificar32
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Personal)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre crlf )
)


(defrule Clasificar41
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Social)
      (Seleccionado si)
   )
   =>
	 (printout t  crlf "Datos sociales:" crlf )
)



(defrule Clasificar42
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Social)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre crlf )
)


(defrule Clasificar51
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Profesionales)
      (Seleccionado si)
   )
   =>
	 (printout t  crlf "Datos profesionales:" crlf )
)


(defrule Clasificar52
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Profesionales)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre  crlf )
)


(defrule Clasificar61
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Empleo)
      (Seleccionado si)
   )
   =>
	 (printout t  crlf "Datos de empleo:" crlf )
)


(defrule Clasificar62
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Empleo)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre crlf )
)


(defrule Clasificar71
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Economicos)
      (Seleccionado si)
   )
   =>
	 (printout t  crlf " Datos economicos:" crlf )
)



(defrule Clasificar72
   (clasificar1)
   (Dato
      (Nombre ?nombre)
      (Tipo Economicos)
      (Seleccionado si)
   )
   =>
	 (printout t  ?nombre crlf )
)


(defrule Clasificar-final
   (clasificar1)
   ?e <- (clasificar1)
   =>
	 (assert (solicitar-aspectos))
   (retract ?e)
)


(defrule Aspectos
   (solicitar-aspectos)

   ?Aspecto <- (Aspectos (Organizacion vacio))

   =>

   (printout t  crlf "¿Que tipo de organizacion usara los datos?" crlf )
   (bind ?Organizacion (read))
   (modify ?Aspecto (Organizacion ?Organizacion))
)


(defrule Aspectos2
   (solicitar-aspectos)

   ?Aspecto <- (Aspectos (Zona vacio))

   =>

   (printout t  crlf "¿En que zona geografica se van a almacenar los datos?" crlf )
   (bind ?zona (read))
   (modify ?Aspecto (Zona ?zona))
)



(defrule Aspectos3
   (solicitar-aspectos)

   ?Aspecto <- (Aspectos (Uso vacio))
   ?e <- (solicitar-aspectos)
   =>

   (printout t  crlf "¿Que Uso se le dara a los datos?" crlf )
   (bind ?uso (read))
   (modify ?Aspecto (Uso ?uso))
   (assert (solicitar-aspectos-final ?uso))
   (retract ?e)
)


(defrule Aspectos-final
   (solicitar-aspectos-final ?uso)
   (Aspectos
     (Organizacion ?org)
     (Zona ?zona)
     (Uso ?uso))

   =>

   (printout t  crlf "Organizacion: " ?org  )
   (printout t  crlf "Zona geografica: " ?zona )
   (printout t  crlf "Uso: " ?uso crlf )
   (assert (identificacion))
)



(defrule Identificacion
   (identificacion)
   ?e <- (identificacion)
   (Dato
      (Nombre DNI)
      (Seleccionado si)
   )
   =>
   (printout t crlf "Ya esta identificado con el DNI." crlf crlf crlf)
    (assert (lopd))
    (retract ?e)
)


(defrule Identificacion2
   (identificacion)
   ?e <- (identificacion)
   (Dato
      (Nombre ?nombre1)
      (Seleccionado si)
   )
   (Dato
      (Nombre ?nombre2)
      (Seleccionado si)
   )
   (Dato
      (Nombre ?nombre3)
      (Seleccionado si)
   )
   =>

   (if (and (eq ?nombre1 Nombre_Apellidos) (eq ?nombre2 Direccion) (or (eq ?nombre3 Aficiones) (eq ?nombre3 Fecha_Nacimiento) (eq ?nombre3 Salud)))
   then (printout t crlf "Ya esta identificado con " ?nombre1 ", " ?nombre2 " y " ?nombre3 "." crlf )
      then (printout t crlf "Ya esta identificado con " ?nombre1 ", " ?nombre2 " y " ?nombre3 "." crlf crlf crlf)
        (assert (lopd))
        (retract ?e)
     )

)


(defrule Identificacion3
   (identificacion)
   ?e <- (identificacion)
   =>
   (printout t crlf "Necesita mas datos para identificarse." crlf crlf crlf)
   (assert (lopd))
    (retract ?e)

)






;;;;; LOPD
    (defrule lopd_cumplimientos
      (lopd)

       =>
      (printout t "Para cumplir la LOPD debemos:" crlf)
      (printout t "Obligatorios:" crlf)
      (printout t "1.- Inscripcion de datos." crlf)
      (printout t "2.- Calidad de los datos" crlf)
      (printout t "3.- Deber de informacion" crlf)
      (printout t "4.- Consentimiento del afectado" crlf)
      (printout t "5.- Datos especialmente protegidos" crlf)
      (printout t "6.- Seguridad de los datos" crlf)
      (printout t "7.- Deber de secreto" crlf)
      (printout t "8.- cumplimiento de los derechos ARCO" crlf)
      (printout t "Opcionales: (debido a que no todas las empresas pueden encontrarse en esta situacion.)" crlf)
      (printout t "9.- Acceso a los datos por cuenta de terceros" crlf)
      (printout t "10.- Comunicacion de datos" crlf)
      (printout t "11.- Transferencia internacional de datos" crlf)

      (printout t "selecciona el numero de la opcion para tener mas informacion: (para salir pulsa 0)" crlf)
        (bind ?licencia1 (read))
         (printout t "" crlf)

         (if (not (= ?licencia1 0))
           then
             (refresh lopd_cumplimientos)
         )
         (if (= ?licencia1 1)
          then
        (printout t "Todos y cada uno de los ficheros existentes en una empresa deben estar inscritos en el Registro General de Protección de Datos para que sean públicos y estén accesibles para su consulta por cualquier interesado. Para ello, el empresario debe notificar la existencia de los ficheros a la Agencia Española de Protección de datos utilizando del formulario de notificaciones telemáticas a la AEPD (NOTA). Una vez que la Agencia ha comprobado que la notificación cumple con todos los requisitos resolverá positivamente su inscripción en el Registro y remitirá al empresario el correspondiente código de inscripción." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 2)
          then
        (printout t "En cumplimiento del principio de “calidad de los datos” regulado en el artículo 4 de la Lopd el empresario debe tratar los datos de carácter personal aplicando las siguientes reglas:" crlf)
        (printout t "Solamente podrá recoger los datos de carácter personal utilizando medios que no sean fraudulentos desleales o ilícitos." crlf)
        (printout t "Deberá recoger únicamente aquellos datos personales que sean adecuados, pertinentes y no excesivos en relación a la finalidad que persiga con su tratamiento." crlf)
        (printout t "Solamente utilizará los datos para  finalidades compatibles con la finalidad que originó su recogida." crlf)
        (printout t "Deberá mantener los datos exactos y actualizados de forma que respondan con veracidad a la situación actual del titular." crlf)
        (printout t "Deberá mantener los datos exactos y actualizados de forma que respondan con veracidad a la situación actual del titular." crlf)
        (printout t "Por ultimo, el empresario debe almacenar los datos personales de manera que el titular de los datos pueda ejercer su derecho de acceso cuando lo considere oportuno" crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 3)
          then
        (printout t "En cumplimiento del principio denominado “derecho de información en la recogida de los datos”, el empresario tiene el deber de informar al titular de los datos de modo expreso, preciso e inequívoco de todos los extremos regulados en el artículo 5 de la Lopd. El deber de información surge desde el mismo momento en que se recogen los datos, pero se cumple de diferente manera en función  de si los datos se obtienen directamente de su titular o si provienen de otras fuentes." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 4)
          then
 (printout t "En cumplimiento del principio denominado “consentimiento del afectado” regulado en el artículo 6 de la Lopd, el empresario solo podrá tratar los datos de carácter personal si dispone del consentimiento del titular de los datos salvo que el tratamiento este fundamentado en una de las excepciones legalmente previstas. Para cumplir con este principio, el empresario debe tener muy claro cuando necesita el consentimiento del afectado y cuando no lo necesita, y, en caso de necesitarlo deberá obtenerlo legalmente teniendo en cuenta que, para que sea valido el consentimiento, debe tratarse de una manifestación de voluntad libre, inequívoca, específica e informada." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 5)
          then
        (printout t "Si el empresario utiliza datos de carácter personal que revelen la ideología, afiliación sindical, religión y creencias o datos que hagan referencia al origen racial, a la salud y a la vida sexual debe tener en cuenta que se trata de datos especialmente protegidos que deben ser tratados con la máxima cautela. En relación al tratamiento de este tipo de datos, y teniendo en cuenta lo previsto en el artículo 7 de la Lopd, el empresario debe tener en cuenta los siguientes aspectos:" crlf)
        (printout t "El empresario no puede obligar al ciudadano a declarar sobre su ideología, religión o creencias y en caso de pedirle el consentimiento para tratar este tipo de datos debe advertirle acerca de su derecho a no prestarlo. " crlf)
        (printout t "El empresario solo podrá utilizar datos de carácter personal que revelen la ideología, afiliación sindical, religión y creencias si dispone del consentimiento expreso y por escrito del interesado." crlf)
        (printout t "El empresario solo podrá utilizar datos de carácter personal que hagan referencia al origen racial, a la salud y a la vida sexual si dispone del consentimiento expreso." crlf)
        (printout t "Los ficheros en los que se encuentren almacenados los datos de carácter personal deben estar protegidos con las medidas de seguridad correspondientes al nivel alto." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 6)
          then
        (printout t "En cumplimiento del principio de “seguridad de los datos” regulado en el artículo 9 de la Lopd, el empresario debe adoptar en su organización las medidas de índole técnica y organizativas necesarias que garanticen la seguridad de los datos de carácter personal y eviten su alteración, pérdida, tratamiento o acceso no autorizado, habida cuenta del estado de la tecnología, la naturaleza de los datos almacenados y los riesgos a que estén expuestos, ya provengan de la acción humana o del medio físico o natural. " crlf)
        (printout t "Para cumplir con este principio, el empresario debe aplicar lo dispuesto en el Titulo VIII del Reglamento que desarrolla la Lopd (Real Decreto 1720/2007) , elaborando el denominado “Documento de seguridad” e implantando las medidas que sean necesarias en función del nivel de seguridad que necesiten cada uno de sus ficheros (básico, medio o alto). A la hora de implantar las medidas de seguridad, el empresario debe tener en cuenta que debe proteger tanto los ficheros automatizados (gestionados a través de archivos y aplicaciones informáticas) como los ficheros no automatizados (documentos en formato papel gestionados manualmente), aplicando las medidas previstas en el Real Decreto 1720/2007 para cada tipo de ficheros." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 7)
          then
 (printout t "En cumplimiento del principio denominado “deber de secreto”, regulado en el articulo 10 de la Lopd, el empresario está obligado a guardar secreto profesional sobre los datos tratados y a mantener la confidencialidad de los mismos dentro de su organización, debiendo tener en cuenta que la ley extiende el deber de secreto a cualquier persona o entidad que intervenga en cualquiera de las fases del tratamiento aun después de finalizar sus relaciones con el titular del fichero o, en su caso, con el responsable del mismo." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 8)
          then
        (printout t "El empresario debe facilitar a los ciudadanos el ejercicio de  los denominados derechos Arco (acceso, rectificación, cancelación y oposición). Para ello, el empresario  debe  diseñar e implantar los procedimientos y formularios adecuados que por un lado faciliten al ciudadano solicitar el ejercicio de  sus derechos y por otro lado, permitan al  propio empresario contestar las solicitudes en los plazos legalmente establecidos. Además, el empresario debe formar a su personal para que sea capaz de atender al ciudadano  y prestarle la información necesaria sobre los pasos a seguir para el ejercicio de sus derechos." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 9)
          then
        (printout t "Cuando el empresario contrate a otra persona, empresa o entidad para que le preste algún tipo de servicio utilizando los datos de carácter personal almacenados en sus ficheros (servicios de contabilidad, elaboración de nóminas, envió de publicidad etc.) se produce una relación jurídica denominada “acceso a los datos por cuenta de terceros”   en la que quien  presta el servicio adquiere la condición de “encargado del tratamiento”  y se limita a tratar los datos por cuenta del responsable del fichero, siguiendo estrictamente sus instrucciones y  devolviendo o destruyendo los datos una vez haya finalizado el servicio contratado. " crlf)
        (printout t "Para cumplir con este principio regulado en el artículo 12 de la Lopd, el empresario debe formalizar la prestación del servicio en un contrato cuyo contenido y  características son las siguientes:" crlf)
        (printout t "Forma del contrato: Para que el contrato sea válido, deberá constar por escrito o en alguna otra forma que permita acreditar su celebración y contenido" crlf)
        (printout t "Tratamiento de los datos:  El encargado del tratamiento únicamente tratará los datos conforme a las instrucciones del responsable del tratamiento. " crlf)
        (printout t "Finalidad del tratamiento: En el contrato quedará reflejada la finalidad con la que se deben tratar los datos, y el encargado del tratamiento obligará a no utilizar los datos con otros fines. " crlf)
        (printout t "Comunicación de datos: El encargado del tratamiento no comunicará los datos, ni siquiera para su conservación, a otras personas." crlf)
        (printout t "Medidas de seguridad: En el contrato se estipularán, asimismo, las medidas de seguridad que el encargado del tratamiento está obligado a implementar." crlf)
        (printout t "Finalización del servicio: Una vez cumplida la prestación contractual, los datos de carácter personal deberán ser destruidos o devueltos al responsable del tratamiento, al igual que cualquier soporte o documentos en que conste algún dato de carácter personal objeto del tratamiento." crlf)
        (printout t "Consecuencias del incumplimiento del contrato: Si el encargado del tratamiento destina los datos a otra finalidad, los comunica o los utiliza incumpliendo las estipulaciones del contrato, será también considerado responsable del tratamiento, respondiendo de las infracciones en que hubiera incurrido personalmente." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 10)
          then
 (printout t "Cuando el empresario pretenda entregar los datos de carácter personal almacenados en sus fichero a otra persona, empresa o entidad para que los trate por su cuenta y bajo su propia responsabilidad debe hacerlo aplicando lo dispuesto en el artículo 11 de la Lopd, teniendo en cuenta que, de manera general,  “los datos de carácter personal objeto del tratamiento sólo podrán ser comunicados a un tercero para el cumplimiento de fines directamente relacionados con las funciones legítimas del cedente y del cesionario con el previo consentimiento del interesado”, salvo que la comunicación este fundamentada en alguna de las excepciones previstas en el artículo 11.2." crlf)
        (printout t "Para cumplir con este principio el empresario deberá aplicar las siguientes reglas:" crlf)
        (printout t "Solamente cederá los datos para el cumplimiento de fines directamente relacionados con las funciones legítimas del cedente y del cesionario." crlf)
        (printout t "Informará al titular de los datos de una manera expresa, precisa e inequívoca de la identidad y el tipo de actividad que desarrolla el destinatario de los datos así como de la finalidad a que destinarán los datos." crlf)
        (printout t "En los casos en que sea necesario el consentimiento del afectado, el empresario debe diseñar las cláusulas y los procedimientos que sean necesarios para obtener un consentimiento válido (manifestación de voluntad libre, inequívoca, específica e informada) y demostrar posteriormente que se ha cumplido con esta obligación." crlf)
        (printout t " " crlf)
      )
      (if (= ?licencia1 11)
          then
        (printout t "Cuando el empresario tenga la intención de transmitir los datos de carácter personal a paises que no formen parte del Espacio Económico Europeo (actualmente formado por los países de la Unión Europea, Islandia, Liechtenstein y Noruega) debe realizar dicha transferencia aplicando todas las garantías previstas en la normativa sobre protección de datos. Para determinar cuales son las obligaciones del empresario a la hora de realizar una transferencia internacional de datos es necesario analizar el caso de que se trata, sin embargo, de manera general y a titulo orientativo, se deben tener en cuenta, al menos, los siguientes aspectos:" crlf)
        (printout t "Notificación: Las transferencias Internacionales de datos deben ser notificadas a la Agencia Española de Protección de Datos para su inscripción en el Registro General de Protección de Datos. " crlf)
        (printout t "Autorización previa: La transmisión de datos fuera del Espacio Económico Europeo requiere de autorización previa del Director de la Agencia Española de Protección de Datos que sólo podrá otorgarla si se obtienen las garantías adecuadas. No será necesaria dicha autorización si la transferencia se realiza bajo alguna de las excepciones previstas en el artículo 34 de la Ley Orgánica de Protección de Datos." crlf)
        (printout t "Requisitos específicos para la comunicación o cesión de datos: Cuando la transferencia internacional de datos se realice con el objeto de entregar los datos a un tercero para que este los trate por su cuenta, además de los requisitos generales de notificación y autorización previa, será necesario aplicar las garantías previstas legalmente para la “cesión o comunicación de datos”. " crlf)
        (printout t "Requisitos específicos para el acceso a los datos por cuenta de terceros: Cuando la transferencia internacional de datos se realice para que un tercero preste un servicio al responsable del fichero (servicios de contabilidad, gestión de nóminas, atención al cliente, telemarketing etc.), además de los requisitos generales de notificación y autorización previa, será necesario aplicar lo legalmente previsto para el “acceso a los datos por cuenta de terceros”. " crlf)
        (printout t " " crlf)
      )
    )






(defrule SeleccionarDato
   (Seleccionar ?dato)

   ?Dato <- (Dato (Nombre ?dato)
                  (Seleccionado no))
   =>
   (modify ?Dato (Seleccionado si))

	 (assert (proteccion))
)



(defrule ImprimirDatos
   (proteccion)
   (Dato (Nombre ?nombre)
         (Seleccionado no)
   )
   =>
   (printout t ?nombre crlf)
)

(defrule Escoge-dato
   (proteccion)
	 ?v <- (proteccion)
   =>
   (printout t crlf "Ponga el nombre del dato que vaya a usar. Si quiere dejar de meter datos pulse 0" crlf )
	 (bind ?opcion (read))
	 (printout t crlf crlf )
	 (if (eq ?opcion 0)
	 	then (assert (clasificar1))
		else (assert (Seleccionar ?opcion))
	)


	 (retract ?v)
)








;##############################################################################;
;INICIO
;##############################################################################;


(defrule opcion-Escogida
	(escoge_opcion ?opcion)
	(opcion ?opcion)
	?v <- (volver empezar_de_nuevo) ;Para que volver ver a empezar no se ejecute reppetidas veces
	=>
	(if (eq ?opcion 1)
    then (assert (Eleccion-software1))
    else (if (eq ?opcion 2)
      then (assert (Compatibilidad))
      else (if (eq ?opcion 3)
			 then (assert (proteccion))
			 else (printout t crlf "Nos vemos."crlf)
			 )
    )
  )
	(retract ?v)
)

;###############################################################################
;Volver a empezar
;Si la opcion escogida no existe se vuelve a mandar a lectura para introducir otra opcion

(defrule Volver-Empezar
	?e <- (escoge_opcion ?opcion) ;esta opcion no vale
	(opcion ~?opcion)
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
  (printout t crlf "opcion 0: Salir")
	(printout t crlf "opcion 1: Eleccion de licencia de software")
	(printout t crlf "opcion 2: Compatibilidad de software a usar con respecto la licencia de mi software")
	(printout t crlf "opcion 3: Asesoramiento sobre ley de protección de datos"crlf)

	(printout t crlf "Introduce Una de las opciones: ")
	(bind ?opcion (read))

	(assert (escoge_opcion ?opcion))
)
