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
            VStack(alignment: .leading) {
                Text(project.name)
                    .font(.headline)
                Text(project.platforms.joined(separator: ", "))
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct ProjectRow_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRow(project: Project(name: "Project", slug: "", yearStart: 0, yearEnd: 0, platforms: ["iOS", "macOS"], client: "", description: "", url: "", links: [:], screenshots: nil, screenshotsBig: nil))
    }
}
