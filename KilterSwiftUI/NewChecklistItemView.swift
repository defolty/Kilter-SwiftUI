//
//  NewChecklistItemVIew.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 18.09.2022.
//

import SwiftUI

struct NewChecklistItemView: View {
    var checklist: ChecklistViewModel
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add new item") 
            Form {
                TextField("Enter item name", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItemModel(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                .disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemVIew_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: ChecklistViewModel())
    }
}
