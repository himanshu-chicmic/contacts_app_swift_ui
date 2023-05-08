//
//  PersonContactsModel.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import Foundation

class CellTextFieldsModel: Identifiable {
    
    // properties
    var id: UUID
    var value: String
    var type: String
    
    
    /// paremeterized initializer - initialized the properties of ContactModel class
    /// - Parameters:
    ///   - mobile: a string value with person's mobile number
    ///   - type: a string value with person's mobile type
    init(value: String, type: String) {
        self.id = UUID()
        self.value = value
        self.type = type
    }
    
}
