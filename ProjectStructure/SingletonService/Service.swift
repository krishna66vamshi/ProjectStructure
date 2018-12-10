

import Foundation
import Alamofire

class Service {
    static let shared = Service()
    private init(){}
    func getResponseFromServer(urlString:String,header:[String:String],parameters:[String:Any],onTaskCompleted : @escaping (DataResponse<Any>)->(Void))
    {
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON {
            (response) in
            
            print(parameters)
            onTaskCompleted(response)
        }
        
        
    }
}
