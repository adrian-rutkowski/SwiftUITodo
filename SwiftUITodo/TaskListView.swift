//
//  TaskListView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct TaskListView: View {
    @EnvironmentObject var userData: UserData
    @State var draftTitle: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        List {
            TextField("Create a New Task...", text: $draftTitle, onCommit: self.createTask).accessibilityIdentifier("create_new_task_textfield")
            ForEach(self.userData.tasks) { task in
                TaskItemView(task: task, isEditing: self.$isEditing)
            }
        }
        .navigationBarTitle(Text("Tasks 👀"))
        .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
            if !self.isEditing {
                Text("Edit").accessibilityIdentifier("edit_button")
            } else {
                Text("Done").bold().accessibilityIdentifier("done_button")
            }
        })
    }
    
    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }
}
