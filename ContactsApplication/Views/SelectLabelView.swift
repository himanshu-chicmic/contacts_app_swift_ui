//
//  MobileLabelView.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI

struct SelectLabelView: View {
    
    // MARK: - properties
    @Environment (\.dismiss) var dismiss
    
    // data items
    @State var listItems: [String]
    
    // current selected string value
    @Binding var selected: String
    
    // MARK: - body
    var body: some View {
        VStack {
            
            // top bar with
            // cancel button &
            // title label
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Text(Strings.cancel)
                })
                
                Text(Strings.label)
                    .frame(maxWidth: .infinity)
                
                // not visible
                Button(action: {
                    dismiss()
                }, label: {
                    Text(Strings.done)
                })
                .disabled(true)
                .opacity(0)
            }
            .padding()
            .padding(.top, 14)
            
            // show list of items containg different mobile types
            List {
                ForEach(listItems, id: \.self) { item in
                    HStack{
                        Text(item)
                        
                        // show check icon to trailing of selected value
                        if item == selected {
                            Spacer()
                            Image(systemName: Icons.checkmark)
                                .foregroundColor(.blue)
                        }
                    }
                    .onTapGesture {
                        selected = item
                        dismiss()
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}
