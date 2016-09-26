//
//  ViewController.swift
//  newQuizz
//
//  Created by Luis  Costa on 22/09/16.
//  Copyright © 2016 Luis  Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    let questionsAnswers = QuestionsAndAnswers()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var correctAnswers: UILabel!
    @IBOutlet weak var wrongAnswers: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionsAnswers.startQuestion()
        // Handle the text field's user input through the delegate
        answerTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        let num: Int?
        
        if questionsAnswers.checkAnswer(answer: text!) {
            num = Int(correctAnswers.text!)! + 1
            correctAnswers.text = String(num!)
        } else {
            num = Int(wrongAnswers.text!)! + 1
            wrongAnswers.text = String(num!)
        }
        
        correctAnswer.text = questionsAnswers.getAnswer()
    }

    // Mark: Actions
    @IBAction func nextQuestionButton(_ sender: AnyObject) {
        questionLabel.text = questionsAnswers.getNextQuestions()
        correctAnswer.text = "Correct Answer"
    }
    
}

