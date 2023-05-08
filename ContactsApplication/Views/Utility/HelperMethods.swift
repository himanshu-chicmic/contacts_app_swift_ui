//
//  HelperMethods.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/20/23.
//

import Foundation
import SwiftUI


class HelperMethods {
    
    /// returns the name of the person which is shown to the user
    /// - Parameters:
    ///   - fname: string value for first name
    ///   - lname: string value for last name
    /// - Returns: string value containg value to be displayed as name
    static func getPersonsName(fname: String, lname: String) -> String {
        // if firstname and lastname are both empty
        // return "Unknown"
        if fname.isEmpty && lname.isEmpty {
            return Strings.unknown
        }
        // first name is empty
        // return last name
        else if fname.isEmpty {
            return lname
        }
        // last name is empty
        // return first name
        else if lname.isEmpty {
            return fname
        }
        // else default
        // return first name + last name
        else {
            return "\(fname) \(lname)"
        }
    }
    
    
    /// returns the ui image
    /// - Parameter personInfo: PersonInfo class instance containing data of person's contact
    /// - Returns: a UIImage
    static func getImage(personInfo: PersonInfo) -> UIImage {
        // check if image data is not nil
        // if nil return default image
        guard let image = personInfo.image, let UiImage = UIImage(data: image)  else{
            return UIImage(imageLiteralResourceName: Icons.personIcon)
        }
        
        // return the UiImage
        return UiImage
    }
    
    
    /// returns the string value of the date
    /// - Parameter date: a date type value
    /// - Returns: string formatted value of date
    static func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, YYYY"
        return dateFormatter.string(from: date)
    }
    
    
    static func getTypeText(_ type: String) -> String {
        switch type {
            case Strings.birthdateType[1]:
                return "Chinese birthday"
            case Strings.birthdateType[2]:
                return "Hebrew birthday"
            case Strings.birthdateType[3]:
                return "Islamic birthday"
            default:
                return "Birthday"
        }
    }
    
    static func getCalendarType(_ type: String) -> Calendar.Identifier {
        switch type {
            case Strings.birthdateType[1]:
                return Calendar.Identifier.chinese
            case Strings.birthdateType[2]:
                return Calendar.Identifier.hebrew
            case Strings.birthdateType[3]:
                return Calendar.Identifier.islamicCivil
            default:
                return Calendar.Identifier.gregorian
        }
    }
}
