//
//  DerivedData.swift
//  XcodeRemote
//
//  Created by Boris Bügling on 03/05/15.
//  Copyright (c) 2015 Boris Bügling. All rights reserved.
//

import AppKit
import Foundation

// Swift translation of https://github.com/kattrali/deriveddata-exterminator/blob/master/DerivedData%20Exterminator/DMMDerivedDataHandler.m
class DerivedData {
    class func clearAll() {
        self.subdirectoryPaths().map { (subdirectory) -> Void in
            self.removeDirectoryAtPath(subdirectory)
        }
    }

    class func derivedDataLocation() -> String {
        return NSHomeDirectory().stringByAppendingPathComponent("Library/Developer/Xcode/DerivedData")
    }

    class func removeDirectoryAtPath(path: String) {
        var error: NSError?
        if !NSFileManager.defaultManager().removeItemAtPath(path, error: &error) {
            self.showErrorAlert(error, path: path)
        } else if NSFileManager.defaultManager().fileExistsAtPath(path) {
            NSFileManager.defaultManager().removeItemAtPath(path, error: &error)
        }

        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            self.showErrorAlert(NSError(domain: "org.vu0.XcodeRemote", code: 668, userInfo: [NSLocalizedDescriptionKey: String(format:"DerivedData Exterminator - removing directory failed after multiple attempts: %@", path)]), path: path)
        }
    }

    class func showErrorAlert(error: NSError?, path: String) {
        let alert = NSAlert()
        alert.messageText = String(format:"An error occurred while removing %@:\n\n %@", path, error != nil ? error!.localizedDescription : "nil")
        alert.runModal()
    }

    class func subdirectoryPaths() -> [String] {
        var workspaceDirectories = [String]()
        let derivedDataPath = self.derivedDataLocation()
        var error: NSError?

        if let directories = NSFileManager.defaultManager().contentsOfDirectoryAtPath(derivedDataPath, error: &error) as? [String] {
            for subdirectory in directories {
                let removablePath = derivedDataPath.stringByAppendingPathComponent(subdirectory)
                workspaceDirectories.append(removablePath)
            }
        } else {
            NSLog("Error while fetching derived data subdirectories: %@", derivedDataPath)
        }

        return workspaceDirectories
    }
}
