//
//  ViewController.swift
//  AdultQuiz
//
//  Created by 金子広樹 on 2022/11/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func startButtonAction(_ sender: Any) {
        if let soundURL = Bundle.main.url(forResource: "決定ボタンを押す木琴", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
    }
}

