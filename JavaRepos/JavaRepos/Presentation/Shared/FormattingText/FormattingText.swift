//
//  FormattingText.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 16/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

extension String {
    var formatDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "pt_BR")
    
        guard let dateForConverted = self.getDate(with: self) else {
            return ""
        }

        let dateFormatted = dateFormatter.string(from: dateForConverted)

        return dateFormatted
    }
    
    private func getDate(with stringDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: stringDate)

        return date
    }
}
