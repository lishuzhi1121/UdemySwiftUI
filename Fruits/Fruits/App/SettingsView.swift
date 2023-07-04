//
//  SettingsView.swift
//  Fruits
//
//  Created by Sands on 2023/7/4.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
//    @State private var isOn = false
    @AppStorage("isOnboarding") var isOnbarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    // section 1
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                        }
                    } label: {
                        SettingsLabelView(
                            labelText: "fructus",
                            labelImage: "info.circle"
                        )
                    }
                    
                    // section 2
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts th onbaording process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                            .frame(minHeight: 60)
                        
                        Toggle(isOn: $isOnbarding) {
                            Text(isOnbarding ? "RESTARTED" : "RESTART")
                                .fontWeight(.bold)
                                .foregroundColor(isOnbarding ? .green : .secondary)
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                    } label: {
                        SettingsLabelView(
                            labelText: "customization",
                            labelImage: "paintbrush"
                        )
                    }

                    
                    // section 3
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "Sand / Lee")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 15")
                        SettingsRowView(name: "Website", linkText: "SwiftUI Masterclass", linkURL: "https://swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", linkText: "@SandsLeee", linkURL: "https://twitter.com/SandsLeee")
                        SettingsRowView(name: "SwiftUI", content: "5.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } label: {
                        SettingsLabelView(
                            labelText: "application",
                            labelImage: "apps.iphone"
                        )
                    }

                }
            }
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
