//
//  TitlesService.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import CoreData
import UIKit

protocol TitlesService: AnyObject {
    
    func getTitles() throws -> [Title]
    func addTitle(text:String) throws -> Title
    func deleteTitle(with id: String) throws
    func getTitle(with id: String) throws -> Title?
}

class TitlesServiceImplementation: TitlesService {

    private func context() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    private func save() {
        
        do {
            try context().save()
        } catch {
            print("Couldn't save titles")
        }
    }
    
    
    func getTitles() throws -> [Title] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        
        do {
            let result = try context().fetch(fetchRequest)
            
            if let titles = result as? [Title] {
                return titles
            } else {
                return []
            }
            
        } catch {
            print("Couldn't get titles")
            return []
        }
    }
    
    func addTitle(text: String) throws -> Title {
        
        let title = NSEntityDescription.insertNewObject(forEntityName: "Title", into: context()) as! Title
        title.text = text
        title.id = UUID().uuidString
        
        self.save()
        
        return title
    }
    
    func deleteTitle(with id: String) throws {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try context().fetch(fetchRequest)
            
            if let objectToDelete = result.first as? NSManagedObject {
                context().delete(objectToDelete)
                
                self.save()
            }
        } catch {
            print("Couldn't delete titles")
        }
    }
    
    func getTitle(with id: String) throws -> Title? {
        
        let predicate = NSPredicate(format: "id = %@", id)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = predicate
        
        do {
            let result = try context().fetch(fetchRequest)
            
            if let title = result.first as? Title {
                return title
            }
        } catch {
            print("Couldn't get title")
        }
        
        return nil
    }
}
