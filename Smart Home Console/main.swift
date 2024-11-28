//
//  main.swift
//  Smart Home Console
//
//  Created by Yu, Samuel (EJNR) on 28/11/2024.
//

import Foundation

var Devices = [Device]()

class Device {
    var name: String
    var status: String
    
    init (name: String, status: String) {
        self.name = name
        self.status = status
    }
    
    func changeState() {
        switch status {
        case "active":
            status = "inactive"
        case "inactive":
            status = "active"
        default:
            break
        }
    }
}

func menu() {
    print("""
    Enter 1 to view existing devices
    Enter 2 to add a new device
    """)
    
    if let input = readLine() {
        
        switch input {
        case "1":
            viewDevices()
        case "2":
            newDevice()
        default:
            print("Unrecognised input")
            menu()
        }
    }
}
    
func viewDevices() {
    if Devices.isEmpty {
        print("No devices found. Returning to menu..")
        menu()
    } else {
        for Device in Devices {
            print("\(Device.name) - \(Device.status)")
        }
    }
}

func newDevice() {
    print("Enter the name you'd like to give to the new device: ")
    var name = readLine()
    Device = Device(name: name, status: "inactive")
}

menu()
