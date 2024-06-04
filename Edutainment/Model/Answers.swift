//
//  Answers.swift
//  Edutainment
//
//  Created by Denis Evdokimov on 6/4/24.
//

import Foundation


struct Answers {
    
    var arr: [Answer] = .init()
    
    mutating func addNewAnswer(question: Question, answer: Int) {
        let newAnswer = Answer(question: question, answer: answer, isRight: answer == question.answer)
        arr.append(newAnswer)
    }
    
}


