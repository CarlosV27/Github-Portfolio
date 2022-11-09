//
//  CalendarioView.swift
//  IEPAM-App
//
//  Created by Sergio on 05/10/22.
//

import SwiftUI

struct CalendarioView: View {
    @State var fecha: Date
    //Calendar View
    var body: some View {
        ZStack{
            Color("azulSecundario")
            VStack{
                Spacer()
                    .frame(height: 165)
                DatePicker(
                    "Selección de Fecha",
                    selection: $fecha,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                .background(.white)
                Spacer()
                    .frame(height: 0)
                Rectangle()
                    .fill(.white)
                    .frame(height: 80)
                Spacer()
            }
            
            
        }
            
        }
}

struct CalendarioView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioView(fecha: Date())
    }
}
