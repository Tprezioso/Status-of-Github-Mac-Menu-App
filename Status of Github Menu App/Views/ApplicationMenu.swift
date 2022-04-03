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
        menuView.view.frame.size = CGSize(width: 225, height: 500)
        
        let menuItem = NSMenuItem()
        menuItem.view = menuView.view
        menu.addItem(menuItem)
        
        let webLinkMenuItem = NSMenuItem(title: "Visit githubstatus.com", action: #selector(openLink), keyEquivalent: "")
        webLinkMenuItem.target = self
        webLinkMenuItem.representedObject = "https://www.githubstatus.com"
        menu.addItem(webLinkMenuItem)

        let aboutMenuItem = NSMenuItem(title: "About Status of GitHub", action: #selector(about), keyEquivalent: "")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc func openLink(sender: NSMenuItem) {
        let link = sender.representedObject as! String
        guard let url = URL(string: link) else { return }
        NSWorkspace.shared.open(url)
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
