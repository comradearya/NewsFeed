//
//  RealmHelper.swift
//  FeedApp
//
//  Created by orpan on 10.04.2021.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    //MARK:- Properties
    
    static var realm: Realm {
            get {
                do {
                    let realm = try Realm()
                    return realm
                }
                catch let error as NSError {
                    NSLog("Could not access database: ", error)
                }
                return self.realm
            }
        }
    //MARK:- Static Methods
    
    static func saveObjects(objects: [NewsForView]) {
        do {
            try realm.write {
                realm.add(objects)
            }
        } catch let error as NSError {
            NSLog("Could not write to database: ", error)
        }
    }
    
    static func getObjects()->[NewsForView] {
        do {
            let realmResults = realm.objects(NewsForView.self)
            return Array(realmResults)
        } catch let error as NSError {
            NSLog("Could not read database: ", error)
        }
    }
    
    static func getObjects(filter:String)->[NewsForView] {
            let realmResults = realm.objects(NewsForView.self).filter(filter)
            return Array(realmResults)
    }
}
