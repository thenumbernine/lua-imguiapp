package = "imguiapp"
version = "dev-1"
source = {
	url = "git+https://github.com/thenumbernine/lua-imguiapp.git"
}
description = {
	summary = "Subclass of GLApp that uses ImGui.",
	detailed = "Subclass of GLApp that uses ImGui.",
	homepage = "https://github.com/thenumbernine/lua-imguiapp",
	license = "MIT"
}
dependencies = {
	"lua >= 5.1"
}
build = {
	type = "builtin",
	modules = {
		imguiapp = "imguiapp.lua"
	}
}
