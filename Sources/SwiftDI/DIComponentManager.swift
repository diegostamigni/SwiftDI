//
//  DIComponentManager.swift
//  SwiftDI
//
//  Created by v.a.prusakov on 01/07/2019.
//

import Foundation

class DIComponentManager {
    
    private let locker = NSRecursiveLock()
    
    lazy private var registerContainers: [ObjectIdentifier: DIObject] = [:]
    
    func insert<T>(_ object: DIObject, forType: T.Type) {
		locker.sync { self.registerContainers[ObjectIdentifier(type(of: forType))] = object }
    }
    
    subscript(_ forType: Any.Type) -> DIObject? {
		locker.sync { self.registerContainers[ObjectIdentifier(type(of: forType))] }
    }
    
    var objects: [DIObject] {
        locker.sync { self.registerContainers.values.compactMap({ $0 }) }
    }

	var description: String {
		registerContainers.description
	}

	func merge(other: DIComponentManager) {
		self.registerContainers.merge(other.registerContainers)  { _, new in new }
	}
    
}
