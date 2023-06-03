//
//  ContentView.swift
//  vt
//
//  Created by Vincent Tourraine on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
    var projects: [Project] = {
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

    var body: some View {
        NavigationView {
            List {
                ForEach(projects) { project in
                    ProjectRow(project: project)
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
