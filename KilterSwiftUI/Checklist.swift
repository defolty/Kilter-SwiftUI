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
class Checklist: ObservableObject {
    ///# Протокол `ObservableObject`, что означает, что наблюдатель
    ///# может постоянно следить за его свойствами `@Published` и получать уведомления, если их значения изменяются
    @Published var items = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
    }
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
    }
}
