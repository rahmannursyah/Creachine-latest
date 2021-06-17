//
//  filterViewController.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 10/06/21.
//

import UIKit

class filterViewController: UIViewController, UITableViewDataSource, getAppendedData {

	@IBOutlet weak var filterBorderView: UIView!
	@IBOutlet weak var filterTableView: UITableView!
	
	@IBOutlet weak var applyButton: UIButton!
	@IBOutlet weak var clearAllButton: UIButton!
    
    var isDataCleared: Bool?
    
	@IBAction func clearAll(_ sender: UIButton) {
        
        isDataCleared = true
        colorCategoryContainer.removeAll()
        contentCategoryContainer.removeAll()
        styleCategoryContainer.removeAll()
        print(contentCategoryContainer.count)
		print(colorCategoryContainer.count)
        print(styleCategoryContainer.count)
        filterTableView.reloadData()
	}
    
	@IBAction func apply(_ sender: UIButton) {
		//print(appendData.count)
        isDataCleared = false
        filterTableView.reloadData()
	}
    
	@IBAction func exitModal(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
    //MARK: -FILTER: ISI ARRAY
	var colorData: [Category] = Category.colorCategory()
	var contentData: [Category] = Category.contentCategory()
	var styleData: [Category] = Category.styleCategory()
	
	var styleContainer: [Category] = []
	var contentContainer: [Category] = []
	var colorContainer: [Category] = []
		
	//Data yang untuk di Passing tetap dalam bentuk string
	var styleCategoryContainer: [String] = []
	var contentCategoryContainer: [String] = []
	var colorCategoryContainer: [String] = []
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
		
		clearAllButton.layer.cornerRadius = 18
		clearAllButton.layer.shadowRadius = 3
		clearAllButton.layer.shadowOffset = CGSize(width: 0, height: 5)
		clearAllButton.layer.shadowOpacity = 0.3
		clearAllButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		
		applyButton.layer.cornerRadius = 18
		applyButton.layer.borderWidth = 4
		applyButton.layer.shadowRadius = 3
		applyButton.layer.shadowOffset = CGSize(width: 0, height: 5)
		applyButton.layer.shadowOpacity = 0.3
		applyButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		
		filterBorderView.layer.cornerRadius = 22
		//filterBorderView.layer.borderWidth = 10
		filterTableView.dataSource = self
		
		let filterNib = UINib(nibName: "\(filterTableViewCell.self)", bundle: nil)
		filterTableView.register(filterNib, forCellReuseIdentifier: "filterCell")
		
		
		print(contentCategoryContainer)
		print(colorCategoryContainer)
		print(styleCategoryContainer)
		
//		checkIfActive(dataToCheck: contentCategoryContainer)
//		checkIfActive(dataToCheck: colorCategoryContainer)
//		checkIfActive(dataToCheck: styleCategoryContainer)

    }
    
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell") as! filterTableViewCell
		
		cell.filterHeaderView.layer.cornerRadius = 20
        cell.filterHeaderView.layer.borderWidth = 4.5
		cell.filterHeaderView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		cell.filterBodyView.layer.cornerRadius = 20
        cell.filterBodyView.layer.borderWidth = 4.5
		cell.filterBodyView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        if isDataCleared != nil{
            if isDataCleared == true {
                cell.clearAllData()
            }else{
                cell.applyData()
            }
        }
		
		if indexPath.section == 0 {
			cell.filterHeaderLabel.text = "Content"
			cell.firstFilterLabel.text = "Scene"
			cell.secondFilterLabel.text = "Fantasy"
			cell.thirdFilterLabel.text = "Object"
			cell.fourthFilterLabel.text = "Character"
			if !contentCategoryContainer.isEmpty {
				if contentCategoryContainer.contains(cell.firstFilterLabel.text ?? "Error") {
					cell.firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isActive = true
				}
				if contentCategoryContainer.contains(cell.secondFilterLabel.text ?? "Error") {
					cell.secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isSecondActive = true
				}
				if contentCategoryContainer.contains(cell.thirdFilterLabel.text ?? "Error") {
					cell.thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isThirdActive = true
				}
				if contentCategoryContainer.contains(cell.fourthFilterLabel.text ?? "Error") {
					cell.fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isFourthActive = true
				}
			}
		} else if indexPath.section == 1{
			cell.filterHeaderLabel.text = "Color"
			cell.firstFilterLabel.text = "Cool Tone"
			cell.secondFilterLabel.text = "Earth Tone"
			cell.thirdFilterLabel.text = "Pastel"
			cell.fourthFilterLabel.text = "Vibrant"
			if !colorCategoryContainer.isEmpty {
				if colorCategoryContainer.contains(cell.firstFilterLabel.text ?? "Error") {
					cell.firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isActive = true
				}
				if colorCategoryContainer.contains(cell.secondFilterLabel.text ?? "Error") {
					cell.secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isSecondActive = true
				}
				if colorCategoryContainer.contains(cell.thirdFilterLabel.text ?? "Error") {
					cell.thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isThirdActive = true
				}
				if colorCategoryContainer.contains(cell.fourthFilterLabel.text ?? "Error") {
					cell.fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isFourthActive = true
				}
			}
		} else {
			cell.filterHeaderLabel.text = "Style"
			cell.firstFilterLabel.text = "Anime"
			cell.secondFilterLabel.text = "Cartoon"
			cell.thirdFilterLabel.text = "Classic"
			cell.fourthFilterLabel.text = "(Your Own)"
			if !styleCategoryContainer.isEmpty {
				if styleCategoryContainer.contains(cell.firstFilterLabel.text ?? "Error") {
					cell.firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isActive = true
				}
				if styleCategoryContainer.contains(cell.secondFilterLabel.text ?? "Error") {
					cell.secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isSecondActive = true
				}
				if styleCategoryContainer.contains(cell.thirdFilterLabel.text ?? "Error") {
					cell.thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isThirdActive = true
				}
				if styleCategoryContainer.contains(cell.fourthFilterLabel.text ?? "Error") {
					cell.fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
                    cell.isFourthActive = true
				}
			}
		}
		
