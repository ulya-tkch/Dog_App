//
//  MainPageViewController.swift
//  Dog3.0
//
//  Created by Kelsy McColgan on 11/11/18.
//  Copyright © 2018 Kelsy McColgan. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

var money = 0;

class MainPageViewController:UIViewController {
    @IBOutlet weak var my_dogs_button: UIButton!
    @IBOutlet weak var make_money_button: UIButton!
    @IBOutlet weak var buy_dog_button: UIButton!
    @IBOutlet weak var money_text: UILabel!
    
    var bgSoundPlayer:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MainPageViewController.playBackgroundSound(_:)), name: NSNotification.Name(rawValue: "PlayBackgroundSound"), object: nil) //add this to play audio
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainPageViewController.stopBackgroundSound), name: NSNotification.Name(rawValue: "StopBackgroundSound"), object: nil) //add this to stop the audio

       
        let dictToSend: [String: String] = ["fileToPlay": "bgMusic" ]  //would play a file named "bgMusic"
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PlayBackgroundSound"), object: self, userInfo:dictToSend) //posts the notification

        
        
        // Do any additional setup after loading the view.
    }
    
    
    //******** plays baground sound ********
    
    @objc func playBackgroundSound(_ notification: Notification) {
        
        //get the name of the file to play from the data passed in with the notification
        let name = (notification as NSNotification).userInfo!["fileToPlay"] as! String
        
        
        //if the bgSoundPlayer already exists, stop it and make it nil again
        if (bgSoundPlayer != nil){
            
            bgSoundPlayer!.stop()
            bgSoundPlayer = nil
            
            
        }
        
        //as long as name has at least some value, proceed...
        if (name != ""){
            
            //create a URL variable using the name variable and tacking on the "mp3" extension
            let fileURL:URL = Bundle.main.url(forResource:name, withExtension: "mp3")!
            
            //basically, try to initialize the bgSoundPlayer with the contents of the URL
            do {
                bgSoundPlayer = try AVAudioPlayer(contentsOf: fileURL)
            } catch _{
                bgSoundPlayer = nil
                
            }
            
            bgSoundPlayer!.volume = 0.75 //set the volume anywhere from 0 to 1
            bgSoundPlayer!.numberOfLoops = -1 // -1 makes the player loop forever
            bgSoundPlayer!.prepareToPlay() //prepare for playback by preloading its buffers.
            bgSoundPlayer!.play() //actually play
            
        }
        
        
    }
    
    
    // ******* stops background sound *******
    
    @objc func stopBackgroundSound() {
        
        //if the bgSoundPlayer isn't nil, then stop it
        if (bgSoundPlayer != nil){
            
            bgSoundPlayer!.stop()
            bgSoundPlayer = nil
            
            
        }
        
    }
    
    
    
    
    @IBAction func ToggleMakeMoney(_ sender: Any) {
        money = money + 10;
        money_text.text = "$" + String(money);
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
         money_text.text = "$" + String(money);
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "buyDogSegue" {
            if (money < 300){
                
                return false
            }else{
                money = money - 300;
                
            }
        }else if (identifier == "my_dogs_segue"){
            if (ownedDogs.count == 0) {
                return false
            }
        }
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
