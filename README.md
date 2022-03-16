Subclass of GLApp that uses ImGui.

### Dependencies:

- https://github.com/thenumbernine/lua-ext
- https://github.com/thenumbernine/lua-gl
- https://github.com/thenumbernine/lua-glapp
- https://github.com/thenumbernine/lua-ffi-bindings

For ImGui C bindings:
- https://github.com/cimgui/cimgui

I'm currently using the cimgui v1.87dock API.

Build this with its `backends/imgui_impl_sdl.cpp` and `backends/imgui_impl_opengl2.cpp` added to the project.
Also for Linux, sure to set in the cimgui Makefile: `CXXFLAGS += "-DIMGUI_IMPL_API=extern \"C\""`

For LuaJIT wrappers to those C bindings:
- https://github.com/sonoro1234/LuaJIT-ImGui

This expects the subfolder `lua/imgui` to be in `LUA_PATH`.
I had to comment out a few sections of the imgui luajit API since I didn't build with all components.  Yeah I could've just re-run the binding script but I'm lazy.
I also had to comment out the `struct tm` and `typedef void FILE` parts in `imgui/cdefs.lua` and replace them with `require 'ffi.c.time'` and `require 'ffi.c.stdio'` found in my `lua-ffi-bindings` project.
