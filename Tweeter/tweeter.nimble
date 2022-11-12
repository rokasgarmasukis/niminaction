# Package

version       = "0.1.0"
author        = "Rokas Garmasukis"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["tweeter"]
skipExt       = @["nim"]


# Dependencies

requires "nim >= 1.6.8", "jester >= 0.0.1"
