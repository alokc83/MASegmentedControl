# MASegmentedControl
![Language](https://img.shields.io/badge/Language-Swift%205-orange.svg)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/alokc83/WeatherInfo/graphs/commit-activity)
![cocoapods](https://img.shields.io/badge/cocoapods-0.0.3-red)
![carthage](https://img.shields.io/badge/Carthage-0.0.3-orange) <br>
[![GitHub issues](https://img.shields.io/github/issues/alokc83/MASegmentedControl)](https://github.com/alokc83/MASegmentedControl/issues)
[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![GitHub license](https://img.shields.io/github/license/alokc83/MASegmentedControl)](https://github.com/alokc83/MASegmentedControl/blob/master/LICENSE)

Super customizable Segmented Control for iOS. 
Following examples can give you idea how it can be customized. All this customization can be written anywhere before rendering of the control. Most desirable place is `didSet block.`

### Integrating with cococapods:
----
##### Integrating latest version
```
pod 'MASegmentedControl'

```
##### Integrating specific version
```
pods 'MASegmentedControl', '~> 0.0.3'

```

### Integrating with Carthage:
----
##### Integrating latest version
```
github "alokc83/MASegmentedControl"

```
##### Integrating specific version
```
github "alokc83/MASegmentedControl" ~> 0.0.3

```

### Circular segment:
----
![Circular design](screenshots/1.png) <br>
You would need to provide the image array that can be a array of image litrals or array of UIImage. 

```
 imagesSegmentedControl.fillEqually = false
 imagesSegmentedControl.buttonsWithDynamicImages = true
 imagesSegmentedControl.roundedControl = true
            
 // images is the array of image litrals 
 imagesSegmentedControl.setSegmentedWith(items: images)
 imagesSegmentedControl.padding = 2
 imagesSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9372549057, 
 											green: 0.3490196168, 
 											blue: 0.1921568662, 
 											alpha: 1)
```

<p>
 
### Rounded corner segment: 
----
![Rounded corner design](screenshots/2.png)

```
didSet {
        //Set this booleans to adapt control
        textSegmentedControl.itemsWithText = true
        textSegmentedControl.fillEqually = true
        textSegmentedControl.roundedControl = true
            
        textSegmentedControl.setSegmentedWith(items: ["Option 1", "Option2"])
        textSegmentedControl.padding = 2
        textSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, 
     											green: 0.2745098174, 
     											blue: 0.3019607961, 
    											alpha: 1)
        textSegmentedControl.selectedTextColor = #colorLiteral(red: 1, 
        									green: 1, 
        									blue: 1, 
        									alpha: 1)
        textSegmentedControl.thumbViewColor = #colorLiteral(red: 0, 
        										green: 0.4784313725, 
        										blue: 1, 
      											alpha: 1)
        textSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
}
```

<p>
 
### Square design with image: 
----
![Square design](screenshots/3.png)

```

didSet {
        //Set this booleans to adapt control
        iconsSegmentedControl.itemsWithText = false
        iconsSegmentedControl.fillEqually = false
        iconsSegmentedControl.roundedControl = false
            
        // icons is the array of image litrals 
        iconsSegmentedControl.setSegmentedWith(items: icons)
        iconsSegmentedControl.padding = 2
        iconsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        iconsSegmentedControl.buttonColorForNormal = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        iconsSegmentedControl.buttonColorForSelected = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }
```

<p> 
 
### Square text design:
----
![Square text design](screenshots/4.png)

```
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
```

<p>
 
### Youtube style design:
----
![Youtube design](screenshots/5.png)

```
didSet {    
        //Set this booleans to adapt control
        youtubeLikeSegmentedControl.itemsWithText = false
        youtubeLikeSegmentedControl.bottomLineThumbView = true
        youtubeLikeSegmentedControl.fillEqually = true
            
        // icons is the array of image litrals 
        youtubeLikeSegmentedControl.setSegmentedWith(items: icons)
        youtubeLikeSegmentedControl.padding = 2
        youtubeLikeSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.2020437331, alpha: 1)
        youtubeLikeSegmentedControl.buttonColorForNormal =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        youtubeLikeSegmentedControl.buttonColorForSelected = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.2020437331, alpha: 1)
  }
```

<p>
 
### Simple text highlight design:
-----
![text highlight design](screenshots/6.png)

```
didSet {
            
       //Set this booleans to adapt control
       hiddenThumbViewSegmentedControl.itemsWithText = true
       hiddenThumbViewSegmentedControl.fillEqually = true
       hiddenThumbViewSegmentedControl.thumbViewHidden = true
            
       hiddenThumbViewSegmentedControl.setSegmentedWith(items: ["Option 1", "Option 2"])
       hiddenThumbViewSegmentedControl.padding = 2
       hiddenThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
       hiddenThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
```

 
<p>
 
### Simple text highlight with underbar design:
-----
![text with underbar design](screenshots/7.png)

```
didSet {
        //Set this booleans to adapt control
        linearThumbViewSegmentedControl.itemsWithText = true
        linearThumbViewSegmentedControl.fillEqually = true
        linearThumbViewSegmentedControl.bottomLineThumbView = true
            
        linearThumbViewSegmentedControl.setSegmentedWith(items: ["Option 1", "Option 2", "Option 3"])
        linearThumbViewSegmentedControl.padding = 2
        linearThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        linearThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
         linearThumbViewSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)     
  }
```

[![Analytics](https://ga-beacon.appspot.com/UA-61420617-3/readme-page)]()
