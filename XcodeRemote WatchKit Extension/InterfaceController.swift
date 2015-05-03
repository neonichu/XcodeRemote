//
//  InterfaceController.swift
//  XcodeRemote WatchKit Extension
//
//  Created by Boris Bügling on 03/05/15.
//  Copyright (c) 2015 Boris Bügling. All rights reserved.
//

import Foundation
import Stargate
import WatchKit

class InterfaceController: WKInterfaceController {
    let stargate = Atlantis(applicationGroupIdentifier: XCRemoteAppGroupIdentifier)
    
    @IBAction func deleteDerivedDataTapped() {
        stargate.passMessage(XCRemoteCommand.DeleteDerivedData.rawValue, identifier: XCRemoteChannel.PhoneCommand.rawValue)
    }
}
