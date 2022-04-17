--[[
Made By hello_123991
]]

local module = {}
module.case = function(o)
    return function(data)
        local t = {o,data}
        local mt = {
            __tostring = function(a)
                return "CaseObject"
            end
        }
        setmetatable(t, mt)
        return t
    end
end
module.default = function(data)
    local t = data
    local mt = {
        __tostring = function(a)
            return "DefaultCaseObject"
        end
    }
    setmetatable(t, mt)
    return t
end
function compare_table(t1,t2)
    for i,v in pairs(t1) do
        if t2[i] == nil then
          return false
        end
        if t2[i] ~= v and type(v) ~= 'table' then
          return false
        end
        if type(v) == 'table' then
            if not module.compare(v,t2[i]) then
            return false
          end
        end
      end
      for i,v in pairs(t2) do
        if t1[i] == nil then
          return false
        end
        if t1[i] ~= v and type(v) ~= 'table' then
          return false
        end
        if type(v) == 'table' then
            if not module.compare(v,t1[i]) then
            return false
          end
        end
      end
      return true
end
module.switch = function(o)
    local object = o
    return function(cases)
        local foundcase = false
        local default = nil
        for i,v in pairs(cases) do
            if tostring(v) == 'CaseObject' then
                if type(o) ~= 'table' then
                    if v[1] == o then
                        v[2][1](v[1])
                        foundcase = true
                    end
                elseif type(o) == 'table' then
                    if type(v[1]) == 'table' then
                        if compare_table(o,v[1],false) then
                            v[2][1](v[1])
                            foundcase = true
                        end
                    end
                end
            elseif tostring(v) == "DefaultCaseObject" then
                default = v[1]
            end
        end
        if not foundcase then
            if default then
                default(o)
            end
        end
    end
end
module.init = function()
    if _VERSION == "Luau" then
        local env
        (function()
            env = getfenv(3)
        end)()
        env.switch = module.switch
        env.case = module.case
        env.default = module.default
    else
        if getfenv then
            local env = getfenv(2)
            env.switch = module.switch
            env.case = module.case
            env.default = module.default
        end
    end
end

return module
