//
//  Character.swift
//  OOPexcercise
//
//  Created by Hesham Saleh on 8/30/16.
//  Copyright © 2016 Hesham Saleh. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    private var _name: String = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var attackPower: Int = 20
    
    init(name: String, hp: Int, attackPower: Int) {
        
        self.attackPower = attackPower
        self._hp = hp
        self._name = name
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    func attack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
    
    
}