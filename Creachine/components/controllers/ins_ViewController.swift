//
//  ins_ViewController.swift
//  Creachine
//
//  Created by Evelyn Wijaya on 18/06/21.
//

import UIKit

class ins_ViewController: UIViewController {
    
    @IBOutlet weak var instructionP1: UIImageView!
    @IBOutlet weak var instructionP2: UIImageView!
    @IBOutlet weak var instructionP3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: -ANIMATION INSTRUCTION PART 1
        let insContent = UIImage(named: "ins_content")!
        let insColor = UIImage(named: "ins_color")!
        let insStyle = UIImage(named: "ins_style")!
        
        instructionP1.animationImages = [insContent, insStyle, insColor]
        instructionP1.animationDuration = 8
        instructionP1.startAnimating()
        
//        //MARK: -ANIMATION INSTRUCTION PART 2 A
//        let insP2_content = UIImage(named: "insP2_content")!
//        let insP2_color = UIImage(named: "insP2_color")!
//        let insP2_style = UIImage(named: "insP2_style")!
//
//        instructionP2.animationImages = [insP2_content, insP2_style, insP2_color]
//        instructionP2.animationDuration = 8
//        instructionP2.startAnimating()
        
        //MARK: -ANIMATION INSTRUCTION PART 2 b
        let s_insP2_content = UIImage(named: "s_insP2_content")!
        let s_insP2_color = UIImage(named: "s_insP2_color")!
        let s_insP2_style = UIImage(named: "s_insP2_style")!

        instructionP2.animationImages = [s_insP2_content, s_insP2_style, s_insP2_color]
        instructionP2.animationDuration = 8
        self.instructionP2.startAnimating()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0){
//            self.instructionP2.startAnimating()
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismiss(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
}
