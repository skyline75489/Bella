//
//  Bella.swift
//  Bella
//
//  Created by skyline on 15/9/28.
//  Copyright © 2015年 skyline. All rights reserved.
//

import Foundation
import Sundown

let READ_UNIT = 1024
let OUTPUT_UNIT = 128

public struct Extension:OptionSetType {
    public let rawValue: Int

    static let None                  = Extension(rawValue: 0)
    static let EXT_NO_INTRA_EMPHASIS = Extension(rawValue: 1 << 0)
    static let EXT_TABLES            = Extension(rawValue: 1 << 1)
    static let EXT_FENCED_CODE       = Extension(rawValue: 1 << 2)
    static let EXT_AUTOLINK          = Extension(rawValue: 1 << 3)
    static let EXT_STRIKETHROUGH     = Extension(rawValue: 1 << 4)
    static let EXT_SPACE_HEADERS     = Extension(rawValue: 1 << 6)
    static let EXT_SUPERSCRIPT       = Extension(rawValue: 1 << 7)
    static let EXT_LAX_SPACING       = Extension(rawValue: 1 << 8)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}


public func render(s:String, ext:Extension?=nil) -> String {
    let ib = bufnew(READ_UNIT)
    let ob = bufnew(OUTPUT_UNIT)
    
    let callbacks = UnsafeMutablePointer<sd_callbacks>.alloc(0)
    let options = UnsafeMutablePointer<html_renderopt>.alloc(0)

    if let ext = ext {
        options.memory.flags = UInt32(ext.rawValue)
    }
    string_to_buf(ib, s)
    
    sdhtml_renderer(callbacks, options, 0)
    
    let markdown = sd_markdown_new(0, 16, callbacks, options)
    sd_markdown_render(ob, ib.memory.data, ib.memory.size, markdown)
    
    let o = buf_to_string(ob)
    
    defer {
        sd_markdown_free(markdown)
        bufrelease(ib)
        bufrelease(ob)
    }
    return String(CString: o, encoding: NSUTF8StringEncoding)!
}