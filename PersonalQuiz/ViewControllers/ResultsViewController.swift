//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let animalType = getResultAnimalType()
        resultLabel.text = "Вы - \(animalType.rawValue)!"
        descriptionLabel.text = animalType.definition
    }

    private func getResultAnimalType() -> AnimalType {
        let results = answers.reduce(into: [:]) { result, answer in result[answer.type, default: 0] += 1 }
        return results.sorted(by: { $0.value > $1.value }).first?.key ?? .dog
    }

}
