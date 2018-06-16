//: [Previous](@previous)

import Foundation

enum Depth: Int {
    case root = 0, one, two, three, four, five, six, seven, eight, nine, ten
}

class Node<T> {
    weak var parent: Node?
    var data: T
    var depth: Depth?
    var children: [Node] = []
    
    init(_ value: T) {
        self.data = value
        
        if self.isRoot() {
            self.depth = Depth(rawValue: 0)
        } else {
            let raw = self.parent?.depth?.rawValue
            self.depth = Depth(rawValue: raw! + 1)
        }
    }
    
    func addOffspring(child: Node) {
        children.append(child)
        child.parent = self
        child.depth = Depth(rawValue: self.depth!.rawValue + 1)
    }
    
    func isLeaf() -> Bool {
        return self.children.count == 0
    }
    
    func isBranch() -> Bool {
        return self.children.count > 0
    }
    
    func isRoot() -> Bool {
        return self.parent == nil
    }
    
    func myDepth() -> Int? {
        guard let dept = depth?.rawValue else {
           return nil
        }
        
        return dept
    }
    
    func numberOfChildren() -> Int {
        return children.count
    }
}

extension Node: CustomStringConvertible {
    
    var description: String {
        
        return "\(self.data)"
    }
}


class HTMLTree<T> {
    
    var root: Node<T>
    var newLine = "\n"
    var tab = "\t"
    
    init(root: Node<T>) {
        self.root = root
    }
    
    
    func createList() -> String {
        var text = "<ol>\n"
        
        self.traversePreOrderRecursive(node: self.root, text: &text)

        return text + "\n</ol>"
        
    }
    
    func traversePreOrderRecursive(node: Node<T>, text: inout String) {
        
        if node.myDepth() == 0 {
            text += "\t<li>\(node.data)"
        } else if node.myDepth() == 1 {
            text += "\(newLine) \(tab) \(tab) <li>\(node.data)"
        } else {
            text += "\(newLine) \(tab) \(tab) \(tab) <li>\(node.data)"
        }
        
        if node.isBranch() && node.myDepth() == 0 {
            text += "\(newLine) \(tab) \(tab)<ol>"
            
            node.children.forEach { (node) in
                self.traversePreOrderRecursive(node: node, text: &text)
            }
            
            text += "\(newLine) \(tab) \(tab)</ol>"
        } else if node.isBranch() && node.myDepth() == 1 {
            text += "\(newLine) \(tab) \(tab) \(tab)<ol>"
            
            node.children.forEach { (node) in
                self.traversePreOrderRecursive(node: node, text: &text)
            }
            
            text += "\(newLine) \(tab) \(tab) \(tab)</ol>"
        }
        
        if node.myDepth() == 0 {
            text += "\(newLine) \(tab)</li>"
        } else if node.myDepth() == 1 {
            text += "\(newLine) \(tab) \(tab) </li>"
        } else {
            text += "</li>"
        }
        
        
    }
    
}


var rootNode = Node("All About Birds")
var birds = Node("Kinds Of Birds")

var finch = Node("The Finch")
var swan = Node("The Swan")

var lives = Node("Habitats")

var land = Node("Wetlands")


rootNode.addOffspring(child: birds)

rootNode.addOffspring(child: lives)

birds.addOffspring(child: finch)
birds.addOffspring(child: swan)

lives.addOffspring(child: land)

var nodeTree = HTMLTree(root: rootNode)

print(nodeTree.createList())





//: [Next](@next)
