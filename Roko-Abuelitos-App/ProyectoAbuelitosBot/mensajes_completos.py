from ensurepip import version
import random
import requests
from deep_translator import GoogleTranslator

def sin_respuesta():
    respuesta = ["No entendí lo que dijiste",
                 "¿Podrías repetirlo? No entendí",
                 "¿Qué quieres decir?",
                 "Disculpa, no entendí eso"][random.randrange(4)]
    
    return respuesta

class preguntar_nombre:

    def respuesta_pg():
        nombre_bot = "Eli"

        respuesta = "Mi nombre es " + nombre_bot
            
        return respuesta
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["cual", "es", "tu", "nombre", "como", "te", "llamas", "quien", "eres"]

        return lista_palabras_reconocidas

    def palabras_necesarias():
        lista_palabras_necesarias = ["tu", "nombre", "te llamas", "quien eres"]

        return lista_palabras_necesarias

class reto_matematico:
    def reto_mat():
        operacion = random.randrange(1, 5)

        match operacion:
            case 1:
                num1 = random.randrange(1, 201)
                num2 = random.randrange(1, 201)
                resultado = num1 + num2
                tipo_operacion = "+"
            case 2:
                num1 = random.randrange(1, 201)
                num2 = random.randrange(1, 201)
                resultado = num1 - num2
                tipo_operacion = "-"
            case 3:
                num1 = random.randrange(1, 61)
                num2 = random.randrange(1, 61)
                resultado = num1 * num2
                tipo_operacion = "*"
            case 4:
                num1 = random.randrange(1, 61)
                num2 = random.randrange(1, 61)
                resultado = num1 / num2
                tipo_operacion = "÷"

        respuesta = "Muy bien, ¿Cuánto es " + str(num1) + " " + tipo_operacion + " " + str(num2) + "?"
        
        return respuesta, resultado
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["dime", "una", "operacion", "matematica", "dime", "un", "reto", "matematico", "dame"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["dime", "dame", "matematico", "matematica"]

        return lista_palabras_necesarias

    def mensaje_correcto_incorrecto():
        respuesta = "¡Muy bien!"

class respuesta_sentimiento_malo:
    def respuesta_sm():
        respuestas = ["Lamento escuchar eso",
                     "Parece que estás pasando un momento difícil. No estás solo",
                     "Siento mucho que te sientas así",
                     "El año tiene 365 días, no todos tienen que ser buenos, y si te ha ido mal un día, recuerda que tienes muchos para poder superar lo que te salió mal, muchos ánimos y fortaleza",
                     "Los malos momentos pasan, pero tu estado de ánimo es el que definirá que las cosas salgan bien"][random.randrange(5)]

        return respuestas

    def palabras_reconocidas():
        lista_palabras_reconocidas = ["me", "siento", "sentido","mal", "decaido", "triste"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["me", "siento", "sentido"]

        return lista_palabras_necesarias

class respuesta_sentimiento_bueno:
    def respuesta_sb():
        respuestas = ["Me alegra mucho escuchar eso",
                      "¡Que bien por ti!",
                      "Que gran noticia",
                      "Eso está muy bien",
                      "¡Felicidades!"][random.randrange(5)]

        return respuestas
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["me", "siento", "bien", "alegre", "contento", "he", "tuve", "tenido", "un", "una", "buena", "semana", "dia"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["bien", "alegre", "contento", "buena", "buen"]
        
        return lista_palabras_necesarias

class pregunta_edad:
    def respuesta_pe():
        respuesta = "Soy un robot. No tengo edad"

        return respuesta
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["cuantos", "años", "tienes", "dime", "tu", "edad"]

        return lista_palabras_reconocidas

    def palabras_necesarias():
        lista_palabras_necesarias = ["cuantos", "años", "dime", "edad"]

        return lista_palabras_necesarias

class pregunta_eanimo():
    def respuesta_pea():
        respuestas = ["Estoy muy bien",
                      "Me siento de maravilla",
                      "Me encuentro perfecto",
                      "Todo bien, gracias por preguntar",
                      "Estoy bien, no puedo quejarme",
                      "Estoy perfecto, ¿Cómo estás tú?"][random.randrange(6)]

        return respuestas
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["como", "estas", "bien", "todo"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["como", "estas"]

        return lista_palabras_necesarias

class contar_chiste:
    def respuesta_cc():
        peticion = requests.get("https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,racist,sexist&format=txt")
        
        respuesta = peticion.text
        respuesta = respuesta.replace("\n", " ")
        respuesta_traducida = GoogleTranslator(source = "english", target = "spanish").translate(respuesta)

        return respuesta_traducida
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["dime", "cuentame", "un", "chiste", "broma"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["cuentame", "dime", "chiste", "broma"]

        return lista_palabras_necesarias

class preguntar_clima:
    def respuesta_pc():
        peticion = requests.get("https://api.open-meteo.com/v1/forecast?latitude=25.64&longitude=-100.29&current_weather=true")
        
        peticion_json = peticion.json()

        temperatura_actual = "La temperatura actual es: " + str(peticion_json["current_weather"]["temperature"]) + "°C"      

        return temperatura_actual

    def palabras_reconocidas():
        lista_palabras_reconocidas = ["dime", "la temperatura", "actual", "cual", "es", "el", "clima", "dame", "el", "pronostico", "del", "tiempo"]

        return lista_palabras_reconocidas

    def palabras_necesarias():
        lista_palabras_necesarias = ["clima", "temperatura", "tiempo", "dime", "dame", "cual"]

class pasaje_biblico:
    def respuesta_pb():
        peticion = requests.get("https://labs.bible.org/api/?passage=random&type=json")

        peticion_json = peticion.json()

        libro = peticion_json[0]["bookname"]
        capitulo = peticion_json[0]["chapter"]
        versiculo = peticion_json[0]["verse"]
        texto = peticion_json[0]["text"]

        versiculo_completo = libro + " " + capitulo + ":" + versiculo + " " + texto

        versiculo_completo_traducido = GoogleTranslator(source = "english", target = "spanish").translate(versiculo_completo)

        return versiculo_completo_traducido
    
    def palabras_reconocidas():
        lista_palabras_reconocidas = ["dime", "un", "pasaje", "de", "la", "biblia", "dame", "cuentame", "un", "versiculo"]

        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["dime", "cuentame", "dame", "biblia"]
        
        return lista_palabras_necesarias

class recomensar_lugares:
    def respuesta_rc():
        peticion = requests.get("https://api.geoapify.com/v2/places?categories=leisure.playground&filter=circle:-100.28978408313742,25.65043804468256,1000&bias=proximity:-100.28978408313742,25.65043804468256&limit=20&apiKey=6848b4c120a64bc1ac18a58fcb46b89e")

        peticion_json = peticion.json()

        direccion = peticion_json["features"][0]["properties"]["formatted"]

        return("Te recomiendo ir a este parque que queda en la dirección: " + direccion + ". Está a menos de 1 Km.")

    def palabras_reconocidas():
        lista_palabras_reconocidas = ["recomiendame", "dime", "un" "lugar", "para", "visitar", "ir"]
        
        return lista_palabras_reconocidas
    
    def palabras_necesarias():
        lista_palabras_necesarias = ["recomiendame", "dime", "lugar", "visitar", "ir"]

        return lista_palabras_necesarias

