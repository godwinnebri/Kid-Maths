//
//  QuestionExtension.swift
//  KidMaths
//
//  Created by Godwin IE on 13/10/2023.
//

import Foundation

extension MultiplicationQuiz.Question: CustomStringConvertible {
    var description: String {
        return "\(questionText) (Answer: \(answer))"
    }
}
