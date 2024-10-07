//
//  GoogleAuth.swift
//  WeHR
//
//  Created by Lihour on 10/1/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

class GoogleAuthentication : ObservableObject{
    @Published var token:String = ""
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    static let share = GoogleAuthentication()
    
    private init() {check()}
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.profilePicUrl = profilePicUrl
            self.token = user.accessToken.tokenString
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
            self.token = ""
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                //                self.errorMessage = "error: \(error.localizedDescription)"
            }
            self.checkStatus()
        }
    }
    
    func signinWithGoogle(presenting: UIViewController,
                          completion: @escaping (Error?) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting) {user, error in
            if let error = error {
                completion(error)
                return
            }
            guard
                let authentication = user?.user,
                let idToken = authentication.idToken?.tokenString
            else {
                return
            }
            let credential = GoogleAuthProvider
                .credential(withIDToken: idToken,
                            accessToken: authentication.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(error)
                    return
                }
                UserDefaults.standard.set(true, forKey: "signIn")
                // When this change to true, it will go to the home screen
            }
        }
    }
}

