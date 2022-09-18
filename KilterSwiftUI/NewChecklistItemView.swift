//
//  NewChecklistItemVIew.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 18.09.2022.
//

import SwiftUI

struct NewChecklistItemView: View {
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                Text("Enter item name")
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemVIew_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView()
    }
}
