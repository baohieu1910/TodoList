//
//  HomeView.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var todoListViewModel = TodoListViewModel()
    
    @State var searchText = ""
    @State var showAddSheet = false
    
    var body: some View {
        NavigationView {
//            ScrollView(showsIndicators: false) {
//
//            }
            ScrollView(showsIndicators: false) {
                Divider()
                ForEach(todoListViewModel.todos) { todo in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(todo.name ?? "N/A")")
                                .lineLimit(1)
                            
                            Text("\(todo.date?.timeZoneVN() ?? Date.now.timeZoneVN())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                       
                        Text(todo.isDone ? "Completed" : "Pending")
                            .padding(10)
                            .background(todo.isDone ? Color.green : Color.orange)
                            .cornerRadius(90)
                    }
                    Divider()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddSheet) {
                        AddTodoView(todoListViewModel: todoListViewModel)
                    }
                }
            }
            .searchable(text: $searchText) {
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
