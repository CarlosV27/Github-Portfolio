//
//  TestInicial.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct TestInicial: View {
    @State var showView: Bool = false
    @State var opacityB11: Double
    @State var opacityB12: Double
    
    @State var opacityB21: Double
    @State var opacityB22: Double
    
    @State var opacityB31: Double
    @State var opacityB32: Double
    
    @State var opacityB41: Double
    @State var opacityB42: Double
    
    @State var opacityB51: Double
    @State var opacityB52: Double
    
    var body: some View {
            GeometryReader {proxy in
                VStack{
                    Text("Cuéntanos")
                        .font(.custom("Recoleta-Bold", size: 50))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 35)
                        .padding(.top, 30)
                        .multilineTextAlignment(.center)
                    Text("¿Tiene problemas:")
                        .font(.custom("Inter-Bold", size: 25))
                        .padding()
                    Spacer()
                        .frame(height: 40)
                    VStack {
                        HStack() {
                            Text("de memoria?")
                                .font(.custom("Inter-Regular", size: 20))
                                .padding()
                            Spacer()
//                                .frame(width: 20)
                            Button {
                                opacityB11 = 1
                                opacityB12 = 0.5
                                print("Hola")
                            } label: {
                                Text("Si")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB11)
                            
                            Button {
                                opacityB11 = 0.5
                                opacityB12 = 1.0
                                print("Hola")
                            } label: {
                                Text("No")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB12)
                        }
                        Spacer()
                            .frame(height: 25)
                        HStack() {
                            Text("para recordar que\nfecha es hoy?")
                                .font(.custom("Inter-Regular", size: 20))
                                .padding()
                            Spacer()
//                                .frame(width: 20)
                            Button {
                                opacityB21 = 1
                                opacityB22 = 0.5
                                print("Hola")
                            } label: {
                                Text("Si")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB21)
                            Button {
                                opacityB21 = 0.5
                                opacityB22 = 1
                                print("Hola")
                            } label: {
                                Text("No")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB22)
                        }
                        Spacer()
                            .frame(height: 25)
                        HStack() {
                            Text("recordar en que\nlugar está?")
                                .font(.custom("Inter-Regular", size: 20))
                                .padding()
                            Spacer()
//                                .frame(width: 20)
                            Button {
                                opacityB31 = 1
                                opacityB32 = 0.5
                                print("Hola")
                            } label: {
                                Text("Si")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB31)
                            Button {
                                print("Hola")
                                opacityB31 = 0.5
                                opacityB32 = 1
                            } label: {
                                Text("No")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB32)
                        }
                        Spacer()
                            .frame(height: 25)
                        HStack() {
                            Text("de depresión?")
                                .font(.custom("Inter-Regular", size: 20))
                                .padding()
                            Spacer()
//                                .frame(width: 20)
                            Button {
                                opacityB41 = 1
                                opacityB42 = 0.5
                                print("Hola")
                            } label: {
                                Text("Si")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB41)
                            Button {
                                print("Hola")
                                opacityB41 = 0.5
                                opacityB42 = 1
                            } label: {
                                Text("No")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB42)
                        }
                        Spacer()
                            .frame(height: 25)
                        HStack() {
                            Text("para escribir?")
                                .font(.custom("Inter-Regular", size: 20))
                                .padding()
                            Spacer()
//                                .frame(width: 20)
                            Button {
                                opacityB51 = 1
                                opacityB52 = 0.5
                                print("Hola")
                            } label: {
                                Text("Si")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB51)
                            Button {
                                opacityB51 = 0.5
                                opacityB52 = 1
                                print("Hola")
                            } label: {
                                Text("No")
                                    .font(.custom("Inter-Bold", size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 60, height: 60)
                            .background(Color("azulPrimario"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(opacityB52)
                        }
                        
                        Button {
                            print("Hola")
                            showView.toggle()
                        } label: {
                            Text("Aceptar")
                                .font(.custom("Inter-Bold", size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(width: 120, height: 60)
                        .background(Color("azulPrimario"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        
                    }
                    .frame(width: 350)
                }
            }.fullScreenCover(isPresented: $showView){
                Home()
            }
        }
}
struct BotonRes: View{
    @ObservedObject var test : Test
    @ObservedObject var question: Question
    @State var answer: Answer
    
    var body: some View{
        Button {
            question.answer_id = answer.id
            print("question",question.answer_id)
//
            //Cambiar para solo cambiar resultado al continuar
//
            test.result = test.result + Int(answer.weight)
            print("test:",test.result, "| testTotal:", test.total)
        } label: {
            Text(answer.answer)
                .font(.custom("Inter-Regular", size: 20))
                .foregroundColor(.white)
                .frame(width: 300)
                .frame(minHeight: 30)
                .background(question.answer_id == answer.id ? Color("azulPrimario"):Color("unselect"))
            
        }
    }
    
}

struct TestInicial_Previews: PreviewProvider {
    static var previews: some View {
        TestInicial(opacityB11: 0.5, opacityB12: 0.5, opacityB21: 0.5, opacityB22: 0.5, opacityB31: 0.5, opacityB32: 0.5, opacityB41: 0.5, opacityB42: 0.5, opacityB51: 0.5, opacityB52: 0.5)
    }
}
