//
//  DayData1View.swift
//  iCloudTest111
//
//  Created by Alfie Le Feuvre on 18/08/2024.
//
import SwiftData
import SwiftUI

struct DayData1View: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData1.timestamp) private var dayDatas: [DayData1]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dayDatas) { dayData in
                    NavigationLink {
                        Text("Item at \(dayData.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(dayData.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Day Data")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = DayData1(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(dayDatas[index])
            }
        }
    }
}

#Preview {
    DayData1View()
        .modelContainer(for: DayData1.self, inMemory: true)
}
