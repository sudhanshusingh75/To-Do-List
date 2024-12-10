//
//  EntryViewController.swift
//  To Do List
//
//  Created by Sudhanshu Singh Rajput on 10/12/24.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    var update : (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",style: .done, target: self, action: #selector(saveTask))
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @objc func saveTask(){
        guard let fieldText = field.text,!fieldText.isEmpty else {
            print("Field Cannot be Empty")
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{return}
        let newCount = count+1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(fieldText, forKey: "task_\(newCount)")
        update?()
        navigationController?.popViewController(animated: true)
    }

}
