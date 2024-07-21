package = "imguiapp"
version = "dev-1"
source = {
	url = "git+https://github.com/thenumbernine/lua-imguiapp"
}
description = {
	summary = "Subclass of GLApp that uses ImGui.",
	detailed = "Subclass of GLApp that uses ImGui.",
	homepage = "https://github.com/thenumbernine/lua-imguiapp",
	license = "MIT"
}
dependencies = {
	"lua >= 5.1",
}
build = {
	type = "builtin",
	modules = {
		["imguiapp"] = "imguiapp.lua",
		["imguiapp.tests.console"] = "tests/console.lua",
		["imguiapp.tests.demo"] = "tests/demo.lua",
		["imguiapp.tests.font"] = "tests/font.lua",
		["imguiapp.withorbit"] = "withorbit.lua",
	},
}
