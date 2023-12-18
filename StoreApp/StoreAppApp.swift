//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

@main
struct StoreAppApp: App {
    @StateObject var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            AppTabBarView()
                .environmentObject(viewModel)
        }
    }
}
