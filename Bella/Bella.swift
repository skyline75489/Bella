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

public struct MarkdownExtension : OptionSet {

    public let rawValue: UInt

    public static let noIntraEmphasis = MarkdownExtension(rawValue: UInt(MKDEXT_NO_INTRA_EMPHASIS.rawValue))
    public static let tables          = MarkdownExtension(rawValue: UInt(MKDEXT_TABLES.rawValue))
    public static let fencedCode      = MarkdownExtension(rawValue: UInt(MKDEXT_FENCED_CODE.rawValue))
    public static let autoLink        = MarkdownExtension(rawValue: UInt(MKDEXT_AUTOLINK.rawValue))
    public static let strikeThrough   = MarkdownExtension(rawValue: UInt(MKDEXT_STRIKETHROUGH.rawValue))
    public static let spaceHeaders    = MarkdownExtension(rawValue: UInt(MKDEXT_SPACE_HEADERS.rawValue))
    public static let superScript     = MarkdownExtension(rawValue: UInt(MKDEXT_SUPERSCRIPT.rawValue))
    public static let laxSpacing      = MarkdownExtension(rawValue: UInt(MKDEXT_LAX_SPACING.rawValue))
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

}


public func render(_ s:String, with ext:MarkdownExtension = .init(rawValue: 0)) -> String? {
    let ib = bufnew(READ_UNIT)
    let ob = bufnew(OUTPUT_UNIT)
    
    let callbacks = UnsafeMutablePointer<sd_callbacks>.allocate(capacity: 1)
    let options = UnsafeMutablePointer<html_renderopt>.allocate(capacity: 1)

    options.pointee.flags = UInt32(ext.rawValue)

    string_to_buf(ib, s)
    
    sdhtml_renderer(callbacks, options, 0)
    
    let markdown = sd_markdown_new(0, 16, callbacks, options)
    sd_markdown_render(ob, ib?.pointee.data, (ib?.pointee.size)!, markdown)
    sd_markdown_free(markdown)
    
    let o = buf_to_string(ob)
    defer {
        bufrelease(ib)
        bufrelease(ob)
    }
    if let result = o {
        return String(utf8String: result)
    }
    return nil;
}
