//
//  HttpUtility.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import Foundation

struct HttpUtility {
    func getData<T:Decodable>(requestUrl: URL?, resultType: T.Type,completionHandler:@escaping(_ result: T?)-> Void) {
       
        guard let urlRequest =  requestUrl else { return }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard let data = data else {
                completionHandler(nil)
                debugPrint("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completionHandler(result)
            } catch {
                completionHandler(nil)
                debugPrint("Failed to decode data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
