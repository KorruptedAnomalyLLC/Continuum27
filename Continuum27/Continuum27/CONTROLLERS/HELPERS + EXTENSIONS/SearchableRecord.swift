//
//  SearchableRecord.swift
//  Continuum27
//
//  Created by Austin West on 7/10/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
