//
//  Questions.swift
//  KidMaths
//
//  Created by Godwin IE on 13/10/2023.
//

import Foundation

struct MultiplicationQuiz {
    let multiplicationTable: Int
    let questions: [Question]
    var shuffledQuestions: [Question] {
           return questions.shuffled()
       }
    
    struct Question {
        let questionText: String
        let answer: Int
    }
    
    // Initialize a quiz with questions for a specific multiplication table
    init(multiplicationTable: Int) {
        self.multiplicationTable = multiplicationTable
        self.questions = MultiplicationQuiz.generateQuestions(table: multiplicationTable)
    }
    
    // Generate questions for a specific multiplication table
    static func generateQuestions(table: Int) -> [Question] {
        var questions: [Question] = []
        
        for i in 1...12 {
            let questionText = "\(table) x \(i)"
            let answer = table * i
            let question = Question(questionText: questionText, answer: answer)
            questions.append(question)
        }
        
        return questions
    }
}

