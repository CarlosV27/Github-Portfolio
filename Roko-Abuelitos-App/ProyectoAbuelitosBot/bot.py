import respuestas
from gtts import gTTS
import pygame
from playsound import playsound
#import speech_recognition as sr
from sys import exit

#Texto a voz
def speak(mensaje):
    cadena = respuestas.respuesta_bot(mensaje)
    print("Bot: " + cadena)
    audio = gTTS(cadena, lang = "es", tld = "com.mx", slow = False)
    audio.save("audio1.mp3")
    playsound("C:/Users/carlo/Downloads/Bot-IEPAM-Funcionalidad/Bot-IEPAM-Funcionalidad/audio1.mp3")

#Parte visual del bot
pygame.init()

res_width = 1284 / 3
res_height = 2778 / 3

pantalla = pygame.display.set_mode((res_width, res_height))
reloj = pygame.time.Clock()

background = pygame.image.load("background.jpg").convert_alpha()
background = pygame.transform.scale(background, (res_width, res_height))

microphone = pygame.image.load("microphone.png").convert_alpha()
microphone = pygame.transform.scale(microphone, (150,150))
microphone_rect = microphone.get_rect(center = ((res_width / 2), (res_height / 1.15)))

bird = pygame.image.load("bird.png").convert_alpha()
bird = pygame.transform.scale(bird, (412 / 1.5, 606 / 1.5))
bird_rect = bird.get_rect(center = ((res_width / 2), (res_height / 3)))

font = pygame.font.Font("FredokaOne-Regular.ttf", 50)

text = font.render("Habla ahora...", False, "Black")
text_rect = text.get_rect(center = ((res_width / 2), (res_height / 1.4)))

pygame.display.set_caption("Asistente Virtual")

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            exit()
        
        if event.type == pygame.MOUSEBUTTONDOWN and microphone_rect.collidepoint(event.pos):
            #mensaje = listen(microfono, recognizer)
            mensaje = input("Yo:")
            speak(mensaje)
            


    pantalla.blit(background, (0 ,0))
    pantalla.blit(bird, bird_rect)
    pantalla.blit(text, text_rect)
    pantalla.blit(microphone, microphone_rect)

    pygame.display.update()
    reloj.tick(60)