//
//  CompactHomeView.swift
//  IEPAM-App
//
//  Created by Sergio on 03/10/22.
//

import SwiftUI

struct CompactHomeView: View {
    @ObservedObject var dataModel: DataModel
    @State var color = ""
    @State var iter = 0
    @State var cont: Int = 0
    var body: some View {
        ZStack{
            VStack{
                Group{
                    HStack{
                        Spacer()
                        Text("Recordatorios")
                            .font(.system(size:25))
                        Spacer()
                        NavigationLink(destination: Recordatorios(dataModel: dataModel)){
                            Text("Ver todos")
                                .foregroundColor(Color.white)
                                .padding(9)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(decidirVista(vista: "Recordatorios")))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                )
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: 100)
                        }
                        Spacer()
                    }
                    
                    ForEach(dataModel.recordatoriosFiltered) { recordatorio in
//                        if(self.cont<2){
                            TarjetaPreview(recomendacion: recordatorio, color: decidirVista(vista: "Recordatorios"))
//                                .onAppear{
//                                    self.cont = self.cont + 1
//                                    print(cont)
//                                }
//                        }
                    }
//                        //                    if(iter < 3){
//                        //                        if let index = dataModel.tests.firstIndex(where: {$0.test_id == dataModel.recordatorios[number].test_id }) {
//                        //                            print("hola")
//                        //                        } else {
//                        //                            print("f")
//                        //                        }
//                        //                    imprimir(num: number)
//
                            
                            
                    
//
//
//
//                        //                            .onAppear(){
//                        //                                iter = iter+1
//                        //                            }
                    
                }
                
                Group{
                    HStack{
                        Spacer()
                        Text("Recomendaciones")
                            .font(.system(size:25))
                        Spacer()
                        NavigationLink(destination: Recomendaciones(dataModel: dataModel)){
                            Text("Ver todos")
                                .foregroundColor(Color.white)
                                .padding(9)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(decidirVista(vista: "Recomendaciones")))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                )
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: 100)
                        }
                        Spacer()
                    }
                    ForEach(dataModel.recomendaciones) { recomendacion in
                            TarjetaPreview(recomendacion: recomendacion, color: decidirVista(vista: "Recomendacion"))
                            .onAppear{
                                print("recomendacion")
                            }

                    }
                    
//                    ForEach(0..<2) { number in
//                        TarjetaPreview(recomendacion: dataModel.recomendaciones[number], color: decidirVista(vista: "Recomendaciones"))
//                    }
                }
                
            }
            .onAppear{
                dataModel.recordatoriosFiltered.removeAll()
                self.cont = 0
                dataModel.recordatoriosFiltered = dataModel.recordatorios.filter{ rec in
                    
                    var hey = dec(index: rec.test_id)
                    print("bool", hey)
//                    for test in dataModel.tests{
//                        print("bol", hey)
//                        if (test.id == rec.test_id){
//                            hey = test.index == test.total
//                            print("bool", hey)
//                        }
//                    }
                    print(cont)
                    if(hey){
                        self.cont += 1
                    }
                    return hey && cont < 4
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
    
    func decidirVista(vista: String) -> String{
        if(vista == "Recordatorios"){
            return "rojo"
        }else{
            return "azulPrimario"
        }
    }
        
    func imprimir(num: Int) {
        print(num)
    }
}
    
    struct TarjetaPreview: View{
        var recomendacion: Recomendacion
        @State var color = ""
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(color))
                    .frame(width: 350,height: 60)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                HStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 330)
                }
                .frame(width: 350,height: 60)
                VStack(alignment: .leading){
                    Text(recomendacion.titulo)
                        .font(.system(size:20))
                    if(recomendacion.fecha != "sopa" && recomendacion.fecha != "memorama"){
                        Text(recomendacion.fecha)
                            .foregroundColor(Color.gray)
                            .font(.system(size:15))
                    }
                }
                .padding(.leading,40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 350,height: 60)
                
            }
            
        }
    }
    
    struct CompactHomeView_Previews: PreviewProvider {
        static var previews: some View {
            CompactHomeView(dataModel: DataModel())
        }
    }
