//
//  EnvironmentStateObjectInject.swift
//  SwiftDI
//  
//
//  Created by Diego Stamigni on 27/11/2020.
//

#if canImport(SwiftUI)
import SwiftUI
import Combine

/// A dynamic view property that subscribes to a `StateObject` automatically invalidating the view
/// when it changes.
@available(iOS 14.0, OSX 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper
public struct EnvironmentStateObjectInject<Value: ObservableObject>: DynamicProperty {

	@StateObject private var _wrappedValue: Value
	public var wrappedValue: Value {
		_wrappedValue
	}

	public init() {
		let bundle = Bundle(for: Value.self)
		let resolvedValue = Environment(\.container).wrappedValue.resolve(bundle: bundle) as Value
		self.__wrappedValue = StateObject<Value>(wrappedValue: resolvedValue)
	}

	/// The binding value, as "unwrapped" by accessing `$foo` on a `@Binding` property.
	public var projectedValue: ObservedObject<Value>.Wrapper {
		return __wrappedValue.projectedValue
	}
}

#endif
