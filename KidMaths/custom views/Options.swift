//
//  Options.swift
//  KidMaths
//
//  Created by Godwin IE on 12/10/2023.
//

import SwiftUI

struct Options: View {
    let option : Int
    
    var body: some View {
        Button {
            //Do something here
        } label: {
            ZStack {
                Color.gray
                    .opacity(0.1)
                Text(String(option))
                    .foregroundColor(.black)
                    .font(.title2)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10 ))
        .frame(width: 120, height: 60)
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options(option: 0)
    }
}
