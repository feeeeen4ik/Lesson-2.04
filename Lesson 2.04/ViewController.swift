//
//  ViewController.swift
//  Lesson 2.04
//
//  Created by Феликс Антонович on 29.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var textFieldOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLabel()
    }

    @IBAction func segmentedControlAction() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "This is first segment"
            mainLabel.textColor = .blue
        case 1:
            mainLabel.text = "This is second segment"
            mainLabel.textColor = .cyan
        default:
            mainLabel.text = "This is third segment"
            mainLabel.textColor = .orange
        }
        
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = sliderOutlet.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(sliderOutlet.value))
    }
    
    @IBAction func buttonAction() {
        guard let inputText = textFieldOutlet.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMassage: "Input text")
            return
        }
        
        let usernamePattern = "^[a-zA-Z ]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern).evaluate(with: inputText)
        
        if !isUsernameValid {
            showAlert(withTitle: "Wrong format", andMassage: "Please enter your name")
            return
        }
        
        mainLabel.text = textFieldOutlet.text
        textFieldOutlet.text = ""
    }
    
    private func setupMainLabel() {
        mainLabel.text = sliderOutlet.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        sliderOutlet.minimumValue = 0
        sliderOutlet.maximumValue = 1
        sliderOutlet.value = 1
        sliderOutlet.minimumTrackTintColor = .green
        sliderOutlet.maximumTrackTintColor = .red
        sliderOutlet.thumbTintColor = .yellow
    }
    
    private func showAlert(withTitle title: String, andMassage massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textFieldOutlet.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}

