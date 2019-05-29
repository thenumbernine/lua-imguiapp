local class = require 'ext.class'
local GLApp = require 'glapp'
local imgui_sdl = require 'imgui.sdl'
local ig = imgui_sdl.lib
local gl = require 'gl'

local ImGuiApp = class(GLApp)

function ImGuiApp:initGL()
	self.imguiCtx = imgui_sdl.Imgui_Impl_SDL_opengl2()
	self.imguiCtx:Init(self.window, self.context)
	ig.igStyleColorsDark(nil)
end

function ImGuiApp:exit()
	self.imguiCtx:destroy()
end

function ImGuiApp:event(event, eventPtr)
	assert(eventPtr, "forgot to pass the eventPtr")
	ig.ImGui_ImplSDL2_ProcessEvent(eventPtr)
end

function ImGuiApp:update()
	self.imguiCtx:NewFrame()

	self:updateGUI()
	
	--glViewport(0, 0, (int)ImGui::GetIO().DisplaySize.x, (int)ImGui::GetIO().DisplaySize.y)
	gl.glViewport(0, 0, self.width, self.height)
	
	self.imguiCtx:Render()
end

function ImGuiApp:updateGUI()
end

return ImGuiApp
