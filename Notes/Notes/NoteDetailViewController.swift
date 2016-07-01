//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Ryan Plitt on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    
    var note: Note?
    
    @IBOutlet weak var noteBody: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        guard let note = note else {
            return
        }
        updateWith(note)
    }
    
    func updateWith(note: Note) {
        noteBody.text = note.body
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard noteBody.text.characters.count > 0 else {
            return
        }
        guard let noteBody = noteBody.text else {
            return
        }
        let note = Note(body: noteBody)
        NoteController.sharedController.createNewNote(note)
        navigationController?.popViewControllerAnimated(true)
    }
    
}