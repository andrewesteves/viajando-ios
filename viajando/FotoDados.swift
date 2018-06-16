//
//  FotoDados.swift
//  viajando
//
//  Created by Lab on 02/06/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import Foundation

final class FotoDados {
    static let instancia = FotoDados()
    var fotos: [Foto] = []
    private init() {}
}
