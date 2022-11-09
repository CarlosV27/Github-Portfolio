//
//  Resultado.swift
//  IEPAM-App
//
//  Created by Sergio on 19/10/22.
//

import SwiftUI

struct Resultado: View {
    @ObservedObject var dataModel: DataModel
    @ObservedObject var test: Test
    
    var body: some View {
        VStack{
            Image("loro")
                .resizable()
                .scaledToFit()
                .frame(width:150)
            
            Text("Gracias por cuidarte!")
                .font(.system(size: 30))
            HStack{
                Text(getIndicador())
                    .font(.system(size: 25))
                Circle()
                    .fill(Color(getColorIndicador()))
                    .frame(height:35)
                
            }
            
            
            
            
        }
    }
    
    func getIndicador() -> String{
        if let index = dataModel.testRange.firstIndex(
            where: {$0.test_id == test.id && test.result >= $0.lower_value && test.result <= $0.upper_value}) {
            return dataModel.testRange[index].indicator
        } else{
            return ""
        }
    }
    
    func getColorIndicador() -> String {
        
        if let index = dataModel.testRange.firstIndex(where: { test.result >= $0.lower_value && test.result <= $0.upper_value && $0.test_id == test.id }) {
            print("Color",dataModel.testRange[index].color)
            print(index)
            return dataModel.testRange[index].color
        } else {
            print(index)
            return ""
        }
        
    }
}

struct Resultado_Previews: PreviewProvider {
    static var previews: some View {
        Resultado(dataModel: DataModel(), test: Test.dummy)
    }
}
