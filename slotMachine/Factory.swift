//
//  Factory.swift
//  slotMachine
//
//  Created by Joao Rosa on 30/11/14.
//  Copyright (c) 2014 sonia rosa. All rights reserved.
//

import Foundation
import UIKit

//32
class Factory {

    class func creatSlots() -> [[Slot]] {
        
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        var slots: [[Slot]] = []
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            var slotArray: [Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slot = Factory.creatSlot(slotArray)
                slotArray.append(slot)
            }
            slots.append(slotArray)
        }
        return slots
    }
    

    class func creatSlot (currentCards: [Slot]) -> Slot {
        
        var currentCardValue: [Int] = []
        
        for slot in currentCards {
            currentCardValue.append(slot.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
        while contains(currentCardValue, randomNumber + 1) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot: Slot
        
        switch randomNumber {
        case 0:
            slot = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
        default:
            slot = Slot(value: 0, image: UIImage(named: "Ace"), isRed: true)
            
        }
        return slot
    }

    
    
//class func creatSlots() -> [[Slot]] {
//    
//    let kNumberOfSlots = 3
//    let kNumberOfContainer = 3
//    let completeSetOfCards: [Slot] = [
//    Slot(value: 0, image: UIImage(named: "Ace"), isRed: true),
//    Slot(value: 1, image: UIImage(named: "Two"), isRed: true),
//    Slot(value: 2, image: UIImage(named: "Three"), isRed: true),
//    Slot(value: 3, image: UIImage(named: "Four"), isRed: true),
//    Slot(value: 4, image: UIImage(named: "Five"), isRed: false),
//    Slot(value: 5, image: UIImage(named: "Six"), isRed: false),
//    Slot(value: 6, image: UIImage(named: "Seven"), isRed: true),
//    Slot(value: 7, image: UIImage(named: "Eight"), isRed: false),
//    Slot(value: 8, image: UIImage(named: "Nine"), isRed: false),
//    Slot(value: 9, image: UIImage(named: "Ten"), isRed: true),
//    Slot(value: 10, image: UIImage(named: "Jack"), isRed: false),
//    Slot(value: 11, image: UIImage(named: "Queen"), isRed: false),
//    Slot(value: 12, image: UIImage(named: "King"), isRed: true)
//    ]
//    
//    
//    var slots: [[Slot]] = []
//    
//    for containerNumber in 1...kNumberOfContainer {
//        
//        slots.append(Factory.creatContainerSlot(completeSetOfCards, numberOfCardsToDraw: 3))
//    }
//    
//   return slots
//}
//    
//    class func creatContainerSlot(setOfCards: [Slot], numberOfCardsToDraw: Int) -> [Slot] {
//        var actualSetOfCards: [Slot] = setOfCards
//        var slotArray: [Slot] = []
//        
//        if numberOfCardsToDraw <= setOfCards.count {
//            for drawNumber in 1...numberOfCardsToDraw {
//                let randomNumber = Int(arc4random_uniform(UInt32(actualSetOfCards.count)))
//                slotArray.append(actualSetOfCards[randomNumber])
//                actualSetOfCards.removeAtIndex(randomNumber)
//            }
//        }
//        return slotArray
//    }
//
    
    
    
    
    
    
    
    
    
    
}

