//
//  ContentView.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 14.09.2022.
//

import SwiftUI

struct ChecklistItem {
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.name) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        if checklistItem.isChecked {
                            Text("✅")
                        } else {
                            Text("🔲") }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
        }
    }
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
