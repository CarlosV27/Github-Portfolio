//
//  Calendario.swift
//  IEPAM-App
//
//  Created by Sergio on 05/10/22.
//






import SwiftUI

struct Calendario: View {
    @State var currentTab: Int = 0
    //Calendar ya incluido en una sola view
    var body: some View {
        
        ZStack {
            Color("azulSecundario")
                .ignoresSafeArea()
            GeometryReader {proxy in
                VStack {
                    Text("Calendario")
                        .font(.custom("Recoleta-bold", size: 40))
                        .padding(.top, 35)
                        .padding(.bottom)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                    
                        .overlay(content: {
                            ZStack(alignment: .top){
                                TabView(selection: self.$currentTab){
                                    CalendarioView(fecha: Date()).tag(0)
                                    Eventos().tag(1)
                                }
                                
                                .cornerRadius(20)
                                
                                VStack(spacing: 0){
                                    TabBarView(currentTab: self.$currentTab, tab: 0)
                                    Spacer()
                                    Button {
                                        print("Hola")
                                    } label: {
                                        HStack(spacing: -15) {
                                            Image(systemName: "plus")
                                                .font(.system(.largeTitle))
                                                .foregroundColor(.white)
                                                .padding()
                                            Text("Agregar nuevo \n evento")
                                                .font(.custom("Inter-Regular", size: 20))
                                                .foregroundColor(.white)
                                                .padding()
                                        }
                                    }
                                    .background(Color("azulPrimario"))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    Spacer()
                                        .frame(height: 20)
                                }
                            }
                        })
                        .frame(height: 550, alignment: .center)
                    
                }
            }
        }
        
    }
}

struct TabBarView: View{
    @Binding var currentTab: Int
    var tab: Int
    var body: some View{
        HStack{
            TabBarItem(currentTab: self.$currentTab,name:"Calendario",tab:0,colorLetra: "azulPrimario", colorFondo: "grisPrimario")
            Spacer()
            TabBarItem(currentTab: self.$currentTab,name:"Eventos",tab:1,colorLetra: "azulPrimario", colorFondo: "grisPrimario")
            
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(height: 100)
        .shadow(color: .gray, radius: 2, x: 0, y: 0)

        
        
    }
}

struct TabBarItem: View{
    @Binding var currentTab: Int
    var name: String
    var tab: Int
    var colorLetra: String
    var colorFondo: String
    
    var body: some View{
        Button{
            self.currentTab = tab
        }label: {
            Text(name)
                .font(.system(size: 23,weight:.semibold))
                .foregroundColor(Color(colorLetra))
                .frame(width:180,height: 70)
                .background(Color.white)
            
        }
        
        
        
    }
}

struct Calendario_Previews: PreviewProvider {
    static var previews: some View {
        Calendario()
    }
}
