//
//  SceneDelegate.swift
//  SwiftDIDemo
//
//  Created by v.a.prusakov on 27/06/2019.
//  Copyright © 2019 Vladislav Prusakov. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }

		self.window = UIWindow(windowScene: windowScene)
		self.window!.rootViewController = UIHostingController(rootView: HomeView())
		self.window!.makeKeyAndVisible()
    }

}

