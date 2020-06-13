//
//  MemoryController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 5/1/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import AVFoundation

class MemoryController: UIViewController,AVAudioPlayerDelegate{

    @IBOutlet weak var startGamebtn: UIButton!
    @IBOutlet var soundBtn: [UIButton]!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    var sound1Player: AVAudioPlayer!
    var sound2Player: AVAudioPlayer!
    var sound3Player: AVAudioPlayer!
    var sound4Player: AVAudioPlayer!
    
    var playlist=[Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    var level = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles ()
        // Do any additional setup after loading the view.
    }
    
    func setupAudioFiles ()
    {
        let soundFilePath1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "1", ofType: "wav")!)
        let soundFilePath2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "2", ofType: "wav")!)
        let soundFilePath3 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "3", ofType: "wav")!)
        let soundFilePath4 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "4", ofType: "wav")!)
        
       
        do
        {
            try sound1Player = AVAudioPlayer(contentsOf:soundFilePath1 as URL)
            try sound2Player =  AVAudioPlayer(contentsOf:soundFilePath2 as URL)
            try sound3Player = AVAudioPlayer(contentsOf:soundFilePath3 as URL)
            try sound4Player = AVAudioPlayer(contentsOf:soundFilePath4 as URL)

            
            
            
        }catch{
            print("error")
        }
        sound1Player.delegate = self
        sound2Player.delegate = self
        sound3Player.delegate = self
        sound4Player.delegate = self
        
        sound1Player.numberOfLoops = 0
        sound2Player.numberOfLoops = 0
        sound3Player.numberOfLoops = 0
        sound4Player.numberOfLoops = 0
        


    }
  
    func checkIfCorrect (buttonPressed:Int) {
        if buttonPressed == playlist[numberOfTaps] {
            if numberOfTaps == playlist.count - 1 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
                    self.NextRound()
                }
                return
            }
            
            numberOfTaps += 1
        }else{ // GAME OVER
            resetGame()
        }
    }
    
    func resetGame ()
    {
        level = 1
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        playlist = []
        levelLabel.text = "Game Over"
        startGamebtn.isHidden = false
        disableButtons()
        
    }
    func NextRound ()
    {
        level += 1
        levelLabel.text = "Level \(level)"
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        disableButtons()

        let randomNumberr = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumberr)
        PlayNextItem()

    
        
    }
    @IBAction func startGameAction(_ sender: Any) {
        levelLabel.text = "Level 1"
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        startGamebtn.isHidden = true
        PlayNextItem()
        
    }
    
    
    
    @IBAction func soundBtnPressed(_ sender: Any) {
        
        if readyForUser
        {
            let button = sender as! UIButton
            
            switch button.tag {
            case 1:
                sound1Player.play()
                checkIfCorrect(buttonPressed: 1)
                break
            case 2:
                sound2Player.play()
                checkIfCorrect(buttonPressed: 2)
                break
            case 3:
                sound3Player.play()
                checkIfCorrect(buttonPressed: 3)
                break
            case 4:
                sound4Player.play()
                checkIfCorrect(buttonPressed: 4)
                break
            default:
                break
            }
        }
        
    
        
        }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if currentItem <= playlist.count - 1
        {
            PlayNextItem()

            
        }else
        {
            readyForUser = true
            setNoHigh()
            enableButtons()
        }
    }
    
    func PlayNextItem()
    {
        let selectedItem = playlist[currentItem]
        switch selectedItem {
        case 1:
            highlightBtnTag(tag: 1)
            sound1Player.play()
            break
        case 2:
            highlightBtnTag(tag: 2)
            sound2Player.play()
            break
        case 3:
            highlightBtnTag(tag: 3)
            sound3Player.play()
            break
        case 4:
            highlightBtnTag(tag: 4)
            sound4Player.play()
            break
        default:
            break ;
        }
        currentItem += 1
    }
    func highlightBtnTag(tag:Int)
    {
        switch tag {
        case 1:
            setNoHigh()
            soundBtn[tag - 1].setImage(UIImage(named: "redPressed"), for: .normal)
        case 2:
            setNoHigh()
            soundBtn[tag - 1].setImage(UIImage(named: "yellowPressed"), for: .normal)
        case 3:
            setNoHigh()
            soundBtn[tag - 1].setImage(UIImage(named: "bluePressed"), for: .normal)
        case 4:
            setNoHigh()
            soundBtn[tag - 1].setImage(UIImage(named: "greenPressed"), for: .normal)
        default:
            break
        }
        
    }
    
    func setNoHigh()
    {
        soundBtn[0].setImage(UIImage(named: "red"), for: .normal)
        soundBtn[1].setImage(UIImage(named: "yellow"), for: .normal)
        soundBtn[2].setImage(UIImage(named: "blue"), for: .normal)
        soundBtn[3].setImage(UIImage(named: "green"), for: .normal)

    }
    
    func disableButtons ()
    {
        for button in soundBtn
        {
            button.isUserInteractionEnabled = false

        }
    }
    func enableButtons ()
    {
        for button in soundBtn
        {
            button.isUserInteractionEnabled = true
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
