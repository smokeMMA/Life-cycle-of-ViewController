//
//  ThirdViewController.swift
//  Life cycle of ViewController
//
//  Created by Михаил Медведев on 28/04/2019.
//  Copyright © 2019 Mikhail Medvedev. All rights reserved.
//

import UIKit

class ThirdViewController: MainViewController {

    @IBOutlet var thirdVCIndicators: [UIView]!
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
