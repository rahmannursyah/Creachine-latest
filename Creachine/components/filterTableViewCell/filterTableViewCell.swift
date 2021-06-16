//
//  filterTableViewCell.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 10/06/21.
//

import UIKit

protocol getAppendedData {
	func sendDataToViewController(myData: String)
	func removeData(myData: String)
	func checkIfActive(dataToCheck: [String])
}

class filterTableViewCell: UITableViewCell {
	
	@IBOutlet weak var filterHeaderLabel: UILabel!
	@IBOutlet weak var filterHeaderView: UIView!
	@IBOutlet weak var filterBodyView: UIView!
	
	@IBOutlet weak var firstCheckButton: UIButton!
	@IBOutlet weak var firstFilterLabel: UILabel!
	
	@IBOutlet weak var secondCheckButton: UIButton!
	@IBOutlet weak var secondFilterLabel: UILabel!
	
	@IBOutlet weak var thirdCheckButton: UIButton!
	@IBOutlet weak var thirdFilterLabel: UILabel!
	
	@IBOutlet weak var fourthCheckButton: UIButton!
	@IBOutlet weak var fourthFilterLabel: UILabel!
	
	var isActive: Bool = false
	var isSecondActive: Bool = false
	var isThirdActive: Bool = false
	var isFourthActive: Bool = false
	var dataToAppend: [String] = []
	var delegate: getAppendedData?
	
	
	@IBAction func checkedButton(_ sender: Any) {
		if isActive {
			print(isActive)
			self.delegate?.removeData(myData: firstFilterLabel.text!)
			isActive = false
			print(isActive)
			firstCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
		}
		else {
			self.delegate?.sendDataToViewController(myData: firstFilterLabel.text!)
			isActive = true
			firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
		}
	}

	@IBAction func secondCheckedButton(_ sender: Any) {
		if isSecondActive {
			self.delegate?.removeData(myData: secondFilterLabel.text!)
			isSecondActive = false
			secondCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
		} else {
			self.delegate?.sendDataToViewController(myData: secondFilterLabel.text!)
			isSecondActive = true
			secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
		}
	}
	@IBAction func thirdCheckedButton(_ sender: Any) {
		if isThirdActive {
			self.delegate?.removeData(myData: thirdFilterLabel.text!)
			isThirdActive = false
			thirdCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
		} else {
			self.delegate?.sendDataToViewController(myData: thirdFilterLabel.text!)
			isThirdActive = true
			thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
		}
	}
	@IBAction func fourthCheckedButton(_ sender: Any) {
		if isFourthActive {
			self.delegate?.removeData(myData: fourthFilterLabel.text!)
			isFourthActive = false
			fourthCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
		} else {
			self.delegate?.sendDataToViewController(myData: fourthFilterLabel.text!)
			isFourthActive = true
			fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
		}
	}
    
    public func clearAllData(){
        firstCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
        secondCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
        thirdCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
        fourthCheckButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
    }
    
    public func applyData(){
        firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
        secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
        thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
        fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
    }
}
