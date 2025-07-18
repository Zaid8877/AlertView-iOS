//
//  AlertFonts.swift
//  AlertView
//
//  Created by Zaid Tayyab on 09/10/2023.
//

import UIKit

struct AlertFonts {

    static let medium    =  "Gilroy-Medium"
    static let extraBold =  "Gilroy-ExtraBold"
    static let bold      =  "Gilroy-Bold"
    static let semiBold  =  "Gilroy-Semibold"
    static let light     =  "Gilroy-Light"
    static let italic    =  "Gilroy-MediumItalic"

    /// Only for gradient buttons
    static let ibmPlexMonoMedium   =  "IBMPlexMono-Medium"
    static let ibmPlexMonoBold     =  "IBMPlexMono-Bold"
    static let ibmPlexMonoSemiBold =  "IBMPlexMono-Semibold"
    
    /// 80
    static let emojiCount =  UIFont(name: AlertFonts.medium, size: 80)
    /// 56
    static let successTitle =  UIFont(name: AlertFonts.medium, size: 56)
    /// 50
    static let title =  UIFont(name: AlertFonts.medium, size: 50)
    /// 50
    static let title8 =  UIFont(name: AlertFonts.medium, size: 48)
    /// 40
    static let title1 =  UIFont(name: AlertFonts.medium, size: 40)
    /// 32
    static let title5 =  UIFont(name: AlertFonts.medium, size: 32)
    /// 30
    static let title6 =  UIFont(name: AlertFonts.medium, size: 30)
    /// 28
    static let title2 =  UIFont(name: AlertFonts.medium, size: 28)
    /// 24
    static let title3 =  UIFont(name: AlertFonts.medium, size: 24)
    /// 20
    static let title4 =  UIFont(name: AlertFonts.medium, size: 20)
    /// 26
    static let title7 =  UIFont(name: AlertFonts.medium, size: 26)

    /// 18
    static let extraLargeBody =  UIFont(name: AlertFonts.medium, size: 18)
    /// 16
    static let largeBody      =  UIFont(name: AlertFonts.medium, size: 16)
    /// 15
    static let mediumBody     =  UIFont(name: AlertFonts.medium, size: 15)
    /// 14
    static let smallBody      =  UIFont(name: AlertFonts.medium, size: 14)
    /// 12
    static let extraSmallBody =  UIFont(name: AlertFonts.medium, size: 12)

    /// 11
    static let caption1 =  UIFont(name: AlertFonts.medium, size: 11)
    /// 10
    static let caption2 =  UIFont(name: AlertFonts.medium, size: 10)
    /// 9
    static let caption3 =  UIFont(name: AlertFonts.medium, size: 9)

}

extension UIFont {

    func applyExtraBold() -> UIFont {
        return UIFont(name: AlertFonts.extraBold, size: self.pointSize)!
    }

    func applyBold() -> UIFont {
        return UIFont(name: AlertFonts.bold, size: self.pointSize)!
    }

    func applySemibold() -> UIFont {
        return UIFont(name: AlertFonts.semiBold, size: self.pointSize)!
    }

    func applyMedium() -> UIFont {
        return UIFont(name: AlertFonts.medium, size: self.pointSize)!
    }

    func applyLight() -> UIFont {
        return UIFont(name: AlertFonts.light, size: self.pointSize)!
    }

    func applyItalics() -> UIFont {
        return UIFont(name: AlertFonts.light, size: self.pointSize)!
    }

    func applyIbmPlexMonoBold() -> UIFont {
        return UIFont(name: AlertFonts.ibmPlexMonoBold, size: self.pointSize)!
    }

    func applyIbmPlexMonoMedium() -> UIFont {
        return UIFont(name: AlertFonts.ibmPlexMonoMedium, size: self.pointSize)!
    }

    func applyIbmPlexMonoSemiBold() -> UIFont {
        return UIFont(name: AlertFonts.ibmPlexMonoSemiBold, size: self.pointSize)!
    }

}
