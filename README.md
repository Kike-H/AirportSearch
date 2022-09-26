# AirportSearch

This is app for iOS that use the [Aviation Reference Data](https://rapidapi.com/proground/api/aviation-reference-data/) for shearch airports near you in a range.

This a technical test for [Itercam Banco](https://www.intercam.com.mx).

## Requiremnets

1. You need a computer with xcode 
2. You need to install [cocoapods](https://cocoapods.org)


```bash
sudo gem install cocoapods
```

## Installation

1. Install the pods

```bash
pod install 
```

2. Create the next file `Env.swift` with the following code:
```swift
import Foundation
import SwiftUI

private struct ApiKey: EnvironmentKey {
    static let defaultValue: String = "your-api-key"
}

extension EnvironmentValues {
    var APIKEY: String {
        get { self[ApiKey.self] }
    }
}

```

3. Open Pokedex.xcworkspace

```bash
open Pokedex.xcworkspace
```

## Images
<p float="left">
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmTwEp5mIZGtk8NHV_80T2HzP3UPzDrSwbMotMlk7cQb0mCeiEVcxuusfKseESQiAEntA3IQHWc=w2880-h1592" alt="img1" width="250" style =/> 
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmSB0rAV4B12JIvIV4JpGdcXD7D7GB4cGFm1GKRrSc6nXM3nSLL61tTZWmFA8tGzZZ3ULBiU2ac=w2880-h1592" alt="img2" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmRM4RkKnF8bDMJ1BC9UyVwRjLqsdeFFodoWyVwk1kdF4-lLtiAoJErIZlb4Oje9gSTG4IrCPmw=w2880-h1592" alt="img3" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmT6MGtU48MqpF4G_Y61X16PVcjELdNrK7ENcb3PhC8g0pF2k73tuAbOsE3hg-cfc3ck3pw-d94=w2880-h1592" alt="img4" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmTG6L481mgE6SNY53yeFq78ofypyqBGzuZtq3ppzBjgku8OA9XJ-WPa4LJDnEklHY7pjRTh_kc=w2880-h1592" alt="img5" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmTLt98G6xQrnV-s4XdB6L7_lRFuyBrA0EaSuG3TdMr3cGSl7mteWi5fN7PkhPLVUNDRai_9K1A=w2880-h1592" alt="img6" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmTQ4dWo9KJotZgZ4RujsavTrmZj3EhI0oY5SDxvIk8V5g1FQ2bEEXn79W07djzz5lc_N2cuF18=w2880-h1592" alt="img7" width="250"/>
<img src="https://lh3.googleusercontent.com/drive-viewer/AJc5JmTnc8_COocUFvGQCGOLu2rsXTyoN6ccfY_v9fYUWg8DYHKgIzhd_7esgTMrHi4DzgJuPeVQi3o=w2880-h1592" alt="img8" width="250"/>
</p>

## Contributing
This is a personal projec, but I see all the feedback that you can send me.

## License
[MIT](https://choosealicense.com/licenses/mit/)
