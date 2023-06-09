//
//  ScoreViewController.swift
//  AdultQuiz
//
//  Created by 金子広樹 on 2022/11/18.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentaryButton: UIButton!
    @IBOutlet weak var returnTopButton: UIButton!
    
    var correct = 0
    var quizCount = 0
    var selectLevel = 0
    var csvArray: [String] = []
    var quizArray: [String] = []
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(correct)問正解"
        
        shareButton.layer.borderWidth = 2
        shareButton.layer.borderColor = UIColor.black.cgColor
        commentaryButton.layer.borderWidth = 2
        commentaryButton.layer.borderColor = UIColor.black.cgColor
        returnTopButton.layer.borderWidth = 2
        returnTopButton.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました","#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
        if let soundURL = Bundle.main.url(forResource: "キャンセル1", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizNumberVC = segue.destination as! CommentaryViewController
        quizNumberVC.selectLevel = selectLevel
        let csvArrayVC = segue.destination as! CommentaryViewController
        csvArrayVC.csvArray = csvArray
        let quizArrayVC = segue.destination as! CommentaryViewController
        quizArrayVC.quizArray = quizArray
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
