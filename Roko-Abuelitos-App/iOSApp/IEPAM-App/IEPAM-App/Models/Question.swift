//
//  Question.swift
//  IEPAM-App
//
//  Created by Sergio on 13/10/22.
//

import SwiftUI

class Question: ObservableObject, Identifiable {
    
    var id: Int
    var question: String
    var test_id: Int
    @Published var answer_id: Int
    
    init(id: Int, question: String, test_id: Int, answer_id: Int) {
        
        self.id = id
        self.question = question
        self.test_id = test_id
        self.answer_id = answer_id
        
    }
    
}

extension Question {
    static let dummy = Question(id: 1, question: "Pregunta", test_id: 14, answer_id: 0)
}
