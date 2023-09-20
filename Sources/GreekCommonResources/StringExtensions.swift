//
//  StringExtensions.swift
//
//
//  Created by Barry Brown on 9/19/23.
//

import Foundation

public extension String {
    var withoutDiacritics: String {
        let greekLocale = Locale(identifier: "el_GR")
        let simple = folding(options: [.diacriticInsensitive, .caseInsensitive], locale: greekLocale)
        return simple
    }

    func containsGreek(isArchaic: Bool = false) -> Bool {
        let alphabet = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ", "λ", "μ", "ν", "ξ", "ο", "π", "ρ", "σ", "τ", "υ","φ","χ","ψ","ω"]
        let archaicAlphabet = ["α", "β", "γ", "δ", "ε", "ϝ", "ζ", "η", "θ", "ι", "κ", "λ", "μ", "ν", "ξ", "ο", "π", "ϻ", "ϙ", "ρ", "σ", "τ", "υ","φ","χ","ψ","ω"]
        let selectedAlphabet = isArchaic ? archaicAlphabet : alphabet
        let charset = CharacterSet(charactersIn: selectedAlphabet.joined())
        let isSearchingGreek = self.lowercased().withoutDiacritics.rangeOfCharacter(from: charset) != nil
        return isSearchingGreek
    }

    // Returns 1st character of self as a separate string
    var firstCharacterString: String {
        return String(self.withoutDiacritics.prefix(1))
    }

    // Returns 2nd character of self as a separate string
    var secondCharacterString: String {
        let twoFirst = String(self.withoutDiacritics.prefix(2))
        let sliced = String(twoFirst.dropFirst())
        return sliced
    }
}
