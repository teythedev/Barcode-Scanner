//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Tugay Emre Yucedag on 19.12.2023.
//

import SwiftUI
// 4:55:00 da kaldim

struct AlertItem: Identifiable {
    let id: UUID = UUID()
    let title:String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(
        title: "Invalid Device Input",
        message: "Something wrong with the camera. We are unable to capture the input.",
        dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(
        title: "Invalid Scan Type",
        message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
        dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    
    @State
    private var scannedCode: String = ""
    @State
    private var alertItem: AlertItem?
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.bottom, 40)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ?  "Not Yet Scanned" : scannedCode)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
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
