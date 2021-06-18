//
//  Style.swift
//  Creachine
//
//  Created by Audrey Aurelia Chang on 14/06/21.
//

import Foundation

struct Style{
	var styleCategory: String?
	var styleDescription: String?
	var styleReferenceImage: String?
	
	init(StyleCategory: String, StyleDescription: String, StyleReferenceImage: String) {
		self.styleCategory = StyleCategory
		self.styleDescription = StyleDescription
		self.styleReferenceImage = StyleReferenceImage
	}
	
	static func StyleData() -> [Style]{
	return[
            //Anime
        Style(StyleCategory: "Anime", StyleDescription: "Studio Ghibli", StyleReferenceImage: "style_Anime-1"),
        Style(StyleCategory: "Anime", StyleDescription: "Danganronpa", StyleReferenceImage: "style_Anime-2"),
        Style(StyleCategory: "Anime", StyleDescription: "True Beauty", StyleReferenceImage: "style_Anime-3"),
        Style(StyleCategory: "Anime", StyleDescription: "City Hunter", StyleReferenceImage: "style_Anime-4"),
        Style(StyleCategory: "Anime", StyleDescription: "Naruto", StyleReferenceImage: "style_Anime-5"),
        Style(StyleCategory: "Anime", StyleDescription: "Sailor Moon", StyleReferenceImage: "style_Anime-6"),
        Style(StyleCategory: "Anime", StyleDescription: "Pokemon", StyleReferenceImage: "style_Anime-7"),
        Style(StyleCategory: "Anime", StyleDescription: "Hai Miiko!", StyleReferenceImage: "style_Anime-8"),
        Style(StyleCategory: "Anime", StyleDescription: "Seven Deadly Sins", StyleReferenceImage: "style_Anime-9"),
        Style(StyleCategory: "Anime", StyleDescription: "Gudetama", StyleReferenceImage: "style_Anime-10"),
            //Classic
        Style(StyleCategory: "Classic", StyleDescription: "Pointilism", StyleReferenceImage: "style_Classic-1"),
        Style(StyleCategory: "Classic", StyleDescription: "Monet Painting", StyleReferenceImage: "style_Classic-2"),
        Style(StyleCategory: "Classic", StyleDescription: "Mona Lisa Painting", StyleReferenceImage: "style_Classic-3"),
        Style(StyleCategory: "Classic", StyleDescription: "Surrealism", StyleReferenceImage: "style_Classic-4"),
        Style(StyleCategory: "Classic", StyleDescription: "Pop Art", StyleReferenceImage: "style_Classic-5"),
        Style(StyleCategory: "Classic", StyleDescription: "Fauvism", StyleReferenceImage: "style_Classic-6"),
        Style(StyleCategory: "Classic", StyleDescription: "Art Nouveau", StyleReferenceImage: "style_Classic-7"),
        Style(StyleCategory: "Classic", StyleDescription: "Art Deco", StyleReferenceImage: "style_Classic-8"),
        Style(StyleCategory: "Classic", StyleDescription: "Geometric", StyleReferenceImage: "style_Classic-9"),
        Style(StyleCategory: "Classic", StyleDescription: "Mosaic", StyleReferenceImage: "style_Classic-10"),
            //Cartoon
        Style(StyleCategory: "Cartoon", StyleDescription: "Power Puff Girls", StyleReferenceImage: "style_Cartoon-1"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Gravity Falls", StyleReferenceImage: "style_Cartoon-2"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Doraemon", StyleReferenceImage: "style_Cartoon-3"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Spongebob", StyleReferenceImage: "style_Cartoon-4"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Monsters Inc.", StyleReferenceImage: "style_Cartoon-5"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Adventure Time", StyleReferenceImage: "style_Cartoon-6"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Hotel Transylvania", StyleReferenceImage: "style_Cartoon-7"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Phineas & Ferb", StyleReferenceImage: "style_Cartoon-8"),
        Style(StyleCategory: "Cartoon", StyleDescription: "Upin & Ipin", StyleReferenceImage: "style_Cartoon-9"),
            //Your Own Style
        Style(StyleCategory: "(Your Own)", StyleDescription: "Your Own Style", StyleReferenceImage: "style_OwnStyle"),
       
        ]
		
	//Total : 30
	}
}
