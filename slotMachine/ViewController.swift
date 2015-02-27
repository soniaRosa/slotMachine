//
//  ViewController.swift
//  slotMachine
//
//  Created by Joao Rosa on 29/11/14.
//  Copyright (c) 2014 sonia rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    //1
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //2
    let kMarginForView: CGFloat = 10.0
    let kSixth: CGFloat = 1.0/6.0
    
    //6
    var titleLabel: UILabel!
    
    //9
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    //11
    let kThird: CGFloat = 1.0/3.0
    let kMarginForSlot: CGFloat = 2.0
    
    //14
    //Information Labels
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    //18
    let kHalf: CGFloat = 1.0/2.0
    let kEighth: CGFloat = 1.0/8.0
    
    //20
    //Buttons in fourth container
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    //33
    var slots: [[Slot]] = []
    
    //39
    var credits = 0
    var currentBet = 0
    var winnings = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //4
        setupContainerViews()
        
        //8
        setupFirstContainer(self.firstContainer)
        
        //13
        //setupSecondContainer(self.secondContainer)(apaga se na //41)
        
        //16
        setupThirdContainer(self.thirdContainer)
        
        //24
        setupFourthContainer(self.fourthContainer)
        
        //41
        hardReset()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //22
    //IBAction
    func resetButtonPressed (button: UIButton) {
        
        //println("resetButtonPressed")
        
        //42
        hardReset()
        
        
    }
    
    //26
    func betOneButtonPressed (button: UIButton) {
        
        //println("betOneButtonPressed")
        
        //46
        if self.credits <= 0 {
            showAlertWithText(header: "No More Credits", message: "Reset game")
        }
        else if self.currentBet < 5 {
            self.currentBet += 1
            self.credits -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You can only bet 5 credits at a time ")
        }

    }
    
    //28
    func betMaxButtonPressed(button: UIButton) {
        
       // println("betMaxButtonPressed")
        
        //47 (//48 class SlotBrain)
        if self.credits < 5 {
            showAlertWithText(header: "Not Enough Credits", message: "Bet Less")
        }
        else if self.currentBet < 5 {
            var creditsToBetMax = 5 - self.currentBet
            self.credits -= creditsToBetMax
            self.currentBet += creditsToBetMax
            updateMainView()
        }
        else {
            showAlertWithText(message: "You can only bet 5 credits at a time")
        }
    
    }
    
    //30 (31 struct Slot) (32 class Factory)
    func spinButtonPressed(button: UIButton) {
        
        //println("spinButtonPressed")
        
        //37
        removeSlotImageViews()
        
        //34
        slots = Factory.creatSlots()
        setupSecondContainer(self.secondContainer)
        
        //59
        var winningsMultiplier = SlotBrain.computeWinnings(slots)
        self.winnings = winningsMultiplier * self.currentBet
        self.credits += winnings
        self.currentBet = 0
        updateMainView()
        
    }
    
    //3
    func setupContainerViews () {
        
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(firstContainer)
        
        //5
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (kSixth * 3)))
        
        self.secondContainer.backgroundColor = UIColor.brownColor()
        self.view.addSubview(secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(thirdContainer)
        
       self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(fourthContainer)

   }
    
    //7
    func setupFirstContainer(containerView: UIView) {
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.greenColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    //10
    func setupSecondContainer(containerView: UIView) {
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                
                //35.0
                var slot: Slot
                
                //10.1
                var slotImageView = UIImageView()
                
                //35.1
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "Ace")
                }
                //10.2
                slotImageView.backgroundColor = UIColor.greenColor()
                      //12
                slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), containerView.bounds.width * kThird - kMarginForSlot, containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
                
        }
    }
    
    //15
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.creditsLabel)
        
        //17
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.winnerPaidTitleLabel)
        
        
    }
    
    //19
    func setupFourthContainer(containerView: UIView) {
        
        //21
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.whiteColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        //23
        containerView.addSubview(self.resetButton)
        
        //25
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.darkGrayColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * kEighth * 3, y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        //27
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betMaxButton.backgroundColor = UIColor.greenColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * kEighth * 5, y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        //29
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.spinButton.backgroundColor = UIColor.redColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * kEighth * 7, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }
    
    //36
    func removeSlotImageViews() {
        
        if self.secondContainer != nil {
            let container: UIView? = self.secondContainer
            let subViews: Array? = container!.subviews
            
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }
    
    //38
    func hardReset() {
        removeSlotImageViews()
        self.slots.removeAll(keepCapacity: true)
        self.setupSecondContainer(self.secondContainer)
        
        //40
        self.credits = 50
        self.winnings = 0
        self.currentBet = 0
        
        //44
        updateMainView()
       
    }
    
    //43
    func updateMainView() {
        
        self.creditsLabel.text = String(self.credits)
        self.betLabel.text = String(self.currentBet)
        self.winnerPaidLabel.text = String(self.winnings)
    }
    
    //45
    func showAlertWithText(header: String = "Warning", message: String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}