enum Weight: Int, Comparable {
    case rootTitle = 1
    case subTitle = 2
    case item = 3
    
    static func < (lhs: Weight, rhs: Weight) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
}

class Heading {
    var weight: Weight
    var text: String
    init(weight: Weight, text: String) {
        self.weight = weight
        self.text = text
    }
}


class Node {
    var heading: Heading
    var children: [Node] = []
    weak var parent: Node?
    
    init(heading: Heading) {
        self.heading = heading
    }
    
    func addChild(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func isLeaf() -> Bool {
        return self.children.count == 0
    }
    
    func isBranch() -> Bool {
        return self.children.count > 0
    }
    
}

extension Node: CustomStringConvertible {
    
    
    var description: String {
        var text = ""
        if self.heading.weight == .item {
            text = "\n      <li>\(self.heading.text)"
        } else {
            text = "\n    <li>\(self.heading.text)"
        }
        
        if !children.isEmpty{
            text += "\n     <ol>"
            for child in children {
                if children.last!.heading.text == child.heading.text {
                    
                    text += child.description + "</li>\n" + "     </ol>\n"
                } else {
                    text += child.description + "</li>"
                }
            }
            text += "    </li>\n"
        }
        
        return text
    }
    
    
}

class HTMLTree {
    
    var root: Node
    var headings: [Heading]
    var allNodes: [Node] = []
    
    init(heading: [Heading]) {
        
        var rootNode = heading.filter { (heading) -> Bool in
            return heading.weight == .rootTitle
        }
        
        self.root = Node(heading: rootNode[0])
        
        self.headings = heading
        
        var subNode = Node(heading: Heading(weight: .subTitle, text: ""))
        
        var subItem = Node(heading: Heading(weight: .item, text: ""))
        headings.forEach { (heading) in
            
            let _weight = heading.weight
            
            if _weight == .subTitle {
                subNode = Node(heading: heading)
                self.root.addChild(child: subNode)
                allNodes.append(subNode)
            }
            
            if _weight == .item {
                subItem = Node(heading: heading)
                subNode.addChild(child: subItem)
                allNodes.append(subItem)
            }
        }
    }
    
    
    
    
    
}

extension HTMLTree: CustomStringConvertible {
    var description: String {
        var text = "<ol>\n <li>\(root.heading.text)\n"
        
        if !root.children.isEmpty {
            text += "   <ol>"
            for child in root.children {
                if root.children.last!.heading.text != child.heading.text {
                    text += child.description
                } else {
                    text += child.description + "   </ol>"
                }
            }
            text += "\n</ol>"
        }
        
        
        
        
        return text
    }
    
}



var headings: [Heading] = [Heading(weight: .rootTitle, text: "All About Birds"), Heading(weight: .subTitle, text: "Kinds of birds"), Heading(weight: .item, text: "The Finch"), Heading(weight: .item, text: "The Swan"), Heading(weight: .subTitle, text: "Habitats"),
                           Heading(weight: .item, text: "Wetlands")
]

var tree = HTMLTree(heading: headings)


print(tree.description)

