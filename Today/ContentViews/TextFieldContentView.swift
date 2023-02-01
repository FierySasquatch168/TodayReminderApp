//
//  TextFieldContentView.swift
//  Today
//
//  Created by Aleksandr Eliseev on 23.01.2023.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    
    struct Configuration: UIContentConfiguration {
        /// to use the TextFieldContentView.Configuration type to customize the content of custom configuration and a view
        var text: String? = ""
        ///This empty closure holds the behavior that I'd like to perform when the user edits the text in the text field.
        var onChange: (String) -> Void = { _ in }
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    
    var configuration: UIContentConfiguration {
        didSet {
            /// Whenever the configuration changes, update the user interface to reflect the current state
            configure(configuration: configuration)
        }
    }
    
    let textField = UITextField()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        /// It's possible to invoke the action when the user first taps the control, begin editing,  end editing, or whenever interacts with the control.
        textField.addTarget(self, action: #selector(didChange(_:)), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
    
    @objc private func didChange(_ sender: UITextField) {
        guard let configuration = configuration as? TextFieldContentView.Configuration else {
            return
        }
        configuration.onChange(textField.text ?? "")
    }
    
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
    
    
}
