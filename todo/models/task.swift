//
//  task.swift
//  todo
//
//  Created by 奥城健太郎 on 2019/01/19.
//  Copyright © 2019 奥城健太郎. All rights reserved.
//

import Foundation

class Task: Codable {
    var title: String = ""
    var description: String = ""
    
    enum CodingKeys: String, CodingKey {
        case title
    }
    
    init(){
        
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
    }
}
