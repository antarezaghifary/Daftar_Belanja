//
//  ViewController.swift
//  DaftarBelanja
//
//  Created by 247 on 03/07/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    
    //Implement the addName IBAction
    @IBAction func addName(sender: AnyObject) {
        let alert = UIAlertController(
            title: "Item Baru Kuy",
            message: "Tambah Item Belanja",
            preferredStyle: .alert
        )
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            (action: UIAlertAction!)->Void in
            
            let textField = alert.textFields![0] as UITextField
            //self.names.append(textField.text)
            self.names.append(textField.text!)
            self.tableView.reloadData()
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default){
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextField(){
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Daftar Belanja\""
        tableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK : UITableViewDataSource
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int)->Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: make the UITableViewCell editable (delete and / or other action)
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            self.names.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            self.tableView.reloadData()
        }
    }
}
