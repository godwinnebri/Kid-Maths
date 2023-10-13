//
//  ContentView.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    
   // let test = 1
      // var test1: [Int]
       
       @State private var numberOfQuestions = 1
       @State private var difficulty = 1
       @State private var answer = 0
       @State public var answerList: [Int]
       @State private var question = ""
    @State public var quiz: MultiplicationQuiz?

    
    var body: some View {
        VStack {
            
            ZStack{
                LinearGradient(colors: [.blue, Color(hex: 0xff89CFF0)], startPoint: .topLeading, endPoint: .bottom)

                
                VStack{
                    Spacer()
                    Spacer()

                    /// Score
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Select difficulty")
                        .foregroundColor(.white.opacity(0.8))
                            .font(.subheadline)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), alignment: .center, spacing: 12) {

                            ForEach (1..<13) {number in
                                Button {
                                    difficulty = number
                                } label: {
                                    DifficultyCell(cellNum: number)
                                }
                            }//foreach
                        }// G R I D
                    .padding(.vertical, 20)
                    
                    Stepper(numberOfQuestions == 1 ? "1 Question" : "\(numberOfQuestions) Questions", value: $numberOfQuestions, in: 1...12)
                        .foregroundColor(.white)

//                    Color.clear
//                        .frame(height: 30)
                } //vstack
                .padding(.horizontal, 44)
                .padding(.vertical, 24)
            } //zstack
            .frame(height: 460)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .ignoresSafeArea()
            
            
//            Color.clear
//                .frame(height: 4)
            
            Text("What is \(question)?")
            
            Spacer()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), alignment: .center, spacing: 18) {

                    ForEach (0..<4) {number in
                       Options(option: answerList[number])
                    }//foreach
                }// G R I D
            .frame(width: 270)
            
            Spacer()
            Spacer()
            
            Button {
                askQuestion(difficultyLevel: difficulty)
            } label: {
                Text("Next")
                   .foregroundColor(.white)
                   .font(.headline)
                   .frame(maxWidth: .infinity, minHeight: 60)
                   .background(Color(hex: 0xff89CFF0))
                   .cornerRadius(10)
                   .padding(.horizontal, 24)

                
            }
            
        } // V S T A C K
        .onAppear {
                    // Initialize answerList and quiz here
                    askQuestion(difficultyLevel: difficulty)
                }
        
    }
    
//    func askQuestion(difficultyLevel: Int) {
//        difficulty = difficultyLevel
//        // Get the question for the selected difficulty
//        answerList = [1, 2, 3, answer].shuffled()
//        quiz = MultiplicationQuiz(multiplicationTable: 1)
//        let selectedQuestion = quiz.shuffledQuestions[difficulty - 1]
//        // Assign the answer from the selected question to the answer variable
//        answer = selectedQuestion.answer
//        // Set the question text for display
//        question = selectedQuestion.questionText
//    }
    
    func askQuestion(difficultyLevel: Int) {
        difficulty = difficultyLevel
        quiz = MultiplicationQuiz(multiplicationTable: difficultyLevel)


        // Set the multiplication table based on difficulty
//        let multiplicationTable: Int
//        switch difficultyLevel {
//        case 1:
//            multiplicationTable = 1
//        case 2:
//            multiplicationTable = 2
//        // Add more cases for other difficulty levels as needed
//        default:
//            multiplicationTable = 1
//        }

        // Get questions for the selected multiplication table
        let shuffledQuestions = quiz?.shuffledQuestions

        let selectedQuestion = shuffledQuestions?[difficulty - 1]

        // Assign the answer from the selected question to the answer variable
        answer = selectedQuestion?.answer ?? 0
        // Set the question text for display
        question = selectedQuestion?.questionText ?? "0"

        // Update answerList accordingly
        answerList = [1, 2, 3, answer].shuffled()
    }





}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(answerList: [1,2,3,4])
    }
}
