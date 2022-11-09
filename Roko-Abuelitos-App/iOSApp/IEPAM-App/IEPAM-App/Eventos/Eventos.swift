//
//  Eventos.swift
//  IEPAM-App
//
//  Created by Sergio on 05/10/22.
//

import SwiftUI

struct Eventos: View {
    

    //View de la lista incluida en otra pantalla
    var body: some View {
            ZStack {
                Color("azulSecundario")
                    .ignoresSafeArea()
                GeometryReader {proxy in
                    VStack{
//                        Text("Eventos")
//                            .font(.custom("Recoleta-bold", size: 45))
//                            .padding(.top, 35)
//                            .padding(.bottom)
//                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                            .frame(height: 70)
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("AzulApp"))
                            .overlay(content: {
                                ListaEventos()
                            })
                            .frame(width: 400, height: 500)
                            
                    }
                }
                
            }
        }
}

struct Eventos_Previews: PreviewProvider {
    static var previews: some View {
        Eventos()
    }
}
