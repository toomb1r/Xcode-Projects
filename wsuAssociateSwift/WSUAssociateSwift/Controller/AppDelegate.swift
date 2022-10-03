//  Tiffany Behr
//  AppDelegate.swift
//  WSUAssociateSwift
//
//  Created by Erik Buck on 9/16/19.
//  Copyright © 2019 WSU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   var window: UIWindow?
   var employees = Set<NSObject>()
   var departments = Set<Department>()
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      prepareEmployeeData()
      prepareDepartmentsData()
      
      return true
   }
    
   private func prepareEmployeeData() {
      employees = [
         Employee("Doe", "John", "Receptionist"),
         Employee("Ant", "Adam"),
         Employee("Bop", "Betty"),
         Employee("Cabbage", "Claude"),
         Employee("Doherty", "Debra"),
         Employee("Evermore", "Eva"),
         Employee("Furter", "Frank"),
         Employee("Gunderson", "George"),
         Employee("Hamilton", "Henry"),
         Employee("Issacson", "Igor"),
         Employee("Jewel", "Jacob"),
         Employee("Kemp", "Karen"),
         Employee("Lambert", "Adam"),
         Employee("Mummer", "Betty"),
         Employee("Nevis", "Claude"),
         Employee("Oliver", "Debra"),
         Employee("Patrick", "Eva"),
         Employee("Quant", "Frank"),
         Employee("Robberts", "George"),
         Employee("Smith", "Henry"),
         Employee("Tyson", "Igor"),
         Employee("Unangst", "Jacob"),
         Employee("Volt", "Karen"),
         Employee("Ant", "Amy"),
         Employee("Bop", "Bertrand"),
         Employee("Cabbage", "Clara"),
         Employee("Doherty", "Donald"),
         Employee("Evermore", "Ester"),
         NSDictionary(dictionary: ["firstName" : "Zack", "lastName" : "Zeinith", "title" : "Dude!"]),
         NSDictionary(dictionary: ["firstName" : "Hank", "lastName" : "Aaron", "title" : "Hall of Fame Dude"])
      ]
   }
   
   private func prepareDepartmentsData() {
      departments = [
         Department("Executive"),
         Department("Operations"),
         Department("Engineering"),
         Department("Sales"),
         Department("Admin"),
         Department("Quality Assurance"),
      ]

   }
}

