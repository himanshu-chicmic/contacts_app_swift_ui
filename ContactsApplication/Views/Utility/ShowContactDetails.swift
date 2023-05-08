//
//  ShowContactDetails.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//

import SwiftUI
import MapKit

struct ShowContactDetails: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State var addressLine: [String] = []
    
    var type: String
    var value: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(type.contains("Calendar") ? HelperMethods.getTypeText(type) : type)
                    .padding(.bottom, 0.2)
                    .font(.system(size: 14))
                if value.contains("\n") {
                    HStack (alignment: .top){
                        
                        VStack (alignment: .leading){
                            ForEach(addressLine, id: \.self) {
                                text in
                                if !text.isEmpty {
                                    Text(text)
                                        .font(.system(size: 16))
                                        .padding(.vertical, 1)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Map(coordinateRegion: $region)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(4)
                    }
                }else {
                    Text(value)
                        .foregroundColor(.blue)
                        .font(.system(size: 16))
                }
            }
            // spacer to occupy extra space
            // and push the upper view (VStack)
            // to start (trailing)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .onAppear{
            if value.contains("\n") {
                addressLine = value.components(separatedBy: ["\n", "\t"])
            }
        }
    }
}
