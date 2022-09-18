//
//  ContentView.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 14.09.2022.
//

import SwiftUI

struct ChecklistView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color(UIColor.systemBackground))
                    .onTapGesture {
                        if let matchingIndex = self.checklist.items.firstIndex(where: { $0.id == checklistItem.id }) {
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }, trailing: EditButton()
            )
            .navigationBarTitle("Checklist")
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            Text("dsadas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
    
