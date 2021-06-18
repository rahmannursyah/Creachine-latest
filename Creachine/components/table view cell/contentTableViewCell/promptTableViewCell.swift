//
//  contentTableViewCell.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 07/06/21.
//

import UIKit

class promptTableViewCell: UITableViewCell {

	@IBOutlet weak var contentHeaderView: UIView!
	@IBOutlet weak var contentHeaderLabel: UILabel!
	@IBOutlet weak var contentRandomLabel: UILabel!
	@IBOutlet weak var contentBodyView: UIView!
    @IBOutlet weak var contentSpinAnimationView: UIImageView!
	@IBOutlet weak var lightAnimation: UIImageView!
	@IBOutlet weak var detailImageView: UIImageView!
	@IBOutlet weak var lockButton: UIButton!
	
	var isActive: Bool = false
	var loading_1: UIImage!
	var loading_2: UIImage!
	var loading_3: UIImage!
	var imagesToAnimate: [UIImage]!
	var animatedImages: UIImage!
	
	//logic untuk animasi blink
	public func animateBlinkLight(){
		loading_1 = UIImage(named: "blink-1")
		loading_2 = UIImage(named: "blink-2")
		loading_3 = UIImage(named: "blink-3")
		
		imagesToAnimate = [loading_1, loading_2, loading_3]
		
		animatedImages = UIImage.animatedImage(with: imagesToAnimate, duration: 0.8)
		lightAnimation.image = animatedImages
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
			self.lightAnimation.image = UIImage(named: "Group 143")
		}
	}
	
	@IBAction func isLockButtonPressed(_ sender: Any) {
        if isActive {
            isActive = false
            lockUnlockValidation(flag: false)
        } else {
            isActive = true
            lockUnlockValidation(flag: true)
        }
	}
    
    public func lockUnlockValidation(flag: Bool){
        if flag == true {
            // tapped lock symbol
            lockButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
            contentHeaderLabel.textColor = .white
            contentHeaderView.backgroundColor = .black
            lockButton.tintColor = .white
            lightAnimation.isHidden = true
            contentSpinAnimationView.alpha = 0
        } else {
            lockButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
            contentHeaderLabel.textColor = .black
            contentHeaderView.backgroundColor = UIColor(red: 128/255, green: 199/255, blue: 190/255, alpha: 1)
            lockButton.tintColor = .black
            lightAnimation.isHidden = false
            contentSpinAnimationView.alpha = 1
        }
    }
    
    // when set idea button is tapped, lock button for every section is enabled
    public func lockSetIdea(flag: Bool){
        if flag == true {
            // tapped "Set Idea" button
            lockButton.isEnabled = false
            contentSpinAnimationView.alpha = 0
        }
        else if flag == false {
            lockButton.isEnabled = true
            contentSpinAnimationView.alpha = 1
            contentSpinAnimationView.isHidden = true
        }
    }
    
  //MARK: -SPIN BLUR ANIMATION PNG IMAGE
            
       public func animation_0(){
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Content10ms-", duration: 0.80)
            contentSpinAnimationView.isHidden = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
          
        }
        public func animation_1(){
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Color20ms-", duration: 0.90)
            contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
        }
        
    public func animation_2(){
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Style30ms-", duration: 1.0)
            contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
        }
        
}
