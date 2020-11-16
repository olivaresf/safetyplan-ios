//
//  SafetyPlanInteractor.swift
//  Safety Plan
//
//  Created by Fernando Olivares on 11/16/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import UIKit

class SafetyPlanInteractor : SafetyPlanViewContorllerActions {
    
    func editSafetyPlan(using: SafetyPlanItem.ItemType?, from: SafetyPlanViewController) {
        let sb = UIStoryboard(name: "Plan", bundle: nil)
        let editSafetyPlanItemNav = sb.instantiateViewController(withIdentifier: "EditSafetyPlanItemNav")
        guard
            let navController = editSafetyPlanItemNav as? UINavigationController,
            let topViewController = navController.topViewController,
            let editSafetyPlanItemsVC = topViewController as? EditSafetyPlanItemViewController,
            let type = using
        else {
            #warning("Do we report this to a user? Or should we force unwrap any of the conditions above?")
            return
        }
        editSafetyPlanItemsVC.refreshDelegate = from
        editSafetyPlanItemsVC.safetyPlanItemType = type
        from.present(editSafetyPlanItemNav, animated: true)
    }
}
