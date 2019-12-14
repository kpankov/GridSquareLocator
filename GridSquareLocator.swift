//
//  Created by Konstantin Pankov on 15.12.2019.
//  Copyright © 2019 kpankov.com. All rights reserved.
//

import Foundation

class GridSquareLocator {
    
    private var latitude: Double
    private var longitude: Double
    
    private var index2Char: Array<Character> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    private func myFloor(_ x: Double) -> Int {
        return Int(floor(x))
    }

    func getField() -> String {
    let field1: Int = Int(floor((180 + longitude) / 20))
    let field2: Int = Int(floor((90 + latitude) / 10))
    var field: String = ""
    field.append(index2Char[field1])
    field.append(index2Char[field2])
    return field
    }

    func getSquare() -> String {
    let square1: Int = Int(floor(Double(Int(floor(longitude + 180)) % 20) / 2))
    let square2: Int = Int(floor(latitude + 90)) % 10
    var square: String = ""
    square += String(square1)
    square += String(square2)
    return square
    }

    func getSubSquare() -> String {
    let subSquare1: Int = myFloor((longitude - Double(myFloor(longitude / 2) * 2)) * 60 / 5)
    let subSquare2: Int = Int(floor((latitude - floor(latitude)) * 60 / 2.5))
    var subSquare: String = ""
    subSquare.append(index2Char[subSquare1])
    subSquare.append(index2Char[subSquare2])
    return subSquare
    }

    func getGrid() -> String {
    var gridPos: String = getField()
    gridPos += getSquare()
    gridPos += getSubSquare().lowercased()
    return gridPos
    }

}
