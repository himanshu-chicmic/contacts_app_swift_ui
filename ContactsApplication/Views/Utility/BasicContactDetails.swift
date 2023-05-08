//
//  BasicContactDetails.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//

import SwiftUI

struct BasicContactDetails: View {
    
    @Binding var personInfo: PersonInfo
    @Binding var actionButtonsInactive: Bool
    
    // action buttons state (message, call, mail)
    @State var buttonIcon = [Icons.messageIcon, Icons.callIcon, Icons.mailIcon]
    @State var buttonTitle = [Strings.message, Strings.call, Strings.mail]
    
    var body: some View {
        VStack{
            // person image
            if let personInfo = personInfo {
                Image(uiImage: HelperMethods.getImage(personInfo: personInfo))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 124, height: 124)
                    .clipped()
            }
            
            // person name
            if let fname = personInfo.firstName, let lname = personInfo.lastName {
                Text(HelperMethods.getPersonsName(fname: fname, lname: lname))
                .font(.system(size: 28))
                .padding(.top, 6)
            }
            
            // show company is it's not empty
            if let company = personInfo.company, !company.isEmpty {
                Text(company)
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
            }
            
            HStack{
                // for each loop to add 3 buttons (message, call, email) to HStack view
                ForEach((0..<3), id: \.self) {
                    ContactButtons(icon: $buttonIcon[$0], title: $buttonTitle[$0], isInactive: $actionButtonsInactive)
                }
                
            }.padding(.vertical, 10)
        }
    }
}
