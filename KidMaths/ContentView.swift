//
//  ContentView.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let test = 1
     var test1: [Int]
    
    @State private var numberOfQuestions = 1
     
     init() {
         test1 = [1, 2, 3, test]
     }
    
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
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
                               DifficultyCell(cellNum: number)
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
            
            Text("What is 2 x 2?")
            
            Spacer()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), alignment: .center, spacing: 18) {

                    ForEach (0..<4) {number in
                       Options(option: test1[number])
                    }//foreach
                }// G R I D
            .frame(width: 270)
            
            Spacer()
            Spacer()
            
            Button {
                //Do something here
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
