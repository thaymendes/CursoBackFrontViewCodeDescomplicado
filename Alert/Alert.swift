//
//  Alert.swift
//  LoginViewCode
//
//  Created by Thayanne Mendes on 04/01/23.
//

import Foundation
import UIKit

class Alert: NSObject {
    var controller: UIViewController
    
    
     init(controller: UIViewController) {
         self.controller = controller
    }
    
    func getAlert(titulo: String, mensage: String, completion :(() -> Void)? = nil){
        let alertController = UIAlertController(title: titulo, message: mensage, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true)
    }
}
