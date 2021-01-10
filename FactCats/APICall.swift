//
//  APICall.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/10/21.
//

import Foundation
import RealmSwift

class APICall: Object {
    @objc dynamic var id = ""
    @objc dynamic var call:String = ""
    @objc public dynamic var timeInterval:Double = 0.0  //time in nano seconds.

    override public static func primaryKey() -> String? {
        return "id"
    }
}
