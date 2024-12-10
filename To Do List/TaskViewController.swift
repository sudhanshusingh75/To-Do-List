//
//  TaskViewController.swift
//  To Do List
//
//  Created by Sudhanshu Singh Rajput on 10/12/24.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var taskIndex: Int?
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target:self, action: #selector(deleteTask))
    }
    @objc func deleteTask() {
        guard let taskIndex = taskIndex else { return }

        // Get the current task count
        guard let count = UserDefaults().value(forKey: "count") as? Int, count > 0 else { return }

        // Validate the index
        guard taskIndex >= 0, taskIndex < count else { return }

        // Remove the task from UserDefaults
        let taskKey = "task_\(taskIndex + 1)" // Adjusted for 1-based keys
        UserDefaults().removeObject(forKey: taskKey)

        // Shift subsequent tasks up
        for i in (taskIndex + 1)...count {
            let currentTaskKey = "task_\(i)"
            let nextTaskKey = "task_\(i + 1)"

            if let nextTask = UserDefaults().value(forKey: nextTaskKey) as? String {
                UserDefaults().setValue(nextTask, forKey: currentTaskKey)
            } else {
                UserDefaults().removeObject(forKey: currentTaskKey)
            }
        }

        // Update the task count
        UserDefaults().setValue(count - 1, forKey: "count")

        // Notify the main view controller to refresh
        update?()

        // Go back to the previous screen
        navigationController?.popViewController(animated: true)

        // Debugging output
        print("Deleted task at index: \(taskIndex)")
        print("Updated task count: \(count - 1)")
    }
}
