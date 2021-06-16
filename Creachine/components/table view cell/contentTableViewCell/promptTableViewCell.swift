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
	
	//logic untuk animasi
	public func animateImages(){
		loading_1 = UIImage(named: "blink-1")
		loading_2 = UIImage(named: "blink-2")
		loading_3 = UIImage(named: "blink-3")
		
		imagesToAnimate = [loading_1, loading_2, loading_3]
		
		animatedImages = UIImage.animatedImage(with: imagesToAnimate, duration: 0.8)
		lightAnimation.image = animatedImages
		DispatchQueue.main.asyncAfter(deadline: .now()+1.1){
			self.lightAnimation.image = UIImage(named: "Group 143")
		}
	}
	
	@IBAction func isLockButtonPressed(_ sender: Any) {
		if isActive {
			isActive = false
			lockButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
		} else {
			isActive = true
			lockButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
		}
	}
    
  //MARK: -SPIN BLUR ANIMATION PNG IMAGE
   // public func slotAnimate(){
        
        //if isTapped == true{
        
        //for index in 0 ... 0 {
        
//            let imageView = cell.contentSpinAnimationView
//                imageView?.image = UIImage.animatedImageNamed("2Style30ms-", duration: 1.0)
//                imageView?.startAnimating()
            
       public func animation_0(){
        
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Content10ms-", duration: 0.80)
                
            contentSpinAnimationView.isHidden = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
          
        }
        //}
        //for index in 1 ... 1 {
        public func animation_1(){
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Color20ms-", duration: 0.90)
                
            contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
        }
        //for index in 2 ... 2 {
        
    public func animation_2(){
            contentSpinAnimationView.image = UIImage.animatedImageNamed("2Style30ms-", duration: 1.0)
                
            contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.contentSpinAnimationView.isHidden = true
            }
        }
        //}
        
    //}
    
//        //MARK: - sequence animation
//        func sequenceAnimation_0() {
//
//                UIView.animate(
//                    withDuration: 0,
//                    delay: 0,
//                    options: .curveEaseOut,
//                    animations: ({
//
//                        self.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
//                        self.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
//                    })
//                    , completion: { _ in
//                        UIView.animate(
//                            withDuration: 0.5,
//                            delay: 0.50,
//                                options: .curveEaseIn,
//                                animations: {
//                                    self.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)///y: 100
//                                    self.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)///y: 60
//                            })
//                    })
//
//        }
//        func sequenceAnimation_1(cell: promptTableViewCell) {
//            
//                UIView.animate(
//                    withDuration: 0,
//                    delay: 0,
//                    options: .curveEaseOut,
//                    animations: ({
//
//                        cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
//                        cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
//                    })
//                    , completion: { _ in
//                        UIView.animate(
//                            withDuration: 0.5,
//                            delay: 0.60,
//                                options: .curveEaseIn,
//                                animations: {
//                                    cell.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)
//                                    cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
//                            })
//                    })
//            
//        }
//        func sequenceAnimation_2(cell: promptTableViewCell) {
//            
//                UIView.animate(
//                    withDuration: 0,
//                    delay: 0,
//                    options: .curveEaseOut,
//                    animations: ({
//
//                        cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
//                        cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
//                    })
//                    , completion: { _ in
//                        UIView.animate(
//                            withDuration: 0.5,
//                            delay: 0.70,
//                                options: .curveEaseIn,
//                                animations: {
//                                    cell.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)
//                                    cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
//                            })
//                    })
//            
//        }

}
