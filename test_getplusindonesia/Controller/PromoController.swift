//
//  PromoController.swift
//  test_getplusindonesia
//
//  Created by Gale on 06/02/23.
//

import Foundation

class PromoController: ObservableObject {
    let promoUrl = "https://private-anon-bb055445df-gpimobiletakehometest.apiary-mock.com/home"
    
    @Published private(set) var promoListData: PromoData?
    
    init () {
        fetchPromo();
    }
    
    func fetchPromo() {
        if let url = URL(string: promoUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleAfterPromo(data:response:error:))
            
            task.resume()
        }
    }
    
    func handleAfterPromo(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            print("safeDatas \(data)")
            self.parseJSON(data: safeData)
            
        }
    }
    
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(PromoData.self, from: data)
            DispatchQueue.main.async {
                self.promoListData = decodedData
                
            }
            
        } catch {
            print(error)
        }
    }
}
