//
//  VoucherData.swift
//  test_getplusindonesia
//
//  Created by Gale on 05/02/23.
//

import Foundation

// MARK: - VoucherData
struct VoucherData: Codable {
    let data: DataClassVoucher
}

// MARK: - DataClass
struct DataClassVoucher: Codable {
    let list: [ListVoucher]
}

// MARK: - List
struct ListVoucher: Codable, Identifiable {
    var id: String {rsn}
    
    let rsn, displayValue, status, validFrom: String
    let validUntil, voucherCode: String
    let voucherValue: Int
    let authenticationRequired: Bool
    let urlOnly, isPendingTransfer: Bool
    let scanToUse: Bool
    let partner: Partner
    let images: ImagesVoucher

    enum CodingKeys: String, CodingKey {
        case rsn = "RSN"
        case displayValue = "DisplayValue"
        case status = "Status"
        case validFrom = "ValidFrom"
        case validUntil = "ValidUntil"
        case voucherCode = "VoucherCode"
        case voucherValue = "VoucherValue"
        case authenticationRequired = "AuthenticationRequired"
        case urlOnly = "URLOnly"
        case isPendingTransfer = "IsPendingTransfer"
        case scanToUse = "ScanToUse"
        case partner = "Partner"
        case images = "Images"
    }
}

// MARK: - Images
struct ImagesVoucher: Codable {
    let feature: FeatureVoucher

    enum CodingKeys: String, CodingKey {
        case feature = "Feature"
    }
}

// MARK: - Feature
struct FeatureVoucher: Codable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "ImageURL"
    }
}

// MARK: - Partner
struct Partner: Codable {
    let id, rsn, displayValue: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case rsn = "RSN"
        case displayValue = "DisplayValue"
    }
}
