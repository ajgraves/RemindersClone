//
//  MyListsScreen.swift
//  RemindersClone
//
//  Created by Aaron Graves on 8/22/24.
//

import SwiftUI

struct MyListsScreen: View {

    let myLists = ["Reminders", "Groceries", "Entertainment"]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("My Lists")
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists, id: \.self) { myList in
                HStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 32))
                    Text(myList)
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

#Preview {
    NavigationStack {
        MyListsScreen()
    }
}
