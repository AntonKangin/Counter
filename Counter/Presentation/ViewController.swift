//
//  ViewController.swift
//  Counter
//
//  Created by Антон Кангин on 22.09.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter: UInt = 0
    private enum Event {
        case plus, minus, error, clear
    }
    
    @IBOutlet private weak var historyText: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    
    @IBAction private func plusButtonTap(_ sender: Any) {
        counter += 1
        addTextToHistoryText(for: .plus)
    }
    
    @IBAction private func minusButtonTap(_ sender: Any) {
        guard counter > 0 else {
            addTextToHistoryText(for: .error)
            return
        }
        counter -= 1
        addTextToHistoryText(for: .minus)
    }
    
    @IBAction private func clearButtonTap(_ sender: Any) {
        counter = 0
        addTextToHistoryText(for: .clear)
    }
    
    
    private func addTextToHistoryText(for event: Event) {
        let dateTime = Date().dateTimeString
        
        switch event {
        case .plus:
            historyText.insertText("\n [\(dateTime)] значение изменено на +1")
        case .minus:
            historyText.insertText("\n [\(dateTime)] значение изменено на -1")
        case .error:
            historyText.insertText("\n [\(dateTime)] попытка уменьшить значение счетчика ниже 0")
        case .clear:
            historyText.insertText("\n [\(dateTime)] значение сброшено")
        }
        
        let textRange = NSRange(location: historyText.text.count - 1, length: 1)
        historyText.scrollRangeToVisible(textRange)
        
        counterLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

