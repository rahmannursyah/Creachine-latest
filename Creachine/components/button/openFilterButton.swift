//
//  openFilterButton.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 09/06/21.
//

import UIKit

struct openfilterButtonViewModel {
	let text: String
	let icon: UIImage?
	let backgroudColor: UIColor
}

class openFilterButton: UIButton {

	private let label: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 14, weight: .semibold)
		return label
	}()

	private let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.tintColor = .white
		imageView.clipsToBounds = true
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(label)
		addSubview(iconImageView)
		clipsToBounds = true
		layer.cornerRadius = 10
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with viewModel: openfilterButtonViewModel) {
		label.text = viewModel.text
		iconImageView.image = viewModel.icon
		backgroundColor = viewModel.backgroudColor
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		label.sizeToFit()
		let iconSize: CGFloat = 18
		let iconX: CGFloat = (frame.size.width - label.frame.size.width - iconSize - 2) / 2
		
		iconImageView.frame = CGRect(x: iconX,
									 y: (frame.size.height - iconSize)/2,
									 width: iconSize,
									 height: iconSize)
		label.frame = CGRect(x: iconX + iconSize + 2,
							 y: (frame.size.height - iconSize)/2,
							 width: label.frame.size.width,
							 height: label.frame.size.height)
	}
}
