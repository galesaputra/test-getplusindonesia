//
//  MerchantController.swift
//  test_getplusindonesia
//
//  Created by Gale on 06/02/23.
//

import Foundation

class MerchantController: ObservableObject {
    let merchantUrl = "https://private-anon-879f14eccd-gpimobiletakehometest.apiary-mock.com/merchants?page=1"
    
    @Published private(set) var merchantListData: MerchantData?
    
    init () {
        fetchMerchant();
    }
    
    func fetchMerchant() {
        if let url = URL(string: merchantUrl) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleAfterCallMerchant(data:response:error:))
            
            task.resume()
        }
    }
    
    func handleAfterCallMerchant(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            
            self.parseJSON(data: safeData)
            
        }
    }
    
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(MerchantData.self, from: data)
            
            DispatchQueue.main.async {
                
                self.merchantListData = decodedData
                
            }
            
        } catch {
            print(error)
        }
    }
}
