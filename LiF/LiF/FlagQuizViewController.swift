//
//  FlagQuizViewController.swift
//  LiF
//
//  Created by YANG FENG LI on 8/5/18.
//  Copyright © 2018 YANG FENG LI. All rights reserved.
//

import UIKit

class FlagQuizViewController: UIViewController {
    
    @IBAction func wrong1(_ sender: UIButton) {
        createMessage(titleText: "Wrong Answer !", messageText: "Please try again. ")
    }
    @IBAction func wong2(_ sender: UIButton) {
        createMessage(titleText: "Wrong Answer !", messageText: "Please try again. ")
    }
    @IBAction func wrong3(_ sender: UIButton) {
        createMessage(titleText: "Wrong Answer !", messageText: "Please try again. ")
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
