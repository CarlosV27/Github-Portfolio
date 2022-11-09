//
//  Recordatorios.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct Recordatorios: View {
    @ObservedObject var dataModel: DataModel
    @State private var cont: Int = 0
    var body: some View {
        ZStack {
            Color("azulSecundario")
            //                .edgesIgnoringSafeArea(.top)
                .ignoresSafeArea()
            VStack{
                Text("Recordatorios")
                    .font(.custom("Recoleta-Bold", size: 40))
//                Spacer()
                
                ForEach(dataModel.recordatoriosFiltered){ recordatorio in
                    Tarjeta(rec: recordatorio, color: "rojo")
                }
                
//                Tarjeta(titulo: "Tomar la prueba 2", contenido: "Recuerda hacer la prueba de Escala Abreviada de Depresión desde la app.", fecha: "08.09.2021")
//
//                Tarjeta(titulo: "Completar la prueba 3", contenido: "Aún te falta completar una sección de la prueba de Escala de Valoración Sociofamiliar, puedes regresar a hacerlo ahora.", fecha: "08.09.2022")
//
//                Tarjeta(titulo: "Tomar la prueba 3", contenido: "Recuerda hacer la prueba de Índice de Barthel desde la app.", fecha: "08.09.2022")
            }
            .onAppear{
                dataModel.recordatoriosFiltered.removeAll()
                self.cont = 0
                dataModel.recordatoriosFiltered = dataModel.recordatorios.filter{ rec in
                    
                    var hey = dec(index: rec.test_id)
                    print("bool", hey)
                    print(cont)
                    if(hey){
                        self.cont += 1
                    }
                    return hey && cont < 5
                }
            
            }
            
        }
    }
    
    func dec(index: Int) -> Bool {
        var con=0
        print(dataModel.tests.count)
        for test in dataModel.tests{
            print(con)
            if (test.id == index){
                return test.index != test.total
            }
            con += 1
        }
        print("whut")
        return true
    }
}

struct Tarjeta: View{
    var rec: Recomendacion
    var color: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(color))
                .frame(width: 350,height: 130)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            HStack{
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 330)
                
            }
            .frame(width: 350,height: 130)
            VStack(alignment: .leading){
                Text(rec.titulo)
                    .font(.system(size:23))
                    .foregroundColor(.black)
                Text(rec.body)
                    .frame(height: 50)
                    .foregroundColor(.black)
                if(rec.fecha != "sopa" && rec.fecha != "memorama"){
                    Text(rec.fecha)
                        .foregroundColor(Color.gray)
                        .font(.system(size:15))
                }else{
                    Text("")
                }
                
            }
            .padding(.leading,40)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: 350,height: 60)
        }
        Spacer()
            .frame(height: 10)
    }
}
struct Recordatorios_Previews: PreviewProvider {
    static var previews: some View {
        Recordatorios(dataModel: DataModel())
    }
}
