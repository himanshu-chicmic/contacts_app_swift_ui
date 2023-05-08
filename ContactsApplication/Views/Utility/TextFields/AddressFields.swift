//
//  AddressFields.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//

import SwiftUI

struct AddressFields: View {
    
    @Binding var textInFields: String
    
    @State var street: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zip: String = ""
    @State var country: String = ""
    
    var body: some View {
        VStack{
            Group{
                TextField("Street", text: $street)
                
                Divider()
                
                TextField("City", text: $city)
                
                Divider()
                
                HStack{
                    TextField("State", text: $state)
                    TextField("ZIP", text: $zip)
                }
                
                Divider()
                
                TextField("Country", text: $country)
            }
            .padding(2)
            .font(.system(size: 16))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            
        }
        .onChange(of: [street, city, state, zip, country]){
            text in
            textInFields = "\(street)\n\(city)\n\(state)\t\(zip)\n\(country)"
        }
        .onAppear{
            let array = textInFields.components(separatedBy: ["\n", "\t"])
            if array.count == 5 {
                street = String(array[0])
                city = String(array[1])
                state = String(array[2])
                zip = String(array[3])
                country = String(array[4])
            }
        }
    }
}
