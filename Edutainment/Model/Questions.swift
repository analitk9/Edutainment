//
//  Questions.swift
//  Edutainment
//
//  Created by Denis Evdokimov on 6/4/24.
//

import Foundation

struct Questions {
    var questions: [Question] = .init()
    
    mutating func createQuestions(multiplication: Int, amount: Int ) {
        questions.removeAll()
        (1...amount).forEach { num in
            let questionString = "Сколько будет \(num) умножить на \(multiplication)?"
            let answer = num * multiplication
            let question = Question(question: questionString, answer: answer)
            questions.append(question)
        }
 
    }
    
    mutating func createSimple() {
        self.createQuestions(multiplication: 2, amount: 10)
    }
   
}
