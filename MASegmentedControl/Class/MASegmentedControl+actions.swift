//
//  MASegmentedControl+actions.swift
//  MASegmentedControl
//
//  Created by Alok Choudhary on 12/30/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation
import UIKit

//MARK: ACTIONS WHEN ITEM IS SELECTED IT HANDLES: ACTION - APPEREANCE - TRANSLATION
extension MASegmentedControl {
    
    //MARK: MAIN ACTION: .valueChanged
    internal func performAction() {
        sendActions(for: .valueChanged)
    }
    
    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc internal func buttonTapped(button: UIButton) {
        
        for (btnIndex, btn) in self.buttons.enumerated() {
            
            btn.setTitleColor(textColor, for: .normal)
            if !itemsWithDynamicColor {
                if !buttonsWithDynamicImages {
                    btn.tintColor = buttonColorForNormal
                }
            }
            if btn == button {
                selectedSegmentIndex = btnIndex
                fillEqually ?  moveThumbView(at: btnIndex) : moveThumbViewFillEquallyFalse(at: btnIndex)
                btn.setTitleColor(selectedTextColor, for: .normal)
                if !itemsWithDynamicColor {
                    if !buttonsWithDynamicImages {
                        btn.tintColor = buttonColorForSelected
                    }
                }
            }
        }
        self.performAction()
    }
    
    //MARK: TRANSLATION OF THUMBVIEW WITH ANIMATION ON TAP
    
    //Movement of thumbview if fillEqually = true
    private func moveThumbView(at index: Int) {
        
        let selectedStartPosition = index == 0 ? self.padding : bounds.width / CGFloat(buttons.count) *  CGFloat(index) + self.padding
        UIView.animate(withDuration: TimeInterval(self.animationDuration), animations: {
            self.thumbView.frame.origin.x = selectedStartPosition
        })
    }
    
    //Movement of thumbview if fillEqually = false
    private func moveThumbViewFillEquallyFalse(at index: Int) {
        
        let firstelementPositionX = self.padding
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding
        
        //the area where the selector is contained
        let selectorAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = selectorAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (selectorAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForNotEquallyFill = startingPointAtIndex + originXForNextItem
        
        UIView.animate(withDuration: TimeInterval(self.animationDuration), animations: {
            
            if index == 0 {
                self.thumbView.frame.origin.x = firstelementPositionX
            } else if index == self.buttons.count - 1 {
                self.thumbView.frame.origin.x = lastElemetPositionX
            } else {
                self.thumbView.frame.origin.x = selectedStartPositionForNotEquallyFill
            }
        })
    }
}
