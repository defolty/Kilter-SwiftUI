//
//  ContentView.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 14.09.2022.
//

import SwiftUI

struct ChecklistView: View {
    
    @ObservedObject var checklistViewModel = ChecklistViewModel() // связь ViewModel с View
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistViewModel.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color(UIColor.systemBackground))
                    .onTapGesture {
                        if let matchingIndex = self.checklistViewModel.items.firstIndex(where: { $0.id == checklistItem.id }) {
                            self.checklistViewModel.items[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklistViewModel.deleteListItem)
                .onMove(perform: checklistViewModel.moveListItem)
            }
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }
            )
            .navigationBarTitle("Checklist")
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklistViewModel)
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
    
