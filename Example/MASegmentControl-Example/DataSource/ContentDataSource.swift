//
//  DummyDataSource.swift
//  MASegmentedControl
//
//  Created by Alok Choudhary on 12/25/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation
import UIKit

class ContentDataSource {
    
    static func colorItems() -> [UIColor] {
        return [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
    }
    
    static func moreColorItems() -> [UIColor] {
        return [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)]
    }
    
    static func iconItems() -> [UIImage] {
        return  [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "new")]
    }
    
    static func textItems() -> [String] {
        return ["Option 1", "Option2", "Options3", "Options4"]
    }
    
    static func options() -> [String] {
        return ["Option 1", "Option2", "Option 3"]
    }
    
    static func imageItems() -> [UIImage] {
        return [#imageLiteral(resourceName: "home2"), #imageLiteral(resourceName: "location"), #imageLiteral(resourceName: "settings"), #imageLiteral(resourceName: "userGroup")]
    }
    
}
