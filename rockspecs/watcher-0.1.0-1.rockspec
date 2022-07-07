package = "watcher"
version = "0.1.0-1"
source = {
	url = "https://github.com/Matthewhughes3/Watcher/releases/download/0.1.0/watcher-0.1.0-1.tar.gz"
}
description = {
  summary = "Run arbitrary commands when selected files are modified, added, or removed",
}
dependencies = {
  "lua >= 5.1",
  "luv = 1.43.0",
  "argparse = 0.7.1"
}
build = {
  type = "builtin",
  install = {
    bin = {
      watcher = "watcher"
    }
  },
  modules = {},
}
