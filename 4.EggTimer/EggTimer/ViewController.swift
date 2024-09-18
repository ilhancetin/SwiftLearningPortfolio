//
//  ViewController.swift
//  EggTimer
//
//  Created by I L H A N on 28.04.2022.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var states = ["Soft": 5, "Medium": 7, "Hard": 9]
    var seconds = 0
    var timer: Timer?
    var state: Int = 0
    var player: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progresBar: UIProgressView!
    
    @IBAction func eggClic(_  sender: UIButton) {
        
        progresBar.progress = 1
        
        if(timer != nil){
            timer!.invalidate()}
        
        titleLabel.text = sender.currentTitle
        
        state = states[sender.currentTitle!]! + 1
        seconds = states[sender.currentTitle!]! + 1
               
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
      
        
        print(states[sender.currentTitle!]!)
    }
    
    @objc func fireTimer() {
       seconds -= 1
       
        print(seconds)
        progresBar.progress = Float(seconds)/Float(state)
    
        if seconds == 0 {
            titleLabel.text = "Done!"
            timer!.invalidate()
            playSound()
        }
   }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
