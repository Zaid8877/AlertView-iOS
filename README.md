# 🔔 Custom AlertView for iOS

A fully customizable, animated alert view for iOS using UIKit. This component provides a reusable, visually rich modal with gradient background, grain animation, haptic feedback, and flexible button configurations.

## ✨ Features

- 🌈 Radial gradient background with grain animation
- ⚡ Smooth drop-and-tilt show/hide animations
- 🧩 Modular and reusable components (`AlertView`, `GradientBackgroundView`, `PeerGrainAnimation`)
- 🔘 Supports `.alert` and `.request` types (with OK and Cancel)
- 🎨 Custom font and color support via your design system
- 🧠 Delegate support for callbacks
- 📱 Haptic feedback integration

## 📷 Preview

*(Add a GIF or image here if available)*

---

## 🚀 Usage

### ✅ Show Alert

```swift
let alert = AlertView(frame: UIScreen.main.bounds)
alert.alertViewDelegate = self
alert.viewController = self
alert.show(type: .alert,
           title: "Alert Title",
           description: "This is a custom alert.")
```

### ❓ Show Confirm Request

```swift
alert.show(type: .request,
           title: "Are you sure?",
           description: "Do you really want to continue?",
           confirmText: "Yes",
           cancelText: "No")
```

### 🎯 Implement Delegate

```swift
extension YourViewController: AlertViewDelegate {
    func confirmTapped() {
        // Handle confirmation
    }

    func cancelTapped() {
        // Handle cancellation
    }

    func alertViewOkPressed() {
        // OK was pressed
    }

    func alertViewPresent() {
        // Alert is shown
    }

    func alertViewDisappear() {
        // Alert is dismissed
    }
}
```

---

## 📐 Customization

This alert relies on a few design-system components (not included):

- `AlertFonts`: Define your custom fonts here
- `Colors`: Custom color struct used for background, labels, and buttons
- `LayoutConstants`: Spacing and sizing used in layout constraints

You can replace or extend these with your own implementations.

---

## 📱 Requirements

- iOS 13.0+
- UIKit-based app
- Swift 5+

---

## 🔧 Installation

Drag and drop the following files into your project:

- `AlertView.swift`
- `GradientBackgroundView.swift`
- `PeerGrainAnimation.swift`

---

## 🤝 Contribution

Contributions, issues, and feature requests are welcome!  
Feel free to open a pull request or an issue.

---

## 📄 License

This project is open source and available under the MIT License.

---

Made with ❤️ by Zaid Tayyab
