//
//  ViewController.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 07/06/21.
//

import UIKit
import AVFoundation

// MARK: - Variables
    
    private var numbers: [Int] = [0,1,2]


class ViewController: UIViewController, UITableViewDataSource{
// MARK: - Outlets
	@IBOutlet weak var promptTableView: UITableView!
	@IBOutlet weak var borderView: UIView!
	
	@IBOutlet weak var randomizeButton: UIButton!
	@IBOutlet weak var setIdeaButton: UIButton!
    @IBOutlet weak var setIdeaLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
	
    var isSetIdeaTapped: Bool = true
	@IBAction func setIdea(_ sender: Any) {
        if isSetIdeaTapped {
            // tapped "Set Idea" button
            setIdeaButton.backgroundColor = .white
            setIdeaButton.tintColor = .black
            for index in 0 ... 2 {
                let cell = promptTableView.cellForRow(at: IndexPath(row: 0, section: index)) as! promptTableViewCell
                cell.lockUnlockValidation(flag: true)
                cell.isActive = true
                cell.lockSetIdea(flag: true)
            }
            
            isSetIdeaTapped = false
            randomizeButton.isHidden = true
            setIdeaLabel.text = "Unset Idea"
            setIdeaLabel.textColor = .black
            
            setIdeaButton.layer.borderWidth = 4
            setIdeaButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            setIdeaButton.layer.shadowOpacity = 0.3
            setIdeaButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            // MARK: - Backsound Set Idea
            let urlString = Bundle.main.path(forResource: "audio-end", ofType: "wav")

            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else{ return }

                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard let player = player else{ return }

                player.play()
            }
            catch{
                print ("something wrong with the sound :(")
            }
        }
        else {
            setIdeaButton.backgroundColor = .black
            setIdeaButton.tintColor = .white
            
            for index in 0 ... 2 {
                let cell = promptTableView.cellForRow(at: IndexPath(row: 0, section: index)) as! promptTableViewCell
                cell.lockUnlockValidation(flag: false)
                cell.isActive = false
                cell.lockSetIdea(flag: false)
            }
            isSetIdeaTapped = true
            randomizeButton.isHidden = false
            setIdeaLabel.text = "Set Idea"
            setIdeaLabel.textColor = .white
        }
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
    var count: Int = 0
	@IBAction func randomize(_ sender: UIButton) {
        generateRandomNumber()
		isClicked = true
		
		count = 0
        
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
        //print (numbers)
        isTapped = true
        promptTableView.reloadData()
        
        // MARK: - Backsound Randomize
        let urlString = Bundle.main.path(forResource: "audio", ofType: "m4a")

        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else{ return  }

            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

            guard let player = player else{ return  }

            player.play()
        }
        catch{
            print ("something wrong :(")
        }
    }
    
    public func generateRandomNumber(){
        for index in 0...2 {
            numbers[index] = Int.random(in: 0..<10)
        }
        //print (numbers)
        isTapped = true
        promptTableView.reloadData()
    }
    
//    MARK: - Variables
        var player: AVAudioPlayer?
        
//    MARK: - Actions
	override func viewDidLoad() {
		super.viewDidLoad()
        generateRandomNumber()
		filterContentData()
		filterColorData()
		filterStyleData()
//		print(contentContainer[0].contentDescription)
		
        //MARK: - CUSTOMIZE BUTTON
		filterButton.layer.cornerRadius = 9
        filterButton.layer.shadowRadius = 2.5
        filterButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        filterButton.layer.shadowOpacity = 0.3
        filterButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        filterButton.layer.borderWidth = 4
        
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
    
    
    func checkIfFiltered(){
        if selectedStyle.count != 0 {
            count += 1
        }
        if selectedColor.count != 0{
            count += 1
        }
        if selectedContent.count != 0{
            count += 1
        }
        
        if count == 0 {
            filterButton.setTitle("Filter Off", for: .normal)
            filterButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            filterButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            filterButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            filterButton.setTitle("Filter On", for: .normal)
            filterButton.backgroundColor = #colorLiteral(red: 0.5401698947, green: 0.8065562248, blue: 0.7741576433, alpha: 1)
            filterButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            filterButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            filterButton.layer.borderWidth = 4
            
        }
        
//        count = 0
    }
    //MARK: -SETUP TABLEVIEW
	func numberOfSections(in tableView: UITableView) -> Int { return 3 }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }

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
        
