//
//  DifficultyCell.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct DifficultyCell: View {
    let cellNum : Int
    let difficulty : Int
    
    var body: some View {
        
            ZStack {
                Color.white
                    .opacity(difficulty == cellNum ? 1 : 0.2)
                Text(String(cellNum))
                    .foregroundColor(difficulty == cellNum ? .blue : .white)
                    .font(.title2)
            }
            
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .frame(width: 60, height: 60)
    }
}

struct DifficultyCell_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyCell(cellNum: 0, difficulty: 1)
    }
}
