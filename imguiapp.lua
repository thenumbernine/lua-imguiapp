local class = require 'ext.class'
local GLApp = require 'glapp'
local ig = require 'imgui'
local gl = require 'gl'

local ImGuiApp = class(GLApp)

function ImGuiApp:initGL()
	self.imguiCtx = ig.igCreateContext(nil)
    ig.ImGui_ImplSDL2_InitForOpenGL(self.window, self.context)
    ig.ImGui_ImplOpenGL2_Init()
	ig.igStyleColorsDark(nil)
end

function ImGuiApp:exit()
    ig.ImGui_ImplOpenGL2_Shutdown()
    ig.ImGui_ImplSDL2_Shutdown()
    ig.igDestroyContext(self.imguiCtx)
end

function ImGuiApp:event(event, eventPtr)
	assert(eventPtr, "forgot to pass the eventPtr")
	ig.ImGui_ImplSDL2_ProcessEvent(eventPtr)
end

function ImGuiApp:update()
    ig.ImGui_ImplOpenGL2_NewFrame()
    ig.ImGui_ImplSDL2_NewFrame()
    ig.igNewFrame()

	self:updateGUI()
	
	--glViewport(0, 0, (int)ImGui::GetIO().DisplaySize.x, (int)ImGui::GetIO().DisplaySize.y)
	gl.glViewport(0, 0, self.width, self.height)
	
    ig.igRender()
    ig.ImGui_ImplOpenGL2_RenderDrawData(ig.igGetDrawData())
end

function ImGuiApp:updateGUI()
end

return ImGuiApp
