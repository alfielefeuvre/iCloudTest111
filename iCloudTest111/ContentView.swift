//
//  ContentView.swift
//  iCloudTest111
//
//  Created by Alfie Le Feuvre on 18/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var selection = 1
   
    var body: some View {
        TabView(selection:$selection) {
            ItemView()
                .tabItem{ Label("Item", systemImage: "fork.knife") } .tag(1)
            
            Message1View()
                .tabItem{ Label("Message", systemImage: "bubble.left") } .tag(2)
            
            DayData1View()
                .tabItem{ Label("DayData", systemImage: "timelapse") } .tag(3)
        }
    }
}

#Preview {
    ContentView()
}
