//
//  ViewController.swift
//  CBSample
//
//  Created by YoshinobuHARA on 2018/01/23.
//  Copyright © 2018年 Sunyou. All rights reserved.
//

import UIKit
import CoreBluetooth


class ViewController: UIViewController, CBCentralManagerDelegate {
    
    var centralManager:CBCentralManager? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager.init(delegate: self, queue: nil)
    }

    
    /* CBCentralManagerのdelegateメソッド */
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("CBCentralManager state has chenged")
        if central.state == CBManagerState.poweredOn{
            //CBCentralManagerによるスキャン開始。
            centralManager?.scanForPeripherals(withServices: nil, options: nil)
            
            //CBManagerStateがpoweredOnになるのに時間がかかるため、
            //viewDidLoadで初期化直後に呼び出しても動かないので
            //CBManagerStateがpoweredOnになったのを確認してからスキャンする
            
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print(peripheral.description + " connected")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral.description + " discovered")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error as Any)
    }

 
}

