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
    @Published var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
}
