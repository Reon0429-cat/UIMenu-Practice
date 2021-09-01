//
//  ViewController.swift
//  UIMenu-Practice
//
//  Created by 大西玲音 on 2021/09/01.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var button: UIButton!
    
    private enum Color: String, CaseIterable {
        case red
        case blue
        case green
        case yellow
        
        var imageName: String {
            switch self {
                case .red: return "flame"
                case .blue: return "drop"
                case .green: return "leaf"
                case .yellow: return "bolt"
            }
        }
    }
    private var isLabelHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func buttonDidTapped(_ sender: Any) {
        showButtonMenu()
    }
    
    private func showButtonMenu() {
        button.menu = buttonMenu()
        button.showsMenuAsPrimaryAction = true
    }
    
    private func buttonMenu() -> UIMenu {
        let actions = Color.allCases
            .map { color in
                UIAction(title: color.rawValue,
                         image: UIImage(systemName: color.imageName)) { _ in
                    self.label.text = color.rawValue
                }
            }
        let hideAction = UIAction(title: isLabelHidden ? "表示する" : "非表示にする",
                                  image: UIImage(systemName: "trash"),
                                  attributes: .destructive) { _ in
            self.isLabelHidden.toggle()
            self.label.isHidden = self.isLabelHidden
            self.showButtonMenu()
        }
        let colorItems = UIMenu(title: "",
                                options: .displayInline,
                                children: actions)
        return UIMenu(title: "カラーズ",
                      options: .displayInline,
                      children: [colorItems, hideAction])
    }
    
}

