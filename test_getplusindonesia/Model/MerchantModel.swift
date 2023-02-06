//
//  MerchantData.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import Foundation

// MARK: - MerchantData
struct MerchantData: Codable {
    let data: DataClassMerchant
}

// MARK: - DataClass
struct DataClassMerchant: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable, Identifiable {
    let id, rsn, name, displayValue: String
    let url, websiteProfile: String
    let partnerCategory: PartnerCategory
    let images: Images

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case rsn = "RSN"
        case name = "Name"
        case displayValue = "DisplayValue"
        case url = "URL"
        case websiteProfile = "WebsiteProfile"
        case partnerCategory = "PartnerCategory"
        case images = "Images"
    }
}

// MARK: - Images
struct Images: Codable {
    let feature: Feature

    enum CodingKeys: String, CodingKey {
        case feature = "Feature"
    }
}

// MARK: - Feature
struct Feature: Codable {
    let imageURL: String
    let thumbnailURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case imageURL = "ImageURL"
        case thumbnailURL = "ThumbnailURL"
    }
}

// MARK: - PartnerCategory
struct PartnerCategory: Codable {
    let rsn: JSONNull?
    let displayValue, partnerCategoryID: String

    enum CodingKeys: String, CodingKey {
        case rsn = "RSN"
        case displayValue = "DisplayValue"
        case partnerCategoryID = "PartnerCategoryID"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
