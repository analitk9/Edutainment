//
//  Question.swift
//  Edutainment
//
//  Created by Denis Evdokimov on 6/4/24.
//

import Foundation

struct Question: Identifiable {
    let id: UUID =  UUID()
    
    let question: String
    let answer: Int
}
