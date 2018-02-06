/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit

import MaterialComponents
//import googlemac_iPhone_Shared_GoogleMaterial_components_Cards_Cards
//import googlemac_iPhone_Shared_GoogleMaterial_components_TextFields_TextFields
//import googlemac_iPhone_Shared_GoogleMaterial_components_Buttons_Buttons
//import googlemac_iPhone_Shared_GoogleMaterial_components_GoogleSans_Medium
//import googlemac_iPhone_Shared_GoogleMaterial_components_Palettes_Palettes

class RichCardExampleViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var card: MDCCard!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var usernameTextfield: MDCTextField!
  @IBOutlet weak var passwordTextfield: MDCTextField!
  @IBOutlet weak var cancelButton: MDCButton!
  @IBOutlet weak var connectButton: MDCButton!
  @IBOutlet weak var identityIcon: UIImageView!
  @IBOutlet weak var lockIcon: UIImageView!

  var usernameController: MDCTextInputControllerOutlined!
  var passwordController: MDCTextInputControllerOutlined!


  override func viewDidLoad() {
    super.viewDidLoad()
    usernameController =
        MDCTextInputControllerOutlined.init(textInput: usernameTextfield)
    passwordController =
        MDCTextInputControllerOutlined.init(textInput: passwordTextfield)
    curveImageToCorners()

    titleLabel.font = UIFont.systemFont(ofSize: 16)
    titleLabel.textColor = MDCPalette.grey.tint800

    descriptionLabel.font = UIFont.systemFont(ofSize: 14)
    descriptionLabel.textColor = MDCPalette.grey.tint700

    usernameController.placeholderText = "Username"
//    usernameTextfield.delegate = self
    passwordController.placeholderText = "Password"
//    passwordTextfield.delegate = self


  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    if textField == usernameTextfield {
      identityIcon.tintColor = MDCPalette.grey.tint700
    } else {
      lockIcon.tintColor = MDCPalette.grey.tint700
    }
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField == usernameTextfield {
      identityIcon.tintColor = MDCPalette.blue.tint600
    } else {
      lockIcon.tintColor = MDCPalette.blue.tint600
    }
  }

  func curveImageToCorners() {
    let bezierPath = UIBezierPath(roundedRect: imageView.bounds,
                                  byRoundingCorners: [.topLeft, .topRight],
                                  cornerRadii: CGSize(width: card.cornerRadius,
                                                      height: card.cornerRadius))
    let shapeLayer = CAShapeLayer()
    shapeLayer.frame = CGRect(x: 0,
                              y: 40,
                              width: imageView.bounds.size.width,
                              height: imageView.bounds.size.height)
    shapeLayer.path = bezierPath.cgPath
    imageView.layer.mask = shapeLayer
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension RichCardExampleViewController {

  @objc class func catalogDescription() -> String {
    return "Google Material Cards."
  }

  @objc class func catalogIsPrimaryDemo() -> Bool {
    return false
  }

  @objc class func catalogBreadcrumbs() -> [String] {
    return ["Cards", "Rich Card Example"]
  }

  @objc class func catalogStoryboardName() -> String {
    return "RichCardExample"
  }

}
