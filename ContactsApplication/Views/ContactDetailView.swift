//
//  ContactView.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI

struct ContactDetailView: View {
    
    // MARK: - properties
    @Environment (\.dismiss) var dismiss
    @Environment (\.colorScheme) var colorScheme
    
    // check if contact is deleted or not
    @State var deleted: Bool = false
    
    // contact notes
    @State var notes: String = ""
    
    // personInfo variable from ContactListView
    @State var personInfo: PersonInfo
    
    @State var actionButtonsInactive = false
    
    // fetch request for core data
    @FetchRequest var contactInfo: FetchedResults<ContactInfo>
    @FetchRequest var emailInfo: FetchedResults<EmailInfo>
    @FetchRequest var urlInfo: FetchedResults<UrlInfo>
    @FetchRequest var addressInfo: FetchedResults<AddressInfo>
    @FetchRequest var birthdateInfo: FetchedResults<BirthdateInfo>
    @FetchRequest var dateInfo: FetchedResults<DateInfo>
    @FetchRequest var relatedInfo: FetchedResults<RelatedInfo>
    @FetchRequest var socialProfileInfo: FetchedResults<SocialProfileInfo>
    @FetchRequest var instantMessageInfo: FetchedResults<InstantMessageInfo>
    
    init(personInfo: PersonInfo) {
        
        _personInfo = State(initialValue: personInfo)
        
        let nsPredicate = NSPredicate(format: "id == %@", personInfo.id! as CVarArg)
        
        _contactInfo = FetchRequest<ContactInfo>(sortDescriptors: [], predicate: nsPredicate)
        _emailInfo = FetchRequest<EmailInfo>(sortDescriptors: [], predicate: nsPredicate)
        _urlInfo = FetchRequest<UrlInfo>(sortDescriptors: [], predicate: nsPredicate)
        _addressInfo = FetchRequest<AddressInfo>(sortDescriptors: [], predicate: nsPredicate)
        _birthdateInfo = FetchRequest<BirthdateInfo>(sortDescriptors: [], predicate: nsPredicate)
        _dateInfo = FetchRequest<DateInfo>(sortDescriptors: [], predicate: nsPredicate)
        _relatedInfo = FetchRequest<RelatedInfo>(sortDescriptors: [], predicate: nsPredicate)
        _socialProfileInfo = FetchRequest<SocialProfileInfo>(sortDescriptors: [], predicate: nsPredicate)
        _instantMessageInfo = FetchRequest<InstantMessageInfo>(sortDescriptors: [], predicate: nsPredicate)
        
    }
    
    // MARK: - body
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            VStack {
                
                BasicContactDetails(personInfo: $personInfo, actionButtonsInactive: $actionButtonsInactive)
                
                Group{
                    
                    if contactInfo.count > 0 {
                        // list contacts stored with current user
                        VStack{
                            ForEach(contactInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: contactInfo[index], flag: Strings.flags[0])
                                
                                let count = contactInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                    }
                    
                    if emailInfo.count > 0 {
                        VStack{
                            // list emails stored with current user
                            ForEach(emailInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: emailInfo[index], flag: Strings.flags[1])
                                
                                let count = emailInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    
                    if urlInfo.count > 0 {
                        VStack {
                            // list urls stored with current user
                            ForEach(urlInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: urlInfo[index], flag: Strings.flags[2])
                                
                                let count = urlInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if addressInfo.count > 0 {
                        VStack {
                            // list addresses stored with current user
                            ForEach(addressInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: addressInfo[index], flag: Strings.flags[3])
                                
                                let count = addressInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if birthdateInfo.count > 0 {
                        VStack{
                            // list birthdates stored with current user
                            ForEach(birthdateInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: birthdateInfo[index], flag: Strings.flags[4])
                                
                                let count = birthdateInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if dateInfo.count > 0 {
                        VStack{
                            // list dates stored with current user
                            ForEach(dateInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: dateInfo[index], flag: Strings.flags[5])
                                
                                let count = dateInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if relatedInfo.count > 0 {
                        VStack{
                            // list related stored with current user
                            ForEach(relatedInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: relatedInfo[index], flag: Strings.flags[6])
                                
                                let count = relatedInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if socialProfileInfo.count > 0 {
                        VStack{
                            // list profiles stored with current user
                            ForEach(socialProfileInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: socialProfileInfo[index], flag: Strings.flags[7])
                                
                                let count = socialProfileInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                    if instantMessageInfo.count > 0 {
                        VStack{
                            // list messages stored with current user
                            ForEach(instantMessageInfo.indices, id: \.self) { index in
                                
                                let value = drawContactCard(value: instantMessageInfo[index], flag: Strings.flags[8])
                                
                                let count = instantMessageInfo.count
                                
                                ShowContactDetails(type: value.1, value: value.0)
                                
                                if index != count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .padding(.vertical, 8)
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                    
                }
                
                ContactViewOptions(notes: $notes)
            }
            .padding(.horizontal, 10)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // navigate to view AddModifyContactView for contact edit
                    NavigationLink(destination: EditContactView(newContact: false, contactInfoBinding: self).background(.gray.opacity(0.1)), label: {
                        Text(Strings.edit)
                    })
                }
            }
            .contentTransition(.identity)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                
                notes = personInfo.notes ?? ""
                
                if deleted {
                    dismiss()
                }

            }
        }
    }
    
    // TODO: methods
    
    /// method to get data for contact card (type and value)
    /// - Parameters:
    ///   - value: Any type containing the FetchedResults from core data
    ///   - valueID: id of value type
    ///   - personID: id of personInfo
    ///   - flag: flag to check which type of result is used
    /// - Returns: type and value (String, String)
    func drawContactCard(value: Any, flag: String) -> (String, String){
        
        var val: String?
        var type: String?
        
        switch(flag) {
            case Strings.flags[0]:
                let value = value as! ContactInfo
                type = value.type
                val = value.mobile
            case Strings.flags[1]:
                let value = value as! EmailInfo
                type = value.type
                val = value.email
            case Strings.flags[2]:
                let value = value as! UrlInfo
                type = value.type
                val = value.url
            case Strings.flags[3]:
                let value = value as! AddressInfo
                type = value.type
                val = value.address
            case Strings.flags[4]:
                let value = value as! BirthdateInfo
                type = value.type
                val = value.birthdate
            case Strings.flags[5]:
                let value = value as! DateInfo
                type = value.type
                val = value.date
            case Strings.flags[6]:
                let value = value as! RelatedInfo
                type = value.type
                val = value.related
            case Strings.flags[7]:
                let value = value as! SocialProfileInfo
                type = value.type
                val = value.profile
            default:
                let value = value as! InstantMessageInfo
                type = value.type
                val = value.messageMedium
        }
        
        if let val = val, let type = type {
            return (val, type)
        }
        
        return ("", "")
    }
    
}
