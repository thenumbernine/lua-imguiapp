#!/usr/bin/env luajit
local class = require 'ext.class'
local ImGuiApp = require 'imguiapp'
local ig = require 'ffi.imgui'


local TestApp = class(ImGuiApp)

function TestApp:updateGUI()
	ig.igText('Hello, world!')
end


local testApp = TestApp()
testApp:run()
