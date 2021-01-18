//
//  UIFontExtension.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

extension UIFont {
    
    static func InterBlack(_ size: CGFloat) -> UIFont { return UIFont(name: "Inter-Black", size: size)! }
    static func InterBold(_ size: CGFloat) -> UIFont { return UIFont(name: "Inter-Bold", size: size)! }
    static func InterExtraBold(_ size: CGFloat) -> UIFont { return UIFont(name: "Inter-ExtraBold", size: size)! }
    static func InterRegular(_ size: CGFloat) -> UIFont { return UIFont(name: "Inter-Regular", size: size)! }
    static func InterMedium(_ size: CGFloat) -> UIFont { return UIFont(name: "Inter-Medium", size: size)! }
    
    
    
    static func regularFont(_ size: CGFloat) -> UIFont { return UIFont.InterRegular(size) }
    static func mediumFont(_ size: CGFloat) -> UIFont { return UIFont.InterMedium(size) }
    static func boldFont(_ size: CGFloat) -> UIFont { return UIFont.InterBold(size) }
    static func extraBoldFont(_ size: CGFloat) -> UIFont { return UIFont.InterExtraBold(size) }
}