		cell.delegate = self
		
		return cell
	}
	
    //MARK: -FILTER: FUNC SELECTION
	//Untuk Add dan Remove Data via Protocol, masih belum bisa per section
	func sendDataToViewController(myData: String) {
			
			contentData = contentData.filter{ content in
				if myData.contains(content.categoryDescription!){
					contentContainer.append(content)
					contentCategoryContainer.append(content.categoryDescription!)
//					print("Appended \(content) to related Arrays")
//					print(contentContainer)
//					print(contentCategoryContainer)
				}
				return true
			}
			
			colorData = colorData.filter{ color in
				if myData.contains(color.categoryDescription!){
					colorContainer.append(color)
					colorCategoryContainer.append(color.categoryDescription!)
//					print("Appended \(String(describing: color.categoryDescription)) to related Arrays")
//					print(colorContainer.count)
//					print(colorCategoryContainer)
				}
				return true
			}
			
			styleData = styleData.filter{ style in
				if myData.contains(style.categoryDescription!){
					styleContainer.append(style)
					styleCategoryContainer.append(style.categoryDescription!)
//					print("Appended \(style) to related Arrays")
//					print(styleContainer)
//					print(styleCategoryContainer)
				}
				return true
			}
		}
	
	func removeData(myData: String) {
			if contentCategoryContainer.contains(myData){
				contentCategoryContainer.removeAll(){
					value in return value == myData
				}
				contentContainer.removeAll(){
					value in return value.categoryDescription == myData
				}
//				print("Removed \(myData) from related style Arrays")
//				print(contentContainer)
//				print(contentCategoryContainer)
			} else if colorCategoryContainer.contains(myData){
				colorCategoryContainer.removeAll(){
					value in return value == myData
				}
				colorContainer.removeAll(){
					value in return value.categoryDescription == myData
				}
//				print("Removed \(myData) from related color Arrays")
//				print(colorContainer)
//				print(colorCategoryContainer)
			}else if styleCategoryContainer.contains(myData){
				styleCategoryContainer.removeAll(){
					value in value == myData
				}
				styleContainer.removeAll(){
					value in return value.categoryDescription == myData
				}
//				print("Succesffuly removed \(myData) from related Style Arrays")
//				print(styleContainer)
//				print(styleCategoryContainer)
			}
		}
	
	func checkIfActive(dataToCheck: [String]) {
		print("masuk ke function check if active")
		if dataToCheck.count != 0 {
			for index in 0 ... 2 {
				print(index)
				let cells = filterTableView.cellForRow(at: IndexPath(row: 0, section: index)) as! filterTableViewCell
				if dataToCheck.contains(cells.firstFilterLabel.text ?? "Error") {
					cells.firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
				} else if dataToCheck.contains(cells.secondFilterLabel.text ?? "Error") {
					cells.secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
				} else if dataToCheck.contains(cells.thirdFilterLabel.text ?? "Error") {
					cells.thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
				} else if dataToCheck.contains(cells.fourthFilterLabel.text ?? "Error") {
					cells.fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
				}
			}
			
		}
		
		//masukin let Cell dalam sini buat cek cell.firstFilterLabel dst. ada atau tidak dalam container yang akan dikirim
		
//		for index in 0...2{
//			if dataToCheck.count != 0 {
////				print("array is not null")
//				let cell = filterTableView.cellForRow(at: IndexPath(row: 0, section: index)) as! filterTableViewCell
//				if dataToCheck.contains(cell.firstFilterLabel.text!) {
//				cell.firstCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
//				} else if dataToCheck.contains(cell.secondFilterLabel.text!) {
//					cell.secondCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
//				} else if dataToCheck.contains(cell.thirdFilterLabel.text!) {
//					cell.thirdCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
//				} else if dataToCheck.contains(cell.fourthFilterLabel.text!) {
//					cell.fourthCheckButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
//				}
//
//			}
//		}
		filterTableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "filterDataSegue" {
			let destVC = segue.destination as? ViewController
			destVC?.selectedContent = contentCategoryContainer
			destVC?.selectedColor = colorCategoryContainer
			destVC?.selectedStyle = styleCategoryContainer
            destVC?.checkIfFiltered()
			print("ini keluar dari filter view controller")
		} else {
			print("identifier not found")
		}
		
	}
	
}


//extension filterViewController {
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "filterDataSegue" {
//			let destVC = segue.destination as? ViewController
//			destVC?.selectedContent = contentCategoryContainer
//			destVC?.selectedColor = colorCategoryContainer
//			destVC?.selectedStyle = styleCategoryContainer
//			print("ini keluar dari filter view controller")
//		} else {
//			print("identifier not found")
//		}
//
//	}
//}
