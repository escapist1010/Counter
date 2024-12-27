//
//  ViewController.swift
//  Counter
//
//  Created by MacUser on 12/27/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let currentDate = Date()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M.yyyy H:mm:ss"
        return formatter
    }()
    
    private var counter: Int = 0
    
    enum counterStatusVariants {
        case rise
        case fall
        case reset
        case nothingToReduce
    }
    
    private func logToTextView(counterStatus: counterStatusVariants) {
        let formattedDate = dateFormatter.string(from: currentDate)
        
        switch counterStatus {
        case .rise:
            logTextView.text += "\n\(formattedDate): значение изменено на +1"
        case .fall:
            logTextView.text += "\n\(formattedDate): значение изменено на -1"
        case .reset:
            logTextView.text += "\n\(formattedDate): значение сброшено"
        case .nothingToReduce:
            logTextView.text += "\n\(formattedDate): попытка уменьшить значение счётчика ниже 0"
        }
            
//      Scrolling UITextView when adding a line
        let range = NSRange(location: logTextView.text.count - 1, length: 0)
        logTextView.scrollRangeToVisible(range)
        textToCounterLabel()
    }
        
    private func textToCounterLabel() {
            counterLabel.text = "Значение счётчика: \(counter)"
    }

    @IBAction private func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            logToTextView(counterStatus: .fall)
        } else {
            logToTextView(counterStatus: .nothingToReduce)
        }
    }
    
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        logToTextView(counterStatus: .rise)
    }
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        logToTextView(counterStatus: .reset)
    }
        
}
