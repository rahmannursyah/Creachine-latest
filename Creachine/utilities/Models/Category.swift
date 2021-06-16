//
//  Category.swift
//  Creachine
//
//  Created by Audrey Aurelia Chang on 15/06/21.
//

import Foundation

struct Category{
	var categoryDescription: String?
	var status: Bool?
	
	init(CategoryDescription: String, Status: Bool) {
		self.categoryDescription = CategoryDescription
		self.status = Status
	}
	
	static func contentCategory()->[Category]{
		return[
			Category(CategoryDescription: "Scene", Status: true),
			Category(CategoryDescription: "Character", Status: true),
			Category(CategoryDescription: "Object", Status: true),
			Category(CategoryDescription: "Fantasy", Status: true)]
	}
	
	static func colorCategory()->[Category]{
		return[
			Category(CategoryDescription: "Pastel", Status: true),
			Category(CategoryDescription: "Earth Tone", Status: true),
			Category(CategoryDescription: "Vibrant", Status: true),
			Category(CategoryDescription: "Cool Tone", Status: true)]
	}
	static func styleCategory()->[Category]{
		return[
			Category(CategoryDescription: "Anime", Status: true),
			Category(CategoryDescription: "Classic", Status: true),
			Category(CategoryDescription: "Cartoon", Status: true),
			Category(CategoryDescription: "(Your Own)", Status: true)]
	}
}
