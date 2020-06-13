//
//  ABCController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/30/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import AVFoundation


class ABCController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var btnNextOutlet: UIButton!
    @IBOutlet weak var btnPrevOutlet: UIButton!
    @IBOutlet weak var btnSoundOutlet: UIButton!
    @IBOutlet weak var btnCloseOutlet: UIButton!
    
    
    var arrayOfFile = NSMutableArray()
    var audioPlayer : AVAudioPlayer!
    var index:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        arrayOfFile = ["A","B","C","D","E","F","G","H","I","J","K"]
        
        imageview.image = UIImage(named: arrayOfFile[index] as! String)
        playSound(soundName: "song")
    }
    
    func playSound(soundName: String)
    {

        let coinSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
        do
        {
        audioPlayer = try AVAudioPlayer(contentsOf:coinSound as URL)
        audioPlayer.prepareToPlay()
        audioPlayer.play()

        }catch{
            print("error")
        }
    }
    
    @IBAction func btnNextAction(_ sender: Any) {
        
        if (index < arrayOfFile.count)
        {
            if (index == arrayOfFile.count-1)
            {
                let alert = UIAlertController(title: "", message: "no more", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                    
                })
                alert.addAction(closeAction)
                self.present(alert,animated: true,completion: nil)
                
            }else
            {
                index = index + 1
                playSound(soundName: "song")
                imageview.image = UIImage(named: arrayOfFile[index] as! String)
            }
            
        }
        
    }
    @IBAction func btnPrevAction(_ sender: Any) {
        
        if (index >= 0)
        {
            if (index == 0)
            {
                let alert = UIAlertController(title: "", message: "no more", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                    
                })
                alert.addAction(closeAction)
                self.present(alert,animated: true,completion: nil)
                
            }else
            {
                index = index - 1
                playSound(soundName: "song")
                imageview.image = UIImage(named: arrayOfFile[index] as! String)
            }
            
        }
        
    }
    @IBAction func btnSoundAction(_ sender: Any) {
        
        playSound(soundName: "song")
    }
    @IBAction func btnCloseAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    


}
