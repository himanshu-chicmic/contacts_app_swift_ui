//
//  ContactsListView.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI
import CoreData

struct ContactsListView: View {
    
    // MARK: - properties
    
    // fetch request for personsInfo data
    @FetchRequest(sortDescriptors: [SortDescriptor(\.firstName)]) var personInfo: FetchedResults<PersonInfo>
    
    // variable for search field
    @State private var textInSearchField = ""

    // varible to check boolean value for showing add new contact view
    @State var openAddNewContactView = false
    
    // MARK: - body
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(getSectionTitles(), id: \.self) { sectionTitle in
                    // outer loop for sections
                    // #,a,b,c,d,.....z
                    Section{
                        
                        // getContactList(section: String) generates and returns array of [PersonInfo]
                        // array containing list of person contacts
                        ForEach(createContactsList(section: sectionTitle), id: \.self) { contact in
                            // inner loop for contact list
                            // falling under the current section
                            
                            ZStack (alignment: .leading){
                                
                                // navigation link with opacity 0
                                // for hiding the "chevron.right symbol"
                                NavigationLink(destination: {
                                    
                                    // open contact detail view when clicked on
                                    // list item and send the item as an argument
                                    // to show details of the person
                                    ContactDetailView(personInfo: contact)
                                        .background(.gray.opacity(0.1))
                                }, label: {
                                    
                                    // empty view
                                    // used to hide arrow symbol on the right of the list item
                                    // by setting opacity to zero
                                    EmptyView()
                                })
                                .opacity(0)
                                
                                // main contact information
                                if let fname = contact.firstName, let lname = contact.lastName {
                                    Text(HelperMethods.getPersonsName(fname: fname, lname: lname))
                                }
                            }
                        }
                    }
                    // set header for the current section
                header: {
                    // if section is empty set "#" as the section
                    Text(sectionTitle.isEmpty ? Strings.hashtag : sectionTitle)
                }
                }
            }
            .overlay{
                
                // show no results found
                // when section titles return an
                // empty list
                if getSectionTitles().isEmpty {
                    VStack{
                        // search icon
                        Image(systemName: textInSearchField.isEmpty ? Icons.personCircleFill : Icons.searchIcon)
                            .foregroundColor(.gray)
                            .scaleEffect(2.5)
                            .padding()
                        // no result found text with search field text
                        Text(textInSearchField.isEmpty ? Strings.noContacts : String(format: Strings.noResults, textInSearchField))
                            .fontWeight(.bold)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 2)
                        
                        // caption for suggestion
                        Text(textInSearchField.isEmpty ? Strings.noContactsSuggestion : Strings.noResultsSuggestion )
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        if textInSearchField.isEmpty {
                            Button(action: {
                                openAddNewContactView.toggle()
                            }, label: {
                                Text(Strings.createNewContact)
                            })
                            .padding(.top)
                        }
                    }
                    .padding()
                }
            }
            .listRowSeparator(.hidden)
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem {
                    // create new contact button
                    Button(action: {
                        // toggle boolean var openAddNewContactView
                        // when true the view is opened as a bottom sheet view
                        openAddNewContactView.toggle()
                    }, label: {
                        // label for add new contact button
                        Label(Strings.labelAddItem, systemImage: Icons.plusIcon)
                    })
                }
            }
            .navigationTitle(Strings.navigationTitle)
            // search bar
            .searchable(text: $textInSearchField, placement: .navigationBarDrawer(displayMode: .always))
            .autocapitalization(.none)
            // bottom sheet view for add new contact
            .sheet(isPresented: $openAddNewContactView) {
                // open bottom sheet to add new contact
                EditContactView()
                    .background(.gray.opacity(0.1))
            }
        }
    }
    
    // MARK: - methods
    
    /// get contact list from personInfo instance
    /// - Parameter section: a string value containing the section for whom the list is generated
    /// - Returns: an array of type PersonInfo
    func createContactsList(section: String) -> [PersonInfo] {
        // filter array based on the section
        // by comparing the section element with the first element in person name stored in personInfo
        // and return the array
        var resultArray = personInfo.filter{
           
            guard let firstname = $0.firstName?.uppercased(), let lastname = $0.lastName?.uppercased() else {
                return false
            }
            
            // if firstname empty ? check prefix of lastname : check prefix of firstname
            return firstname.isEmpty ? lastname.prefix(1) == section : firstname.prefix(1) == section
        }
        
        if !textInSearchField.isEmpty {
            // get search results
            resultArray = filterContactsWithSearchText(result: resultArray)
        }
        
        // return the result array
        return resultArray
        
    }
    
    /// create array of sectionTitle from the personInfo array
    /// - Returns: string array containg sections i.e. A, B, C, D, .. Z
    func getSectionTitles() -> [String]{
        // temporary array to store the results
        var tempArray = Array(personInfo)
        
        // when search is active
        if !textInSearchField.isEmpty {
            // get search results
            tempArray = filterContactsWithSearchText(result: tempArray)
        }
        
        // returns the String array in sorted form
        return createSectionTitles(array: tempArray).sorted()
    }

    /// returns the section titles based on the contact data from personInfo
    /// - Parameter array: array of type PersonInfo containg contacts data
    /// - Returns: array of String contaning section titles
    func createSectionTitles(array: [PersonInfo]) -> [String] {
        // gets the section title by checking the first letter of first name and last name
        // set used to remove duplicates
        // then converted to array
        return Array(Set(array.compactMap{
            
            guard let firstname = $0.firstName?.uppercased(), let lastname = $0.lastName?.uppercased() else {
                return ""
            }
            
            // return string value
            // of length 1 containg the first letter
            // from firstname or lastname
            return String(firstname.isEmpty ? lastname.prefix(1) : firstname.prefix(1))
                
            }
        ))
    }
    
    
    /// returns array of type PersonInfo contaning results matching
    /// with the search field text when search is in active mode
    /// - Parameter result: PersonInfo array containing default data
    /// - Returns: PersonInfo array with filtered data based on search field text
    func filterContactsWithSearchText(result: [PersonInfo]) -> [PersonInfo] {
        // get search string
        let search = textInSearchField.lowercased()
        
        // filter the array by comparing the section and the search text with the values in personInfo (i.e. firstname, lastname)
        // used forced unwrapping because the properties (firstname, lastname) are never null and instead they are empty
        return result.filter{
            
            guard let firstname = $0.firstName?.lowercased(), let lastname = $0.lastName?.lowercased() else {
                return false
            }
            // get full name
            let fullname = "\(firstname) \(lastname)"
            
            // check if first, last and full name contains searched text and return a bool value
            return firstname.contains(search) || lastname.contains(search) || fullname.contains(search)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
