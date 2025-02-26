return {
	"mfussenegger/nvim-dap",

	config = function()
		local dap = require("dap")

		local servers = { "java", "kotlin" }

		for _, lang in ipairs(servers) do
			dap.adapters[lang] = {
				type = "server",
				host = "127.0.0.1",
				port = 5005, -- Default JDWP debug port
			}

			dap.configurations[lang] = {
				{
					type = "java",
					request = "attach",
					name = "Debug (Attach)",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}
		end
	end,
}
