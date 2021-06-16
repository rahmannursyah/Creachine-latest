//
//  Color.swift
//  Creachine
//
//  Created by Audrey Aurelia Chang on 14/06/21.
//

import Foundation

struct Color{
	var colorCategory: String?
	var colorDescription: String?
	var colorPaletteImage: String?
	
	init(ColorCategory: String, ColorDescription: String, ColorPalatteImage: String) {
		self.colorCategory = ColorCategory
		self.colorDescription = ColorDescription
		self.colorPaletteImage = ColorPalatteImage
	}
	
	static func ColorData()->[Color]{
		return[
			//Pastels
		Color(ColorCategory: "Pastel", ColorDescription: "The color of your pet", ColorPalatteImage: "color_Pastel-1"),
		Color(ColorCategory: "Pastel", ColorDescription: "The color of your favourite flower", ColorPalatteImage: "color_Pastel-2"),
		Color(ColorCategory: "Pastel", ColorDescription: "The pink color of cotton candy", ColorPalatteImage: "color_Pastel-3"),
		Color(ColorCategory: "Pastel", ColorDescription: "Your hair color", ColorPalatteImage: "color_Pastel-4"),
		Color(ColorCategory: "Pastel", ColorDescription: "The color of your eyes", ColorPalatteImage: "color_Pastel-5"),
		Color(ColorCategory: "Pastel", ColorDescription: "The color of your favourite mug", ColorPalatteImage: "color_Pastel-6"),
		Color(ColorCategory: "Pastel", ColorDescription: "The color of your fav jean jacket", ColorPalatteImage: "color_Pastel-7"),
			//Earth Tones
		Color(ColorCategory: "Earth Tone", ColorDescription: "The color of sunset skies", ColorPalatteImage: "color_Earth-1"),
		Color(ColorCategory: "Earth Tone", ColorDescription: "The green color of leaves", ColorPalatteImage: "color_Earth-2"),
		Color(ColorCategory: "Earth Tone", ColorDescription: "The color of the forest", ColorPalatteImage: "color_Earth-3"),
		Color(ColorCategory: "Earth Tone", ColorDescription: "The color of an insect you hate", ColorPalatteImage: "color_Earth-4"),
		Color(ColorCategory: "Earth Tone", ColorDescription: "The light blue color of the sea", ColorPalatteImage: "color_Earth-5"),
		Color(ColorCategory: "Earth Tone", ColorDescription: "The yellow color of a banana", ColorPalatteImage: "color_Earth-6"),
			//Vibrant
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of your favorite fruit", ColorPalatteImage: "color_Vibrant-1"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of a green tea drink", ColorPalatteImage: "color_Vibrant-2"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of your shirt", ColorPalatteImage: "color_Vibrant-3"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of your favorite snacks/dessert", ColorPalatteImage: "color_Vibrant-4"),
		Color(ColorCategory: "Vibrant", ColorDescription: "Your favorite color", ColorPalatteImage: "color_Vibrant-5"),
		Color(ColorCategory: "Vibrant", ColorDescription: "Your favorite color of the rainbow", ColorPalatteImage: "color_Vibrant-6"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of your house wall", ColorPalatteImage: "color_Vibrant-7"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The purple color of lavender", ColorPalatteImage: "color_Vibrant-8"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of strawberry", ColorPalatteImage: "color_Vibrant-9"),
		Color(ColorCategory: "Vibrant", ColorDescription: "The color of papaya", ColorPalatteImage: "color_Vibrant-10"),
			//Cool Tones
		Color(ColorCategory: "Cool Tone", ColorDescription: "The color of your phone", ColorPalatteImage: "color_Cool-1"),
		Color(ColorCategory: "Cool Tone", ColorDescription: "The main color of your phone wallpaper", ColorPalatteImage: "color_Cool-2"),
		Color(ColorCategory: "Cool Tone", ColorDescription: "The color of your nation flag", ColorPalatteImage: "color_Cool-3"),
		Color(ColorCategory: "Cool Tones", ColorDescription: "The color of blue skies", ColorPalatteImage: "color_Cool-4"),
		Color(ColorCategory: "Cool Tone", ColorDescription: "The color of your handphone case", ColorPalatteImage: "color_Cool-5"),
		Color(ColorCategory: "Cool Tone", ColorDescription: "The color of a panda", ColorPalatteImage: "color_Cool-6"),
		Color(ColorCategory: "Cool Tone", ColorDescription: "The color of light blue flames", ColorPalatteImage: "color_Cool-7")
		]
		
		//Total : 30
	}
}
