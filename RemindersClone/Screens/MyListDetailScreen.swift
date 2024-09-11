//
//  MyListDetailScreen.swift
//  RemindersClone
//
//  Created by Aaron Graves on 9/10/24.
//

import SwiftUI
import SwiftData

struct MyListDetailScreen: View {
    
    let myList: MyList
    @State private var title: String = ""
    @State private var isNewReminderAlertPresented: Bool = false
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    private func saveReminder() {
        let reminder = Reminder(title: title)
        myList.reminders.append(reminder)
    }
    
    var body: some View {
        VStack {
            List(myList.reminders) { reminder in
                Text(reminder.title)
            }
            
            Spacer()
            Button(action: {
                isNewReminderAlertPresented = true
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }.navigationTitle(myList.name)
            .alert("New Reminder", isPresented: $isNewReminderAlertPresented) {
                TextField("", text: $title)
                Button("Cancel", role: .cancel) { }
                Button("Done") {
                    if isFormValid {
                        saveReminder()
                    }
                }
            }
    }
}

struct MyListDetailScreenContainer: View {
    
    @Query private var myLists: [MyList]
    
    var body: some View {
        MyListDetailScreen(myList: myLists[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListDetailScreenContainer()
    }.modelContainer(previewContainer)
}
