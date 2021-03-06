# AboutThisApp

[![Actions Status](https://github.com/hexedbits/AboutThisApp/workflows/CI/badge.svg)](https://github.com/hexedbits/AboutThisApp/actions)

*A standard, customizable "About This App" panel for any Mac app*

## About

This library provides a standard "About This App" panel for Mac apps. It requires **zero configuration by default** for typical projects, and it can be easily customized.

AppKit provides a default "About This App" panel via [`NSApp.orderFrontStandardAboutPanel()`](https://developer.apple.com/documentation/appkit/nsapplication/1428479-orderfrontstandardaboutpanel), but customization is limited.

This component is used in [Red Eye](https://www.hexedbits.com/redeye/) and [Lucifer](https://www.hexedbits.com/lucifer/).

<img src="https://raw.githubusercontent.com/hexedbits/AboutThisApp/dev/screenshots/screenshot_dark.png" width="50%" />

<img src="https://raw.githubusercontent.com/hexedbits/AboutThisApp/dev/screenshots/screenshot_light.png" width="50%" />

## Usage

```swift
let metadata = AppMetadata() // customize if desired

let panel = AboutThisAppPanel(metadata: metadata)

panel.makeKeyAndOrderFront(nil)
```

## Requirements

- macOS 10.14+
- Swift 5.3+
- Xcode 12.0+
- SwiftLint

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

Add `AboutThisApp` to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/hexedbits/AboutThisApp", from: "1.0.0")
]
```

Alternatively, you can add the package [directly via Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Documentation

You can read the [documentation here](https://hexedbits.github.io/AboutThisApp). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/hexedbits/.github/blob/master/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/hexedbits/.github/blob/master/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/hexedbits/.github/blob/master/SUPPORT.md)
- [Security Policy](https://github.com/hexedbits/.github/blob/master/SECURITY.md)

Also, consider [sponsoring this project](https://www.jessesquires.com/sponsor/) or [buying my apps](https://www.hexedbits.com)! ??????

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

Released under the MIT License. See `LICENSE` for details.

>**Copyright &copy; 2020-present Jesse Squires.**
