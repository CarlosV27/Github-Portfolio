//
//  PruebasPreview.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct PruebasPreview: View {
    @ObservedObject var dataModel : DataModel
    @State var progreso: Int = 0
    var body: some View {
        NavigationView{
            ZStack {
                Color("azulSecundario")
                //                .edgesIgnoringSafeArea(.top)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Armando Casas")
                        .font(.custom("Recoleta-Bold", size: 40))
                    Spacer()
                    
                    Text("Pruebas por realizar")
                        .font(.system(size: 20))
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width:350, height: 250)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .overlay(content: {
                            VStack{
                                HStack{
                                    Image("arrow")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .rotationEffect(Angle(degrees: 180))
                                    
                                    NavigationLink(destination: Deyesavage(dataModel: dataModel, test: dataModel.tests[0], question: Question.dummy, valor: 0)){
                                        Image("pruebasPreview")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                    }
                                    Image("arrow")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                }
                                NavigationLink(destination: Dimensiones(dataModel: dataModel)){
                                    Text("Ver todas")
                                        .foregroundColor(Color.white)
                                        .padding(9)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color("rojo"))
                                                .shadow(color: .gray, radius: 2, x: 0, y: 0)

                                        )
                                        .buttonStyle(PlainButtonStyle())
                                        .frame(width: 100)
                                }
                                
                            }
                            
                        })
                    Spacer()
                    Text("Progreso de dimensiones")
                        .font(.system(size: 20))
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 350, height: 250)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .overlay(content: {
                            VStack{
                                ScoreView(score: Double(progreso))
                            }
                        })
                    Spacer()
                    
                    
                }
                                .onAppear{
                                    self.progreso = 0
                                    for test in dataModel.tests {
                                        if(test.index == test.total){
                                            self.progreso+=1
                                            
                                        }
                                    }
                                }
            }
        }
    }
}

struct PruebasPreview_Previews: PreviewProvider {
    static var previews: some View {
        PruebasPreview(dataModel: DataModel())
    }
}
