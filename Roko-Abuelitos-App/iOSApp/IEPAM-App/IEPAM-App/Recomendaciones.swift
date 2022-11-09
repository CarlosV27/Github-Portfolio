//
//  Recomendaciones.swift
//  IEPAM-App
//
//  Created by Sergio on 19/10/22.
//

import SwiftUI

struct Recomendaciones: View {
    @ObservedObject var dataModel: DataModel
    var body: some View {
        ZStack {
            Color("azulSecundario")
            //                .edgesIgnoringSafeArea(.top)
                .ignoresSafeArea()
            VStack{
                NavigationLink(destination: Bot(img:"bot")){
                    Image("loro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                Text("Recomendaciones")
                    .font(.custom("Recoleta-Bold", size: 40))
//                Spacer()
                
                ForEach(dataModel.recomendaciones){ recomendacion in
//                    ZStack{
                    NavigationLink(destination: Bot(img: recomendacion.fecha)){
                            ZStack{
                                VStack{
                                    Tarjeta(rec: recomendacion, color: "azulPrimario")
                                        
                                }
                                }
                        }
                    
                    }
                        
                }

            }
            
        }
    }


struct Recomendaciones_Previews: PreviewProvider {
    static var previews: some View {
        Recomendaciones(dataModel: DataModel())
    }
}
