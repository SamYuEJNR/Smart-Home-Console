//
//  main.swift
//  Smart Home Console
//
//  Created by Yu, Samuel (EJNR) on 28/11/2024.
//

import Foundation

var devices = [Device]()
var total = 0

class Device {
    var name: String
    var status: String
    var index: Int
    
    init(name: String, status: String, index: Int) {
        self.name = name
        self.status = status
        self.index = index
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
    Enter 3 to exit
    """)
    
    if let input = readLine() {
        switch input {
        case "1":
            viewDevices()
        case "2":
            newDevice()
        case "3":
            print("Exiting program. Goodbye!")
            return
        default:
            print("Unrecognized input. Try again.")
            menu()
        }
    } else {
        print("Invalid input. Try again.")
        menu()
    }
}

func viewDevices() {
    if devices.isEmpty {
        print("No devices found. Returning to menu..")
        menu()
    } else {
        for device in devices {
            print("\(device.index). \(device.name) - \(device.status)")
        }
        print("Enter the device's index number to change its status or any other key to return to menu:")
        if let input = readLine(), let enteredIndex = Int(input) {
            for device in devices {
                if device.index == enteredIndex {
                    device.changeState()
                    print("The status of '\(device.name)' has been changed to '\(device.status)'.")
                    break
                }
            }
        }
    }
    menu()
}

func newDevice() {
    total += 1
    print("Enter the name of the new device: ")
    if let name = readLine(), !name.isEmpty {
        let newDevice = Device(name: name, status: "inactive", index: total)
        devices.append(newDevice)
        print("Device '\(name)' added successfully.")
    } else {
        total -= 1
        print("Invalid name. Returning to menu.")
    }
    menu()
}

menu()
