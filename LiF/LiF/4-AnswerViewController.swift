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
        "At how many degrees on a compass is south?"
    ]
    
    //the answer of the questions
    let answers =
    [
        ["Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean"],
        ["180", "90", "270", "360"]
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
            scores += 1
            scoresLabel.text = "Score: \(Int(scores))"
        }
        else
        {
            print("wrong")
        }
        
        if (currentQuestion != questions.count)
        {
            nextQuestion()
        }
        else
        {
            //show score
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
                x = 2
            }
        }
        currentQuestion += 1

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
