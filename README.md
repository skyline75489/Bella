Bella
=====

A sample Swift binding for [Sundown](https://github.com/vmg/sundown), a markdown processing library.

## Usage

```swift
import Bella

let options: Extension = [.FencedCode, .AutoLink]
let result = Bella.render("### Hello你好", with: options)
```