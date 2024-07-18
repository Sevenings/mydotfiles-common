local function prompt()
	return ya.input {
		title = "Competition Project Name:",
		position = { "center", w = 50 },
		realtime = false,
		debounce = 0.1,
	}
end

local function entry()
    local project_type = "competition"
	local project_name = prompt()

    if project_name == "" then
        return
    end

    os.execute("new-project.sh "..project_type.." '"..project_name.."'")
end

return { entry = entry }
