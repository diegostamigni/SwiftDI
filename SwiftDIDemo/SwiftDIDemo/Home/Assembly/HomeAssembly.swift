//
//  HomeAssembly.swift
//  SwiftDIDemo
//
//  Created by v.a.prusakov on 27/06/2019.
//  Copyright © 2019 Vladislav Prusakov. All rights reserved.
//

import SwiftDI

protocol Something {
	func name() -> String
}

class SomethingImpl: Something {
	func name() -> String {
		return "Hello"
	}
}

struct HomeAssembly : DIPart {
    
    var body: some DIPart {
        DIGroup {
            DIRegister(HomeViewModel.init)
                .lifeCycle(.prototype)

			DIRegister(SomethingImpl.init)
				.as(Something.self)
        }
    }
}
