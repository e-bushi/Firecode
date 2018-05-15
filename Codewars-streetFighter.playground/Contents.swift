//You'll have to simulate the video game's character selection screen behaviour, more specifically the selection grid

//Selection Grid Layout in text:
//
//| Ryu  | E.Honda | Blanka  | Guile   | Balrog | Vega    |
//| Ken  | Chun Li | Zangief | Dhalsim | Sagat  | M.Bison |
//Input
//
//the list of game characters in a 2x6 grid;
//the initial position of the selection cursor (top-left is (0,0));
//a list of moves of the selection cursor (which are up, down, left, right);
//Output
//
//the list of characters who have been hovered by the selection cursor after all the moves

var fighters = [
    ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
    ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
]
var initial_position = (0,0)



enum Direction: String  {
    case up = "up"
    case down = "down"
    case left = "left"
    case right = "right"
    
}

var moves = ["up", "left", "right", "left", "left"]


func streetFighterSelection(fighters: [[String]], position: (row: Int, column: Int), moves: [String]) -> [String] {
    // Direction enum values are .up, .down, .left, and .right
    var updateablePosition = position
    var streetFighters = [String]()
    
    moves.forEach { (direction) in
        if let direct = Direction(rawValue: direction) {
            
            switch direct {
            case .up:
                if updateablePosition.row == 0 {
                    updateablePosition.row = 0
                } else {
                    updateablePosition.row -= 1
                }
                streetFighters.append(fighters[updateablePosition.row][updateablePosition.column])
                
            case .down:
                if updateablePosition.row == fighters.count - 1 {
                    updateablePosition.row = fighters.count - 1
                } else {
                    updateablePosition.row += 1
                }
                streetFighters.append(fighters[updateablePosition.row][updateablePosition.column])
                
            case .left:
                if updateablePosition.column == 0 {
                    updateablePosition.column = fighters[updateablePosition.row].count - 1
                } else {
                    updateablePosition.column -= 1
                }
                streetFighters.append(fighters[updateablePosition.row][updateablePosition.column])
                
            case .right:
                if updateablePosition.column == fighters[updateablePosition.row].count - 1 {
                    updateablePosition.column = 0
                } else {
                    updateablePosition.column += 1
                }
                streetFighters.append(fighters[updateablePosition.row][updateablePosition.column])
            }
            
        }
    }
    
    return streetFighters
}

print(streetFighterSelection(fighters: fighters, position: initial_position, moves: moves))

