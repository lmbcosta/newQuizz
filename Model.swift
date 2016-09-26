//
//  Model.swift
//  newQuizz
//
//  Created by Luis  Costa on 24/09/16.
//  Copyright © 2016 Luis  Costa. All rights reserved.
//

import Foundation

// Structure that contains que qustions
// and correct answers
struct Question {
    // Properties
    var question: String
    var correctAnswer: String
    var wrongAnswers: [String]
    
    init(question: String, correctAnswer: String, wrongAnswers: [String]) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
    }
    
    // Functions
    func getQuestion() -> String {
        return correctAnswer
    }
    
    func getCorrectAnswer() -> String {
        return correctAnswer
    }
    
    func getWrongAnswers() -> [String] {
        var answers = Array<String>()
        
        for i in 0..<wrongAnswers.count {
            answers.append(wrongAnswers[i])
        }
        return answers
    }
}

// Catalog of all questions available in newQuizz
class QuestionsCatalog {
    var questionsMap = Dictionary<Int, Question>()
    
    init(questions: [[String]]) {
        for i in 0..<questions.count {
            var aux = questions[i]
            let index = i + 1
            questionsMap[index] =
                Question(question: aux[0], correctAnswer: aux[1], wrongAnswers: [aux[2], aux[3], aux[4]])
        }
    }
    
    // Functions
    func getQuestion(index: Int) -> String? {
        return questionsMap[index]?.getQuestion()
    }
    
    func getCorrectAnswer(index: Int) -> String? {
        return questionsMap[index]?.getCorrectAnswer()
    }
    
    func getAllAnswers(index: Int) -> [String]? {
        var all = questionsMap[index]?.getWrongAnswers()
        all?.append(getCorrectAnswer(index: index)!)
        
        return all
    }
}

class Model {
    //MARK: Properties
    let dataBaseArray = [["Quem foi o primeiro rei d ePortugal?",
                          "D. Afonso Henriques", "D. Afonso III", "D. Sancho II", "D. Sebastião"],
                         ["Qual a capital da Austrália?", "Camberra", "Sydney", "Melbourne", "Golad Coast"],
                         ["Em que ano estreou o filme Titanic pela primeira nos EUA?",
                          "1997", "1996", "1998", "1995"],
                         ["Em que ano a Roménia adeiu à União Europeia?", "2007", "2009", "2008", "2009"],
                         ["Quem foi o autor do quadro A Persistência da Memória?",
                          "Salvador Dali", "Gustavo Klimt", "Vincet van Gogh", "Pablo Picasso"],
                         ["Quem foi o melhor marcador do Euro 2016",
                          "Griezmann", "Álvaro Morata", "Cristiano Ronaldo", "Bale"]]
    
    let catalog = QuestionsCatalog(questions: dataBaseArray)
}


