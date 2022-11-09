import re
import mensajes_completos

reto_matematico = False
resultado_reto_matematico = 0

def respuesta_bot(mensaje):

    global reto_matematico
    global resultado_reto_matematico

    if not reto_matematico:
        mensaje = re.split(r'\s+|[,;¿?¡!.-]\s*', mensaje.lower())
        respuesta = revisar_mensajes(mensaje)
    else:
        if mensaje == str(resultado_reto_matematico):
            reto_matematico = True
            resultado_reto_matematico = 0
            return("¡Bien hecho!")
        else:
            return("Esa no es la respuesta correcta, inténtalo de nuevo")
    return respuesta
    
def probabilidad_mensaje(mensaje, palabras_reconocidas, unica_respuesta = False, palabras_requeridas = []):
        acc_mensaje = 0
        requiere_palabras = True
        
        for palabra in mensaje:
            if palabra in palabras_reconocidas:
                acc_mensaje += 1
        
        porcentaje_acc_mensaje = float(acc_mensaje) / float(len(palabras_reconocidas))
        
        
        return int(porcentaje_acc_mensaje * 100)
        
def revisar_mensajes(mensaje):
    lista_probabilidades = {}

    global reto_matematico
    global resultado_reto_matematico
    
    def respuesta(b_respuesta, lista_palabras, unica_respuesta = False, palabras_requeridas = []):
        nonlocal lista_probabilidades
        lista_probabilidades[b_respuesta] = probabilidad_mensaje(mensaje, lista_palabras, unica_respuesta, palabras_requeridas)
    
    reto_mat = mensajes_completos.reto_matematico.reto_mat()
    reto_mat_string = reto_mat[0]
    resultado_reto_matematico = reto_mat[1]
    respuesta("Hola!", ["hola", "hey", "estas ahi", "oye", "eli"], unica_respuesta = True)
    respuesta(mensajes_completos.respuesta_sentimiento_malo.respuesta_sm(), mensajes_completos.respuesta_sentimiento_malo.palabras_reconocidas(), mensajes_completos.respuesta_sentimiento_malo.palabras_necesarias())
    respuesta(mensajes_completos.respuesta_sentimiento_bueno.respuesta_sb(), mensajes_completos.respuesta_sentimiento_bueno.palabras_reconocidas(), False, mensajes_completos.respuesta_sentimiento_bueno.palabras_necesarias())
    respuesta(mensajes_completos.preguntar_nombre.respuesta_pg(), mensajes_completos.preguntar_nombre.palabras_reconocidas(), mensajes_completos.preguntar_nombre.palabras_necesarias())
    respuesta(mensajes_completos.reto_matematico.reto_mat()[0], mensajes_completos.reto_matematico.palabras_reconocidas(), mensajes_completos.reto_matematico.palabras_necesarias())
    respuesta(mensajes_completos.pregunta_edad.respuesta_pe(), mensajes_completos.pregunta_edad.palabras_reconocidas(), False, mensajes_completos.pregunta_edad.palabras_necesarias())
    respuesta(mensajes_completos.pregunta_eanimo.respuesta_pea(), mensajes_completos.pregunta_eanimo.palabras_reconocidas(), False, mensajes_completos.pregunta_edad.palabras_necesarias())
    respuesta(mensajes_completos.preguntar_clima.respuesta_pc(), mensajes_completos.preguntar_clima.palabras_reconocidas(), False, mensajes_completos.preguntar_clima.palabras_necesarias())
    #respuesta(mensajes_completos.contar_chiste.respuesta_cc(), mensajes_completos.contar_chiste.palabras_reconocidas(), mensajes_completos.contar_chiste.palabras_necesarias())
    respuesta(mensajes_completos.pasaje_biblico.respuesta_pb(), mensajes_completos.pasaje_biblico.palabras_reconocidas(), False, mensajes_completos.pasaje_biblico.palabras_necesarias())
    respuesta(mensajes_completos.recomensar_lugares.respuesta_rc(), mensajes_completos.recomensar_lugares.palabras_reconocidas(), False, mensajes_completos.recomensar_lugares.palabras_necesarias())
    respuesta(reto_mat_string, mensajes_completos.reto_matematico.palabras_reconocidas(), False, mensajes_completos.reto_matematico.palabras_necesarias())

    mejor_match = max(lista_probabilidades, key = lista_probabilidades.get)

    if mejor_match == reto_mat_string and lista_probabilidades[mejor_match] > 1:
        reto_matematico = True
    
    return mensajes_completos.sin_respuesta() if lista_probabilidades[mejor_match] < 1 else mejor_match    
