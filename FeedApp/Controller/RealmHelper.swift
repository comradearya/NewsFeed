//
//  RealmHelper.swift
//  FeedApp
//
//  Created by orpan on 10.04.2021.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func saveObjects(objects: [NewsForView]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(objects)
        }
    }
    static func getObjects()->[NewsForView] {
        let realm = try! Realm()
        let realmResults = realm.objects(NewsForView.self)
        return Array(realmResults)

    }
    static func getObjects(filter:String)->[NewsForView] {
        let realm = try! Realm()
        let realmResults = realm.objects(NewsForView.self).filter(filter)
        return Array(realmResults)

    }
}