//        checkIfFiltered()
        //MARK: CUSTOMIZE CELL: HEADER TEXT
		if indexPath.section == 0 {
			cell.contentHeaderLabel.text = "Content"
            
            if cell.isActive == false{
			cell.detailImageView.image = UIImage(named: contentContainer[numbers[0]].contentReferenceImage ?? "error")
			cell.contentRandomLabel.text = contentContainer[numbers[0]].contentDescription
            }
		} else if indexPath.section == 1{
			cell.contentHeaderLabel.text = "Color"
            
            if cell.isActive == false{
            cell.detailImageView.image = UIImage(named: colorContainer[numbers[1]].colorPaletteImage ?? "error")
			cell.contentRandomLabel.text = colorContainer[numbers[1]].colorDescription
            }
		} else {
			cell.contentHeaderLabel.text = "Style"
            
            if cell.isActive == false{
			cell.detailImageView.image = UIImage(named: styleContainer[numbers[2]].styleReferenceImage ?? "error")
			cell.contentRandomLabel.text = styleContainer[numbers[2]].styleDescription
            }
		}
		
//		removeAllStoredData()
		
        for index in 0...2{
            if index == 0 {
                if indexPath.section == 0 {
                    if cell.isActive == false { // button: unlock
                        cell.animateBlinkLight()
                        spin123_0(cell: cell)
                        sequenceAnimation_0(cell: cell)
                    }
                }
                else if indexPath.section == 1 {
                    if cell.isActive == false {
                        cell.animateBlinkLight()
                        spin123_1(cell: cell)
                        sequenceAnimation_1(cell: cell)
                    }
                }
                else if indexPath.section == 2 {
                    if cell.isActive == false {
                        cell.animateBlinkLight()
                        spin123_2(cell: cell)
                        sequenceAnimation_2(cell: cell)
                    }
                }
            }
        }
		
		return cell
}

