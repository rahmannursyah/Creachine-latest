//
//  firstPageViewController.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 10/06/21.
//

import UIKit

class firstPageViewController: UIViewController {

	@IBOutlet weak var firstRandomizeButton: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		firstRandomizeButton.layer.cornerRadius = 18
		firstRandomizeButton.layer.borderWidth = 4
		firstRandomizeButton.layer.shadowRadius = 3
		firstRandomizeButton.layer.shadowOffset = CGSize(width: 0, height: 5)
		firstRandomizeButton.layer.shadowOpacity = 0.3
		firstRandomizeButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
	override var prefersStatusBarHidden: Bool {
			return true
		}
}
