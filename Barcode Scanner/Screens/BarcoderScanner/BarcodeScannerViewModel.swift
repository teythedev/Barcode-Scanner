//
//  BarcodeScannerViewModel.swift
//  Barcode Scanner
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published
    var scannedCode: String = ""
    @Published
    var alertItem: AlertItem?
    
    
    var statusText: String {
        scannedCode.isEmpty ?  "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
