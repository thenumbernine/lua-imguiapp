#!/usr/bin/env luajit

-- https://github.com/ocornut/imgui/blob/master/docs/FONTS.md
--  Trying to use custon fonts.  no luck yet I guess.

local class = require 'ext.class'
local ImGuiApp = require 'imguiapp'
local ffi = require 'ffi'
local ig = require 'imgui'
local gl = require 'gl'

local fontFilename = ... or 'font.ttf'

local TestApp = class(ImGuiApp)

function TestApp:initGL(...)
	TestApp.super.initGL(self, ...)

-- [[
	self.fontAtlas = ig.ImFontAtlas_ImFontAtlas()
	self.fontConfig = ig.ImFontConfig_ImFontConfig()
	self.glyphRanges = ig.ImFontAtlas_GetGlyphRangesDefault(self.fontAtlas)

print('fontAtlas', self.fontAtlas)
print('fontConfig', self.fontConfig)
print('glyphRanges', self.glyphRanges)
--]]

	self.font = ig.ImFontAtlas_AddFontFromFileTTF(
		self.fontAtlas,	-- self
		fontFilename,	-- filename
		16,			-- size_pixels
		nil,--self.fontConfig,	-- font_cfg
		nil--self.glyphRanges -- glyph_ranges
	)
print('font', self.font)
	if self.font == nil then error("couldn't load font") end
-- [[
	local built = ig.ImFontAtlas_Build(self.fontAtlas)
	print('font atlas built?', built)
--]]
	local io = ig.igGetIO()
print('io', io)
end

function TestApp:update(...)
	gl.glClearColor(.4, .8, .8, 1)
	gl.glClear(gl.GL_COLOR_BUFFER_BIT)

	TestApp.super.update(self, ...)
end

local checkbox = ffi.new('bool[1]', 1)
function TestApp:updateGUI()
	ig.igBegin('test', nil, 0)
	ig.igPushFont(self.font)
	ig.igText('Hello, world!')
	ig.igCheckbox('checkbox', checkbox)
	ig.igPopFont()
	ig.igEnd()
end

local testApp = TestApp()
return testApp:run()
