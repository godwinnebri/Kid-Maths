//
//  DifficultyCell.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct DifficultyCell: View {
    let cellNum : Int
    
    var body: some View {
        Button {
            //Do something here
        } label: {
            ZStack {
                Color.white
                    .opacity(0.2)
                Text(String(cellNum))
                    .foregroundColor(.white)
                    .font(.title2)
            }
            
        }
        .clipShape(Circle())
        .frame(width: 60, height: 60)
    }
}

struct DifficultyCell_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyCell(cellNum: 0)
    }
}
