//
//  ViewController.swift
//  MASegmentControl-Example
//
//  Created by Alok Choudhary on 12/30/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit
import MASegmentedControl

class ViewController: UIViewController {
    private var colorsViewModel: GenericViewModel<UIColor>?
    
    /**
            Circular design
     */
    @IBOutlet weak var imagesSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            imagesSegmentedControl.fillEqually = false
            imagesSegmentedControl.buttonsWithDynamicImages = true
            imagesSegmentedControl.roundedControl = true
            
            let images = ContentDataSource.imageItems()
            imagesSegmentedControl.setSegmentedWith(items: images)
            imagesSegmentedControl.padding = 2
            imagesSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
    
    /**
            When control is having text
     */
    @IBOutlet weak var textSegmentedControl: MASegmentedControl! {
        didSet {
            //Set this booleans to adapt control
            textSegmentedControl.itemsWithText = true
            textSegmentedControl.fillEqually = true
            textSegmentedControl.roundedControl = true
            
            let strings = ContentDataSource.textItems()
            textSegmentedControl.setSegmentedWith(items: strings)
            textSegmentedControl.padding = 2
            textSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSegmentedControl.thumbViewColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            textSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }
    
        /**
            Another example with icons square
     */
    @IBOutlet weak var iconsSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            iconsSegmentedControl.itemsWithText = false
            iconsSegmentedControl.fillEqually = false
            iconsSegmentedControl.roundedControl = false
            
            let icons = ContentDataSource.iconItems()
            iconsSegmentedControl.setSegmentedWith(items: icons)
            iconsSegmentedControl.padding = 2
            iconsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            iconsSegmentedControl.buttonColorForNormal = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            iconsSegmentedControl.buttonColorForSelected = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    /**
           Another example with text square
    */
    @IBOutlet weak var textSquareSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            textSquareSegmentedControl.itemsWithText = true
            textSquareSegmentedControl.fillEqually = true
            
            let strings = ContentDataSource.textItems()
            textSquareSegmentedControl.setSegmentedWith(items: strings)
            textSquareSegmentedControl.padding = 2
            textSquareSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSquareSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSquareSegmentedControl.thumbViewColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
    
    /**
     Segmented control customized as youtue segment control
    */
    @IBOutlet weak var youtubeLikeSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            youtubeLikeSegmentedControl.itemsWithText = false
            youtubeLikeSegmentedControl.bottomLineThumbView = true
            youtubeLikeSegmentedControl.fillEqually = true
            
            let icons = ContentDataSource.iconItems()
            youtubeLikeSegmentedControl.setSegmentedWith(items: icons)
            youtubeLikeSegmentedControl.padding = 2
            youtubeLikeSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.2020437331, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForNormal =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForSelected = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.2020437331, alpha: 1)
        }
    }

    /**
     Segmented control customized with Text highlight and no thumb view
    */
    @IBOutlet weak var hiddenThumbViewSegmentedControl: MASegmentedControl! {
        
        didSet {
            
            //Set this booleans to adapt control
            hiddenThumbViewSegmentedControl.itemsWithText = true
            hiddenThumbViewSegmentedControl.fillEqually = true
            hiddenThumbViewSegmentedControl.thumbViewHidden = true
            
            let strings = ContentDataSource.textItems()
            hiddenThumbViewSegmentedControl.setSegmentedWith(items: strings)
            hiddenThumbViewSegmentedControl.padding = 2
            hiddenThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            hiddenThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    /**
     Segmented control customized with Text highlight and  thumb view
    */
    @IBOutlet weak var linearThumbViewSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            linearThumbViewSegmentedControl.itemsWithText = true
            linearThumbViewSegmentedControl.fillEqually = true
            linearThumbViewSegmentedControl.bottomLineThumbView = true
            
            let strings = ContentDataSource.options()
            linearThumbViewSegmentedControl.setSegmentedWith(items: strings)
            linearThumbViewSegmentedControl.padding = 2
            linearThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            linearThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            linearThumbViewSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            
        }
    }
    
    // MARK: Type 8 
    @IBOutlet weak var colorsSegmentedControl: MASegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            colorsSegmentedControl.itemsWithDynamicColor = true
            colorsSegmentedControl.fillEqually = false
            colorsSegmentedControl.roundedControl = true
            
            let colors = ContentDataSource.colorItems()
            colorsSegmentedControl.setSegmentedWith(items: colors)
            colorsSegmentedControl.imageForItemWithDynamicColors = UIImage(named: "circle")
            colorsSegmentedControl.padding = 2
            colorsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            colorsSegmentedControl.animationDuration = 0.2
            colorsViewModel = GenericViewModel<UIColor>(items: colors)
            
        }
    }
    
    @IBAction func changrBackgroundColor(_ sender: MASegmentedControl) {
        let backGroundColor = colorsViewModel?.getItem(at: sender.selectedSegmentIndex)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = backGroundColor
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backGroundColor = colorsViewModel?.getItem(at: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = backGroundColor
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func updateSelectedIndex(_ sender: UIButton) {
        hiddenThumbViewSegmentedControl.selectedSegmentIndex = 3
    }
    
}

