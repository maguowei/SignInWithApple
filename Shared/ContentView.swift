//
//  ContentView.swift
//  Shared
//
//  Created by maguowei on 2021/1/21.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View {
        VStack {
            SignInWithAppleButton(.signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    switch result {
                        case .success (let authorization):
                            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                                let userId = appleIDCredential.user
                                
                                let identityToken = appleIDCredential.identityToken
                                let identityTokenString = String(data: identityToken!, encoding: .utf8)
                                
                                let authorizationCode = appleIDCredential.authorizationCode
                                let authorizationCodeString = String(data: authorizationCode!, encoding: .utf8)
                                
                                let email = appleIDCredential.email
                                let fullName = appleIDCredential.fullName
                                let state = appleIDCredential.state
                                
                                print(userId)
                                print(identityTokenString!)
                                print(authorizationCodeString!)
                                
                                print(email ?? "")
                                print(fullName ?? "")
                                print(state ?? "")
                            }
                            
                        case .failure (let error):
                            print("Authorization failed: " + error.localizedDescription)
                    }
                }
            ).frame(width: 300.0, height: 50.0)
            .signInWithAppleButtonStyle(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
