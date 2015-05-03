//
//  AppDelegate.swift
//  XcodeRemote
//
//  Created by Boris Bügling on 03/05/15.
//  Copyright (c) 2015 Boris Bügling. All rights reserved.
//

import Cocoa
import Stargate

// ¯\_AppKit & Swift_/¯
let NSSquareStatusItemLength: CGFloat = -2.0

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let stargate = Earth(applicationGroupIdentifier: XCRemoteAppGroupIdentifier)
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(notification: NSNotification) {
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSSquareStatusItemLength)
        statusItem.action = "itemClicked:"
        statusItem.image = NSImage(named: "dock-icon")

        stargate.listenForMessage(identifier: XCRemoteChannel.PhoneCommand.rawValue) { (object) -> Void in
            if let value = object as? String, command = XCRemoteCommand(rawValue: value) {
                switch (command) {
                case .DeleteDerivedData:
                    DerivedData.clearAll()
                    break
                }
            }
        }
    }

    func itemClicked(statusItem: NSStatusItem) {
        if let event_ = NSApp.currentEvent, event = event_ {
            if (event.modifierFlags.rawValue & NSEventModifierFlags.ControlKeyMask.rawValue) > 0 {
                NSApplication.sharedApplication().terminate(self)
                return
            }
        }
    }
}
