//
//  Home.swift
//  IEPAM-App
//
//  Created by Sergio Chavez on 02/10/22.
//

import SwiftUI

struct Home: View {
    @State var dataModel = DataModel()
    var body: some View {
        
        TabView{
            ZStack{
                Color("azulSecundario")
                VStack {
                    HomeView(dataModel: dataModel)
                    Spacer()
                    Color.white
                        .frame(height: 100)
                        .opacity(1)
                        .cornerRadius(20)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .tabItem{
                Label("", systemImage: "house")
            }
            
            ZStack{
                Color("azulSecundario")
                VStack {
                    PruebasPreview(dataModel: dataModel)
                    Spacer()
                    Color.white
                        .frame(height: 100)
                        .opacity(1)
                        .cornerRadius(20)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .tabItem{
                Label("", systemImage: "list.clipboard")
            }
            
            ZStack{
                Color("azulSecundario")
                VStack {
                    Calendario()
                    Spacer()
                    Color.white
                        .frame(height: 100)
                        .opacity(1)
                        .cornerRadius(20)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .tabItem{
                Label("", systemImage: "calendar")
            }
            ZStack{
                Color("azulSecundario")
                VStack {
                    FichaMedica()
                    Spacer()
                    Color.white
                        .frame(height: 100)
                        .opacity(1)
                        .cornerRadius(20)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .tabItem {
                Label("",systemImage: "wallet.pass")
            }
        }
        .accentColor(Color("azulPrimario"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
