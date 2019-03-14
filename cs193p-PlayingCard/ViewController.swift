//
//  ViewController.swift
//  cs193p-PlayingCard
//
//  Created by Grigoriy Romanyuk on 3/13/19.
//  Copyright © 2019 Grigoriy Romanyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

