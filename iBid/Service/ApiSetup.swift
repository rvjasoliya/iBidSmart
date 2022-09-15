


import UIKit
import SwiftyJSON

class NetworkManager {
    
    static func tokenApi(param: [String: Any],callback: ((_ status: Bool ,_ scenarios: String?,_ error: Error?)->Void)?) {
        let username = param["username"] as? String ?? ""
        let pass = param["password"] as? String ?? ""
        let pUrl = param["url"] as? String ?? ""
        //let url = login_url + "?op=Login" + "&Email=" + email + "&Password=" + password
        let url = login_url + "?wrap_name=\(username)&wrap_password=\(pass)&sf_domain=\(pUrl)&sf_persistent=true&deflate=false"
        
        APIManager.sharedInstance.getTokenResponseAPI(url: url){ (response, error) in
            if error == nil {
                if let someDictionaryFromJSON = response {
                    let tk:String = someDictionaryFromJSON as! String
                    let rs = tk.replacingOccurrences(of: "wrap_access_token=", with: "")
                    callback?(true,rs,nil)
                } else{
                    let error = NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey:  "Invalid"]) as Error
                    callback?(false,nil,error)
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
}
