//
//  CounterProAppViewController.swift
//  CounterProApp
//
//  Created by Иван Доронин on 21.07.2023.
//

import UIKit

class CounterProAppViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var increaseCounterButton: UIButton!
    
    @IBOutlet weak var decreaseCounterButton: UIButton!
    
    @IBOutlet weak var resetCounterButton: UIButton!
    
    @IBOutlet weak var infoTextView: UITextView!
    
    private var counter: Int = 0
    
    private var dateFormatter = DateFormatter()
    
    // MARK: Calculated propertie for current date and time.
    private var getCurrentTime: String {
        get {
            let currentDate = Date()
            return dateFormatter.string(from: currentDate)
        }
    }
    
    private var info: String = "История изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        // MARK: Setup backgound view.
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 14
        backgroundView.backgroundColor = Constants.Colors.backgorundColor
        
        // MARK: Setup counter label.
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.text = "Значение счетчика: \(counter)"
        counterLabel.textColor = .systemBlue
        counterLabel.textAlignment = .center
        counterLabel.font = counterLabel.font.withSize(23)
    
        
        // MARK: Setup increase button.
        increaseCounterButton.translatesAutoresizingMaskIntoConstraints = false
        increaseCounterButton.backgroundColor = .black
        increaseCounterButton.tintColor = .white
        increaseCounterButton.layer.cornerRadius = 25
        increaseCounterButton.titleLabel?.font = .systemFont(ofSize: 25)
        
        // MARK: Setup decrease button.
        decreaseCounterButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseCounterButton.backgroundColor = .black
        decreaseCounterButton.tintColor = .white
        decreaseCounterButton.layer.cornerRadius = 25
        decreaseCounterButton.titleLabel?.font = .systemFont(ofSize: 20)
        
        // MARK: Setup reset button.
        resetCounterButton.translatesAutoresizingMaskIntoConstraints = false
        resetCounterButton.setTitle("Отчистить счетчик!", for: .normal)
        resetCounterButton.backgroundColor = .black
        resetCounterButton.tintColor = .white
        resetCounterButton.layer.cornerRadius = 14
    
        
        // MARK: Setup text view.
        infoTextView.text = info
        infoTextView.isEditable = false
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.font = infoTextView.font?.withSize(20)
        
        // MARK: Setup date formatter.
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = .current
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // MARK: Constraints for background view.
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: view.frame.width - 30),
            backgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            // MARK: Constraints for counter label.
            counterLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            counterLabel.widthAnchor.constraint(equalToConstant: 250),
            counterLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Constraints for reset button.
            resetCounterButton.widthAnchor.constraint(equalToConstant: 150),
            resetCounterButton.heightAnchor.constraint(equalToConstant: 50),
            resetCounterButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 50),
            resetCounterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetCounterButton.leftAnchor.constraint(equalTo: increaseCounterButton.rightAnchor, constant: 10),
            resetCounterButton.rightAnchor.constraint(equalTo: decreaseCounterButton.leftAnchor, constant: -10),
            
            // MARK: Constraints for increase button.
            increaseCounterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            increaseCounterButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 50),
            increaseCounterButton.widthAnchor.constraint(equalToConstant: 50),
            increaseCounterButton.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Constraints for decrease button.
            decreaseCounterButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 50),
            decreaseCounterButton.leftAnchor.constraint(equalTo: resetCounterButton.rightAnchor, constant: 15 ),
            decreaseCounterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            decreaseCounterButton.widthAnchor.constraint(equalToConstant: 50),
            decreaseCounterButton.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Constraints for text view.
            infoTextView.topAnchor.constraint(equalTo: decreaseCounterButton.bottomAnchor, constant: 30),
            infoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoTextView.widthAnchor.constraint(equalToConstant: view.frame.width - 30),
            infoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    

    @IBAction func increaseButtonTapped(_ sender: Any) {
        counter += 1
        info += "\n\(getCurrentTime): значение изменено на +1."
        counterLabel.text = "Значение счетчика: \(counter)"
        infoTextView.text = info
    }
    
    @IBAction func decreaseButtonTapped(_ sender: Any) {
        if (counter > 0) {
            counter -= 1
            info += "\n\(getCurrentTime): значение изменено на -1."
        } else {
            info += "\n\(getCurrentTime): попытка уменьшить значение счетчика ниже 0."
        }
        
        counterLabel.text = "Значение счетчика: \(counter)"
        infoTextView.text = info
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        counter = 0
        info += "\n\(getCurrentTime): значение сброшено."
        infoTextView.text = info
        counterLabel.text = "Значение счетчика: \(counter)"
    }
}

