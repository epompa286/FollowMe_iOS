//
//  FollowMe_iOSApp.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/25/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FollowMe_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var dependencies = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            Router()
                .environmentObject(dependencies)
        }
    }
}
