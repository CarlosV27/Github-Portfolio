//
//  Inicio.swift
//  IEPAM-App
//
//  Created by Sergio Chavez on 30/09/22.
//

import SwiftUI

struct Inicio: View {
    @State var user = ""
    @State var password = ""
    @State var showView: Bool = false
    @State var show: Int = 2
    
    var body: some View {
        VStack{
        VStack(spacing: 20){
            
            Text("Iniciar sesión")
                .font(.custom("Recoleta-Bold", size: 40))
                .padding(.bottom, 30)
            Image("grandparents")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom, 30)
        }
        
        Spacer()
            .frame(height:30)
        VStack(spacing: 10){
            TextField("Usuario", text: $user)
                .font(.system(size:20))
            Divider()
            SecureField("Contraseña", text: $password)
                .font(.system(size:20))
            Divider()
        }
        .frame(width: 330)
        Spacer()
            .frame(height:30)
        VStack{
            
            Button{
                show = 0
                print(show)
                showView.toggle()
            } label: {
                Text("Ingresar")
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("azulPrimario"))
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            )
                    .buttonStyle(PlainButtonStyle())
            }

            Spacer()
                .frame(height:70)
            Text("Olvidé mi contraseña")
                .underline()
            Button{
                show = 1
                print(show)
                
                showView.toggle()
            } label: {
                Text("No tengo cuenta")
                    .foregroundColor(Color.black)
                    .padding()
                    .buttonStyle(PlainButtonStyle())
            }
        }
        }
        .fullScreenCover(isPresented: $showView){
//            Registro(nombre: "", apellidoP: "", apellidoM: "", correo: "", contra: "")
            Pantalla(show: show)
        }
        
    }
    
}
struct Pantalla: View{
    @State var show: Int
    var body: some View{
        if (show == 0){
            Home()
        }else{
            Registro(nombre: "", apellidoP: "", apellidoM: "", correo: "", contra: "")
        }
    }
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
