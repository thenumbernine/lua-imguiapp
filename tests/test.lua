#!/usr/bin/env luajit
local class = require 'ext.class'
local gl = require 'gl'
local ig = require 'imgui'
local ImGuiApp = require 'imguiapp'

local TestApp = class(ImGuiApp)

function TestApp:update(...)
	gl.glClearColor(.4, .8, .8, 1)
	gl.glClear(gl.GL_COLOR_BUFFER_BIT)

	TestApp.super.update(self, ...)
end

local guivars = {checkbox = true}
function TestApp:updateGUI()
	ig.igText('Hello, world!')
	
	ig.luatableCheckbox('checkbox', guivars, 'checkbox')

	if guivars.checkbox then
		ig.igShowDemoWindow(checkbox)
	end
end

local testApp = TestApp()
return testApp:run()
