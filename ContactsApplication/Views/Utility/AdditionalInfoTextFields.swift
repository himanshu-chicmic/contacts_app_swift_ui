//
//  BasicInfoTextFields.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//

import SwiftUI

struct AdditionalInfoTextFields: View {
    
    // arrays to store different field properties
    // these are temporary type variables
    // and not associated with core data classes
    // this will store fields info which
    // will be used to assign values to
    // Core Data instance for storing data
    @Binding var contactsArray: [CellTextFieldsModel]
    @Binding var emailsArray: [CellTextFieldsModel]
    @Binding var urlsArray: [CellTextFieldsModel]
    @Binding var addressesArray: [CellTextFieldsModel]
    @Binding var birthdaysArray: [CellTextFieldsModel]
    @Binding var datesArray: [CellTextFieldsModel]
    @Binding var relatedNamesArray: [CellTextFieldsModel]
    @Binding var socialProfilesArray: [CellTextFieldsModel]
    @Binding var instantMessagesArray: [CellTextFieldsModel]
    
    @Binding var doneButtonDisabled: Bool
    
    var body: some View {
        Group {
            // contacts
            BuildTextFieldsUI(fieldArray: $contactsArray, placeholder: Strings.mobile, keyboardType: UIKeyboardType.phonePad, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.phoneType, buttonText: Strings.addPhone, defaultValue: Strings.phoneType[0])
            
            // emails
            BuildTextFieldsUI(fieldArray: $emailsArray, placeholder: Strings.email, keyboardType: UIKeyboardType.emailAddress, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.emailType, buttonText: Strings.addEmail, defaultValue: Strings.emailType[0])
            
            // urls
            BuildTextFieldsUI(fieldArray: $urlsArray, placeholder: Strings.url, keyboardType: UIKeyboardType.URL, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.urlType, buttonText: Strings.addUrl, defaultValue: Strings.urlType[0])
            
            // address
            BuildTextFieldsUI(fieldArray: $addressesArray, placeholder: "change text field", keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.addressType, buttonText: Strings.addAddress, defaultValue: Strings.addressType[0])
            
            // birthday
            BuildTextFieldsUI(fieldArray: $birthdaysArray, placeholder: "", keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.birthdateType, buttonText: Strings.addBirthday, defaultValue: Strings.birthdateType[0])
            
            // date
            BuildTextFieldsUI(fieldArray: $datesArray, placeholder: "", keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.dateType, buttonText: Strings.addDate, defaultValue: Strings.dateType[0])

            // related name
            BuildTextFieldsUI(fieldArray: $relatedNamesArray, placeholder: Strings.relatedName, keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.relationType, buttonText: Strings.addRelatedName, defaultValue: Strings.relationType[0])
            
            // social profile
            BuildTextFieldsUI(fieldArray: $socialProfilesArray, placeholder: Strings.socialProfile, keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.socialProfileType, buttonText: Strings.addSocialProfile, defaultValue: Strings.socialProfileType[0])
            
            // instant messaging
            BuildTextFieldsUI(fieldArray: $instantMessagesArray, placeholder: Strings.instantMessage, keyboardType: UIKeyboardType.default, doneButtonDisabled: $doneButtonDisabled, listItemsArray: Strings.instantMessageType, buttonText: Strings.addInstantMessage, defaultValue: Strings.instantMessageType[0])
        }
    }
    
    
}
