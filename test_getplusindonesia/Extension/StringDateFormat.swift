//
//  StringDateFormat.swift
//  test_getplusindonesia
//
//  Created by Gale on 05/02/23.
//

import Foundation

extension String {

    func toDateFormat() -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

         let oldDate = olDateFormatter.date(from: self)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "dd MMMM yyyy"

         return convertDateFormatter.string(from: oldDate!)
    }
}
