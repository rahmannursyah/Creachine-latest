//
//  dataSeeder.swift
//  Creachine
//
//  Created by Rahmannur Rizki Syahputra on 10/06/21.
//

//import Foundation
//import CoreData
//
//
//public class DataSeeder{
//	
//	let context: NSManagedObjectContext
//	
//	init(context:NSManagedObjectContext) {
//		self.context = context
//	}
//	
//	public func seedDataStore(){
//		seedColor()
//		seedContent()
//		seedStyle()
//	}
//	
//	private func seedColor(){
//	   let colors = [
//		(colorCategory: "Pastel", colorPaletteImage: "colorPaletteImage1", tentativeColorDescription: "The Colour of your Hair"),
//		(colorCategory: "Risol", colorPaletteImage: "colorPaletteImage1", tentativeColorDescription: "The Colour of your Hair"),
//		(colorCategory: "Pastel", colorPaletteImage: "colorPaletteImage1", tentativeColorDescription: "The Colour of your Hair"),
//		(colorCategory: "Kroket", colorPaletteImage: "colorPaletteImage1", tentativeColorDescription: "The Colour of your Hair"),
//		(colorCategory: "Pastel", colorPaletteImage: "colorPaletteImage1", tentativeColorDescription: "The Colour of your Hair"),]
//		
//	   let selectedColors = ["Pastel", "Kroket"]
//		
////		colors.filter { color in
////			if selectedColors.contains(color.colorCategory) {
////				return true
////			}
////		}
//		
//	   for color in colors {
//		   let newColor = NSEntityDescription.insertNewObject(forEntityName: "Color", into: context)as! Color
//		   newColor.colorCategory = color.colorCategory
//		   newColor.colorPaletteImage = color.colorPaletteImage
//		   newColor.tentativeColorDescription = color.tentativeColorDescription
//	   }
//	   
//	   do {
//		   try context.save()
//	   } catch _ {
//	   }
//	   
//	}
//	
//	private func seedContent(){
//		let contents = [(contentCategory: "Still Life", contentReferenceImage:"contentReferenceImage1", contentDescription: "The Last restaurant you went to"),(contentCategory: "Scenery", contentReferenceImage:"contentReferenceImage2", contentDescription: "Your favourite scenery"),(contentCategory: "Character", contentReferenceImage:"contentReferenceImage3", contentDescription: "Someone yu admire"),(contentCategory: "", contentReferenceImage:"", contentDescription: ""),(contentCategory: "", contentReferenceImage:"", contentDescription: ""),]
//		
//		for content in contents {
//			let newContent = NSEntityDescription.insertNewObject(forEntityName: "Content", into: context)as! Content
//			newContent.contentCategory = content.contentCategory
//			newContent.contentDescription = content.contentDescription
//			newContent.contentImage = content.contentReferenceImage
//		}
//		
//		do{
//			try context.save()
//		} catch _ {
//		}
//	}
//	
//	private func seedStyle(){
//		let styles = [(styleCategory: "", styleReferenceImage: "", styleDescription: ""),(styleCategory: "", styleReferenceImage: "", styleDescription: ""),(styleCategory: "", styleReferenceImage: "", styleDescription: ""),(styleCategory: "", styleReferenceImage: "", styleDescription: ""),(styleCategory: "", styleReferenceImage: "", styleDescription: ""),]
//		
//		for style in styles{
//			let newStyle = NSEntityDescription.insertNewObject(forEntityName: "Style", into: context)as! Style
//			newStyle.styleCategory = style.styleCategory
//			newStyle.styleDescription = style.styleDescription
//			newStyle.styleReferenceImage = style.styleReferenceImage
//		}
//		
//		do {
//			try context.save()
//		} catch _ {
//		}
//	}
//}
