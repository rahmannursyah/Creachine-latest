//
//  firstPageViewController.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 10/06/21.
//

import UIKit
import AVKit

class firstPageViewController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var firstRandomizeButton: UIButton!
    @IBOutlet weak var btnImageLeft: UIImageView!
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
		
//		firstRandomizeButton.layer.cornerRadius = 18
//		firstRandomizeButton.layer.borderWidth = 4
//		firstRandomizeButton.layer.shadowRadius = 3
//		firstRandomizeButton.layer.shadowOffset = CGSize(width: 0, height: 5)
//		firstRandomizeButton.layer.shadowOpacity = 0.3
//		firstRandomizeButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
	override var prefersStatusBarHidden: Bool {
			return true
		}
    
    @IBAction func moveScreensAnimation(_ sender: Any) {
		
        UIView.animate(withDuration: 0.8, animations: {
            self.btnImageLeft.transform = CGAffineTransform(translationX: +82, y: 0)
            self.firstRandomizeButton.transform = CGAffineTransform(translationX: +45, y: 0)
            self.header.transform = CGAffineTransform(translationX: 0, y: -525)
        }) {(true) in
        }


        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.performSegue(withIdentifier: "firstSegue", sender: self)
            }
        
    }
    
    
}
