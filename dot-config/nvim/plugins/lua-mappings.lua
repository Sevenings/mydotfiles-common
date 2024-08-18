-- Define a function to run the sss_code command with given line range
local function take_screenshot_visual()
    local output_folder = "~/Imagens/code-prints"
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>'")

    if start_line and end_line then
        -- Get the current buffer name
        local file_name = vim.fn.expand('%')

        local name_only = vim.fn.expand('%:t:r')

        -- Obter a extensão do arquivo atual
        local extension = vim.fn.expand('%:e')

        -- Obter data
        local datetime = os.date("%Y-%m-%d_%H_%M_%S")

        -- Construct the sss_code command
        local command = string.format(
            "sss_code --window-controls --window-title %s --background '#7AA2F7' -e %s -f png -o %s/%s_%s.png ./%s --lines %d..%d",
            file_name, extension, output_folder, name_only, datetime, file_name, start_line, end_line
            )

        -- Execute the command in the terminal
        vim.fn.system(command)
        print("Screenshot taken from line " .. start_line .. " to " .. end_line)
        -- print(command)
    else
        print("Please provide two valid line numbers.")
    end
end

-- Create a user command in Neovim that calls the take_screenshot function
vim.api.nvim_create_user_command(
    'TakeScreenshotVisual',
    take_screenshot_visual,
    { range = true }
)




-- Map the visual mode selection to call the TakeScreenshotVisual command
vim.api.nvim_set_keymap('v', '<Leader>s', ':<C-U>TakeScreenshotVisual<CR>', { noremap = true, silent = true })
