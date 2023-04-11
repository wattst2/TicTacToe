import Foundation
class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.X
    @Published var oScore = 0
    @Published var xScore = 0
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    init()
    {
        resetBoard()
    }
    
    func turnText() -> String {
        return turn == Tile.X ? "Turn: X" : "Turn: O"
    }
    
    func placeTile(_ row: Int,_ column: Int) {
        if(board[row][column].tile != Tile.Empty)
        {
            return
        }
        board[row][column].tile = turn == Tile.X ? Tile.X : Tile.Circle
        //toggles between x's and o's
        if(checkForVictory())
        {
            if(turn == Tile.X)
            {
                xScore += 1
            }
            else
            {
                oScore += 1
            }
            let winner = turn == Tile.X ? "X's" : "O's"
            alertMessage = winner + " Wins!"
            showAlert = true
            
        }
        else
        {
            turn = turn == Tile.X ? Tile.Circle : Tile.X
        }
        if (checkForDraw())
        {
            if (!checkForVictory()) {
                alertMessage = "Draw!"
                showAlert = true
            }
        }
    }
    
    func checkForVictory() -> Bool
    {
        //vertical
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0)
        {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2)
        {
            return true
        }
        
        //horizontal
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2)
        {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2)
        {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2)
        {
            return true
        }
        
        //diagonal
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)
        {
            return true
        }

        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)
        {
            return true
        }

        return false
    }
    
    func checkForDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.Empty
                {
                    return false
                }
            }
        }
        return true
    }
    
    
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool
    {
        return board[row][column].tile == turn
        
    }
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    
}
