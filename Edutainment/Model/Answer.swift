//
//  Answer.swift
//  Edutainment
//
//  Created by Denis Evdokimov on 6/4/24.
//

import Foundation

struct Answer: Identifiable {
    let id: UUID =  UUID()
    let question: Question
    let answer: Int
    let isRight: Bool

}
