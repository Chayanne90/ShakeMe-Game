//
//  ViewController.swift
//  ShakeMe
//
//  Created by Chayanne on 8/19/17.
//  Copyright © 2017 Chayanne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startRestart: UIButton!
    @IBOutlet var imageView: UIImageView!

    var timer = Timer()
    
    var countInt = 0
    var scoreInt = 0
    var modeInt  = 0
    var imageInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startRestart.layer.cornerRadius = 10
        
        countInt = 10
        scoreInt = 0
        
        timerLabel.text = String(countInt)
        scoreLabel.text = String(scoreInt)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        if countInt == 10 {
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.startCounter), userInfo:nil, repeats: true)
            
            startRestart.isEnabled = false
            startRestart.alpha = 0.5
            
            modeInt = 1
        
        }
        
        if countInt == 0 {
            
            countInt = 10
            scoreInt = 0
            
            timerLabel.text = String(countInt)
            scoreLabel.text = String(scoreInt)
            startRestart.setTitle("Start Game", for:[])

        }
    }
    
    func startCounter(){
        
        countInt -= 1
        timerLabel.text = String(countInt)
        
        if countInt == 0 {
        
            timer.invalidate()
            startRestart.isEnabled = true
            startRestart.alpha = 1
            
            startRestart.setTitle("Restart", for: [])
            
            modeInt = 0
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            if modeInt == 1 {
                scoreInt+=1
                scoreLabel.text = String(scoreInt)
                
                imageInt+=1
                if imageInt == 5{
                
                    imageInt=1
                }
                imageView.image = UIImage(named:"Maracas\(imageInt).png")
                
                
                
            }
        }
    }
}
    
    
    




