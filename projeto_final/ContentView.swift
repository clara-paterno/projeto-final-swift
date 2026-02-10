//
//  ContentView.swift
//  projeto_final
//
//  Created by Turma02-19 on 10/11/25.
//

import SwiftUI
import Foundation

struct PlantReading: Codable {
    let ts: String
    let umidade: Double
    let luminosidade: Double
    let temperatura: Double
}

struct PlantData: Codable, Identifiable{
    var id: String {plant_id}
    let type: String?
    let device_id: String
    let plant_id: String
    let luxid: String
    let igm: String?
    let ultima_leitura: PlantReading
    
}
struct PlantDataenvio: Codable, Identifiable{
    var id: String {plant_id}
    let type: String?
    let device_id: String
    let plant_id: String
    let luxid: String
    let igm: String
    
}

struct ContentView: View {
    
    @State private var selectedTab: TabbedItems = .home
    @StateObject private var themeManager = ThemeManager()
    @StateObject private var plantsVM = PlantsViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            // MARK: - TabView
            TabView(selection: $selectedTab) {
                SuasPlantas()
                    .navigationBarBackButtonHidden(true)
                    .tag(TabbedItems.home)
                
                TelaAdicionarPlanta(vm: plantsVM)
                    .tag(TabbedItems.add)
                
                ConfigView()
                    .tag(TabbedItems.menu)
            }.tabViewStyle(.page(indexDisplayMode:.never))
                .ignoresSafeArea()
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
            
            // MARK: - Barra customizada
            HStack(spacing: 20) {
                ForEach(TabbedItems.allCases, id: \.self) { item in
                    if item == .add {
                        // botão central (exemplo de botão flutuante)
                        Button {
                            selectedTab = .add
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color.fundo)
                                    .frame(width: 60, height: 60)
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .shadow(radius: 4)
                        }
                    } else {
                        Button {
                            selectedTab = item
                        } label: {
                            CustomTabItem(
                                imageName: item.iconName,
                                title: item.title,
                                isActive: selectedTab == item
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color("tabColor"))
                    .shadow(color: .black.opacity(0.1), radius: 5, y: -2)
            )
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


extension ContentView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .tab : .gray)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .white : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .fundo.opacity(0.9) : .clear)
        .cornerRadius(30)
    }
}


#Preview {
    ContentView()
}
