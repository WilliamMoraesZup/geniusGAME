//
//  ViewController.swift
//  GeniusGame
//
//  Created by William Moraes da Silva on 16/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var gameColors = [#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)]
    
    var game = Game()
    var round = Turn.PLAYER_TURN
    
    var endGame : Bool {  return game.endGame }
    var playerWin : Bool {  return game.playerWin }
    var enablePlayer : Bool {  return game.playerTurn   }
    
    
    enum Turn {
        case PLAYER_TURN
        case CPU_TURN
    }
    
    
    func initGame() {
        round = Turn.CPU_TURN
        game.endGame = false
        
        // verify if CPU is running
        if  round == .CPU_TURN {
            
            game.newRound()
            
            loop()

            // when loops ends, player turn is ON
             
        }
    }
    // on click Start button
    @IBAction func StartButton(_ sender: UIButton) {
        
        // on click in start button, CPU start to press button colors
//        round = Turn.CPU_TURN
//        game.endGame = false
        initGame()
    }
    
    
    
    @IBAction func Button(_ sender: UIButton) {
        
        if round == .PLAYER_TURN, game.playerTurn {
            
            if let index = ButtonsCollection.firstIndex(of: sender){
                game.buttonClick(index: index)
                
                if playerWin {
                   
                    round = Turn.CPU_TURN
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                        self.initGame()
                    }
                    game.playerWin = false 
                }
            
                
                if endGame {
                    endGamePopup()
                }
            }
            sender.pulse
        }
    }
    
    
    //LOOP OF CPU TURN s
    func loop() {
        var i = 0
        print(game.winnerSequence)
        func nextIteration() {
            
            if i < game.winnerSequence.count {
                
                print( ButtonsCollection[game.winnerSequence[i]])
                ButtonsCollection[game.winnerSequence[i]].pulse
                                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    nextIteration()
                }
                
                i += 1

            }
            else {
                round = .PLAYER_TURN
                game.playerTurn = true
                
            }
        }
        
        nextIteration()
        
    }
    
    
    func endGamePopup (){
        let alert = UIAlertController(title: "Game Over", message: "Você perdeu, tente novamente", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        StartButton.isEnabled = true
        
    }
    
    func updateButtons(){
        for each in ButtonsCollection.indices{
            ButtonsCollection[each].backgroundColor = gameColors[each]
        }
    }
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet var ButtonsCollection: [UIButton]!  {
        didSet{
            updateButtons()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}




extension UIButton {
    
    var pulse : UIButton {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1 )
        self.alpha = 0.2
        UIView.animate(withDuration: 1,  animations: {
            self.transform = CGAffineTransform.identity
            self.alpha = 1.0
        }  )
        return self
        
    }
}
