//
//  KidMathsApp.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

@main
struct KidMathsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(answerList: [1,2,3,4], isCorrect: false)
        }
    }
}
