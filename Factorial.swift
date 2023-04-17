// Factorial.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-04-13
//  Version 1.1
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Finds the factorial of a number

import Foundation

// Define a function to find the factorial of a number
func factorial(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    return num * factorial(num - 1)
}

// Define input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputString = try? String(contentsOfFile: inputFilePath) {
    // Separate the input into lines
    let inputLines = inputString.components(separatedBy: .newlines)

    // Calculate factorial for each line and append to answers array
    var answers = [String]()
    for line in inputLines {
        if let num = Int(line) {
            let result = factorial(num)
            let resultString = "The factorial of \(num) is \(result)"
            answers.append(resultString)
        }
    }

    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("Error reading input file.")
}
