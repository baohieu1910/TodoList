//
//  AddTodoView.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var todoListViewModel: TodoListViewModel
    
    @State var name = ""
    @State var date = Date.now
    
    var body: some View {
        VStack {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                }
                
                Section("Date") {
                    DatePicker("Date", selection: $date)
                        .datePickerStyle(.graphical)
                }
            
                if name == "" {
                    Text("Add")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(10)
                } else {
                    Button {
                        todoListViewModel.addTodo(name: name, date: date)
                        dismiss()
                    } label: {
                        Text("Add")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todoListViewModel: TodoListViewModel())
    }
}
