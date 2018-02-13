//
//  DrawerViewController.swift
//  Drawer
//
//  Created by Neha Gupta on 12/02/18.
//  Copyright © 2018 Neha Gupta. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    @IBOutlet weak var uvDrawer:UIView!
    @IBOutlet var btnMenuItem: [UIButton]!
    
    var delgate:DrawerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uvDrawer.layer.masksToBounds = false
        uvDrawer.layer.shadowOffset = CGSize(width: 3, height: 3)
        uvDrawer.layer.shadowOpacity = 0.8
        uvDrawer.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(self.viewTapGesture(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    @IBAction func menuItem_TouchUpInside(_ sender: UIButton) {
        
        switch sender.tag {
            case MenuItemCollection.Home.rawValue:
                self.delgate?.selectedButtonTag(value: MenuItemCollection.Home.rawValue)
                self.dismiss(animated: true, completion: nil)
            break
            case MenuItemCollection.login.rawValue:
                self.dismiss(animated: true, completion: { isSucess -> Void in
                        self.delgate?.selectedButtonTag(value: MenuItemCollection.login.rawValue)
                    })
            break
            default: break
        }
    }
    
    //MARK: - Gesture -

    func viewTapGesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Helper
    

}



enum MenuItemCollection: Int {
    case Home = 0
    case login = 1
    
}
