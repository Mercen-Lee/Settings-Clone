//
//  ContentView.swift
//  Settings
//
//  Created by Mercen on 2022/07/28.
//

import SwiftUI

struct Icon: View {
    let color: Color
    let image: Image
    let title: String
    var body: some View {
        HStack {
            image
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 7))
            Text(title)
        }
    }
}

struct ContentView: View {
    @State var searchText = String()
    @State var toggle = false
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        VStack(alignment: .leading) {
                            Text("Seok Ho Lee")
                                .font(.title2)
                            Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                                .font(.caption)
                        }
                    }
                }
                Section {
                    HStack {
                        Image(systemName: "airplane")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                        Text("에어플레인 모드")
                        Spacer()
                        Toggle(isOn: $toggle) { }
                    }
                    NavigationLink(destination: DummyView()) {
                        Icon(color: .blue, image: Image(systemName: "wifi"), title: "Wi-Fi")
                    }
                    NavigationLink(destination: DummyView()) {
                        Icon(color: .green, image: Image(systemName: "antenna.radiowaves.left.and.right"), title: "셀룰러")
                    }
                    NavigationLink(destination: DummyView()) {
                        Icon(color: .green, image: Image(systemName: "personalhotspot"), title: "개인용 핫스팟")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("설정")
            .searchable(text: $searchText)
        }
    }
}

struct DummyView: View {
    var body: some View {
        Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
