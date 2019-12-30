//
//  GenericViewModel.swift
//  MASegmentedControl
//
//  Created by Alok Choudhary on 12/25/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation

//MARK: Generic viewmodel that accepts an array of T
//Main responsability is to return the element selected at index
struct GenericViewModel<T>: IndexReturnable {

    var itemsForSelection: [T]
    
    init(items: [T]) {
        self.itemsForSelection = items
    }
    
    func getItem(at index: Int) -> T {
        return self.itemsForSelection[index]
    }
    
    mutating func update(items: [T]) {
        self.itemsForSelection.removeAll()
        self.itemsForSelection = items
    }
}




