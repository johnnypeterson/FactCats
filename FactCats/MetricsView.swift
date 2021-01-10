//
//  MetricsView.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/10/21.
//

import SwiftUI

struct MetricsView: View {
    var body: some View {
        VStack {
            let os = ProcessInfo().operatingSystemVersion
            let device = UIDevice.current
            Text("OS Version: \(os.majorVersion).\(os.minorVersion)")
            Text("Device: \(device.name)")
            Text("\(formattedMemoryFootprint())")
        }
    }
    
    
    func memoryFootprint() -> Float? {
        let TASK_VM_INFO_COUNT = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<integer_t>.size)
        let TASK_VM_INFO_REV1_COUNT = mach_msg_type_number_t(MemoryLayout.offset(of: \task_vm_info_data_t.min_address)! / MemoryLayout<integer_t>.size)
        var info = task_vm_info_data_t()
        var count = TASK_VM_INFO_COUNT
        let kr = withUnsafeMutablePointer(to: &info) { infoPtr in
            infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) { intPtr in
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
            }
        }
        guard
            kr == KERN_SUCCESS,
            count >= TASK_VM_INFO_REV1_COUNT
        else { return nil }
        
        let usedBytes = Float(info.phys_footprint)
        return usedBytes
        
    }

    func formattedMemoryFootprint() -> String {
        let usedBytes: UInt64? = UInt64(self.memoryFootprint() ?? 0)
        let usedMB = Double(usedBytes ?? 0) / 1024 / 1024
        let usedMBAsString: String = "Memory Used by App: \(usedMB)MB"
        return usedMBAsString
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView()
    }
}
