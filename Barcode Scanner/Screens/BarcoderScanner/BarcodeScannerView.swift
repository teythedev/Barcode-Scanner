//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Tugay Emre Yucedag on 19.12.2023.
//

import SwiftUI
// 4:55:00 da kaldim
struct BarcodeScannerView: View {
    
    @StateObject
    var viewModel: BarcodeScannerViewModel = BarcodeScannerViewModel()


    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.bottom, 40)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(viewModel.statusText)
                    .foregroundStyle(viewModel.statusTextColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
            
            
        }
        
    }
}

#Preview {
    BarcodeScannerView()
}
