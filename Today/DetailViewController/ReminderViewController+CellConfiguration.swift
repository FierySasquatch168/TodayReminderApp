//
//  ReminderViewController+CellConfiguration.swift
//  Today
//
//  Created by Aleksandr Eliseev on 23.01.2023.
//

import UIKit

extension ReminderViewController {
    
    func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration() // default list content configuration for the cell’s style
        contentConfiguration.text = text(for: row)
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfiguration.image = row.image
        return contentConfiguration
    }
    
    func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
        var textFieldConfiguration = cell.textFieldConfiguration()
        textFieldConfiguration.text = title
        textFieldConfiguration.onChange = { [weak self] changedTitle in
            self?.workingReminder.title = changedTitle
        }
        return textFieldConfiguration
    }
    
    func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = title
        return contentConfiguration
    }
    
    func dateConfiguration(for cell: UICollectionViewListCell, with date: Date) -> DatePickerContentView.Configuration {
        var contentConfiguration = cell.datePickerConfiguration()
        contentConfiguration.date = date
        contentConfiguration.onChange = { [weak self] changedDueDate in
            self?.workingReminder.dueDate = changedDueDate
        }
        return contentConfiguration
    }
    
    func notesConfiguration(for cell: UICollectionViewListCell, with notes: String?) -> TextViewContentView.Configuration {
        var contentConfiguration = cell.textViewConfiguration()
        contentConfiguration.text = notes
        contentConfiguration.onChange = { [weak self] notes in
            self?.workingReminder.notes = notes
        }
        return contentConfiguration
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .viewDate:
            return reminder.dueDate.dayText
        case .viewTime:
            return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .viewNotes:
            return reminder.notes
        case .viewTitle:
            return reminder.title
        default:
            return nil
        }
    }
    
    
}
