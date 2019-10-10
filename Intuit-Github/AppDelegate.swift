//
//  AppDelegate.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import Whisper
import InstantSearchClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let ALGOLIA_APP_ID = "Algolia App ID"
    static let ALGOLIA_API_KEY = "Algolia API Key"
    static let USERS_INDEX = "dev_USERS"
    
    var propertiesDict:[String:Any]?
    
    var algoliaClient:Client?
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let url = Bundle.main.url(forResource:"Info", withExtension: "plist"){
            let propertiesDict = NSDictionary(contentsOf: url) as? [String:Any]
            self.propertiesDict = propertiesDict
        } else{
            print("Missing info.plist file")
            fatalError("Missing info.plist file")
        }
        
        //Setup Algolia Elastic Search
        if let appID = propertiesDict![AppDelegate.ALGOLIA_APP_ID], let apiKey = propertiesDict![AppDelegate.ALGOLIA_API_KEY]{
            algoliaClient = Client(appID: appID as! String, apiKey: apiKey as! String)
        } else{
            print("Missing info.plist file")
            fatalError("Missing ALGOLIA_APP_ID or ALGOLIA_API_KEY")
        }
       
        //Setup Service Manger
        ServiceManager.setup()
        
        //Setup Keyboard Manager
        IQKeyboardManager.shared.enable = true
        
        //Initialize Root View Controller
        setupRootViewController()
        
        //APIManager Setup
        
        return true
    }
    
    private func setupRootViewController(){
        // get your storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // instantiate your desired ViewController
        let rootNavigationController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController") as! UINavigationController
        
        // Because self.window is an optional you should check it's value first and assign your rootViewController
        if let window = self.window {
            window.rootViewController = rootNavigationController
        }
    
        
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Intuit_Github")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

