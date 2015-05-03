//
//  Constants.swift
//  XcodeRemote
//
//  Created by Boris Bügling on 03/05/15.
//  Copyright (c) 2015 Boris Bügling. All rights reserved.
//

let XCRemoteAppGroupIdentifier      = "group.vu0.org.XcodeRemote"

enum XCRemoteChannel : String {
    case PhoneCommand = "PhoneCommand"
}

enum XCRemoteCommand : String {
    case DeleteDerivedData = "DeleteDerivedData"
}
