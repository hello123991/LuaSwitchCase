# Lua Switch Case
C's switch case functions in lua.


# Usage
There are two ways to import the functions. I don't know why I did this. I was bored.

#1(Needs getfenv()):
```lua
require("SwitchCase").init()
```
#2:
```lua
local SwitchCase = require("SwitchCase")
local switch, case, default = SwitchCase.switch, SwitchCase.case, SwitchCase.default
```
The first way might not work in some ways because I was just testing something and it happened to work. If you use #1, it is suggested that you write this to silence any errors:
```lua
switch, case, default = nil, nil, nil -- **NOT LOCAL**
```

Here is an example of using this:

(Normal Lua):
```lua
switch, case, default = nil, nil, nil
require("SwitchCase").init()
local value = 10
switch (value) {
	case (1) {
		function()
			print("The value is 1")
		end
	},
	case (10) {
		function(val) -- first argument is the value
			print("The value is "..val) 
		end
	},
	default {
		function(val)
			print("Unknown Value("..val..")")
		end
	}
}
```
(Luau):
```lua
switch, case, default = nil, nil, nil
require(game.ReplicatedStorage.SwitchCase).init()
local value = 10
switch (value) {
	case (1) {
		function()
			print("The value is 1")
		end
	},
	case (10) {
		function(val)
			print("The value is "..val) 
		end
	},
	default {
		function(val)
			print("Unknown Value("..val..")")
		end
	}
}
```
This is a very simple module that was coded in like 30 minutes so there might be some bugs.
