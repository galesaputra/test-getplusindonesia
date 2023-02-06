//
//  PromoData.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import Foundation

// MARK: - PromoModel
struct PromoData: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let layout: Layout
}

// MARK: - Layout
struct Layout: Decodable {
    let menu: [Menu]
    let promo: Promo
}

// MARK: - Menu
struct Menu: Decodable {
    let logoURL: String
    let label, id: String
    let deeplink: String
    let enable, visible: Bool

    enum CodingKeys: String, CodingKey {
        case logoURL = "logoUrl"
        case label, id, deeplink, enable, visible
    }
}

// MARK: - Promo
struct Promo: Decodable {
    let title: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Decodable, Identifiable {
    let id: Int
    let imageURL: String
    let order: Int
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case order, url
    }
}
