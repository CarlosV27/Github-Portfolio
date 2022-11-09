//
//  Perfil.swift
//  IEPAM-App
//
//  Created by Sergio on 03/10/22.
//

import SwiftUI

struct Perfil: View {
    var body: some View {
        ZStack {
            Color("azulSecundario")
            //                .edgesIgnoringSafeArea(.top)
                .ignoresSafeArea()
            VStack{
                Image("fotoUsuario")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text("Armando Casas")
                    .font(.custom("Recoleta-Bold", size: 35))
                
                Spacer()
                    .frame(height: 70)
                Group{
                    
                    Group{
                        
                        Text("Correo electrónico:")
                            .font(.system(size: 25,weight:.semibold))
                        Text("armandocasas@gmail.com")
                            .font(.system(size: 20))
                        Spacer()

                        Text("Contraseña:")
                            .font(.system(size: 25,weight:.semibold))
                        Text("Lopez12")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    

                    Text("Teléfono:")
                        .font(.system(size: 25,weight:.semibold))
                        
                    Text("+52 81 0466 3142")
                        .font(.system(size: 20))
                    Spacer()

                    Text("Fecha de nacimiento:")
                        .font(.system(size: 25,weight:.semibold))
                    Text("03/01/1942")
                        .font(.system(size: 20))
                    Spacer()
                }
                .frame(maxWidth: 330, alignment: .leading)
                
                Button {
                    print("Hola")
                } label: {
                    Text("Imprimir")
                        .font(.custom("Inter-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        
                }
                .background(Color("azulPrimario"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
