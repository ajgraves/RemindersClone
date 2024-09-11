//
//  MyListsScreen.swift
//  RemindersClone
//
//  Created by Aaron Graves on 8/22/24.
//

import SwiftUI
import SwiftData

struct MyListsScreen: View {

    @Query private var myLists: [MyList]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("My Lists")
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists) { myList in
                
                NavigationLink {
                    MyListDetailScreen(myList: myList)
                } label: {
                    HStack {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex: myList.colorCode))
                        Text(myList.name)
                    }
                }
            }
            
            Button(action: {
                isPresented = true
            }, label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }).listRowSeparator(.hidden)
        }.listStyle(.plain)
            .sheet(isPresented: $isPresented, content: {
                NavigationStack { // Why the fuck are we doing this here? We should have this in the view
                    AddMyListScreen()
                }
            })
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListsScreen()
    }.modelContainer(previewContainer)
}
