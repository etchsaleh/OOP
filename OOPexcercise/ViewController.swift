//
//  ViewController.swift
//  OOPexcercise
//
//  Created by Hesham Saleh on 8/30/16.
//  Copyright © 2016 Hesham Saleh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var p1hpLbl: UILabel!
    
    @IBOutlet weak var p2hpLbl: UILabel!
    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var p1Img: UIImageView!
    
    @IBOutlet weak var p2Img: UIImageView!
    
    @IBOutlet weak var p1Tombstone: UIImageView!
    
    @IBOutlet weak var p2Tombstone: UIImageView!
    
    @IBOutlet weak var gameover: UIImageView!
    
    @IBOutlet weak var p1Button: UIButton!
    
    @IBOutlet weak var p2Button: UIButton!
    
    var player1: Character!
    
    var player2: Character!
    
    var sound: AVAudioPlayer!
    
    var btn: AVAudioPlayer!
    
    var lose: AVAudioPlayer!
    
    @IBAction func p1Btn(sender: AnyObject) {
        
        btnSound()
        
        btn.play()
        
        if player2.attack(player1.attackPower) {
            textLbl.text = "\(player1.name) attacked \(player2.name)! -\(player1.attackPower)HP"
            
            p2hpLbl.text = "\(player2.hp) HP"
        }
        
        let rand = Int(arc4random_uniform(UInt32(player1.attackPower)+9))
        
        player1.attackPower = rand
        
        if !player2.isAlive {
            sound.stop()
            gameoverMusic()
            lose.play()
            p2hpLbl.text = ""
            p1hpLbl.text = ""
            textLbl.text = "Great job, \(player1.name)! 😄"
            
            p2Img.hidden = true
            p2Tombstone.hidden = false
            p1Button.hidden = true
            p2Button.hidden = true
            gameover.hidden = false
        }
        
        self.p1Button.enabled = false
        
        delay()
    }
    
    @IBAction func p2Btn(sender: AnyObject) {
        
        btnSound()
        
        btn.play()
        
        if player1.attack(player2.attackPower) {
            textLbl.text = "\(player2.name) attacked \(player1.name)! -\(player2.attackPower)HP"
            
            p1hpLbl.text = "\(player1.hp) HP"
        }
        
        let rand = Int(arc4random_uniform(UInt32(player2.attackPower)+9))
        
        player2.attackPower = rand
        
        if !player1.isAlive {
            sound.stop()
            gameoverMusic()
            lose.play()
            p1hpLbl.text = ""
            p2hpLbl.text = ""
            textLbl.text = "Well done, \(player2.name)! 😄"
            
            p1Img.hidden = true
            p1Tombstone.hidden = false
            p1Button.hidden = true
            p2Button.hidden = true
            gameover.hidden = false
        }
        
        self.p2Button.enabled = false
        
        delay()
    }
    
    func enableButton() {
        if self.p2Button.enabled == false {
            self.p2Button.enabled = true
        } else if self.p1Button.enabled == false {
            self.p1Button.enabled = true
        }
    }
    
    func delay() {
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableButton", userInfo: nil, repeats: false)
    }
    
    func music() {
        
        let path = NSBundle.mainBundle().pathForResource("bgMusic", ofType: "mp3")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try sound = AVAudioPlayer(contentsOfURL: soundUrl)
            sound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func btnSound() {
        
        let path1 = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl1 = NSURL(fileURLWithPath: path1!)
        
        do {
            try btn = AVAudioPlayer(contentsOfURL: soundUrl1)
            btn.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func gameoverMusic() {
        
        let path2 = NSBundle.mainBundle().pathForResource("lose", ofType: "wav")
        
        let soundUrl2 = NSURL(fileURLWithPath: path2!)
        
        do {
            try lose = AVAudioPlayer(contentsOfURL: soundUrl2)
            lose.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        music()
        
        sound.play()
        
        sound.numberOfLoops = -1 //Continuous Loop.
        
        sound.volume = 0.3 //Volume from 0.0 to 1.0.
        
        player1 = Character(name: "Etch", hp: 120, attackPower: 25)
        
        player2 = Character(name: "Hoss", hp: 140, attackPower: 25)
        
        p1hpLbl.text = "\(player1.hp) HP"
        
        p2hpLbl.text = "\(player2.hp) HP"
        
        textLbl.text = "Press [ATTACK] to start."
        
    }
}
