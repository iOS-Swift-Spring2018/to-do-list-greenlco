//
//  DetailViewController.swift
//  To Do List
//
//  Created by Connor Greenleaf on 2/18/18.
//  Copyright © 2018 Connor Greenleaf. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNoteView: UITextView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String?
    var toDoNoteItem: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    func enableDisableSaveButton() {
        if let toDofieldCount = toDoField.text?.count, toDofieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: Any) {
        enableDisableSaveButton()
        }
    
    @IBAction func cancelPressed(_ sender: Any) {
        let isPresentinginAddMOde = presentingViewController is UINavigationController
        if isPresentinginAddMOde {
            dismiss(animated: true, completion: nil)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    

}
