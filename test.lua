#!/usr/bin/env luajit
local class = require 'ext.class'
local ImGuiApp = require 'imguiapp'
local ffi = require 'ffi'
local ig = require 'ffi.imgui'
local gl = require 'ffi.OpenGL'

local TestApp = class(ImGuiApp)

function TestApp:update(...)
	gl.glClearColor(.4, .8, .8, 1)
	gl.glClear(gl.GL_COLOR_BUFFER_BIT)

	TestApp.super.update(self, ...)
end

local checkbox = ffi.new('bool[1]')
function TestApp:updateGUI()
	ig.igText('Hello, world!')
	ig.igCheckbox('checkbox', checkbox)
end

local testApp = TestApp()
testApp:run()
