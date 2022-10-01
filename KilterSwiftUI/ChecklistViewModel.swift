//
//  Checklist.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 17.09.2022.
//

import Foundation

///# `ViewModel` Func
///# Отображение пунктов контрольного списка.
///# Удаление элемента.
///# Перемещение элемента.
///# Переключение элемента между "checked" и "unchecked".

///# `Checklist` должен быть доступен из нескольких разных мест.
///# Это означает, что экземпляр `Checklist` должен быть ссылочным типом, что означает, что он должен быть классом
class ChecklistViewModel: ObservableObject {
    ///# Протокол `ObservableObject`, что означает, что наблюдатель
    ///# может постоянно следить за его свойствами `@Published` и получать уведомления, если их значения изменяются
    @Published var items = [
        ChecklistItemModel(name: "Walk the dog"),
        ChecklistItemModel(name: "Brush my teeth"),
        ChecklistItemModel(name: "Learn iOS development", isChecked: true),
        ChecklistItemModel(name: "Soccer practice"),
        ChecklistItemModel(name: "Eat ice cream", isChecked: true),
    ]
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
    }
    
    func printChecklistContents() {
        for item in items {
            print(item)
        }
    } 
}
