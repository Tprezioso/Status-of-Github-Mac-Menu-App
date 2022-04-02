//
//  ApplicationMenu.swift
//  Status of Github Menu App
//
//  Created by Thomas Prezioso Jr on 4/1/22.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let statusView = StatusView()
        let menuView = NSHostingController(rootView: statusView)
        menuView.view.frame.size = CGSize(width: 225, height: 225)
        
        let menuItem = NSMenuItem()
        menuItem.view = menuView.view
        menu.addItem(menuItem)
        
        return menu
    }
}
