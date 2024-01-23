//
//  ContentView.swift
//  stream
//
//  Created by Qiu, Men Seng on 18.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
        }
        .padding().onAppear(){hi()}
    }
    private func hi() {
        let url = URL(string: "http://192.168.178.92:8080")
        var request = URLRequest(url: url!)
        let dat = try! JSONEncoder().encode("g")


        request.httpMethod = "POST"
        request.httpBody = dat
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
            } else if let data = data {
                print(data)
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
}


#Preview {
    ContentView()
}
