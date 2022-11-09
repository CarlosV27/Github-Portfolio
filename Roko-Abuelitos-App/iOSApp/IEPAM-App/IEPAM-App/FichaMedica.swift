//
//  FichaMedica.swift
//  IEPAM-App
//
//  Created by Sergio on 05/10/22.
//

import SwiftUI

struct FichaMedica: View {
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
                
                Text("3 Enero 1942")
                    .font(.system(size: 20))
                
                Spacer()
                    .frame(height: 30)
                Group{
                    
                    Group{
                        
                        Text("Edad:")
                            .font(.system(size: 24,weight:.semibold))
                        Text("80 años")
                            .font(.system(size: 20))
                        Spacer()

                        Text("Sexo:")
                            .font(.system(size: 24,weight:.semibold))
                        Text("Hombre")
                            .font(.system(size: 20))
                        Spacer()
                        Text("Estatura:")
                            .font(.system(size: 24,weight:.semibold))
                        Text("1.65 m")
                            .font(.system(size: 20))
                        Spacer()

                    }
                    
                    Text("Tipo de sangre:")
                        .font(.system(size: 24,weight:.semibold))
                    Text("O+")
                        .font(.system(size: 20))
                    Spacer()
                    
                    Text("Condiciones médicas:")
                        .font(.system(size: 24,weight:.semibold))
                    Text("Hipertensión")
                        .font(.system(size: 20))
                    Spacer()

                    
                }
                .frame(maxWidth: 330, alignment: .leading)
            }
        }
    }
}

struct FichaMedica_Previews: PreviewProvider {
    static var previews: some View {
        FichaMedica()
    }
}
