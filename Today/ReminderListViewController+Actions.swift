//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Aleksandr Eliseev on 18.01.2023.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {
            return
        }
        completeReminder(with: id)
    }
}
