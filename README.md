# MASegmentedControl
Super customizable Segmented Control for iOS.

## If control contains texts:
 ```
 segmentedControl.setSelectorWith(titles: [String])
 itemsWithText = true
 fillEqually = true/false 
 ```
`fillEqually`: can be true or false depending on the lenght of text, suggest set to true to give mnore space to text.
 
## If control contains images:
 
 ```
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 fillEqually = true/false 
 ```
 `fillEqually`: depending on design `buttonColorForNormal` and `buttonColorForSelected` and set the value.
 
## if control contains images that are different and dont want to change its tintColor on selection:
 ```
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 buttonsWithDynamicImages = true
 ```
🛑Note - Please don't set `itemsWithDynamicColor` to true here that will make buttons not show on app //this will change the image based on the index
 
## If control needs to change color
 
 ```
 segmentedControl.setSelectorWith(colors: [UIColor])
 itemsWithText = false
 fillEqually = true/false //depending on design
 itemsWithDynamicColor = true
 imageForItemWithDynamicColors = true //image that will change color
 ```
