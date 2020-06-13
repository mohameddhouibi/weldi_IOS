//
//  AnimalsController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 5/1/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import AVFoundation

class AnimalsController: UIViewController ,AVAudioPlayerDelegate{

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var ImageVCenter: UIImageView!
    var sound1Player: AVAudioPlayer!
    var sound2Player: AVAudioPlayer!
    var sound3Player: AVAudioPlayer!
    var sound4Player: AVAudioPlayer!
    var sound5Player: AVAudioPlayer!
    var sound6Player: AVAudioPlayer!
    var sound7Player: AVAudioPlayer!
    var sound8Player: AVAudioPlayer!
    var sound9Player: AVAudioPlayer!
    var sound10Player: AVAudioPlayer!
    var sound11Player: AVAudioPlayer!
    var sound12Player: AVAudioPlayer!
    var sound13Player: AVAudioPlayer!
    var sound14Player: AVAudioPlayer!
    var sound15Player: AVAudioPlayer!
    var sound16Player: AVAudioPlayer!
    var sound17Player: AVAudioPlayer!
    var sound18Player: AVAudioPlayer!


    
    
    func setupAudioFiles ()
    {
        let soundFilePath1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "camel", ofType: "mp3")!)
        let soundFilePath2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "rabbit", ofType: "mp3")!)
        let soundFilePath3 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "lion", ofType: "mp3")!)
        let soundFilePath4 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "giraffe", ofType: "mp3")!)
        let soundFilePath5 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "dog", ofType: "mp3")!)
        let soundFilePath6 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "cat", ofType: "mp3")!)
        let soundFilePath7 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "red", ofType: "mp3")!)
        let soundFilePath8 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "blue", ofType: "mp3")!)
        let soundFilePath9 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "green", ofType: "mp3")!)
        let soundFilePath10 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pink", ofType: "mp3")!)
        let soundFilePath11 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "orange", ofType: "mp3")!)
        let soundFilePath12 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "yellow", ofType: "mp3")!)
        let soundFilePath13 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "reddog", ofType: "mp3")!)
        let soundFilePath14 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "redcamel", ofType: "mp3")!)
        let soundFilePath15 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "redcat", ofType: "mp3")!)
        let soundFilePath16 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "redlion", ofType: "mp3")!)
        let soundFilePath17 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "redrabbit", ofType: "mp3")!)
        let soundFilePath18 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "redgiraffe", ofType: "mp3")!)
        
        
        do
        {
            try sound1Player = AVAudioPlayer(contentsOf:soundFilePath1 as URL)
            try sound2Player =  AVAudioPlayer(contentsOf:soundFilePath2 as URL)
            try sound3Player = AVAudioPlayer(contentsOf:soundFilePath3 as URL)
            try sound4Player = AVAudioPlayer(contentsOf:soundFilePath4 as URL)
            try sound5Player = AVAudioPlayer(contentsOf:soundFilePath5 as URL)
            try sound6Player =  AVAudioPlayer(contentsOf:soundFilePath6 as URL)
            try sound7Player = AVAudioPlayer(contentsOf:soundFilePath7 as URL)
            try sound8Player = AVAudioPlayer(contentsOf:soundFilePath8 as URL)
            try sound9Player = AVAudioPlayer(contentsOf:soundFilePath9 as URL)
            try sound10Player =  AVAudioPlayer(contentsOf:soundFilePath10 as URL)
            try sound11Player = AVAudioPlayer(contentsOf:soundFilePath11 as URL)
            try sound12Player = AVAudioPlayer(contentsOf:soundFilePath12 as URL)
            try sound13Player = AVAudioPlayer(contentsOf:soundFilePath13 as URL)
            try sound14Player = AVAudioPlayer(contentsOf:soundFilePath14 as URL)
            try sound15Player = AVAudioPlayer(contentsOf:soundFilePath15 as URL)
            try sound16Player = AVAudioPlayer(contentsOf:soundFilePath16 as URL)
            try sound17Player = AVAudioPlayer(contentsOf:soundFilePath17 as URL)
            try sound18Player = AVAudioPlayer(contentsOf:soundFilePath18 as URL)


            
            
            
            
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles ()

    }
   
    @IBAction func btnPressedAction(_ sender: Any) {
        
        let button = sender as! UIButton
        
        switch button.tag {
        case 1:
            labelName.text = "camel"
            ImageVCenter.image = UIImage(named: "camel")
            sound1Player.play()
            break
        case 2:
            labelName.text = "rabbit"

            ImageVCenter.image = UIImage(named: "rabbit")
            sound2Player.play()
            break
        case 3:
            labelName.text = "lion"

            ImageVCenter.image = UIImage(named: "lion")
            sound3Player.play()
            break
        case 4:
            labelName.text = "giraffe"

            ImageVCenter.image = UIImage(named: "giraffe")
            sound4Player.play()
            break
        case 5:
            labelName.text = "dog"

            ImageVCenter.image = UIImage(named: "doag")
            sound5Player.play()
            break
        case 6:
            labelName.text = "cat"
            ImageVCenter.image = UIImage(named: "c1at")
            sound6Player.play()
            break
        case 7:
            if (labelName.text == "dog")
            {
                ImageVCenter.image = UIImage(named: "reddog")
                sound13Player.play()
            }else if(labelName.text == "camel")
            {
                ImageVCenter.image = UIImage(named: "redcamel")
                sound14Player.play()
            }
            else if(labelName.text == "rabbit")
                {
                    ImageVCenter.image = UIImage(named: "redrabbit")
                    sound17Player.play()
                }
            else if(labelName.text == "lion")
                {
                    ImageVCenter.image = UIImage(named: "redlion")
                    sound16Player.play()
                }
            else if(labelName.text == "giraffe")
                {
                    ImageVCenter.image = UIImage(named: "redgiraffe")
                    sound18Player.play()
                }
            else if(labelName.text == "cat")
                {
                    ImageVCenter.image = UIImage(named: "redcat")
                    sound15Player.play()
                }
            else
                {
                    sound7Player.play()
                }
            break
        case 8:
            sound8Player.play()
            break
        case 9:
            sound9Player.play()
            break
        case 10:
            sound10Player.play()
            break
        case 11:
            sound11Player.play()
            break
        case 12:
            sound12Player.play()
            break
        default:
            break
        }
    }
    
    

}
