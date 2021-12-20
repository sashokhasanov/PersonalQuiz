//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = getAnimalType()
        resultLabel.text = "Вы - \(result.rawValue)!"
        descriptionLabel.text = result.definition
    }

    private func getAnimalType() -> AnimalType {
        let results = answers.reduce(into: [:]) { result, answer in result[answer.type, default: 0] += 1 }
        return results.sorted(by: { $0.value > $1.value }).first?.key ?? .dog
    }

}
