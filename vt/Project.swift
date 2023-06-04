//
//  Project.swift
//  vt
//
//  Created by Vincent Tourraine on 03/06/2023.
//

import Foundation

struct Project: Codable {
    let name: String
    let slug: String
    let yearStart: Int
    let yearEnd: Int
    let platforms: [String]
    let client: String
    let description: String
    let url: URL?
    let links: [String: String]
    let screenshots: [String]?
    let screenshotsBig: [String]?

    enum CodingKeys: String, CodingKey {
        case name, slug, platforms, client, description, url, links, screenshots
        case yearStart = "year-start"
        case yearEnd = "year-end"
        case screenshotsBig = "screenshots-big"
    }
}

extension Project: Identifiable {
    var id: String {
        return slug
    }
}
