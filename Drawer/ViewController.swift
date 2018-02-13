//
//  ViewController.swift
//  Drawer
//
//  Created by Neha Gupta on 12/02/18.
//  Copyright © 2018 Neha Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drawer"{
            if let drawerVC = segue.destination as? DrawerViewController {
                drawerVC.delgate = self
            }
        }
    }
    
    

}

extension ViewController: DrawerDelegate {
    func selectedButtonTag(value: Int) {
        print("Selected Button \(value)")
        switch value {
        case MenuItemCollection.Home.rawValue:
            break
        case MenuItemCollection.login.rawValue:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController:LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginViewController, animated: true, completion: nil)
            break
        default: break
            
        }
    }
}

