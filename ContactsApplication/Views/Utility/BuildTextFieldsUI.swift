//
//  BuildTextFieldsUI.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Himanshu on 4/26/23.
//

import SwiftUI

struct BuildTextFieldsUI: View {
    
    // edit mode for input field rows
    @State private var editModelState = EditMode.inactive
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @Environment (\.colorScheme) var colorScheme
    
    @Binding var fieldArray: [CellTextFieldsModel]
    @State var placeholder: String
    @State var keyboardType: UIKeyboardType
    @Binding var doneButtonDisabled: Bool
    @State var listItemsArray: [String]
    @State var buttonText: String
    @State var defaultValue: String
    
    var body: some View {
        VStack{
            VStack{
                Divider()
                
                if fieldArray.count > 0 {
                    
                    List {
                        ForEach($fieldArray) { $value in
                            
                            DynamicTextFields(type: $value.type, textInTextField: $value.value, listItems: listItemsArray, doneButtonDisabled: $doneButtonDisabled, keyboardType: keyboardType, textFieldPlaceHolder: placeholder)

                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    .scrollDisabled(true)
                    .padding(.horizontal, 4)
                    .frame(minHeight: listItemsArray == Strings.addressType ? (minRowHeight * 4) * CGFloat(fieldArray.count) + 24 : minRowHeight * CGFloat(fieldArray.count))
                    .environment(\.editMode, $editModelState)
                }
                
                // insert rows into list view on tap
                AddDynamicFieldButton(buttonText: buttonText)
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation{
                        // add new default instance to
                        // email array. initialize with default
                        // values
                        fieldArray.append(CellTextFieldsModel(value: "", type: listItemsArray == Strings.birthdateType ? Strings.birthdateType[0] : listItemsArray.randomElement() ?? defaultValue))

                        // set disable done button to false
                        doneButtonDisabled = false
                    }
                }
                
                Divider()
            }
            .background(colorScheme == .dark ? .black : .white)
            .onAppear{
                editModelState = .active
            }
            .onDisappear{
                editModelState = .inactive
            }
            
            Divider().padding().opacity(0)
        }
    }
    
    /// delete item from list view
    /// - Parameter offsets: index set of the item
    func delete(at offsets: IndexSet) {
        
        //remove from the contacts array
        fieldArray.remove(atOffsets: offsets)
        
        // set disable done button to false
        doneButtonDisabled = false
    }
}
