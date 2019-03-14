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
    

    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch  sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
        
    }
    
}

