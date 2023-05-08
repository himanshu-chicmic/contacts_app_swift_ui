//
//  AddModifyContact.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI
import PhotosUI

struct EditContactView: View {
    
    // MARK: - properties
    
    // @Environment variabels for managedObjectContext and dismiss
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    @Environment (\.colorScheme) var colorScheme
    
    // boolean varible to check
    // for new contact
    // by default the varibale is true
    // if true the view will appear as add new contact view
    // else the view will appear as edit contact view
    @State var newContact: Bool = true
    
    // done button enabled when changes are made
    @State private var doneButtonDisabled = true
    
    // input properties
    // initializd with default values
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    
    // arrays to store different field properties
    // these are temporary type variables
    // and not associated with core data classes
    // this will store fields info which
    // will be used to assign values to
    // Core Data instance for storing data
    @State private var contactsArray: [CellTextFieldsModel] = []
    @State private var emailsArray: [CellTextFieldsModel] = []
    @State private var urlsArray: [CellTextFieldsModel] = []
    @State private var addressesArray: [CellTextFieldsModel] = []
    @State private var birthdaysArray: [CellTextFieldsModel] = []
    @State private var datesArray: [CellTextFieldsModel] = []
    @State private var relatedNamesArray: [CellTextFieldsModel] = []
    @State private var socialProfilesArray: [CellTextFieldsModel] = []
    @State private var instantMessagesArray: [CellTextFieldsModel] = []
    
    
    // boolean for confirmations
    @State private var dismissConfirmation = false
    @State private var deleteConfirmation = false
    
    // variables from ContactDetailView
    // initialized only if this view is opened
    // from Contact detail view
    @State var contactInfoBinding: ContactDetailView?
    
    // photos picker item
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    @State private var notes = ""
    
    // MARK: - body
    
