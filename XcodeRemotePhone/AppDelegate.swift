//
//  AppDelegate.swift
//  XcodeRemotePhone
//
//  Created by Boris Bügling on 03/05/15.
//  Copyright (c) 2015 Boris Bügling. All rights reserved.
//

import Stargate
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let stargate = Abydos(applicationGroupIdentifier: XCRemoteAppGroupIdentifier)
    var window: UIWindow?

    func applicationDidFinishLaunching(application: UIApplication) {
        stargate.tunnelReplies(identifier: XCRemoteChannel.PhoneCommand.rawValue)

        UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler() {}
    }
}
