//
//  Model.swift
//  GeniusGame
//
//  Created by William Moraes da Silva on 16/09/21.
//

import Foundation

class Game {
    
    var winnerSequence = [Int]()
     
    var playerClickPosition = 0
    var playerTurn = false
    var endGame = false
    var playerWin = false
    
    func newRound(){
        print("ANTIGA SEQUENCIA")
       print(winnerSequence)
        
        
        winnerSequence.append(Int( arc4random_uniform(UInt32(4))))
        print("NOVA SEQUENCIA")
        print(winnerSequence)
        playerClickPosition = 0
        
    }
    
    func buttonClick(index : Int ){
      
        if winnerSequence.count > playerClickPosition {
            if index == winnerSequence[playerClickPosition] {
            print("ACERTOU !")
                
        }
            
        else {
            print("ERROU !")
            
            playerTurn = false
            endGame = true
            winnerSequence = [] // restart gam sequence
            
             
        }
            playerClickPosition += 1
            if playerClickPosition == winnerSequence.count {
                playerTurn = false
                playerWin = true
                // deve iniciar LOOP CPU automaticamente
                  print("turno da CPU")
            }
        }
        
    }

}

