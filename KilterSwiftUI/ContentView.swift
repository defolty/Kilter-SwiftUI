//
//  ContentView.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = [
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream"
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteListItem)
            }
            .navigationBarTitle("Checklist")
        }
    }
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
