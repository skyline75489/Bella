Bella
=====

A Swift binding for [Sundown](https://github.com/vmg/sundown), a markdown processing library.

## Usage

```swift
import Bella

let options: Extension = [.EXT_FENCED_CODE, .EXT_AUTOLINK]
let r = Bella.render("### Hello你好", ext: options)
```