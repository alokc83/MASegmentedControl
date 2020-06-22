//
//  MASegmentedControl.swift
//  MASegmentedControl
//
//  Created by Alok Choudhary on 12/25/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//


import Foundation
import UIKit

@IBDesignable
public class MASegmentedControl: UIControl {
    
    //static properties
    //Set to 10 by default, if setted to 0 the image will be same size at button
    static let imageInsets: UIEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    static let bottomLineThumbViewHeight: CGFloat = 5.0
    
    //Private UI properties
    internal var buttons = [UIButton]()
    internal var thumbView: UIView = {
        return UIView()
    }()
        
    //Private datasources
    @IBInspectable private var buttonImages: [UIImage] = [] {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable internal var buttonTitles: [String] = [] {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable private var buttonColors: [UIColor] = [] {
        didSet {
            updateView()
        }
    }
    
    //Public properties customize segmented control
    //change this public properties for customization
    
    //MARK: APPEREANCE
    public var selectedSegmentIndex = 0

    @IBInspectable public var padding: CGFloat = 0 {
        didSet {
            self.updateView()
        }
    }
    
    @IBInspectable public var customBorderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = customBorderWidth
        }
    }
    
    @IBInspectable public var customBorderColor: UIColor = .clear {
        didSet {
            layer.borderColor = customBorderColor.cgColor
        }
    }
    
    //animation duration is 0.3 by default
    @IBInspectable public var animationDuration: CGFloat = 0.3
    @IBInspectable public var thumbViewAlpha: CGFloat = 1.0 {
        didSet {
            self.thumbView.alpha = thumbViewAlpha
        }
    }

    //segmented
    @IBInspectable public var segmentedBackGroundColor: UIColor = .white {
        didSet {
            self.backgroundColor = segmentedBackGroundColor
        }
    }
    
    //thumbView
    @IBInspectable public var thumbViewColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    //MARK: SEGMENTED CONTROL WITH TEXT
    @IBInspectable public var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var selectedTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    public var titlesFont: UIFont? {
        didSet {
            updateView()
        }
    }
    
