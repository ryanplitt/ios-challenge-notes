//
//  NoteController.swift
//  Notes
//
//  Created by Ryan Plitt on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    private let savedKey = "SavedKey"
    
    var notes = [Note]()
    
    init() {
        loadFromPersistance()
    }
    
    /// CRUD ////
    
    func createNewNote(note: Note) {
        notes.append(note)
        saveToPersistance()
    }
    
    func removeNote(note: Note) {
        if let index = notes.indexOf(note) {
            notes.removeAtIndex(index)
        }
        saveToPersistance()
    }
    
    /// TO DO :::: SAVE AND LOAD
    func saveToPersistance() {
        let savedData = NoteController.sharedController.notes.map{($0.dictionaryCopy)}
        NSUserDefaults.standardUserDefaults().setObject(savedData, forKey: savedKey)
    }
    
    func loadFromPersistance() {
        guard let loadedData = NSUserDefaults.standardUserDefaults().objectForKey(savedKey) as? [[String:AnyObject]] else {
            return
        }
        notes = loadedData.flatMap{Note(dictionary: $0)}
    }
}