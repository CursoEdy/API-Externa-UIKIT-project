//
//  API.swift
//  ApiExterna
//
//  Created by ednardo alves on 07/12/24.
//

import Foundation


class API: NSObject {
    
    @objc
    func buscarElemento(completion: @escaping (_ jsonData: NSMutableDictionary?) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        
        // task que vai chamar esse request
        var request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error)")
                completion(nil)
            }else if(data != nil) {
                let result = NSMutableDictionary()
                let res = response as! HTTPURLResponse
                print(res.statusCode)
                
                do {
                    let dataJson = try JSONSerialization.jsonObject(with: data!)
                    result["data"] = dataJson
                    result["statusCode"] = String.init(format: "%li", res.statusCode)
                } catch {
                    result["statusCode"] = "404"
                }
                
                completion(result)
            }
        }
        task.resume()
    }
    
}
