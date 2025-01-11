return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('bufferline').setup {
                options = {
                    mode = "tabs", -- set to "tabs" to only show tabpages instead
                    numbers = "none", -- Pode ser "ordinal", "buffer_id", etc.
                    close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
                    indicator = {
                        style = 'underline',
                    },
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                            separator = true
                        }
                    },
                    separator_style = "slant",
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false, -- only applies to coc
                    diagnostics_update_on_event = true, -- use nvim's diagnostic handler
                    color_icons = true, -- whether or not to add the filetype icon highlights
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                    highlight = {underline = true, sp = "blue"}, -- Optional
                    pick = {
                      alphabet = "1234567890",
                    },
                }
            }

            -- Função para alternar para buffers específicos
            local function goto_buffer(num)
              vim.cmd("BufferLineGoToBuffer " .. num)
            end

            -- Mapear Alt+1, Alt+2, ..., Alt+9
            for i = 1, 9 do
              vim.keymap.set("n", "<M-" .. i .. ">", function() goto_buffer(i) end, { desc = "Go to buffer " .. i })
            end
        end
    },
}


