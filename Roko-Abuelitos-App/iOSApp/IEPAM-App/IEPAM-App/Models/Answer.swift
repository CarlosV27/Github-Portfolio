//
//  Answer.swift
//  IEPAM-App
//
//  Created by Sergio on 13/10/22.
//


import SwiftUI

struct Answer: Identifiable {
    
    var id: Int
    var answer: String
    var weight: Float
    var question_id: Int
    
}

extension Answer {
    
    static let dumy = Answer(id: 1, answer: "Pregunta", weight: 1, question_id: 1)
}
