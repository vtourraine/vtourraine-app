//
//  ProjectRow.swift
//  vt
//
//  Created by Vincent Tourraine on 03/06/2023.
//

import SwiftUI

struct ProjectRow: View {
    @State var project: Project

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(project.name)
                    .font(.headline)
                Text(project.platforms.joined(separator: ", ") + " – " + project.client)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct ProjectRow_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRow(project: Project(name: "Project", slug: "", yearStart: 0, yearEnd: 0, platforms: ["iOS", "macOS"], client: "Std AMG", description: "", url: URL(string: ""), links: [:], screenshots: nil, screenshotsBig: nil))
    }
}
