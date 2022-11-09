//
//  Recordatorioes.swift
//  IEPAM-App
//
//  Created by Sergio on 19/10/22.
//

import SwiftUI

class Recordatorio: ObservableObject, Identifiable {
    
    var id: Int
    var test_id: Int
    var titulo: String
    var body: String
    var fecha: String
    
    init(id: Int,test_id: Int, titulo: String, body: String, fecha: String) {
        
        self.id = id
        self.test_id = test_id
        self.titulo = titulo
        self.body = body
        self.fecha = fecha
        
    }
    
}

extension Recordatorio{
    static let dummy = Recordatorio(id: 0, test_id: 0, titulo: "titulo", body: "body", fecha: "01/01/01")
}