// MARK: -Filter and Delete Data Functions
		func filterStyleData(){
			if selectedStyle.count == 4 || selectedStyle.isEmpty {
				styleContainer = styleData
			}else{
				styleContainer.removeAll()
				styleData = styleData.filter { style in
				if selectedStyle.contains(style.styleCategory!){
					styleContainer.append(style)
					//print(style.styleDescription!)
                }
				return true
				}
			}
		}
		
		func filterContentData(){
			if selectedContent.count == 4 || selectedContent.isEmpty{
				contentContainer = contentData
			}else{
				contentContainer.removeAll()
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
				colorContainer.removeAll()
				colorData = colorData.filter{ color in
					if selectedColor.contains(color.colorCategory!){
						colorContainer.append(color)
					}
					return true
				}
			}
		}
	
    //MARK: -STATUS BAR HIDDEN
    override var prefersStatusBarHidden: Bool {
        return true
    }
	
}
//MARK: -TestLetImage
    //CONTENT
    let content0 = UIImage(named: "2Content10ms-0")!
    let content1 = UIImage(named: "2Content10ms-1")!
    let content2 = UIImage(named: "2Content10ms-2")!
    let content3 = UIImage(named: "2Content10ms-3")!
    let content4 = UIImage(named: "2Content10ms-4")!
    let content5 = UIImage(named: "2Content10ms-5")!
    let content6 = UIImage(named: "2Content10ms-6")!
    let content7 = UIImage(named: "2Content10ms-7")!
    let content8 = UIImage(named: "2Content10ms-8")!
    let content9 = UIImage(named: "2Content10ms-9")!

    func spin123_0(cell: promptTableViewCell){
        cell.contentSpinAnimationView.animationImages = [content0, content1, content2, content3, content4, content5, content6, content7, content8, content9]
        cell.contentSpinAnimationView.animationDuration = 0.80
        cell.contentSpinAnimationView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.70){
            cell.contentSpinAnimationView.stopAnimating()
        }
    }
    
    //COLOR
    let color0 = UIImage(named: "2Color20ms-0")!
    let color1 = UIImage(named: "2Color20ms-1")!
    let color2 = UIImage(named: "2Color20ms-2")!
    let color3 = UIImage(named: "2Color20ms-3")!
    let color4 = UIImage(named: "2Color20ms-4")!
    let color5 = UIImage(named: "2Color20ms-5")!
    let color6 = UIImage(named: "2Color20ms-6")!
    let color7 = UIImage(named: "2Color20ms-7")!
    let color8 = UIImage(named: "2Color20ms-8")!
    let color9 = UIImage(named: "2Color20ms-9")!
    let color10 = UIImage(named: "2Color20ms-10")!
    let color11 = UIImage(named: "2Color20ms-11")!
    let color12 = UIImage(named: "2Color20ms-12")!
    let color13 = UIImage(named: "2Color20ms-13")!
    let color14 = UIImage(named: "2Color20ms-14")!
    let color15 = UIImage(named: "2Color20ms-15")!
    let color16 = UIImage(named: "2Color20ms-16")!
    let color17 = UIImage(named: "2Color20ms-17")!
    let color18 = UIImage(named: "2Color20ms-18")!
    let color19 = UIImage(named: "2Color20ms-19")!

    func spin123_1(cell: promptTableViewCell){
        cell.contentSpinAnimationView.animationImages = [color0, color1, color2, color3, color4, color5, color6, color7, color8, color9, color10, color11, color12, color13, color14, color15, color16, color17, color18, color19]
        cell.contentSpinAnimationView.animationDuration = 0.90
        cell.contentSpinAnimationView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.80){
            cell.contentSpinAnimationView.stopAnimating()
        }
    }
    
    //STYLE
    let style0 = UIImage(named: "2Style30ms-0")!
    let style1 = UIImage(named: "2Style30ms-1")!
    let style2 = UIImage(named: "2Style30ms-2")!
    let style3 = UIImage(named: "2Style30ms-3")!
    let style4 = UIImage(named: "2Style30ms-4")!
    let style5 = UIImage(named: "2Style30ms-5")!
    let style6 = UIImage(named: "2Style30ms-6")!
    let style7 = UIImage(named: "2Style30ms-7")!
    let style8 = UIImage(named: "2Style30ms-8")!
    let style9 = UIImage(named: "2Style30ms-9")!
    let style10 = UIImage(named: "2Style30ms-10")!
    let style11 = UIImage(named: "2Style30ms-11")!
    let style12 = UIImage(named: "2Style30ms-12")!
    let style13 = UIImage(named: "2Style30ms-13")!
    let style14 = UIImage(named: "2Style30ms-14")!
    let style15 = UIImage(named: "2Style30ms-15")!
    let style16 = UIImage(named: "2Style30ms-16")!
    let style17 = UIImage(named: "2Style30ms-17")!
    let style18 = UIImage(named: "2Style30ms-18")!
    let style19 = UIImage(named: "2Style30ms-19")!
    let style20 = UIImage(named: "2Style30ms-20")!
    let style21 = UIImage(named: "2Style30ms-21")!
    let style22 = UIImage(named: "2Style30ms-22")!
    let style23 = UIImage(named: "2Style30ms-23")!
    let style24 = UIImage(named: "2Style30ms-24")!
    let style25 = UIImage(named: "2Style30ms-25")!
    let style26 = UIImage(named: "2Style30ms-26")!
    let style27 = UIImage(named: "2Style30ms-27")!
    let style28 = UIImage(named: "2Style30ms-28")!
    let style29 = UIImage(named: "2Style30ms-29")!

    func spin123_2(cell: promptTableViewCell){
        cell.contentSpinAnimationView.animationImages = [style0, style1, style2, style3, style4, style5, style6, style7, style8, style9, style10, style11, style12, style13, style14, style15, style16, style17, style18, style19, style20, style21, style22, style23, style24, style25, style26, style27, style28, style29]
        cell.contentSpinAnimationView.animationDuration = 1.0
        cell.contentSpinAnimationView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.90){
            cell.contentSpinAnimationView.stopAnimating()
        }
    }

    //MARK: - sequence animation
    func sequenceAnimation_0(cell: promptTableViewCell) {
        
        UIView.animate(
            withDuration: 0,
            delay: 0,
            options: .curveEaseOut,
            animations: ({

                cell.detailImageView.frame = CGRect(x: 20, y: -150, width: 56, height: 56)
                cell.contentRandomLabel.transform = CGAffineTransform(translationX: 0, y: -100)
            }) , completion: { _ in
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
                }) , completion: { _ in
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
        count = 0
		filterContentData()
		filterColorData()
		filterStyleData()
	}
}

extension ViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let filterVC = segue.destination as? filterViewController
		filterVC?.styleCategoryContainer = selectedStyle
		filterVC?.contentCategoryContainer = selectedContent
		filterVC?.colorCategoryContainer = selectedColor
//		print("masuk nih preparenya")
//		print(selectedContent)
//		print(selectedColor)
//		print(selectedStyle)
	}
    
}
