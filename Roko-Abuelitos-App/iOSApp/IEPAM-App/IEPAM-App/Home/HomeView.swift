//
//  HomeView.swift
//  IEPAM-App
//
//  Created by Sergio Chavez on 02/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dataModel = DataModel()
    var body: some View {
        NavigationView{
            ZStack {
                Color("azulSecundario")
                //                .edgesIgnoringSafeArea(.top)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        NavigationLink(destination: Perfil()){
                            Image("fotoUsuario")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95)
                        }
                        NavigationLink(destination: Perfil()){
                            Text("Hola, Armando!")
                                .font(.custom("Recoleta-Bold", size: 30))
                                .foregroundColor(.black)
                        }
                    }
                    CompactHomeView(dataModel: dataModel)
                }
                
            }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dataModel: DataModel())
    }
}
