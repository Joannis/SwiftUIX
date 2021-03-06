//
// Copyright (c) Vatsal Manot
//

import Combine
import Swift
import SwiftUI

public protocol DefaultTextFieldType {
    init<S: StringProtocol>(
        _ title: S,
        text: Binding<String>,
        onEditingChanged: @escaping (Bool) -> Void,
        onCommit: @escaping () -> Void
    )
    
    init<S: StringProtocol>(
        _ title: S,
        text: Binding<String>,
        isEditing: Binding<Bool>,
        onCommit: @escaping () -> Void
    )
}

// MARK: - Extensions -

extension DefaultTextFieldType {
    public init<S: StringProtocol>(
        _ title: S,
        text: Binding<String>,
        isEditing: Binding<Bool>,
        onCommit: @escaping () -> Void = { }
    ) {
        self.init(
            title,
            text: text,
            onEditingChanged: { isEditing.wrappedValue = $0 },
            onCommit: onCommit
        )
    }
    
    public init<S: StringProtocol>(
        _ title: S,
        text: Binding<String?>,
        onEditingChanged: @escaping (Bool) -> Void = { _ in },
        onCommit: @escaping () -> Void = { }
    ) {
        self.init(
            title,
            text: text.withDefaultValue(""),
            onEditingChanged: onEditingChanged,
            onCommit: onCommit
        )
    }
    
    public init<S: StringProtocol>(
        _ title: S,
        text: Binding<String?>,
        isEditing: Binding<Bool>,
        onCommit: @escaping () -> Void = { }
    ) {
        self.init(
            title,
            text: text,
            onEditingChanged: { isEditing.wrappedValue = $0 },
            onCommit: onCommit
        )
    }
}

// MARK: - Conformances -

extension TextField: DefaultTextFieldType where Label == Text {
    
}
