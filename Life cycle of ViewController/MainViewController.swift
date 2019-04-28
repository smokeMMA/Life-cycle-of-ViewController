//
//  ViewController.swift
//  Life cycle of ViewController
//
//  Created by Михаил Медведев on 27/04/2019.
//  Copyright © 2019 Mikhail Medvedev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var viewDidLoadIndicator: UIView!
    @IBOutlet weak var viewWillAppearIndicator: UIView!
     @IBOutlet weak var viewDidAppearIndicator: UIView!
     @IBOutlet weak var viewWillDisappearIndicator: UIView!
     @IBOutlet weak var viewDidDisappearIndicator: UIView!
     @IBOutlet weak var viewWillLayoutSubviewsIndicator: UIView!
    @IBOutlet weak var viewDidLayoutSubviewIndicator: UIView!
    @IBOutlet weak var viewWillTransitionIndicator: UIView!

    @IBOutlet weak var historyLabel: UITextView!
    
    
    private func printMessage(_ message: String = "", line: Int = #line, function: String = #function) {
      print("\(title ?? "nil"): line: \(line) of \(function) \(message)")
    }
    
    //вызывается когда переворачиваем телефон или вызывают split view (у
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // обязательно вызвать родителя
        super.viewWillTransition(to: size, with: coordinator)
         printMessage()
          collectHistory(function: #function)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printMessage()
        collectHistory(function: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         collectHistory(function: #function)
        printMessage()
    }
    
    // между viewWillAppear и viewDidAppear находятся viewDidDisappear и viewWillDisappear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         collectHistory(function: #function)
        printMessage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
         collectHistory(function: #function)
        printMessage()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printMessage()
        collectHistory(function: #function)
    }
    
    // оба вызываются между viewWillAppear(_:)  и viewDidAppear(_:)  и при повороте экрана и splitView
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         collectHistory(function: #function)
        printMessage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         collectHistory(function: #function)
        printMessage()
    }
    
    private func collectHistory(_ message: String = "", line: Int = #line, function: String = #function) {
        
        let tabBar = tabBarController as! CustomTabBarController
        tabBar.history.append("\(title ?? "nil"): line: \(line) of \(function) \(message)")
       // historyLabel.text = tabBar.history.joined(separator: "\n")
        
        switch function {
        case "viewDidLoad()":
            viewDidLoadIndicator.backgroundColor = .green
        case "viewWillAppear(_:)":
            viewWillAppearIndicator.backgroundColor = .green
        case "viewDidAppear(_:)":
            viewDidAppearIndicator.backgroundColor = .green
        case "viewWillDisappear(_:)":
            viewWillDisappearIndicator.backgroundColor = .green
        case "viewDidDisappear(_:)":
            viewDidDisappearIndicator.backgroundColor = .green
        case "viewWillLayoutSubviews()":
            viewWillLayoutSubviewsIndicator.backgroundColor = .green
        case "viewDidLayoutSubviews()":
            viewDidLayoutSubviewIndicator.backgroundColor = .green
//        case "viewWillTransition(to:with:)":
//            viewWillTransitionIndicator.backgroundColor = .green
        default:
            break
        }
    }
    //MARK: NAVIGATION
    
}
