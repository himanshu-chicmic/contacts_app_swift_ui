//
//  SwiftUIView.swift
//  ContactsApplication
//
//  Created by Nitin on 4/20/23.
//

import SwiftUI

struct DynamicTextFields: View {
    
    // boolean for bottom sheets
    @State private var showTypePickerView = false
    @Binding var type: String
    @Binding var textInTextField: String
    @State var listItems: [String]
    
    @Binding var doneButtonDisabled: Bool
    
    @State var selectedDate = Date()
    
    var keyboardType: UIKeyboardType
    var textFieldPlaceHolder: String
    
    var body: some View {
        HStack{
            HStack{
                Text(listItems == Strings.birthdateType ? HelperMethods.getTypeText(type) : type)
                    .foregroundColor(.blue)
                    .font(.system(size: 15))
                    // bottom sheet view
                    .sheet(isPresented: $showTypePickerView) {
                        SelectLabelView(listItems: listItems, selected: $type)
                    }
                Image(systemName: Icons.chevronRightIcon)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .fontWeight(.light)
            }.onTapGesture {
                showTypePickerView.toggle()
            }
            
            if listItems == Strings.dateType || listItems == Strings.birthdateType{
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .onChange(of: selectedDate) {
                        date in
                        textInTextField = HelperMethods.convertDateToString(date: date)
                    }
                    .frame(height: 24)
                    .clipped()
                    .environment(\.calendar, Calendar(identifier: HelperMethods.getCalendarType(type)))
            }
            
            else if listItems == Strings.addressType {
                AddressFields(textInFields: $textInTextField)
                    .onChange(of: textInTextField) {
                        text in
                        doneButtonDisabled = false
                    }
            }
            
            else {
                // text fields
                TextField(textFieldPlaceHolder, text: $textInTextField)
                    .font(.system(size: 15))
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                    .onChange(of: textInTextField) {
                        text in
                        doneButtonDisabled = false
                    }
            }
        }
        .padding(.vertical, 6)
        
    }
    
}
