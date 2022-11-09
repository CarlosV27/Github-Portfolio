//
//  Dimensiones.swift
//  IEPAM-App
//
//  Created by Sergio on 10/10/22.
//

import SwiftUI

struct Dimensiones: View {
    @ObservedObject var dataModel: DataModel
    
    var body: some View {
        ZStack {
            Color("azulSecundario")
            //                .edgesIgnoringSafeArea(.top)
                .ignoresSafeArea()
            VStack(spacing:0){
                Image("caminata")
                    .resizable()
                    .scaledToFit()
                //                    .cornerRadius(radius: 20.0, corners: [.topLeft, .topRight])
                    .cornerRadius(20)
                //                    .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.clear)
                        .overlay(content: {
                            VStack(){
                                Text("Dimensiones")
                                    .font(.custom("Recoleta-Bold", size: 30))
                                    .frame(width: 400, height: 80)
                                
                                    .background(.white)
                                    .background(Color("azulSecundario"))
                                
                                VStack(alignment: .leading){
                                    if dataModel.dimensions.count > 0{
                                        ForEach(dataModel.dimensions){ dimension in
                                            Spacer()
                                            NavigationLink(destination: PruebasPorRealizar(dataModel: dataModel, dimension: dimension)){
                                                Text(dimension.dimension)
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 25, weight: .semibold))
                                                    .frame(maxWidth: 340, alignment: .leading)
                                            }
                                            
                                        }
                                    }
                                    Spacer()
                                    
//                                        .refreshable {
//                                            dataModel.loadDimensions()
//                                        }
                                    
//                                        .onAppear(){
//                                            dataModel.loadPam(id:3)
//                                        }
                                    
                                }
                                .frame(width:400)
                                .background(Color("azulSecundario"))
                                
                                
                            }
                            .cornerRadius(20)
                            .offset(y:-30)
                        })
            }
        }
            
        }
//    var body: some View {
//        NavigationView{
//            ZStack{
//                Color("azulSecundario")
//                    .ignoresSafeArea()
//                GeometryReader {proxy in
//                    VStack(alignment: .leading){
//                        NavigationLink(destination: PruebasPorRealizar()){
//                            Text("Cognitiva")
//                                .foregroundColor(.black)
//                                .font(.system(size: 20, weight: .semibold))
//                        }
//                        Spacer()
//
//                    }
//                    .frame(width:400)
//                }
//            }
//        }
//    }
}

struct Dimensiones_Previews: PreviewProvider {
    static var previews: some View {
        Dimensiones(dataModel: DataModel())
    }
}
