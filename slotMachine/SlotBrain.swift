//
//  SlotBrain.swift
//  slotMachine
//
//  Created by Joao Rosa on 03/12/14.
//  Copyright (c) 2014 sonia rosa. All rights reserved.
//

import Foundation

//48
class SlotBrain {
    
    class func unpackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]] {
        
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        
        var slotsInRow: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotsInRow
        
    }
    
    //49
    class func computeWinnings(slots: [[Slot]]) -> Int {
        var slotsInRow = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRow {
            
            //51
            if checkFlush(slotRow) == true {
                println("Flush")
                winnings += 1
                flushWinCount += 1
            }
            
            //54
            if checkThreeInRow(slotRow) == true {
                println("Three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            //57
            if checkThreeOfAkind(slotRow) {
                println("three of a kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
            
        }
        
        //52
        if flushWinCount == 3 {
            println("Royal flush")
            winnings += 15
        }
        
        //55
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }
        
        //58
        if threeOfAKindWinCount == 3 {
            println("threes all around")
            winnings += 50
        }
        
        // (pertence 49)
        return winnings
        
    }
    
    //50
    class func checkFlush(slotRow: [Slot]) -> Bool {
        
        var slot1 = slotRow[0]
        var slot2 = slotRow[1]
        var slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    //53 
    class func checkThreeInRow(slotRow: [Slot]) -> Bool {
        
        var slot1 = slotRow[0]
        var slot2 = slotRow[1]
        var slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    //56
    class func checkThreeOfAkind(slotRow: [Slot]) -> Bool {
        
        var slot1 = slotRow[0]
        var slot2 = slotRow[1]
        var slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
