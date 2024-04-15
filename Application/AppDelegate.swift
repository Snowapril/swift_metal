//
//  AppDelegate.swift
//  swift_metal
//
//  Created by snowapril on 3/24/24.
//

import Cocoa

#if os(iOS) || os(tvOS)
    import UIKit

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

        func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            return true
        }

    }
#else
    import AppKit

    @NSApplicationMain
    class AppDelegate: NSObject, NSApplicationDelegate {

        func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
            return true
        }

    }
#endif
