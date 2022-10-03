//  Tiffany Behr
//  Employee.swift
//  WSUAssociateSwift
//
//  Created by Erik Buck on 9/16/19.
//  Copyright © 2019 WSU. All rights reserved.
//

import Foundation

class Employee : NSObject {
   @objc var lastName : String
   @objc var firstName : String
   @objc var title : String

   init(_ lastName: String, _ firstName: String, _ title : String = "Employee") {
      self.lastName = lastName
      self.firstName = firstName
      self.title = title
   }
}
