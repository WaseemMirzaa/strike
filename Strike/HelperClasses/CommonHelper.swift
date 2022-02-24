//
//  CommonHelper.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
//import SwiftyJWT
class CommonHelper
{
    static let sharedInstance = CommonHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    class func round(_ val: Double, to decimals: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimals
        formatter.roundingMode = .up
        let ret = formatter.string(from: val as NSNumber)
        
        return ret
    }
    
    
    
    class func setLeftPadding(_ txt: UITextField?)
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        txt?.leftView = paddingView
        txt?.leftViewMode = .always
        txt?.setNeedsLayout()
        txt?.setNeedsDisplay()
    }
    
    class func getLocale() -> String? {
        return NSLocale.preferredLanguages[0]
    }
    
    class func showAllFontsFamiliesNames() -> Void
    {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    class func getLocalizedImage(_ name: String?) -> UIImage? {
        return UIImage(named: "\(URL(fileURLWithPath: name ?? "").deletingPathExtension().absoluteString)_\(CommonHelper.getLocale() ?? "")")
    }
//    class func saveCachedUserData(_ userData:UserModel){
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(userData.dictionary, forKey: Constant.login_key)
//        userDefaults.synchronize()
//    }
//    class func saveCachedUserData(_ userData:UserModel){
//        let userDefaults = UserDefaults.standard
//        do{
//            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: userData.dictionary, requiringSecureCoding: false)
//            userDefaults.set(encodedData, forKey: Constant.login_key)
//            userDefaults.synchronize()
//        }
//        catch let error{
//            print(error.localizedDescription)
//        }
//
//    }
//    class func saveCachedUserLocationData(_ userData:LocationModels){
//        let userDefaults = UserDefaults.standard
//        do {
//
//            try userDefaults.setObject(userData, forKey: Constant.location_key)
//            userDefaults.synchronize()
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    class func saveCachedUserServiceData(_ userData:[LoginModel]){
//        let userDefaults = UserDefaults.standard
//        do {
//
//            try userDefaults.setObject(userData, forKey: Constant.login_user_service)
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    class func getCachedUserData() -> UserModel? {
//        let userDefaults = UserDefaults.standard
//        if let dic = userDefaults.dictionary(forKey: Constant.login_key){
//            return UserModel(dictionary: dic as AnyObject)
//        }
//        return nil
//        
//    }
//    class func getCachedUserData() -> UserModel? {
//        let userDefaults = UserDefaults.standard
//        do{
//            if let decoded  = userDefaults.object(forKey: Constant.login_key) as? Data{
//                let decodedTeams = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? [String:Any]
//                let user = UserModel(dictionary: decodedTeams as AnyObject)
//                print(user?.lastName)
//                return user
//            }
//            else{
//                return nil
//            }
//            
//        }
//        catch let error{
//            print(error.localizedDescription)
//            return nil
//        }
////        if let dic = userDefaults.dictionary(forKey: Constant.login_key){
////            return UserModel(dictionary: dic as AnyObject)
////        }
////        return nil
//        
//    }
//    class func getCachedUserLocationData() -> LocationModel? {
//        let userDefaults = UserDefaults.standard
//        do {
//            let user = try userDefaults.getObject(forKey: Constant.location_key, castTo: LocationModel.self)
//            print(user.address ?? "0")
//            return user
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//    class func decodeToken(token:String?) -> Bool{
//        let login = LoginModel()
//        let alg = JWTAlgorithm.hs256(Constant.jwt_secret)
//        do {
//            let jwt = try JWT.init(algorithm: alg, rawString: token ?? "")
//                print(jwt.payload.customFields)
//                if let payload = jwt.payload.customFields{
//                    if let id = payload[Constant.id]?.value as? NSNumber{
//                        login.id = Int64(truncating: id)
//                    }
//                    let first_name = payload[Constant.first_name]?.value as? String
//                    let last_name = payload[Constant.last_name]?.value as? String
//                    let phone_number = payload[Constant.phone_number]?.value as? String
//                    let email = payload[Constant.email]?.value as? String
//                    let image_url = payload[Constant.image_url]?.value as? String
//                    let role = payload[Constant.role]?.value as? String
//                    let iat = payload[Constant.iat]?.value as? String
//                    let exp = payload[Constant.exp]?.value as? String
//                    
//                    
//                    login.first_name = first_name
//                    login.last_name = last_name
//                    login.phone_number = phone_number
//                    login.email = email
//                    login.image_url = image_url
//                    login.role = role
//                    login.iat = iat
//                    login.exp = exp
//                    login.token = token
//                    self.saveCachedUserData(login)
//                    return true
//                }
//            
//        }
//        catch let error{
//            print(error.localizedDescription)
//        }
//        return false
//    }
//    class func getCachedUserServiceData() -> [LoginModel]? {
//        let userDefaults = UserDefaults.standard
//        do {
//            let user = try userDefaults.getObject(forKey: Constant.login_user_service, castTo: [LoginModel].self)
//            print(user[0].user_id ?? "0")
//            return user
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
    class func removeCachedUserData() {
        let userDefaults = UserDefaults.standard
        userDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        userDefaults.synchronize()
    }
    
    // MARK: - Activity Indicator Inside Button
    func showActivityIndicator(_ activityIndicatorForButton: UIActivityIndicatorView?, inside buttonObj: UIButton?) {
        DispatchQueue.main.async(execute: {
            if (buttonObj?.frame.size.width ?? 0.0) <= 133.0 {
                buttonObj?.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
            }
            let halfButtonHeight: CGFloat = (buttonObj?.bounds.size.height ?? 0.0) / 2
            let buttonWidth: CGFloat? = buttonObj?.bounds.size.width
            activityIndicatorForButton?.center = CGPoint(x: (buttonWidth ?? 0.0) - halfButtonHeight, y: halfButtonHeight)
            if let aButton = activityIndicatorForButton {
                buttonObj?.addSubview(aButton)
            }
            activityIndicatorForButton?.hidesWhenStopped = true
            activityIndicatorForButton?.startAnimating()
            buttonObj?.isUserInteractionEnabled = false
            /// Disable Other Controls
            //////////////////////////////////////////////////////////////////////
        })
    }
    
    func hideActivityIndicator(_ activityIndicatorForButton: UIActivityIndicatorView?, inside buttonObj: UIButton?) {
        if activityIndicatorForButton != nil {
            DispatchQueue.main.async(execute: {
                if (buttonObj?.frame.size.width ?? 0.0) <= 133.0 {
                    buttonObj?.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                activityIndicatorForButton?.removeFromSuperview()
                activityIndicatorForButton?.stopAnimating()
                buttonObj?.isUserInteractionEnabled = true
                /// Disable Other Controls
                //////////////////////////////////////////////////////////////////////
            })
        }
    }
    
    
    // MARK: - Country Code for Current Device
    func getCountryCodeForCurrentDevice() -> String? {
        let currentLocale = NSLocale.current as NSLocale // get the current locale.
        let countryCode = currentLocale.object(forKey: .countryCode) as? String
        return countryCode
    }
    
    // MARK: - Images
    func image(with color: UIColor?, andSize imageSize: CGSize) -> UIImage? {
        let imageSizeRect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        UIGraphicsBeginImageContext(imageSizeRect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor((color?.cgColor)!)
        context?.fill(imageSizeRect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: - Screen Size
    var appScreenRect: CGRect {
        let appWindowRect = UIApplication.shared.keyWindow?.bounds ?? UIWindow().bounds
        return appWindowRect
    }
    func getDirectoryPath(isImage:Bool = false) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if isImage{
            
            documentsDirectory = (paths[0] as NSString).appendingPathComponent("Images") as String
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        }
        else{
            if let appname = Bundle.main.displayName{
                documentsDirectory = (paths[0] as NSString).appendingPathComponent(appname + ".sqlite3") as String
                debugPrint(documentsDirectory)
                return documentsDirectory
            }
            else{
                debugPrint(documentsDirectory)
                return documentsDirectory
            }
            
        }
        
    }
    
    // MARK:- ALERT CONTROLLER
    func ShowAlert(view: UIViewController,message:String,Title:String)
    {
        let alert = UIAlertController(title: Title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            print(message)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}

