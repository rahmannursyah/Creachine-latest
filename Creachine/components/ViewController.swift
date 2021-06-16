//
//  ViewController.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 07/06/21.
//

import UIKit
import AVFoundation

// MARK: - Variables
    private var pics: [UIImage] = [
        UIImage(named: "pic1")!,
        UIImage(named: "pic2")!,
        UIImage(named: "pic3")!,
        UIImage(named: "pic4")!,
        UIImage(named: "pic5")!,
        UIImage(named: "pic6")!,
        UIImage(named: "pic7")!,
        UIImage(named: "pic8")!,
        UIImage(named: "pic9")!,
        UIImage(named: "pic10")! ]
    private var labels: [String] = ["Index 0",
                                    "index 1",
                                    "index 2",
                                    "index 3",
                                    "index 4",
                                    "index 5",
                                    "index 6",
                                    "index 7",
                                    "index 8",
                                    "index 9"]
    
    private var numbers: [Int] = [0,1,2]


class ViewController: UIViewController, UITableViewDataSource{
// MARK: - Outlets
	@IBOutlet weak var promptTableView: UITableView!
	@IBOutlet weak var borderView: UIView!
	
	@IBOutlet weak var randomizeButton: UIButton!
	@IBOutlet weak var setIdeaButton: UIButton!
	@IBOutlet weak var filterButton: UIButton!
	
	@IBAction func setIdea(_ sender: Any) {
	}
    
    var isTapped: Bool = false
    
	//Array untuk simpan static Data
	var colorData: [Color] = Color.ColorData()
	var contentData: [Content] = Content.ContentData()
	var styleData: [Style] = Style.StyleData()
		
	//Array untuk simpan Data yang dipassing dari filter
	var selectedStyle: [String] = []
	var selectedContent: [String] = []
	var selectedColor: [String] = []
	
	//Array untuk simpan hasil filter dari static Data
	var styleContainer: [Style] = []
	var contentContainer: [Content] = []
	var colorContainer: [Color] = []
	
	var isClicked = false
	
	@IBAction func randomize(_ sender: UIButton) {
		
		isClicked = true
		
		filterContentData()
		filterColorData()
		filterStyleData()
		
        for index in 0...2 {
			if index == 0 {
				//masukin buat content container
				numbers[index] = Int.random(in: 0..<contentContainer.count)
			}
			else if index == 1 {
				//masukin buat color container
				numbers[index] = Int.random(in: 0..<colorContainer.count)
			}
			else if index == 2 {
				//masukin buat style container
				numbers[index] = Int.random(in: 0..<styleContainer.count)
			}
			
			
        }
        print (numbers)
        isTapped = true
//        slotAnimate()
        promptTableView.reloadData()
        ///problem: cell have to be clicked first
    
        // MARK: - sound
        let urlString = Bundle.main.path(forResource: "audio", ofType: "wav")

        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else{
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

            guard let player = player else{
                return
            }

            player.play()
        }
        catch{
            print ("something wrong :(")
        }
    }
//    MARK: - Variables
        var player: AVAudioPlayer?
        
//    MARK: - Actions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
//		let filterButton = openFilterButton(frame: CGRect(x: 248, y: 130, width: 102, height: 32))
//		view.addSubview(filterButton)
//		filterButton.configure(with: openfilterButtonViewModel(text: "Filter off", icon: UIImage(systemName: "line.horizontal.3.decrease.circle.fill"), backgroudColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        
		contentContainer = contentData
		colorContainer = colorData
		styleContainer = styleData
//		print(contentContainer[0].contentDescription)
		
        //MARK: - CUSTOMIZE BUTTON
		filterButton.layer.cornerRadius = 9
        filterButton.layer.shadowRadius = 2.5
        filterButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        filterButton.layer.shadowOpacity = 0.3
        filterButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		
		setIdeaButton.layer.cornerRadius = 18
		setIdeaButton.layer.shadowRadius = 3
		setIdeaButton.layer.shadowOffset = CGSize(width: 0, height: 5)
		setIdeaButton.layer.shadowOpacity = 0.3
		setIdeaButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		
		randomizeButton.layer.cornerRadius = 18
		randomizeButton.layer.borderWidth = 4
		randomizeButton.layer.shadowRadius = 3
		randomizeButton.layer.shadowOffset = CGSize(width: 0, height: 5)
		randomizeButton.layer.shadowOpacity = 0.3
		randomizeButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //MARK: -CUSTOMIZE TABLEVIEW
		borderView.layer.cornerRadius = 22
		promptTableView.dataSource = self
		
