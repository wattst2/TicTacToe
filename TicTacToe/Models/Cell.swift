import Foundation
import SwiftUI
struct Cell
{
    var tile: Tile
    
    func displayTile() -> String
    {
        switch(tile)
        {
            case Tile.Circle:
                return "O"
            case Tile.X:
                return "X"
            default:
                return ""
        }
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
            case Tile.Circle:
                return Color.red
            case Tile.X:
                return Color.black
            default:
                return Color.black
        }
    }
    
    
}
enum Tile
{
    case Circle
    case X
    case Empty
}
