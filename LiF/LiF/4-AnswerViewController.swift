//
//  4-AnswerViewController.swift
//  LiF
//
//  Created by YANG FENG LI on 8/5/18.
//  Copyright © 2018 YANG FENG LI. All rights reserved.
//

import UIKit

class __AnswerViewController: UIViewController {
    
    //create numerous questions
    let questions =
    [
        "Which is the deepest ocean in the world ?",
        "At how many degrees on a compass is south?",
        "Name the largest freshwater lake in the world?",
        "What is the world's longest river? ",
        "What is the diameter of Earth? "
    ]
    
    //the answer of the questions
    let answers =
    [
        ["Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean"],
        ["180", "90", "270", "360"],
        ["Lake Superior", "Lake Malawi","Lake Huron","Lake Michigan"],
        ["Amazon", "Yellow River", "Yangtze", "Nile"],
        ["8000 miles", "7500 miles", "9100 miles", "7000 miles"]
    ]
    
    //variables
    var currentQuestion = 0
    var rightAnswer : UInt32 = 0 //the right answer will be the first one in the "answer"
    var scores = 0
    
    //label
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoresLabel: UILabel!

    
    //answer button
    
    @IBAction func answerButtons(_ sender: AnyObject) {
        scoresLabel.text = "0"
        
        if (sender.tag == Int(rightAnswer))
        {
            if (currentQuestion == questions.count)
            {
                createMessage(titleText: "Congratulations ! ", messageText: "You have finished all question !")
            }
            else
            {
                nextQuestion()
                scores += 1
                scoresLabel.text = "Score: \(Int(scores))"
            }
        }
        else
        {
            createMessage(titleText: "Wrong Answer !", messageText: "Please try again. ")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nextQuestion()
    }
    
    func nextQuestion()
    {
        questionLabel.text = questions[currentQuestion]
        rightAnswer = arc4random_uniform(4)+1
        
        var button : UIButton = UIButton()
        var x = 1
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswer))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = x + 1;
            }
        }
        currentQuestion += 1

    }
    
    
    func createMessage(titleText: String , messageText: String)
    {
        let message = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        message.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            message.dismiss(animated: true, completion: nil)
        }))
        
        self.present(message, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
    */

}
