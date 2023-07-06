//
//  ContentView.swift
//  Convertator
//
//  Created by Jérémie - Ada on 16/06/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            TabView {
                tab0
                    .tabItem {
                        Label("Tab 0", systemImage: "circle")
                    }
                tab1
                    .tabItem {
                        Label("Tab 1", systemImage: "circle")
                    }
                tab2
                    .tabItem {
                        Label("Tab 2", systemImage: "circle")
                    }
                tab3
                    .tabItem {
                        Label("Tab 3", systemImage: "circle")
                    }
            }
            .tabViewStyle(.page)

        }
    }
    
    private var tab0: some View {
        ZStack{
            Intro()
        }
    }
    
    private var tab1: some View {
        ZStack {
            Temperature()
        }
    }
    
    private var tab2: some View {
        ZStack {
            Volumes()
        }
    }
    private var tab3: some View {
        ZStack {
            Longueurs()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
