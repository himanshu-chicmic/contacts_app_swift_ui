//
//  StringConstants.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import Foundation

class Strings {
    
    // MARK: - navigation
    static let navigationTitle = "Contacts"
    static let labelAddItem = "Add Item"
    static let edit = "Edit"
    static let cancel = "Cancel"
    static let done = "  Done"
    
    // MARK: - textfield placeholders
    static let phone = "Phone"
    static let firstname = "First name"
    static let lastname = "Last name"
    static let company = "Company"
    
    // MARK: - bottom sheet
    static let discardChanges = "Discard Changes"
    static let keepEditing = "Keep Editing"
    static let confirmationMessageDiscard = "You sure you want to discard this new contact?"
    
    // MARK: - titles
    static let newContact = "New Contact"
    static let label = "Label"
    
    // MARK: - others
    static let message = "Message"
    static let call = "Call"
    static let url = "URL"
    static let mail = "Mail"
    static let addPhone = "Add phone"
    static let addEmail = "Add email"
    static let addUrl = "Add url"
    static let addAddress = "Add address"
    static let addBirthday = "Add birthday"
    static let addDate = "Add date"
    static let addRelatedName = "Add related name"
    static let addSocialProfile = "Add social profile"
    static let addInstantMessage = "Add instant message"
    static let addPhoto = "Add Photo"
    static let editPhoto = "Edit Photo"
    static let unknown = "Unknown"
    static let hashtag = "#"
    static let mobile = "Mobile"
    static let email = "Email"
    static let deleteContact = "Delete Contact"
    static let noContacts = "No Contacts"
    static let noResults = "No Results for \"%@\""
    static let noContactsSuggestion = "Contacts you've added will appear here."
    static let noResultsSuggestion = "Check the spelling or try a new search."
    static let createNewContact = "Create New Contact"
    static let notes = "Notes"
    static let relatedName = "Related name"
    static let socialProfile = "Social profile"
    static let instantMessage = "Instant message"
    
    // MARK: - string arrays
    static let phoneType = ["Mobile", "Home", "Work", "School", "iPhone", "Apple Watch", "Main", "Home Fax", "Work Fax", "Pager", "Other"]
    static let emailType = ["Home", "Work", "School", "iCloud", "Other"]
    static let urlType = ["Homepage", "Home", "Work", "School", "Other"]
    static let addressType = ["Home", "Work", "School", "Other"]
    static let birthdateType = ["Default Calendar", "Chinese Calendar", "Hebrew Calendar", "Isalmic Calendar"]
    static let dateType = ["Anniversary", "Other"]
    static let relationType = ["Mother", "Father", "Parent", "Brother", "Sister", "Son", "Daughter", "Child", "Friend", "Spouse", "Partner", "Assitant", "Manager", "Other"]
    static let socialProfileType = ["Twitter", "Facebook", "Flicker", "Linkedin", "Myspace", "Sina Weibo"]
    static let instantMessageType = ["Skype", "MSN", "Google Talk", "Facebook", "AIM", "Yahoo", "ICQ", "Jabber", "QQ", "Gadu-Gadu"]
    
    static let additionalOptionsContactViewCombined = ["Send Message", "Share Contact", "Add to Favorites"]
    static let additionalOptionsContactView = [
        "Add to Emergency Contacts", "Share My Location", "Add to List"
    ]
    
    static let flags = ["contact", "email", "url", "address", "birthdate", "date", "related", "profile", "message"]
}
