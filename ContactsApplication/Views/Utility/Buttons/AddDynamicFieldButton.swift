//
//  AddDynamicFieldButton.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/20/23.
//

import SwiftUI

struct AddDynamicFieldButton: View {
    
    var buttonText: String
    
    var body: some View {
        // insert rows into list view on tap
        HStack{
            Image(systemName: Icons.plusCircleIcon)
                .foregroundColor(.green)
                .font(.system(size: 22))
            Text(buttonText)
                .padding(.leading, 6)
                .font(.system(size: 15))
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
