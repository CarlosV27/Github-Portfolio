//
//  SeleccionPerfil.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct SeleccionPerfil: View {
    @State var opacityB2: Double
    @State var opacityB1: Double
    
    @State var showView: Bool = false
    var body: some View {
            GeometryReader {proxy in
                VStack {
                    
                    Text("Seleccione\nsu perfil")
                        .font(.custom("Recoleta-Bold", size: 50))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 35)
                        .padding(.top, 15)
                        .multilineTextAlignment(.center)
                    Button {
                        opacityB2 = 0.5
                        opacityB1 = 1.0
                    } label: {
                        VStack(spacing: -10){
                            Text("Cuidador")
                                .font(.custom("Inter-Bold", size: 30))
                                .foregroundColor(.black)
                                .padding()
                            Image("equipo-medico")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .padding()
                        }
                        .frame(width: 350, height: 200)
                    }
                    .background(Color("grisTest"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(opacityB1)
                    Spacer()
                        .frame(height: 35)
                    Button {
                        opacityB1 = 0.5
                        opacityB2 = 1.0
                    } label: {
                        VStack(spacing: -10){
                            Text("Persona adulta mayor")
                                .font(.custom("Inter-Bold", size: 25))
                                .foregroundColor(.black)
                                .padding()
                            Image("old")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                                .padding()
                        }
                        .frame(width: 350, height: 200)
                    }
                    .background(Color("grisTest"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(opacityB2)
                    Spacer()
                        .frame(height: 65)
                    Button {
                        print("Hola")
                        showView.toggle()
                    } label: {
                        Text("Aceptar")
                            .font(.custom("Inter-Regular", size: 25))
                            .foregroundColor(.white)
                            .padding()
                        
                            
                    }
                    .background(Color("azulPrimario"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                }
            }.fullScreenCover(isPresented: $showView){
                TestInicial(opacityB11: 0.5, opacityB12: 0.5, opacityB21: 0.5, opacityB22: 0.5, opacityB31: 0.5, opacityB32: 0.5, opacityB41: 0.5, opacityB42: 0.5, opacityB51: 0.5, opacityB52: 0.5)
        }
        }
}

struct SeleccionPerfil_Previews: PreviewProvider {
    static var previews: some View {
        SeleccionPerfil(opacityB2: 0.5, opacityB1: 0.5)
    }
}
