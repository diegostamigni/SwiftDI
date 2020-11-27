//
//  AppDelegate.swift
//  SwiftDIDemo
//
//  Created by v.a.prusakov on 27/06/2019.
//  Copyright © 2019 Vladislav Prusakov. All rights reserved.
//

import UIKit
import SwiftDI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create and init our container
        let container = DIContainer(part:
            DIGroup {
				ServicesAssembly()
                HomeAssembly()
            }
        )
        
        SwiftDI.useContainer(container)
        
        return true
    }


}

