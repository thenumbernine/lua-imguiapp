Subclass of GLApp that uses ImGui.

### Dependencies:

- https://github.com/thenumbernine/lua-ext
- https://github.com/thenumbernine/lua-gl
- https://github.com/thenumbernine/lua-glapp
- https://github.com/thenumbernine/lua-ffi-bindings

For ImGui C bindings:
- https://github.com/Extrawurst/cimgui

I'm currently using the v1.79 API.

Build this with its `examples/imgui_impl_sdl.cpp` and `examples/imgui_impl_opengl2.cpp` added to the project.
Also for Linux, sure to set in the cimgui Makefile: `CXXFLAGS += "-DIMGUI_IMPL_API=extern \"C\""`

For LuaJIT wrappers to those C bindings:
- https://github.com/sonoro1234/LuaJIT-ImGui

This expects the subfolder `lua/imgui` to be in `LUA_PATH`.
If you run into any API issues, just add a `do return M end` after the Impl tables are defined.