    //MARK: SEGMENTED CONTROL WITH IMAGES
    //if images with change on it's tint color on selection
    @IBInspectable public var buttonColorForNormal: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var buttonColorForSelected: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }

    //MARK: SEGMENTED CONTROL WITH COLORS

    //this is just a placeholder it can be any type of images passed as parameter it will "hold" the color and present it
    @IBInspectable public var imageForItemWithDynamicColors: UIImage? {
        didSet {
            updateView()
        }
    }
    
    //MARK: MAIN BOOLEANS FOR SET UICONTROL
    //main properties for customize segmented, if items contains text is recommended to set the fillEqually to true
    
    //A) Most important booleans are fillEqually - itemsWithText - roundedControl - bottomLineThumbView - thumbViewHidden
    public var fillEqually: Bool = false {
        didSet {
            self.layoutSubviews()
        }
    }
    
    //change the control for images and text
    public var itemsWithText: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var roundedControl: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var bottomLineThumbView: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var thumbViewHidden: Bool = false {
        didSet {
            self.thumbView.isHidden = thumbViewHidden
        }
    }
    
    //B) This makes changes on buttons with images and only if itemsWithText = false
    //if buttons have dynamicImages means if we want to show the image without changing its tintcolor
    //Setting this to true will make not buttonColorForNormal and buttonColorForSelected not been called
    @IBInspectable public var buttonsWithDynamicImages: Bool = false {
        didSet {
            updateView()
        }
    }
    
    //C) This makes changes on buttons with colors and only if itemsWithText = false
    @IBInspectable public var itemsWithDynamicColor: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    //MARK: SET SEGMENTED CONTROL DATASOURCES
    
    public func setSegmentedWith<T>(items: T) {
        if items is [String] {
            self.buttonTitles = items as! [String]
        } else if items is [UIImage] {
            self.buttonImages = items as! [UIImage]
        } else if items is [UIColor] {
            self.buttonColors = items as! [UIColor]
        }
    }
    
    //MARK: GENERIC METHOD FOR UPDATE DATASOURCES
    public func updateSegmentedWith<T>(items: T) {
        
        self.buttonTitles.removeAll()
        self.buttonImages.removeAll()
        self.buttonColors.removeAll()
        self.thumbView.alpha = 0
        
        self.selectedSegmentIndex = 0
        self.setSegmentedWith(items: items)

        UIView.animate(withDuration: 0.4) {
            self.updateView()
            self.thumbView.alpha = 1
        }
        //if we want to update the view based on the new selectedSegmentedIndex
        self.performAction()
    }
    
    //MARK: METHODS THAT WILL CREATE THE CONTROL BASED ON CUSTOMIZATION OF PROPERTIES
    
    //1 reset all views to clean state
    private func resetViews() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    //2 update the UI based on text/ images or colors
    private func updateView() {
        
        resetViews()
        self.clipsToBounds = false
        addSubview(thumbView)
        if itemsWithDynamicColor {
            setButtonsWithDynamicColors()
        } else {
            itemsWithText ? setButtonsWithText() : setButtonsWithImages()
        }
        if fillEqually {
            self.layoutButtonsOnStackView()
        } else {
            let _ = self.buttons.map { addSubview($0) }
        }
    }
    
    //3 all UI layout based on frames must be called on layoutSubviews
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = roundedControl ? frame.height / 2 : 1.0
        self.backgroundColor = self.segmentedBackGroundColor
        self.layer.borderWidth = self.customBorderWidth
        self.layer.borderColor = self.customBorderColor.cgColor

        setThumbView()
        //if fillEqually is not true the layout is not in stackview and its set based on frames
        guard !fillEqually else { return }
        for (index, btn) in self.buttons.enumerated() {
            btn.frame = setFrameForButtonAt(index: index)
        }
    }
    
    //MARK: THUMBVIEW LAYOUT
    private func setThumbView() {

        let thumbViewHeight = bottomLineThumbView ? MASegmentedControl.bottomLineThumbViewHeight : bounds.height - padding * 2
        let thumbViewWidth = fillEqually ? (bounds.width / CGFloat(buttons.count)) - padding * 2 : bounds.height - padding * 2
        let thumbViewPositionX = padding
        let thumbViewPositionY = bottomLineThumbView ? bounds.height - thumbViewHeight - padding : (bounds.height - thumbViewHeight) / 2
        
        thumbView.frame = CGRect(x: thumbViewPositionX, y: thumbViewPositionY, width: thumbViewWidth, height: thumbViewHeight)
        thumbView.layer.cornerRadius = roundedControl ? thumbViewHeight / 2 : 1.0
        thumbView.backgroundColor = thumbViewColor
    }
    
    //4 MARK: BUTTONS LAYOUTS
    // if fillEqualy = true
    private func layoutButtonsOnStackView() {
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo: topAnchor),
            sv.bottomAnchor.constraint(equalTo: bottomAnchor),
            sv.trailingAnchor.constraint(equalTo: trailingAnchor),
            sv.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
    }
    
    //if fillEqually = false
    private func setFrameForButtonAt(index: Int) -> CGRect {
        
        var frame = CGRect.zero
        
        //1 identify the height of each button
        let buttonHeight = (bounds.height - padding * 2)
        //2 set it's height for circle/square look and centered position Y
        let buttonWidth = buttonHeight
        let thumbViewPositionY = (bounds.height - buttonHeight) / 2

        //set first and last elements origin x
        let firstelementPositionX = self.padding
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding
        //MARK Start here to modify the items from the second until the one before the last
        //the area where the thumbView is contained
        let thumbViewAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = thumbViewAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (thumbViewAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForNotEquallyFill = startingPointAtIndex + originXForNextItem 
        
        if index == 0 {
            frame = CGRect(x: firstelementPositionX, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        } else if index == self.buttons.count - 1 {
            frame = CGRect(x: lastElemetPositionX, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        } else {
            frame = CGRect(x: selectedStartPositionForNotEquallyFill, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        }
        return frame
    }
    
    //called if boolean for text is true
    private func setButtonsWithText() {
        
        guard self.buttonTitles.count != 0 else { return }
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = titlesFont
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
            //set the one that we want to show as selected by default
        }
        buttons[selectedSegmentIndex].setTitleColor(selectedTextColor, for: .normal)
    }
    
    //called if boolean for text is false
    private func setButtonsWithImages() {
        
        guard self.buttonImages.count != 0 else { return }

        for buttonImage in self.buttonImages {
            
            var button: UIButton?
            if !buttonsWithDynamicImages {
                button = UIButton(type: .system)
                button?.tintColor = buttonColorForNormal
            } else {
                button = UIButton(type: .custom)
            }
            button?.setImage(buttonImage, for: .normal)
            button?.imageEdgeInsets = MASegmentedControl.imageInsets
            button?.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button!)
        }
        if !buttonsWithDynamicImages {
            buttons[selectedSegmentIndex].tintColor = buttonColorForSelected
        }
    }
    
    //called if boolean for dynamic colors in buttons is true
    private func setButtonsWithDynamicColors() {
        
        guard self.buttonColors.count != 0 else { return }
        for btnColor in self.buttonColors {
            let button = UIButton(type: .system)
            button.tintColor = btnColor
            if let image = self.imageForItemWithDynamicColors {
                button.setImage(image, for: .normal)
            }
            button.imageEdgeInsets = MASegmentedControl.imageInsets
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
    }
}

