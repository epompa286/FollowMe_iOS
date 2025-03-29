//
//  LandingViewModel.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/25/25.
//

import Foundation
import Network
import CoreLocation
import os

struct LandingViewState {
    var activeDestination = false
    var isVerifyingPermissions = false
    var isLoginScreenPresented = false
    var isRegistrationScreenPresented = false
    var isErrorAlertPresented = false
    var errorMessage: String?
    
    var email: String = ""
    var password: String = ""
    var isSaveLoginChecked = false
    var isUserAuthenticated: Bool = false
}

enum LandingViewAction { // TODO: Might chance action name
    case VerifyUser
    case OpenRegistrationScreen
    case AuthenticateUser
    case CreateUser
}

final class LandingViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var state = LandingViewState()
    var auth: FirebaseAuthRepository
    
    private var locationManager: CLLocationManager?
    private var locationContinuation: CheckedContinuation<Bool, Never>?
    
    let logger = Logger(subsystem: "com.pompa.edgar.FollowMe_iOS", category: "LandingViewModel")
    
    init(repository: FirebaseAuthRepository = FirebaseAuthRepository()) {
        self.auth = repository
    } 
    
    func send(_ intent: LandingViewAction) {
        switch intent {
        case .VerifyUser: verifyUserAuthentication()
        case .OpenRegistrationScreen: openRegistrationScreen() // TODO: Might chance action name
        case .AuthenticateUser: authenticateUser()
        case .CreateUser: createUser()
        }
    }
    
    private func verifyUserAuthentication() {
//        if state.isUserAuthenticated {
        if true {
            self.state.activeDestination.toggle()
        } else {
            clearState()
            state.isLoginScreenPresented.toggle()
        }
    }
    
    private func openRegistrationScreen() {
        clearState()
        state.isRegistrationScreenPresented.toggle()
    }
    
    private func authenticateUser() {
        auth.signIn(email: state.email, password: state.password) { result in
            switch result {
            case .success(_):
                self.state.isUserAuthenticated = true
                self.state.isLoginScreenPresented.toggle()
                self.state.activeDestination.toggle()
            case .failure(_):
                self.state.errorMessage = "Invalid email or password"
                self.state.isErrorAlertPresented.toggle()
            }
        }
    }
    
    private func createUser() {
        auth.signUp(email: state.email, password: state.password) { result in
            switch result {
            case .success(_):
                self.state.isRegistrationScreenPresented.toggle()
            case .failure(_):
                self.state.errorMessage = "Invalid email or password"
                self.state.isErrorAlertPresented.toggle()
            }

        }
    }
    
    func clearState() {
        state.email = ""
        state.password = ""
    }
    
    
    func checkPermissions() async {
        // Set verifying to true so the UI can show a loading spinner.
        await MainActor.run { self.state.isVerifyingPermissions.toggle() }
        logger.info("Toggled progress view \(self.state.isVerifyingPermissions)")
            
        // Run both checks concurrently.
        async let networkResult = checkNetwork()
        async let locationResult = checkLocation()
        logger.info("Moving tasks to async...")
        let (networkAvailable, locationAuthorized) = await (networkResult, locationResult)
        logger.info("Finished async tasks")

        
        // Once checks are complete, stop loading and toggle login screen based on success.
        await MainActor.run {
            logger.info("Netowrk: \(networkAvailable), Location: \(locationAuthorized)")
            self.state.isVerifyingPermissions.toggle()
            if !networkAvailable {
                self.state.errorMessage = "Network connectivity is required."
                self.state.isErrorAlertPresented.toggle()
            } else if !locationAuthorized {
                self.state.errorMessage = "Location access is required."
                self.state.isErrorAlertPresented.toggle()
            } else {
                self.state.isLoginScreenPresented.toggle()
            }
        }
    }

    /// Asynchronously checks for network connectivity using NWPathMonitor.
    private func checkNetwork() async -> Bool {
        await withCheckedContinuation { continuation in
            let monitor = NWPathMonitor()
            let queue = DispatchQueue(label: "NetworkMonitor")
            monitor.pathUpdateHandler = { path in
                monitor.cancel()
                continuation.resume(returning: path.status == .satisfied)
            }
            monitor.start(queue: queue)
        }
    }

    /// Asynchronously checks for location authorization.
    private func checkLocation() async -> Bool {
        await withCheckedContinuation { continuation in
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self

            // Get the current authorization status.
            let status = self.locationManager?.authorizationStatus ?? .notDetermined
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                continuation.resume(returning: true)
            case .denied, .restricted:
                continuation.resume(returning: false)
            case .notDetermined:
                // Store the continuation until the delegate callback.
                self.locationContinuation = continuation
                self.locationManager?.requestWhenInUseAuthorization()
            @unknown default:
                continuation.resume(returning: false)
            }
        }
    }

    // CLLocationManagerDelegate callback for authorization changes.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if let continuation = locationContinuation {
            if status == .authorizedAlways || status == .authorizedWhenInUse {
                continuation.resume(returning: true)
            } else {
                continuation.resume(returning: false)
            }
            locationContinuation = nil
        }
    }
}
