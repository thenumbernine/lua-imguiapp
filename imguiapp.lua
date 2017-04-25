local class = require 'ext.class'
local GLApp = require 'glapp'
local ig = require 'ffi.imgui'
local gl = require 'gl'

local ImGuiApp = class(GLApp)

function ImGuiApp:initGL()
	ig.ImGui_ImplSdl_Init(self.window)
end

function ImGuiApp:exit()
	ig.ImGui_ImplSdl_Shutdown()
end

function ImGuiApp:event(event, eventPtr)
	assert(eventPtr, "forgot to pass the eventPtr")
	ig.ImGui_ImplSdl_ProcessEvent(eventPtr)
end

function ImGuiApp:update()
	ig.ImGui_ImplSdl_NewFrame(self.window)
	
	self:updateGUI()
	
	--glViewport(0, 0, (int)ImGui::GetIO().DisplaySize.x, (int)ImGui::GetIO().DisplaySize.y);
	gl.glViewport(0, 0, self.width, self.height)
	ig.igRender()
end

function ImGuiApp:updateGUI()
end

return ImGuiApp
