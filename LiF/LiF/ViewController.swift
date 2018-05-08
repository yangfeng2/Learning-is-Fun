//
//  ViewController.swift
//  LiF
//
//  Created by YANG FENG LI on 24/4/18.
//  Copyright © 2018 YANG FENG LI. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var musicPlayer: AVAudioPlayer!
    
    func playMusicWith(fileName: String, fileExtension: String) -> Void {
        let musicURL: URL!
        musicURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        if musicURL == nil
        {
            print("requested song cannot be played")
        }
        else
        {
            do
            {
                musicPlayer = try AVAudioPlayer.init(contentsOf: musicURL)
                musicPlayer.prepareToPlay()
                musicPlayer.play()
            }
            catch
            {
                print(error)
            }
        }
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func playMusic(_ sender: UIButton) {
        pauseButton.isHidden = false
        playButton.isHidden = true
        
        playMusicWith(fileName: "joeshisha_summer", fileExtension: "mp3")
        
    }
    @IBAction func pauseMusic(_ sender: UIButton) {
        pauseButton.isHidden = true
        playButton.isHidden = false
        musicPlayer.pause()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

