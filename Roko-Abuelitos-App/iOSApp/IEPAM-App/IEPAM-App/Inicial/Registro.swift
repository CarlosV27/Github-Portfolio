//
//  InicioSesion.swift
//  IEPAM-App
//
//  Created by Alumno on 29/09/22.
//

import SwiftUI

struct Registro: View {
    
    @State var nombre: String
    @State var apellidoP: String
    @State var apellidoM: String
    @State var correo: String
    @State var contra: String
    
    @State var showView: Bool = false
    var body: some View {
        
        GeometryReader {proxy in
            
            VStack{
                Text("Registro \n de usuario")
                    .font(.custom("Recoleta-Bold", size: 40))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.center)
                Image("grandparents")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)
                
                VStack {
                    TextField("Nombre:", text: $nombre)
                        .font(.custom("Inter-Regular", size: 20))
                    Divider()
                        .overlay(Color("azulPrimario"))
                        .padding(.bottom, 25)
                    TextField("Apellido Paterno:", text: $apellidoP)
                        .font(.custom("Inter-Regular", size: 20))
                    Divider()
                        .overlay(Color("azulPrimario"))
                        .padding(.bottom, 25)
                    TextField("Apellido Materno:", text: $apellidoM)
                        .font(.custom("Inter-Regular", size: 20))
                    Divider()
                        .overlay(Color("azulPrimario"))
                        .padding(.bottom, 25)
                    TextField("Correo Electrónico:", text: $correo)
                        .font(.custom("Inter-Regular", size: 20))
                        .keyboardType(.emailAddress)
                    Divider()
                        .overlay(Color("azulPrimario"))
                        .padding(.bottom, 25)
                    TextField("Contraseña:", text: $contra)
                        .font(.custom("Inter-Regular", size: 20))
                    Divider()
                        .overlay(Color("azulPrimario"))
                        .padding(.bottom, 25)
                    
                }
                .frame(width: 330)
                .padding(.bottom, 25)
                Button {
                    print("Hola")
                    showView.toggle()
                } label: {
                    Text("Aceptar")
                        .font(.custom("Inter-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        
                }
                .background(Color("azulPrimario"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                

                
            }.fullScreenCover(isPresented: $showView){
                SeleccionPerfil(opacityB2: 0.5, opacityB1: 0.5)
            }
            
            
        }
        
    }
}

struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        Registro(nombre: "", apellidoP: "", apellidoM: "", correo: "", contra: "")
    }
}
