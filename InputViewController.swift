//
//  InputViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonHandler(_ sender: UIButton) {
        
        cardButton.isEnabled = true
        if questionIdx < (scArray?.count)! - 1 {
            questionIdx += 1
        } else {
            questionIdx = 0
        }
        
        nextQuestion()
    }
    
    var enteredAnswer: String?
    
    var correctAnswer: String?
    
    var question: String?
    
    var questionIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(InputViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(InputViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        inputTextField.delegate = self
        
        titlesForLabels()
        
        cardButton.isEnabled = false
        nextQuestion()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        
        let currentQuestion = scArray![questionIdx]
        
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        question = currentQuestion["Question"] as? String
        
        titlesForLabels()
    }
    
    func titlesForLabels() {
        questionLabel.text = question
        correctAnswerLabel.text = correctAnswer
        correctAnswerLabel.isHidden = true
        
        inputTextField.text = nil
        inputTextField.isEnabled = true
    }
    
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = -keyboardFrame.size.height
        })
    }
    
    func keyboardWillHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = 0
        })

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        enteredAnswer = textField.text
        
        textField.isEnabled = false
        cardButton.isEnabled = true
        
        checkForCorrectAnswer()
        return true
    }
    
    func checkForCorrectAnswer() {
        if enteredAnswer?.lowercased() == correctAnswer!.lowercased() {
            print("Right")
            correctAnswerLabel.textColor = UIColor.green
        } else {
            print("Wrong")
            correctAnswerLabel.textColor = UIColor.red
        }
        correctAnswerLabel.isHidden = false
    }

    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
