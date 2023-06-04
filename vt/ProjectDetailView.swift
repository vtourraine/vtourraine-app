//
//  ProjectDetailView.swift
//  vt
//
//  Created by Vincent Tourraine on 04/06/2023.
//

import SwiftUI

struct ProjectDetailView: View {
    @State var project: Project

    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(NumberFormatter.localizedString(from: project.yearStart as NSNumber, number: .none))–\(NumberFormatter.localizedString(from: project.yearEnd as NSNumber, number: .none))")
                    Text(project.platforms.joined(separator: ", "))
                    Text(project.client)
                    if let url = project.url {
                        Spacer()
                        Button {
                            UIApplication.shared.open(url)
                        } label: {
                            Text(url.absoluteString)
                        }
                    }
                    Spacer()
                    Text(project.description)
                        .font(.body)
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(project.name)
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Project(name: "Project", slug: "", yearStart: 2000, yearEnd: 2022, platforms: ["iOS", "macOS"], client: "Std AMG", description: "Bla bla", url: URL(string: "https://www.studioamanga.com"), links: [:], screenshots: nil, screenshotsBig: nil))
    }
}
