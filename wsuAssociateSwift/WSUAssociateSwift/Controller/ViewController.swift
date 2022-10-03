//  Tiffany Behr
//  ViewController.swift
//  WSUAssociateSwift
//
//  Created by Erik Buck on 9/16/19.
//  Copyright © 2019 WSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var employeesTable : UITableView? //creates a way to connect two different data sources to the two different table views
    
    var (arrangedEmployees) = Array<NSObject>(); //arrays to sort out data
    var (arrangedDepartments) = Array<NSObject>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView === employeesTable){
            let employees = (UIApplication.shared.delegate as! AppDelegate).employees
            arrangedEmployees = employees.sorted(by: { (lhs : NSObject, rhs : NSObject) -> Bool in
                let lhsFName = lhs.value(forKey: "firstName") as! String
                let rhsFName = rhs.value(forKey: "firstName") as! String
                let lhsLName = lhs.value(forKey: "lastName") as! String
                let rhsLName = rhs.value(forKey: "lastName") as! String
                
                if (lhsLName == rhsLName) {
                    return (lhsFName > rhsFName) //Sorts first names Z - A if last names match
                    
                } else {
                    return (lhsLName > rhsLName) //Sorts last names Z - A
                }
            })
            return employees.count
            
        } else {
            let departments = (UIApplication.shared.delegate as! AppDelegate).departments
            arrangedDepartments = departments.sorted(by: { (lhs : NSObject, rhs : NSObject) -> Bool in
                let lhsName = lhs.value(forKey: "name") as! String //sorts out departments A-Z 
                let rhsName = rhs.value(forKey: "name") as! String
                    return (lhsName < rhsName)
            })
            return arrangedDepartments.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if (tableView === employeesTable){
            let lastname = Array(arrangedEmployees)[index].value(forKey:"lastName") as! String
            let firstname = Array(arrangedEmployees)[index].value(forKey:"firstName") as! String
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                cell.textLabel!.text = lastname + " , " + firstname
                return cell
            
        } else {
            let name = Array(arrangedDepartments)[index].value(forKey:"name") as! String
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                cell.textLabel!.text = name
                return cell
            
        }
    }
}


