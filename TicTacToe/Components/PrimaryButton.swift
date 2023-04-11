//
//  PrimaryButton.swift
//  TicTacToe
//
//  Created by TQ on 4/11/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    //creates button with pink background
    var background: Color = Color(.black)
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Play")
    }
}
