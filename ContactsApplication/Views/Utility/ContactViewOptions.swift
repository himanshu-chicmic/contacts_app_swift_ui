//
//  ContactViewOptions.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//

import SwiftUI

struct ContactViewOptions: View {
    
    @Binding var notes: String
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading){
                Text(Strings.notes)
                    .font(.system(size: 14))
                TextField("", text: $notes, axis: .vertical)
                    .lineLimit(15)
                    .font(.system(size: 16))
            }
            .padding()
            .padding(.bottom, 44)
            .background(colorScheme == .dark ? .black : .white)
            .cornerRadius(12)
            
            VStack {
                ForEach(Strings.additionalOptionsContactViewCombined, id: \.self) { text in
                    
                    Button(action: {
                        // do nothing
                    }, label: {
                        HStack{
                            Text(text)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                    })
                    
                    if text != Strings.additionalOptionsContactViewCombined.last {
                        Divider()
                            .padding(.horizontal)
                    }
                    
                }
            }
            .padding(.vertical, 8)
            .background(colorScheme == .dark ? .black : .white)
            .cornerRadius(12)
            .padding(.top, 10)
            
            // list contacts stored with current user
            ForEach(Strings.additionalOptionsContactView, id: \.self) { text in
                
                Button(action: {
                    // do nothing
                }, label: {
                    HStack{
                        Text(text)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(colorScheme == .dark ? .black : .white)
                    .cornerRadius(12)
                    
                    
                })
                .padding(.top, 10)
                
            }
        }
        .padding(.vertical, 10)
        
    }
}
