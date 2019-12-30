//
//  IndexReturnable.swift
//  MASegmentedControl
//
//  Created by Alok Choudhary on 12/25/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation

//Protocol with associated Type
protocol IndexReturnable {
    associatedtype Object
    var itemsForSelection : [Object] { get set }
    func getItem(at index: Int) -> Object
}