        //Register
		let contentNib = UINib(nibName: "\(promptTableViewCell.self)", bundle: nil)
		
		self.promptTableView.register(contentNib, forCellReuseIdentifier: "contentCell")
	}
	
    //MARK: -SETUP TABLEVIEW
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! promptTableViewCell
        
        //MARK: CUSTOMIZE CELL: BORDER
		cell.contentHeaderView.layer.cornerRadius = 20
        cell.contentHeaderView.layer.borderWidth = 4.5
        cell.contentHeaderView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.contentBodyView.layer.cornerRadius = 20
        cell.contentBodyView.layer.borderWidth = 4.5
		cell.contentBodyView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		cell.detailImageView.layer.cornerRadius = 10
		
        cell.contentSpinAnimationView.isHidden = false
        
        //MARK: CUSTOMIZE CELL: HEADER TEXT
		if indexPath.section == 0 {
			cell.contentHeaderLabel.text = "Content"
//			cell.detailImageView.image = pics[numbers[0]]
//			cell.contentRandomLabel.text = labels[numbers[0]]
			cell.detailImageView.image = UIImage(named: contentContainer[numbers[0]].contentReferenceImage ?? "error")
			cell.contentRandomLabel.text = contentContainer[numbers[0]].contentDescription
		} else if indexPath.section == 1{
			cell.contentHeaderLabel.text = "Color"
//			cell.detailImageView.image = pics[numbers[1]]
//			cell.contentRandomLabel.text = labels[numbers[1]]
            cell.detailImageView.image = UIImage(named: colorContainer[numbers[1]].colorPaletteImage ?? "error")
			cell.contentRandomLabel.text = colorContainer[numbers[1]].colorDescription
		} else {
			cell.contentHeaderLabel.text = "Style"
//			cell.detailImageView.image = pics[numbers[2]]
//			cell.contentRandomLabel.text = labels[numbers[2]]
			cell.detailImageView.image = UIImage(named: styleContainer[numbers[2]].styleReferenceImage ?? "error")
			cell.contentRandomLabel.text = styleContainer[numbers[2]].styleDescription
            //cell.animation_0()
		}
        
        for index in 0...2{
            if index == 0 {
                if indexPath.section == 0 {
                    cell.animation_0()
                    sequenceAnimation_0(cell: cell)
                    print("animation 0")
                }
                else if indexPath.section == 1 {
                    cell.animation_1()
                    sequenceAnimation_1(cell: cell)
                    print("animation 1")
                }
                else if indexPath.section == 2 {
                    cell.animation_2()
                    sequenceAnimation_2(cell: cell)
                    print("animation 2")
                }
            }
        }
        
		for  value in 0...2{
			
			 if indexPath.section == value{
				 if isClicked == true  {
					 cell.animateImages()
				 }
			 }
			 
		 }

		return cell
	
    }

	//Filter and Delete Data Functions
		func filterStyleData(){
			if selectedStyle.count == 4 || selectedStyle.isEmpty {
				styleContainer = styleData
			}else{
			styleData = styleData.filter { style in
				if selectedStyle.contains(style.styleCategory!){
					styleContainer.append(style)
					print(style.styleDescription!)}
				return true
				}
			}
		}
		
		func filterContentData(){
			if selectedContent.count == 4 || selectedContent.isEmpty{
				contentContainer = contentData
			}else{
				contentData = contentData.filter{ content in
					if selectedContent.contains(content.contentCategory!){
						contentContainer.append(content)
					}
					return true
				}
			}
		}
		
		func filterColorData(){
			if selectedColor.count == 4 || selectedColor.isEmpty{
				colorContainer = colorData
			}else{
				colorData = colorContainer.filter{ color in
					if selectedColor.contains(color.colorCategory!){
						colorContainer.append(color)
					}
					return true
				}
			}
		}
		
		func removeAllStoredData(){
			colorContainer.removeAll()
			contentContainer.removeAll()
			styleContainer.removeAll()
		}
	
    //MARK: -STATUS BAR HIDDEN
    override var prefersStatusBarHidden: Bool {
        return true
    }
	
    //MARK: -SPIN BLUR ANIMATION
  
    }
 /*   public func slotAnimate(){
        
        //if isTapped == true{
        
        //for index in 0 ... 0 {
            let cell_0 = promptTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! promptTableViewCell
            sequenceAnimation_0(cell: cell_0)

//            let imageView = cell.contentSpinAnimationView
//                imageView?.image = UIImage.animatedImageNamed("2Style30ms-", duration: 1.0)
//                imageView?.startAnimating()
            
        
            cell_0.isSelected = true
//            cell_0.contentSpinAnimationView.startAnimating()
            cell_0.contentSpinAnimationView.image = UIImage.animatedImageNamed("2Content10ms-", duration: 0.80)
                
            cell_0.contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.80){
                cell_0.contentSpinAnimationView.isHidden = true
            }
        //}
        //for index in 1 ... 1 {
            let cell_1 = promptTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! promptTableViewCell
            sequenceAnimation_1(cell: cell_1)
        
            cell_1.contentSpinAnimationView.startAnimating()
            cell_1.contentSpinAnimationView.image = UIImage.animatedImageNamed("2Color20ms-", duration: 0.90)
                
            cell_1.contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.90){
                cell_1.contentSpinAnimationView.isHidden = true
            }
        //}
        //for index in 2 ... 2 {
            let cell_2 = promptTableView.cellForRow(at: IndexPath(row: 0, section: 2)) as! promptTableViewCell
            sequenceAnimation_2(cell: cell_2)
        
            cell_2.contentSpinAnimationView.startAnimating()
            cell_2.contentSpinAnimationView.image = UIImage.animatedImageNamed("2Style30ms-", duration: 1.0)
                
            cell_2.contentSpinAnimationView.isHidden = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                cell_2.contentSpinAnimationView.isHidden = true
            }
        //}
        //}
        
    } */
    
        //MARK: - sequence animation
        func sequenceAnimation_0(cell: promptTableViewCell) {
            
                UIView.animate(
                    withDuration: 0,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: ({

                        cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
                        cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
                    })
                    , completion: { _ in
                        UIView.animate(
                            withDuration: 0.5,
                            delay: 0.50,
                                options: .curveEaseIn,
                                animations: {
                                    cell.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)
                                    cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                            })
                    })
            
        }

        func sequenceAnimation_1(cell: promptTableViewCell) {

                UIView.animate(
                    withDuration: 0,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: ({

                        cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
                        cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
                    })
                    , completion: { _ in
                        UIView.animate(
                            withDuration: 0.5,
                            delay: 0.60,
                                options: .curveEaseIn,
                                animations: {
                                    cell.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)
                                    cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                            })
                    })

        }
        func sequenceAnimation_2(cell: promptTableViewCell) {

                UIView.animate(
                    withDuration: 0,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: ({

                        cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
                        cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
                    })
                    , completion: { _ in
                        UIView.animate(
                            withDuration: 0.5,
                            delay: 0.70,
                                options: .curveEaseIn,
                                animations: {
                                    cell.detailImageView.frame = CGRect(x: 20, y: 28, width: 56, height: 56)
                                    cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                            })
                    })

        }



extension ViewController {
	@IBAction func unwindToViewController(_ segue: UIStoryboardSegue) {
		
	}
}

extension ViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let filterVC = segue.destination as? filterViewController
		filterVC?.styleCategoryContainer = selectedStyle
		filterVC?.contentCategoryContainer = selectedContent
		filterVC?.colorCategoryContainer = selectedColor
		print("masuk nih preparenya")
		print(selectedContent)
		print(selectedColor)
		print(selectedStyle)
	}
}
