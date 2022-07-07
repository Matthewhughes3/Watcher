# Watcher
Watch files and run arbitrary commands when they change

## Install with [LuaRocks](https://luarocks.org)
```sh
git clone https://github.com/Matthewhughes3/Watcher.git
cd Watcher
luarocks --local install rockspecs/watcher-0.1.0-1.rockspec
```

## Demo

```sh
watcher
Path to watch: .
Space-separated files to watch: main.c
Command to run on file change: make main
# now 'make main' will be executed whenever main.c is changed
```
or
```sh
watcher -p . -f main.c -c 'make main'
# now 'make main' will be executed whenever main.c is changed
```
