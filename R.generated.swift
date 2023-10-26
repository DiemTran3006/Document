//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle

  let entitlements = entitlements()

  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var nib: nib { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func nib(bundle: Foundation.Bundle) -> nib {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.nib.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 15 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `Vector (2)`.
    var vector2: RswiftResources.ImageResource { .init(name: "Vector (2)", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `Vector (3)`.
    var vector3: RswiftResources.ImageResource { .init(name: "Vector (3)", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `back.left`.
    var backLeft: RswiftResources.ImageResource { .init(name: "back.left", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `back.right`.
    var backRight: RswiftResources.ImageResource { .init(name: "back.right", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icon.hidden.password`.
    var iconHiddenPassword: RswiftResources.ImageResource { .init(name: "icon.hidden.password", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icon.show.password`.
    var iconShowPassword: RswiftResources.ImageResource { .init(name: "icon.show.password", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icon_email`.
    var icon_email: RswiftResources.ImageResource { .init(name: "icon_email", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icon_facebook`.
    var icon_facebook: RswiftResources.ImageResource { .init(name: "icon_facebook", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icon_google`.
    var icon_google: RswiftResources.ImageResource { .init(name: "icon_google", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icons8-reload`.
    var icons8Reload: RswiftResources.ImageResource { .init(name: "icons8-reload", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icons8_apple`.
    var icons8_apple: RswiftResources.ImageResource { .init(name: "icons8_apple", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `image`.
    var image: RswiftResources.ImageResource { .init(name: "image", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `image.birthday`.
    var imageBirthday: RswiftResources.ImageResource { .init(name: "image.birthday", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `reload`.
    var reload: RswiftResources.ImageResource { .init(name: "reload", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `search`.
    var search: RswiftResources.ImageResource { .init(name: "search", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
          }
        }
      }
    }
  }

  /// This `_R.entitlements` struct is generated, and contains static references to 2 properties.
  struct entitlements {
    let apsEnvironment: String = "development"
    let comAppleDeveloperApplesignin = comAppleDeveloperApplesignin()
    let keychainAccessGroups = keychainAccessGroups()
    struct comAppleDeveloperApplesignin {
      let `default`: String = "Default"
    }
    struct keychainAccessGroups {
      let appIdentifierPrefixComQalattComDocument: String = "$(AppIdentifierPrefix)com.qalatt.com.Document"
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 1 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `GoogleService-Info.plist`.
    var googleServiceInfoPlist: RswiftResources.FileResource { .init(name: "GoogleService-Info", pathExtension: "plist", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.nib` struct is generated, and contains static references to 17 nibs.
  struct nib {
    let bundle: Foundation.Bundle

    /// Nib `CollectionViewCell`.
    var collectionViewCell: RswiftResources.NibReference<CollectionViewCell> { .init(name: "CollectionViewCell", bundle: bundle) }

    /// Nib `CollectionViewController`.
    var collectionViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "CollectionViewController", bundle: bundle) }

    /// Nib `DataDetailsViewController`.
    var dataDetailsViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "DataDetailsViewController", bundle: bundle) }

    /// Nib `DataPassingViewController`.
    var dataPassingViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "DataPassingViewController", bundle: bundle) }

    /// Nib `FirebaseStorageViewController`.
    var firebaseStorageViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "FirebaseStorageViewController", bundle: bundle) }

    /// Nib `HomeViewController`.
    var homeViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "HomeViewController", bundle: bundle) }

    /// Nib `LoginSocialViewController`.
    var loginSocialViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "LoginSocialViewController", bundle: bundle) }

    /// Nib `MenuTableViewCell`.
    var menuTableViewCell: RswiftResources.NibReference<MenuTableViewCell> { .init(name: "MenuTableViewCell", bundle: bundle) }

    /// Nib `PopViewController`.
    var popViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "PopViewController", bundle: bundle) }

    /// Nib `PushNotificationViewController`.
    var pushNotificationViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "PushNotificationViewController", bundle: bundle) }

    /// Nib `PushViewController`.
    var pushViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "PushViewController", bundle: bundle) }

    /// Nib `TableViewCell`.
    var tableViewCell: RswiftResources.NibReference<TableViewCell> { .init(name: "TableViewCell", bundle: bundle) }

    /// Nib `TableViewController`.
    var tableViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "TableViewController", bundle: bundle) }

    /// Nib `UIAlertViewController`.
    var uiAlertViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "UIAlertViewController", bundle: bundle) }

    /// Nib `UIDatePickerViewController`.
    var uiDatePickerViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "UIDatePickerViewController", bundle: bundle) }

    /// Nib `UITimePickerViewController`.
    var uiTimePickerViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "UITimePickerViewController", bundle: bundle) }

    /// Nib `UIWebViewViewController`.
    var uiWebViewViewController: RswiftResources.NibReference<UIKit.UIView> { .init(name: "UIWebViewViewController", bundle: bundle) }

    func validate() throws {
      if UIKit.UIImage(named: "icon_facebook", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'icon_facebook' is used in nib 'LoginSocialViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "icon_google", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'icon_google' is used in nib 'LoginSocialViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "icons8_apple", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'icons8_apple' is used in nib 'LoginSocialViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "Vector (2)", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'Vector (2)' is used in nib 'TableViewCell', but couldn't be loaded.") }
      if UIKit.UIImage(named: "Vector (3)", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'Vector (3)' is used in nib 'TableViewCell', but couldn't be loaded.") }
      if UIKit.UIImage(named: "image.birthday", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'image.birthday' is used in nib 'UIDatePickerViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "back.left", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'back.left' is used in nib 'UIWebViewViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "back.right", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'back.right' is used in nib 'UIWebViewViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "icons8-reload", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'icons8-reload' is used in nib 'UIWebViewViewController', but couldn't be loaded.") }
      if UIKit.UIImage(named: "search", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'search' is used in nib 'UIWebViewViewController', but couldn't be loaded.") }
    }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }
  }
}