//
//  VoucherController.swift
//  test_getplusindonesia
//
//  Created by Gale on 06/02/23.
//

import Foundation

class VoucherController: ObservableObject {
    let voucherUrl = "https://private-anon-220aa18c3f-gpimobiletakehometest.apiary-mock.com/vouchers"
    
    @Published private(set) var voucherListData: VoucherData?
    
    init () {
        fetchVoucher();
    }
    
    func fetchVoucher() {
        if let url = URL(string: voucherUrl) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleAfterCallVoucher(data:response:error:))
            
            task.resume()
        }
    }
    
    func handleAfterCallVoucher(data: Data?, response: URLResponse?, error: Error?) {
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
            
            let decodedData = try decoder.decode(VoucherData.self, from: data)
            
            DispatchQueue.main.async {
                
                self.voucherListData = decodedData
                
            }
            
        } catch {
            print("Voucher \(error)")
        }
    }
}
