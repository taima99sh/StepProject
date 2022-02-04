


import Foundation
import UIKit

public protocol POTPLabel: UIView {
    var active: Bool { get set }
    var text: String? { get set }
    var textColor: UIColor! { get set }
    var font: UIFont! { get set }
    //should be called when a text is set from textfield.text, but not from the keyboard
    func updateState()
}
