//
//  CommentaryViewController.swift
//  AdultQuiz
//
//  Created by 金子広樹 on 2022/11/21.
//

import UIKit

class CommentaryViewController: UIViewController {

    @IBOutlet weak var quizNumberCommentaryLabel: UILabel!
    @IBOutlet weak var commentaryLabel: UITextView!
    
    var selectLevel = 0
    var csvArray: [String] = []
    var quizArray: [String] = []
    var commentary = ""                         //解説格納変数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizNumberCommentaryLabel.text = "レベル\(selectLevel)のかいせつ\n"
        commentaryLabel.text = "問題のかいせつ\n\n"
        
        
    
        for i in 0..<csvArray.count {
            quizArray = csvArray[i].components(separatedBy: ",")
            commentary = quizArray.last!
            commentaryLabel.text += "問題\(i + 1)\n"
            commentaryLabel.text += "\(commentary)\n\n"
        }
    }
    
    @IBAction func toScoreViewButtonAction(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
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
