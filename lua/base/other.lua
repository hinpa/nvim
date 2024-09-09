opt.number = true
opt.splitright = true
opt.splitbelow = true
vim.api.nvim_set_option("clipboard", "unnamed")
opt.fixeol = false
opt.scrolloff = 8
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
vim.cmd[[set noshowmatch]]
opt.relativenumber = true


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("v", "ii", "i}")

vim.keymap.set('v','<C-c>', function()
    local sstart = vim.fn.getpos("v")[2]
    local send = vim.fn.getpos(".")[2]
    if sstart > send then
        local tmp = sstart
        sstart = send
        send = tmp
    end
    local command = sstart .. ',' .. send .. 's/^./\\/\\//'
    vim.cmd(command)
    vim.cmd("nohlsearch")
end)

vim.keymap.set('n','<C-c>', function()
    local pos = vim.fn.getpos(".")[2]
    local command = pos .. 's/^./\\/\\//'
    vim.cmd(command)
    vim.cmd("nohlsearch")
end)


vim.keymap.set('v','<leader>ca', function()
    local replaced_token = vim.fn.input("Replaced token > ")
    local replace_token = vim.fn.input("New token > ")
    local sstart = vim.fn.getpos("v")[2]
    local send = vim.fn.getpos(".")[2]
    if sstart > send then
        local tmp = sstart
        sstart = send
        send = tmp
    end
    local command = sstart .. ',' .. send .. 's/\\<' .. replaced_token .. '\\>/' .. replace_token .. '/g'
    vim.cmd(command)
    vim.cmd("nohlsearch")
end)

vim.keymap.set('n','<leader>ca', function()
    local replaced_token = vim.fn.input("Replaced token > ")
    local replace_token = vim.fn.input("New token > ")
    local command = '%s/\\<' .. replaced_token .. '\\>/' .. replace_token .. '/g'
    vim.cmd(command)
    vim.cmd("nohlsearch")
end)


vim.keymap.set('n','<leader>cl', function()
    local replaced_token = vim.fn.input("Replaced token > ")
    local replace_token = vim.fn.input("New token > ")
    local command = 's/\\<' .. replaced_token .. '\\>/' .. replace_token .. '/g'
    vim.cmd(command)
    vim.cmd("nohlsearch")
end)
