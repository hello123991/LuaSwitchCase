-- Luau
switch, case, default = nil, nil, nil
require(game.ReplicatedStorage.SwitchCase).init()

local Number1 = 10
local Number2 = 2
local Operation = "*"

local Answer

switch (Operation) {
  case "+" {
    function()
      Answer = Number1 + Number2
    end
  },
  case "-" {
    function()
      Answer = Number1 - Number2
    end
  },
  case "*" {
    function()
      Answer = Number1 * Number2
    end
  },
  case "/" {
    function()
      Answer = Number1 / Number2
    end
  },
  case "%" {
    function()
      Answer = Number1 % Number2
    end
  },
  case "^" {
    function()
      Answer = Number1 ^ Number2
    end
  },
  default {
    function()
      print("Unknown operation")
      Answer = "error"
    end
  }

}

print("The answer is "..Answer)
