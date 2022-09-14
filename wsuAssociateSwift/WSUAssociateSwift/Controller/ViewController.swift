//
//  ViewController.swift
//  WSUAssociateSwift
//
//  Created by Erik Buck on 9/16/19.
//  Copyright © 2019 WSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return (UIApplication.shared.delegate as! AppDelegate).departments.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let index = indexPath.row
      let departments = (UIApplication.shared.delegate as! AppDelegate).departments
      let name = Array(departments)[index].value(forKey:"name") as! String
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
   
      // Configure the cell’s contents.
      cell.textLabel!.text = name
      return cell
   }
}

