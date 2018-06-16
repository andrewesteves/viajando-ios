//
//  ViagemDados.swift
//  viajando
//
//  Created by Lab on 19/05/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import Foundation

final class ViagemDados {
    static let instancia = ViagemDados()
    var viagens: [Viagem] = []
    private init() {}
}