    var body: some View {
        VStack{
            HStack{
                // cancel button
                Button(action: {
                    // show confirmation dialog
                    // when done button is disabled
                    // or dismiss the view
                    if !doneButtonDisabled {
                        dismissConfirmation.toggle()
                    }else {
                        dismiss()
                    }
                }, label: {
                    Text(Strings.cancel)
                })
                .confirmationDialog("", isPresented: $dismissConfirmation) {
                    // discard and dismiss
                    Button(Strings.discardChanges, role: .destructive) {
                        dismiss()
                    }
                    // cancel and continue
                    Button(Strings.keepEditing, role: .cancel) {
                        dismissConfirmation.toggle()
                    }
                } message: {
                    Text(Strings.confirmationMessageDiscard)
                }
                
                // title for view
                if newContact {
                    Text(Strings.newContact)
                        .frame(maxWidth: .infinity)
                }else {
                    Spacer()
                }
                
                // done button
                Button(action: {
                    if let person = contactInfoBinding?.personInfo{
                        addContactToDB(person: person)
                    }else {
                        let person = PersonInfo(context: managedObjContext)
                        addContactToDB(person: person)
                    }
                    
                }, label: {
                    Text(Strings.done)
                })
                .disabled(doneButtonDisabled)
            }
            .padding()
            
            if let selectedImage = selectedImage {
                
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 124, height: 124)
                    .clipped()
                    .clipShape(Circle())
                    .onChange(of: photosPickerItem) { _ in
                        Task {
                            if let data = try? await photosPickerItem?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    self.selectedImage = uiImage
                                    if let contactInfoBinding, data != contactInfoBinding.personInfo.image {
                                        doneButtonDisabled = false
                                    }
                                    return
                                }
                            }
                        }
                    }
            }
            
            PhotosPicker(newContact ? Strings.addPhoto : Strings.editPhoto, selection: $photosPickerItem, matching: .images)
                .font(.system(size: 15))
                .padding(.bottom, 6)
            
            ScrollView{
                VStack {
                    // text fields
                    // - first name
                    // - last name
                    // - company
                    VStack{
                        
                        Divider()
                        
                        Group{
                            TextField(Strings.firstname, text: $firstName)
                                .onChange(of: firstName) {
                                    text in
                                    checkForDataChanges()
                                }
                                .padding(.vertical, 4)
                            
                            Divider()
                            
                            TextField(Strings.lastname, text: $lastName)
                                .onChange(of: lastName) {
                                    text in
                                    checkForDataChanges()
                                }
                                .padding(.vertical, 4)
                            
                            Divider()
                            
                            TextField(Strings.company, text: $company)
                                .onChange(of: company) {
                                    text in
                                    checkForDataChanges()
                                }
                                .padding(.vertical, 4)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                    }
                    .autocorrectionDisabled(true)
                    .background(colorScheme == .dark ? .black : .white)
                    
                    Divider().padding().opacity(0)

                    AdditionalInfoTextFields(contactsArray: $contactsArray, emailsArray: $emailsArray, urlsArray: $urlsArray, addressesArray: $addressesArray, birthdaysArray: $birthdaysArray, datesArray: $datesArray, relatedNamesArray: $relatedNamesArray, socialProfilesArray: $socialProfilesArray, instantMessagesArray: $instantMessagesArray, doneButtonDisabled: $doneButtonDisabled)
                    
                    
                    VStack(alignment: .leading){
                        
                        Divider()
                            .padding(.bottom, 8)
                        
                        Group{
                            Text(Strings.notes)
                                .font(.system(size: 15))
                            TextField("", text: $notes, axis: .vertical)
                                .lineLimit(15)
                                .onChange(of: notes){
                                    _ in
                                    checkForDataChanges()
                                }
                                .padding(.bottom, 34)
                        }
                        .padding(.horizontal, 24)
                        
                        Divider()
                            .padding(.top, 8)
                    }
                    .background(colorScheme == .dark ? .black : .white)
                    
                    Divider().padding().opacity(0)
                    
                    if let contactInfoBinding {
                        
                        VStack(alignment: .leading) {
                            
                            Divider()
                            
                            Text(Strings.deleteContact)
                                .foregroundColor(.red)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                            
                            Divider()
                        }
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? .black : .white)
                        .onTapGesture {
                            deleteConfirmation.toggle()
                        }
                        .confirmationDialog("", isPresented: $deleteConfirmation) {
                            Button(Strings.deleteContact, role: .destructive) {
                                
                                // delete contact from the data
                                managedObjContext.delete(contactInfoBinding.personInfo)
                                
                                // save changes to db
                                try? managedObjContext.save()
                                
                                contactInfoBinding.deleted.toggle()
                                
                                // dismiss current view
                                dismiss()
                            }
                            Button(Strings.cancel, role: .cancel) {
                                deleteConfirmation.toggle()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            
            // set clear button mode for all the text fields
            UITextField.appearance().clearButtonMode = .whileEditing
            
            // if view is opened in edit mode
            // set properties of user info
            if let personInfo = contactInfoBinding?.personInfo {
                firstName = personInfo.firstName ?? ""
                lastName = personInfo.lastName ?? ""
                company = personInfo.company ?? ""
            }
            
            // check if image exists in personInfo data
            // and set the value of selectedImage
            if let image = contactInfoBinding?.personInfo.image, let uiimage = UIImage(data: image){
                selectedImage = uiimage
            }else {
                selectedImage = UIImage(named: Icons.personIcon)
            }
            
            fillOrEmptyArrays(add: true)
        }
        
    }
    
    // MARK: - methods
    
    
    /// this method populates or de-populates the following arrays
    /// - contactArray, emailArray, urlArray, birthdateArray, dateArray, relatedArray, socialProfileArray, instantMessageArray
    func fillOrEmptyArrays(add: Bool) {
        // set contact rows with data
        if let contactInfo = contactInfoBinding?.contactInfo {
            for contact in contactInfo {
                if add {
                    contactsArray.append(CellTextFieldsModel(value: contact.mobile ?? "", type: contact.type ?? Strings.phoneType[0]))
                }else {
                    managedObjContext.delete(contact)
                }
            }
        }
        
        // set email rows with data
        if let emailInfo = contactInfoBinding?.emailInfo {
            for email in emailInfo {
                if add {
                    emailsArray.append(CellTextFieldsModel(value: email.email ?? "", type: email.type ?? Strings.emailType[0]))
                }else {
                    managedObjContext.delete(email)
                }
            }
        }
        
        // set url rows with data
        if let urlInfo = contactInfoBinding?.urlInfo {
            for url in urlInfo {
                if add {
                    urlsArray.append(CellTextFieldsModel(value: url.url ?? "", type: url.type ?? Strings.urlType[0]))
                }else {
                    managedObjContext.delete(url)
                }
            }
        }
        
        // set url rows with data
        if let addressInfo = contactInfoBinding?.addressInfo {
            for address in addressInfo {
                if add {
                    addressesArray.append(CellTextFieldsModel(value: address.address ?? "", type: address.type ?? Strings.addressType[0]))
                }else {
                    managedObjContext.delete(address)
                }
            }
        }
        
        // set bithdate rows with data
        if let birthdateInfo = contactInfoBinding?.birthdateInfo {
            for birthdate in birthdateInfo {
                if add {
                    birthdaysArray.append(CellTextFieldsModel(value: birthdate.birthdate ?? "", type: birthdate.type ?? Strings.birthdateType[0]))
                }else {
                    managedObjContext.delete(birthdate)
                }
            }
        }
        
        // set date rows with data
        if let dateInfo = contactInfoBinding?.dateInfo {
            for date in dateInfo {
                if add {
                    datesArray.append(CellTextFieldsModel(value: date.date ?? "", type: date.type ?? Strings.dateType[0]))
                }else {
                    managedObjContext.delete(date)
                }
            }
        }
        
        // set related rows with data
        if let relatedInfo = contactInfoBinding?.relatedInfo {
            for related in relatedInfo {
                if add {
                    relatedNamesArray.append(CellTextFieldsModel(value: related.related ?? "", type: related.type ?? Strings.relationType[0]))
                }else {
                    managedObjContext.delete(related)
                }
            }
        }
        
        // set profile rows with data
        if let socialProfileInfo = contactInfoBinding?.socialProfileInfo {
            for profile in socialProfileInfo {
                if add {
                    socialProfilesArray.append(CellTextFieldsModel(value: profile.profile ?? "", type: profile.type ?? Strings.socialProfileType[0]))
                }else {
                    managedObjContext.delete(profile)
                }
            }
        }
        // set messaging rows with data
        if let instantMessageInfo = contactInfoBinding?.instantMessageInfo {
            for instantMessage in instantMessageInfo {
                if add {
                    instantMessagesArray.append(CellTextFieldsModel(value: instantMessage.messageMedium ?? "", type: instantMessage.type ?? Strings.instantMessageType[0]))
                }else {
                    managedObjContext.delete(instantMessage)
                }
            }
        }
        
        if add {
            notes = contactInfoBinding?.personInfo.notes ?? ""
        }
    }
    
    /// check for data changes and set the state of done button
    /// disable if no chage and enabled when any change in data is observed
    func checkForDataChanges() {
        // check name and compnay text fields
        // for any text changes
        if firstName != contactInfoBinding?.personInfo.firstName ?? ""
            || lastName != contactInfoBinding?.personInfo.lastName ?? ""
            || company != contactInfoBinding?.personInfo.company ?? ""
        || notes != contactInfoBinding?.personInfo.notes ?? "" {
            doneButtonDisabled = false
        }else {
            doneButtonDisabled = true
        }
        
    }
    
    /// add / update contact in database
    /// - Parameter person: class instance for PersonInfo
    func addContactToDB(person: PersonInfo) {
        
        // assign value to the fields
        
        // for new contact assign a UUID
        if newContact {
            person.id = UUID()
        }
        person.firstName = firstName
        person.lastName = lastName
        person.company = company
        person.notes = notes
        if let image = selectedImage?.pngData() {
            person.image = image
        }
        
        if !newContact {
            // delete stored data in
            // the tables to insert again
            // this removes duplicacy
            // but takes more time and memory
            fillOrEmptyArrays(add: false)
        }
        
        // add the date from cell
        // text fields to database
        addContactsData(person)
        
        // save to core db
        try? managedObjContext.save()
        
        // dismiss the current view
        // after saving changes
        dismiss()
    }
    
    
    /// method that iterates over array of different types of data
    /// and call a method to add that data into the core data
    /// - Parameter person: PersonInfo instance
    func addContactsData(_ person: PersonInfo) {
        
        // creating a temporary 2-d array containing
        // all the array whose data to be added to the database
        let array = [contactsArray, emailsArray, urlsArray, addressesArray, birthdaysArray, datesArray, relatedNamesArray, socialProfilesArray, instantMessagesArray]
       
        // loop over the temp array and call the addContactsData method
        // this method will add the data to the core data entities
        for (i, item) in array.enumerated() {
            addContactsData(person: person, array: item, flag: Strings.flags[i])
        }
        
    }
    
    func getContactInfo(person: PersonInfo, item: CellTextFieldsModel) -> ContactInfo {
        let contactInfo = ContactInfo(context: managedObjContext)
        contactInfo.id = person.id
        contactInfo.mobile = item.value
        contactInfo.type = item.type
        
        return contactInfo
    }
    
    func getEmailInfo(person: PersonInfo, item: CellTextFieldsModel) -> EmailInfo {
        let emailInfo = EmailInfo(context: managedObjContext)
        emailInfo.id = person.id
        emailInfo.email = item.value
        emailInfo.type = item.type
        
        return emailInfo
    }
    
    func getUrlInfo(person: PersonInfo, item: CellTextFieldsModel) -> UrlInfo {
        let urlInfo = UrlInfo(context: managedObjContext)
        urlInfo.id = person.id
        urlInfo.url = item.value
        urlInfo.type = item.type
        
        return urlInfo
    }
    
    func getAddressInfo(person: PersonInfo, item: CellTextFieldsModel) -> AddressInfo {
        let addressInfo = AddressInfo(context: managedObjContext)
        addressInfo.id = person.id
        addressInfo.address = item.value
        addressInfo.type = item.type
        
        return addressInfo
    }
    
    func getBirthdateInfo(person: PersonInfo, item: CellTextFieldsModel) -> BirthdateInfo {
        let birthdateInfo = BirthdateInfo(context: managedObjContext)
        birthdateInfo.id = person.id
        birthdateInfo.birthdate = item.value
        birthdateInfo.type = item.type
        
        return birthdateInfo
    }
    
    func getDateInfo(person: PersonInfo, item: CellTextFieldsModel) -> DateInfo {
        let dateInfo = DateInfo(context: managedObjContext)
        dateInfo.id = person.id
        dateInfo.date = item.value
        dateInfo.type = item.type
        
        return dateInfo
    }
    
    func getRelatedInfo(person: PersonInfo, item: CellTextFieldsModel) -> RelatedInfo {
        let relatedInfo = RelatedInfo(context: managedObjContext)
        relatedInfo.id = person.id
        relatedInfo.related = item.value
        relatedInfo.type = item.type
        
        return relatedInfo
    }
    
    func getSocialProfileInfo(person: PersonInfo, item: CellTextFieldsModel) -> SocialProfileInfo {
        let socialProfileInfo = SocialProfileInfo(context: managedObjContext)
        socialProfileInfo.id = person.id
        socialProfileInfo.profile = item.value
        socialProfileInfo.type = item.type
        
        return socialProfileInfo
    }
    
    func getInstantMessagingInfo(person: PersonInfo, item: CellTextFieldsModel) -> InstantMessageInfo {
        let instantMessagingInfo = InstantMessageInfo(context: managedObjContext)
        instantMessagingInfo.id = person.id
        instantMessagingInfo.messageMedium = item.value
        instantMessagingInfo.type = item.type
        
        return instantMessagingInfo
    }
    
    func addContactsData(person: PersonInfo, array: [CellTextFieldsModel], flag: String) {
        // loop over contacts array
        // and add contacts to the contactInfo data
        // then add to personToContact
        
        for item in array {
            if !item.value.isEmpty {
                switch flag{
                case Strings.flags[0]:
                    person.addToPersonToContact(getContactInfo(person: person, item: item))
                case Strings.flags[1]:
                    person.addToPersonToEmail(getEmailInfo(person: person, item: item))
                case Strings.flags[2]:
                    person.addToPersonToUrl(getUrlInfo(person: person, item: item))
                case Strings.flags[3]:
                    person.addToPersonToAddress(getAddressInfo(person: person, item: item))
                case Strings.flags[4]:
                    person.addToPersonToBirthdate(getBirthdateInfo(person: person, item: item))
                case Strings.flags[5]:
                    person.addToPersonToDate(getDateInfo(person: person, item: item))
                case Strings.flags[6]:
                    person.addToPersonToRelated(getRelatedInfo(person: person, item: item))
                case Strings.flags[7]:
                    person.addToPersonToProfile(getSocialProfileInfo(person: person, item: item))
                default:
                    person.addToPersonToMessage(getInstantMessagingInfo(person: person, item: item))
                }
            }
        }
    }
}
