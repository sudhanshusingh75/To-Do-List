//
//  ViewController.swift
//  To Do List
//
//  Created by Sudhanshu Singh Rajput on 10/12/24.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    var tasks:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task"
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup")
        {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        updateTasks()
    }
    
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int,count>0 else{
            tableView.reloadData()
            return
        }
        
        for x in 1...count{
            if let task = UserDefaults().value(forKey: "task_\(x)") as? String{
                tasks.append(task)
            }
            
        }
        tableView.reloadData()
        
    }

    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ViewController: UITableViewDelegate{
 
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            tableView.deselectRow(at: indexPath, animated: true)
            
            let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
            vc.title = "Edit Task"
            vc.task = tasks[indexPath.row]
            vc.taskIndex = indexPath.row
            vc.update = {
                DispatchQueue.main.async {
                    self.updateTasks()
                }
            }
            navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}

