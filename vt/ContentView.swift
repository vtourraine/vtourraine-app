//
//  ContentView.swift
//  vt
//
//  Created by Vincent Tourraine on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State var projects: [Project] = {
        let bundle = Bundle.main
        do {
            guard let fileURL = bundle.url(forResource: "projects", withExtension: "json") else {
                return []
            }

            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let objects = try decoder.decode([Project].self, from: data)
            return objects
        }
        catch {
            return []
        }
    }()
    let currentYear = 2023

    var body: some View {
        NavigationView {
            List {
                Section("Current Projects") {
                    ForEach(projects.filter { $0.yearEnd == currentYear || $0.yearEnd == currentYear - 1 }) { project in
                        NavigationLink {
                            ProjectDetailView(project: project)
                        } label: {
                            ProjectRow(project: project)
                        }
                    }
                }
                Section("Past Projects") {
                    ForEach(projects.filter { $0.yearEnd < currentYear - 1 }) { project in
                        NavigationLink {
                            ProjectDetailView(project: project)
                        } label: {
                            ProjectRow(project: project)
                        }
                    }
                }
            }.navigationTitle("Projects")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
