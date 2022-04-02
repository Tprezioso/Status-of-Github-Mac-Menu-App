//
//  ContentView.swift
//  Status of Github Menu App
//
//  Created by Thomas Prezioso Jr on 4/1/22.
//

import SwiftUI

struct StatusView: View {
    @State var statusComponents = StatusComponents(components: [])
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(statusComponents.components) { item in
                if item.name != "Visit www.githubstatus.com for more information" {
                    Text("\(item.name): ") +
                    Text("\(item.status.capitalized)")
                }
            }
            Spacer()
        }
        .frame(width: 225, height: 225)
            .padding()
        .onAppear {
            Task { @MainActor in
                do {
                    self.statusComponents = try await getStatus()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func getStatus() async throws -> StatusComponents {
        guard let url = URL(string: "https://www.githubstatus.com/api/v2/components.json") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
        
        if let components = try? JSONDecoder().decode(StatusComponents.self, from: data) {
            print(components.components)
            return components
        }
        return StatusComponents(components: [])
    }
    
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
