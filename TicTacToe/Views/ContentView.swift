import SwiftUI
struct ContentView: View
{
    @StateObject var gameState = GameState()
    var body: some View
    {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        Spacer()
                        Text("Tic Tac Toe")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text("Grab a friend and play Tic Tac Toe!")
                            .multilineTextAlignment(.center)
                        NavigationLink {
                            GameView()
                        } label: {
                            //implements PrimaryButton and labels the button
                            PrimaryButton(text: "Play")
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Game by Ta'Quawn Watts")
                                .font(.footnote)
                        }
                        .padding()
                        .frame(width: geometry.size.width, height: 0, alignment: .bottom)
                    }
                    .background(Color("AccentColor"))
                }
            }
        }
    }
}
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
