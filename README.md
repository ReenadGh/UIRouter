# UIRouter

UIRouter is a simple and flexible routing component for SwiftUI that allows you to present views using various presentation styles, including push, modal sheets, and full-screen covers. It's easy to use, highly customizable, and integrates seamlessly with the SwiftUI navigation stack.


## Installation


You can install UIRouter using Swift Package Manager. Simply add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/UIRouter.git", from: "1.0.0")
]
```


## Usage

To use UIRouter in your app, you can create instances of the Router view, specifying the presentation style, the destination view, and the label view that triggers the navigation. For example:

```swift
Router(presentationStyle: .push, destination: DetailView()) {
    Text("Show Details")
}
```

UIRouter also provides a number of convenience functions to make it easier to use certain presentation styles, such as push, present, sheet, and bottomSheet. For example:


### Full Screen 

```swift
Router(presentationStyle: .present(isPresented: $showFullScreen), destination: DestinationExample()) {
    Text("Show Full Screen")
}
```
### Push Navigation 

```swift
Router(presentationStyle: .push, destination: DestinationExample()) {
    Text("Show Push Navigation")
}
```

### Sheet 

```swift
Router(presentationStyle: .sheet(isPresented: $showSheet), destination: DestinationExample()) {
    Text("Show Sheet")
}
```
### Bottom Sheet

```swift
Router(presentationStyle: .bottomSheet(isPresented: $showBottomSheet), destination: DestinationExample()) {
    Text("Show Bottom Sheet")
}
```
## License

UIRouter is available under the MIT license. See the LICENSE file for more information.
