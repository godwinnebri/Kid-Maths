//
//  ContentView.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var difficulty = 1
    @State private var answer = 0
    @State public var answerList: [Int]
    @State private var question = ""
    @State public var quiz: MultiplicationQuiz?
    
    @State private var userSelection = 0
    @State public var isCorrect : Bool
    @State private var showAlert = false
    @State private var message = ""
    @State private var icon = ""
    
    @State private var score = 0
    @State private var attempts = 0
    @State private var numberOfQuestions = 1


    
    var body: some View {
        VStack {
            
            ZStack{
                LinearGradient(colors: [.blue, Color(hex: 0xff89CFF0)], startPoint: .topLeading, endPoint: .bottom)

                
                VStack{
                    Spacer()
                    
                    Text("Select difficulty")
                        .foregroundColor(.white.opacity(0.8))
                            .font(.subheadline)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), alignment: .center, spacing: 12) {

                            ForEach (1..<13) {number in
                                Button {
                                    difficulty = number
                                } label: {
                                    DifficultyCell(cellNum: number, difficulty: difficulty)
                                }
                            }//foreach
                        }// G R I D
                    .padding(.vertical, 20)
                    
                    Stepper(numberOfQuestions == 1 ? "1 Question" : "\(numberOfQuestions) Questions", value: $numberOfQuestions, in: 1...12)
                        .foregroundColor(.white)
                    
                } //vstack
                .padding(.horizontal, 44)
                .padding(.vertical, 40)
            } //zstack
            .frame(height: 450)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .ignoresSafeArea()
            
            
//            Color.clear
//                .frame(height: 4)
            
            Text("What is \(question)?")
            
            Spacer()
            
            if showAlert {
                VStack (spacing: 16) {
                    Image(systemName: icon)
                        .imageScale(.large)
                        .foregroundColor(isCorrect ? .green : .red)
                    
                    Text(message)
                }
            }
            else {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), alignment: .center, spacing: 18) {
                
                ForEach (0..<4) {number in
                    
                    Button {
                        //check if user is correct
                        userSelection = answerList[number]
                        attempts += 1
                        
                        if userSelection == answer {
                            isCorrect = true
                            message = "Correct"
                            icon = "checkmark"
                            score += 1

                        } else {
                            isCorrect = false
                            message = "Wrong, \(question) is \(answer)"
                            icon = "x.circle"
                        }
                        
                        showAlert = true
                    } label: {
                        Options(option: answerList[number])
                    }
                }//foreach
            }// G R I D
            .frame(width: 270)
            }
            
            Spacer()
            Spacer()
            
            Button {
                askQuestion(difficultyLevel: difficulty)
            } label: {
                Text("Next question")
                   .foregroundColor(.white)
                   .font(.headline)
                   .frame(maxWidth: .infinity, minHeight: 60)
                   .background(Color(hex: 0xff89CFF0))
                   .cornerRadius(10)
                   .padding(.horizontal, 24)

                
            }
            
            Spacer()

            /// Score
            HStack {
                HStack{
                    Image(systemName: "checkmark")
                        .imageScale(.small)
                    
                    Text("Score : \(score)")
                }
                .foregroundColor(.green)

                
                Spacer()
                
                Text("Attempts: \(attempts)")
                    .foregroundColor(.gray)

            }
            .padding(.horizontal, 24)
            
        } // V S T A C K
        .onAppear {
                    // Initialize answerList and quiz here
                    askQuestion(difficultyLevel: difficulty)
                }
        
    }
    
    func askQuestion(difficultyLevel: Int) {
        
        difficulty = difficultyLevel
        showAlert = false
        quiz = MultiplicationQuiz(multiplicationTable: difficultyLevel)

        // Get questions for the selected multiplication table
        let shuffledQuestions = quiz?.shuffledQuestions

        let selectedQuestion = shuffledQuestions?[difficulty - 1]

        // Assign the answer from the selected question to the answer variable
        answer = selectedQuestion?.answer ?? 0
        
        // Set the question text for display
        question = selectedQuestion?.questionText ?? "0"

        // Update answerList accordingly
        answerList = [Int.random(in: 1..<19 + 5), Int.random(in: 1..<19 + 5), Int.random(in: 1..<19 + 5), answer].shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(answerList: [1,2,3,4], isCorrect: false)
    }
}
