//
//  ContactButtons.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI

struct ContactButtons: View {
    
    // MARK: - button properties
    @Binding var icon: String
    @Binding var title: String
    @Binding var isInactive: Bool
    
    @Environment (\.colorScheme) var colorScheme
    
    // MARK: - body
    var body: some View {
        
        Button(action: {
            // nothing
        }, label: {
            VStack(spacing: 2){
                // button icon
                Image(systemName: icon)
                // button text
                Text(title)
                    .font(.system(size: 12))
            }
        })
        .padding(12)
        .frame(maxWidth: .infinity)
        // set backround color based on the state of the button
        .foregroundColor(isInactive ? .gray.opacity(0.2) : .blue)
        .background(colorScheme == .dark ? .black : .white)
        .cornerRadius(12)
        .disabled(isInactive)
        
    }
}
