//
//  prompt.swift
//  Copyright (c) 2015 DevelopMentor. All rights reserved.
//

import Foundation

/// Provides access to user input via the Prompt.input() method.
public class Prompt {
    /// Blocks and waits for user input from the command prompt.
    ///
    /// :returns: A string that the user typed in the console (omits the newline)
    public class func input() -> String {
        var keyboard = NSFileHandle.fileHandleWithStandardInput()
        var inputData = keyboard.availableData
        var inputtext = NSString(data: inputData, encoding:NSUTF8StringEncoding)!
        
        return inputtext.stringByTrimmingCharactersInSet(
            NSCharacterSet.newlineCharacterSet())
    }
}