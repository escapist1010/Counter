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
    private var counter: Int = 0
    
    enum logStatusVariants {
        case plus
        case minus
        case reset
        case zero
    }
    
    @IBAction private func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            textToCounterLabel()
            logToTextView(logStatus: .minus)
        } else {
            logToTextView(logStatus: .zero)
        }
    }
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        textToCounterLabel()
        logToTextView(logStatus: .plus)
    }
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        textToCounterLabel()
        logToTextView(logStatus: .reset)
    }
    
    private func logToTextView(logStatus: logStatusVariants) {
        switch logStatus {
        case .plus:
            logTextView.text += "\n\(currentDate()): значение изменено на +1"
        case .minus:
            logTextView.text += "\n\(currentDate()): значение изменено на -1"
        case .reset:
            logTextView.text += "\n\(currentDate()): значение сброшено"
        case .zero:
            logTextView.text += "\n\(currentDate()): попытка уменьшить значение счётчика ниже 0"
        }
        
//      Прокрутка textView при добавлении новой строки
        let range = NSRange(location: logTextView.text.count - 1, length: 0)
        logTextView.scrollRangeToVisible(range)
    }
    
    private func textToCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func currentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        return "\(day).\(month).\(year) \(hour):\(minute):\(second)"
    }

}
