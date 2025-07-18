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

## 🛠️ Components Overview

### `AlertView`
Custom view that handles:
- Presenting alerts modally over the screen
- Setting title, description, and button labels
- Delegating callbacks like `okTapped`, `confirmTapped`, and `cancelTapped`
- Animations and layout configuration

### `GradientBackgroundView`
- Handles background gradient rendering
- Manages grain overlay with animation

### `PeerGrainAnimation`
- Animates image sequences to produce a static/noise effect

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
