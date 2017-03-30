//
//  TitleScene.swift
//  Binmatch
//
//  Created by Andy-E on 2017-03-28.
//  Copyright © 2017 Andy-E. All rights reserved.
//

import SpriteKit
import GameplayKit


class TitleScene: SKScene {
    
    let play = SKLabelNode(fontNamed: "Helvetica-Bold")
    let howToPlay = SKLabelNode(fontNamed: "Helvetica-Bold")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        let NumbersTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        NumbersTag.fontColor = SKColor.blue
        NumbersTag.text = "BinMatch"
        NumbersTag.fontSize = 70
        NumbersTag.position = CGPoint(x: size.width*0.5, y: size.height*0.75) // Spaced across middle of scene
        self.addChild(NumbersTag)
        
        let highScore = SKLabelNode(fontNamed: "Helvetica-Bold")
        highScore.fontColor = SKColor.red
        highScore.text = "Highscore"
        highScore.fontSize = 30
        highScore.position = CGPoint(x: size.width*0.5, y: size.height*0.25) // Spaced across middle of scene
        self.addChild(highScore)
        
        let highScoreNum = SKLabelNode(fontNamed: "Helvetica-Bold") //need to put proper varible
        highScoreNum.fontColor = SKColor.red
        highScoreNum.text = "0" //put here
        highScoreNum.fontSize = 30
        highScoreNum.position = CGPoint(x: size.width*0.5, y: size.height*0.17) // Spaced across middle of scene
        self.addChild(highScoreNum)
        
        play.fontColor = SKColor.green
        play.text = "Play!"
        play.fontSize = 40
        play.position = CGPoint(x: size.width*0.5, y: size.height*0.5) // Spaced across middle of scene
        self.addChild(play)
        
        
        howToPlay.fontColor = SKColor.red
        howToPlay.text = "How to Play" //put here
        howToPlay.fontSize = 25
        howToPlay.position = CGPoint(x: size.width*0.80, y: size.height*0.95) // Spaced across middle of scene
        self.addChild(howToPlay)
        
    }
    
    // This allows the scene to respond to a touch
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        // A touch actually has many points (since a finger is large) so
        // only proceed if we can get the first touch
        guard let touch = touches.first else {
            return
        }
        
        // Get the location of the first touch
        let touchLocation = touch.location(in: self)
        
        if play.frame.contains(touchLocation) {
            print("play time!")
            
            // Create the menu scene with the same dimensions as the current scene
            let game = GameScene(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
            
            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            self.view!.presentScene(game, transition: reveal)
        }
        
        if howToPlay.frame.contains(touchLocation) {
            print("how to play")
            
            // Create the menu scene with the same dimensions as the current scene
            let game = HowToPlay(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
            
            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            self.view!.presentScene(game, transition: reveal)
        }
        
    }
    
    
}
