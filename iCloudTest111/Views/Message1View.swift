//
//  MessageView.swift
//  iCloudTest111
//
//  Created by Alfie Le Feuvre on 18/08/2024.
//
import SwiftData
import SwiftUI

struct Message1View: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Message1.timestamp) private var message1s: [Message1]
   
    var body: some View {
        NavigationView {
            List {
                ForEach(message1s) { msg in
                    NavigationLink {
                        Text("Item at \(msg.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(msg.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
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
            .navigationTitle("Message")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Message1(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(message1s[index])
            }
        }
    }
}

#Preview {
    Message1View()
        .modelContainer(for: Message1.self, inMemory: true)
}
