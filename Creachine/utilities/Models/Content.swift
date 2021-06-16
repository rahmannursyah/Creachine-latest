//
//  Content.swift
//  Creachine
//
//  Created by Audrey Aurelia Chang on 14/06/21.
//

import Foundation

struct Content{
	var contentCategory: String?
	var contentDescription: String?
	var contentReferenceImage: String?
	
	init(ContentCategory: String, ContentDescription: String, ContentReferenceImage: String) {
		self.contentCategory = ContentCategory
		self.contentDescription = ContentDescription
		self.contentReferenceImage = ContentReferenceImage
	}
	
	static func ContentData()->[Content]{
		return[
			//Scenes
		Content(ContentCategory: "Scene", ContentDescription: "A tree that you see outside", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "Scene in a Ghibli movie", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "Your favorite scenery", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "A memorable moment in your life", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "A Crime scene", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "The last dream you remember", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "Your bedroom", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "A city you want to visit", ContentReferenceImage: "content_Scene"),
		Content(ContentCategory: "Scene", ContentDescription: "Your dream company", ContentReferenceImage: "content_Scene"),
			//Characters
		Content(ContentCategory: "Character", ContentDescription: "A singer you love", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "A Ghibli character", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your favourite character from a book", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Someone you admire", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your first ex", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your favourite Avengers character", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your favorite Greek God", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your significant other", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Yourself in 5 years", ContentReferenceImage: "content_Character"),
		Content(ContentCategory: "Character", ContentDescription: "Your bestfriend", ContentReferenceImage: "content_Character"),
			//Objects
		Content(ContentCategory: "Object", ContentDescription: "A plant or flowers", ContentReferenceImage: "content_Object"),
		Content(ContentCategory: "Object", ContentDescription: "Your most beloved thing", ContentReferenceImage: "content_Object"),
		Content(ContentCategory: "Object", ContentDescription: "The cover of your favorite book", ContentReferenceImage: "content_Object"),
		Content(ContentCategory: "Object", ContentDescription: "Your favourite food", ContentReferenceImage: "content_Object"),
		Content(ContentCategory: "Object", ContentDescription: "Your favourite drinks", ContentReferenceImage: "content_Object"),
			//Fantasy
		Content(ContentCategory: "Fantasy", ContentDescription: "A charcter from a myth/legend", ContentReferenceImage: "content_Fantasy"),
		Content(ContentCategory: "Fantasy", ContentDescription: "A post apocalypse world", ContentReferenceImage: "content_Fantasy"),
		Content(ContentCategory: "Fantasy", ContentDescription: "An ant's POV of your house", ContentReferenceImage: "content_Fantasy"),
		Content(ContentCategory: "Fantasy", ContentDescription: "A mythical creature (elves etc.)", ContentReferenceImage: "content_Fantasy"),
		Content(ContentCategory: "Fantasy", ContentDescription: "Mix of things you love and hate", ContentReferenceImage: "content_Fantasy"),
		Content(ContentCategory: "Fantasy", ContentDescription: "Your favourite folktale", ContentReferenceImage: "content_Fantasy"),
		]
		
	//Total : 30
	}
}
