//  Tiffany Behr
//  Reminder.swift
//  completeClasses
//
//  Created by wsucatslabs on 9/11/22.
//

import Foundation


struct Reminder {
    
    var title: String
    
    var dueDate: Date
    
    var notes: String? = nil
    
    var isComplete: Bool = false
    
}


#if DEBUG

extension Reminder {
    
    static var sampleData = [
        
        Reminder(title: "CS-1180", dueDate: Date().addingTimeInterval(800.0), notes: "Don't forget about taxi receipts"),
        
        Reminder(title: "CS-1181", dueDate: Date().addingTimeInterval(14000.0), notes: "Check tech specs in shared folder", isComplete: true),
        
        Reminder(title: "CEG-3310", dueDate: Date().addingTimeInterval(24000.0), notes: "Optometrist closes at 6:00PM"),
        
        Reminder(title: "CS-3100", dueDate: Date().addingTimeInterval(3200.0), notes: "Collaborate with project manager", isComplete: true),
        
        Reminder(title: "CEG-2350", dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
        
        Reminder(title: "CEG-2400", dueDate: Date().addingTimeInterval(72000.0), notes: "Think different"),
        
        Reminder(title: "CS-1000", dueDate: Date().addingTimeInterval(83000.0), notes: "Discuss trends with management"),
        
        Reminder(title: "CS-2200", dueDate: Date().addingTimeInterval(92500.0), notes: "Ask about space heaters"),
        
        Reminder(title: "CS-6850", dueDate: Date().addingTimeInterval(101000.0),  notes: "v0.9 out on Friday")
        
    ]
    
}

#endif
