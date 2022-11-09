//
//  ListaEventos.swift
//  IEPAM-App
//
//  Created by Sergio on 05/10/22.
//

import SwiftUI

struct ListaEventos: View {
    //View de la lista solamente
    var body: some View {
            List {
                VStack {
                  Text("Evento 1")
                        .font(.custom("Inter-Bold", size: 20))
                  Text(Date(), style: .date)
                        .font(.custom("Inter-Regular", size: 15))
                }
                VStack {
                  Text("Evento 2")
                        .font(.custom("Inter-Bold", size: 20))
                  Text(Date(), style: .date)
                        .font(.custom("Inter-Regular", size: 15))
                }
                VStack {
                  Text("Evento 3")
                        .font(.custom("Inter-Bold", size: 20))
                  Text(Date(), style: .date)
                        .font(.custom("Inter-Regular", size: 15))
                }
                VStack {
                  Text("Evento 4")
                        .font(.custom("Inter-Bold", size: 20))
                  Text(Date(), style: .date)
                        .font(.custom("Inter-Regular", size: 15))
                }
            }
            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5 ))
            .scrollContentBackground(.hidden)
        }
}

struct ListaEventos_Previews: PreviewProvider {
    static var previews: some View {
        ListaEventos()
    }
}
