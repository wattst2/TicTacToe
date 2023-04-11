//
//  GameView.swift
//  TicTacToe
//
//  Created by TQ on 4/11/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameState = GameState()
    @State private var resetConfirm: Bool = false
    var body: some View
    {
        let borderSize = CGFloat(5)
        VStack {
            Text(gameState.turnText())
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Text(String(format: "X: %d", gameState.xScore))
                .font(.title)
                .bold()
                .padding()
            
            VStack(spacing: borderSize)
            {
                ForEach(0...2, id: \.self)
                {
                    row in HStack(spacing: borderSize)
                    {
                        ForEach(0...2, id: \.self)
                        {
                            column in
                            
                            let cell = gameState.board[row][column]
                            Text(cell.displayTile())
                                .font(.system(size: 60))
                                .foregroundColor(cell.tileColor())
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .background(Color.accentColor)
                                .onTapGesture {
                                    gameState.placeTile(row, column)
                                }
                            
                        }
                    }
                }
            }
            .background(Color.black)
            .padding()
            .alert(isPresented: $gameState.showAlert)
            {
                Alert(
                    title: Text(gameState.alertMessage),
                    dismissButton: .default(Text("Dismiss"))
                    {
                        gameState.resetBoard()
                    }
                )
            }
            
            Text(String(format: "O: %d", gameState.oScore))
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Button {
                resetConfirm = true
            } label: {
                PrimaryButton(text: "Reset Board")
            }
            .background(Color.accentColor)
            .confirmationDialog("Are you sure?", isPresented: $resetConfirm) {
                Button("Reset Board", role: .destructive) {
                    gameState.resetBoard()
                }
            } message: {
                Text("Are you sure you want to reset the board?")
            }
            .background(Color.accentColor)
        }
        .background(Color.accentColor)
        .navigationBarHidden(true)
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
