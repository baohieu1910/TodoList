//
//  HomeView.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var todoListViewModel = TodoListViewModel()
    @ObservedObject var colorSchemeManager = ColorSchemeManager.shared
    @State var searchText = ""
    @State var showAddSheet = false
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(todoListViewModel.todos) { todo in
                        Divider()
                        HStack {
                            Button {
                                todo.makeItDone()
                                todoListViewModel.updateTodoList()
                            } label: {
                                Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(colorSchemeManager.isLightMode ? .black : .white)
                                    .padding(.horizontal, 10)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("\(todo.name ?? "N/A")")
                                    .foregroundColor(colorSchemeManager.isLightMode ? .black : .white)
                                    .font(.system(size: 20))
                                    .lineLimit(1)
                                
                                HStack {
                                    Text("\(todo.date?.getTime() ?? Date.now.getTime())")
                                        .font(.subheadline)
                                        .foregroundColor(todo.date ?? Date.now > Date.now ? .gray : .red)
                                    
                                    Text("\(todo.date?.getDate() ?? Date.now.getDate())")
                                        .font(.subheadline)
                                        .foregroundColor(todo.date ?? Date.now > Date.now ? .gray : .red)
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                        }
                    }
                }
                
                Divider()
                
                Button {
                    showAddSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        
                        Text("Add Todo")
                            .padding()
                    }
                }
                .sheet(isPresented: $showAddSheet) {
                    AddTodoView(todoListViewModel: todoListViewModel)
                }
            }
            .padding(.horizontal)
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        todoListViewModel.deleteAllTodos()
                    } label: {
                        Text("Remove All")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        ColorSchemeManager.shared.changeColorScheme()
                    } label: {
                        Image(systemName: colorSchemeManager.isLightMode ? "sun.max" : "moon")
                    }
                }
            }
            .searchable(text: $searchText) {
                
            }
        }
        .environment(\.colorScheme, colorSchemeManager.isLightMode ? .light : .dark)
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
