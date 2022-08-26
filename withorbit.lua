local class = require 'ext.class'
local OrbitBehavior = require 'glapp.orbit'
local ImGuiApp = require 'imguiapp'
return class(OrbitBehavior(ImGuiApp))
