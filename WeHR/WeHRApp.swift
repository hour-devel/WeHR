//
//  WeHRApp.swift
//  WeHR
//
//  Created by Lihour on 9/27/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Initializetion code for firebase
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}

@main
struct WeHRApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        let appearance = UINavigationBarAppearance()
    
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(Color(hex: "#3F61E9")),
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                Landing()
            }
        }
    }
}
