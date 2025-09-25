-- Toggle dedicated AI CLI terminal on the right
vim.keymap.set("n", "<leader>aa", function()
  local cli_program = "crush"
  local terminal_name = "AI CLI"
  local terminal_buf = nil
  local terminal_win = nil

  -- Find our dedicated terminal buffer by name
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:match(terminal_name) then
        terminal_buf = buf
        break
      end
    end
  end

  -- Find window containing our dedicated terminal
  if terminal_buf then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        terminal_win = win
        break
      end
    end
  end

  if terminal_win then
    -- Close our dedicated terminal window
    vim.api.nvim_win_close(terminal_win, false)
  else
    -- Create or show our dedicated terminal
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
    vim.cmd("vertical resize 80")

    if terminal_buf then
      -- Use existing dedicated terminal buffer
      vim.api.nvim_win_set_buf(0, terminal_buf)
    else
      -- Create new terminal
      vim.cmd("terminal")
      -- Set buffer name to identify it
      vim.api.nvim_buf_set_name(0, terminal_name)
      -- Start CLI agent command
      vim.api.nvim_feedkeys(cli_program .. "\n", "i", false)
    end
    vim.cmd("startinsert")
  end
end, { desc = "Toggle AI CLI terminal sidebar" })

-- Send current buffer path to AI CLI terminal
vim.keymap.set("n", "<leader>ac", function()
  local terminal_name = "AI CLI"
  local terminal_buf = nil
  local terminal_win = nil

  -- Find our dedicated terminal buffer by name
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:match(terminal_name) then
        terminal_buf = buf
        break
      end
    end
  end

  -- Find window containing our dedicated terminal
  if terminal_buf then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        terminal_win = win
        break
      end
    end
  end

  if terminal_buf then
    -- Get current buffer path and make it relative (without leading slash)
    local current_file = vim.api.nvim_buf_get_name(0)
    local relative_path = vim.fn.fnamemodify(current_file, ":.")

    -- Send the relative path directly to the terminal using chansend
    vim.api.nvim_chan_send(vim.bo[terminal_buf].channel, relative_path .. "\n")

    -- If terminal window is visible, switch to it briefly to show the input
    if terminal_win then
      local current_win = vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(terminal_win)
      vim.schedule(function()
        vim.api.nvim_set_current_win(current_win)
      end)
    end
  else
    print("AI CLI terminal not found. Use <leader>aa to create it first.")
  end
end, { desc = "Send buffer path to AI CLI" })

-- Send visual selection to AI CLI terminal wrapped in triple backticks
vim.keymap.set("v", "<leader>ac", function()
  local terminal_name = "AI CLI"
  local terminal_buf = nil
  local terminal_win = nil

  -- Find our dedicated terminal buffer by name
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:match(terminal_name) then
        terminal_buf = buf
        break
      end
    end
  end

  -- Find window containing our dedicated terminal
  if terminal_buf then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        terminal_win = win
        break
      end
    end
  end

  if terminal_buf then
    -- Yank visual selection to t register
    vim.cmd('normal! "ty')
    local selected_text = vim.fn.getreg("t")

    -- Remove trailing newline from selected text
    selected_text = selected_text:gsub("\n+$", "")

    -- Get relative file path
    local current_file = vim.api.nvim_buf_get_name(0)
    local relative_path = vim.fn.fnamemodify(current_file, ":.")

    -- Wrap with triple backticks and include file path
    local wrapped_text = "File: " .. relative_path .. "\n" .. "```\n" .. selected_text .. "\n```"

    -- Send the wrapped text to terminal using chansend
    vim.api.nvim_chan_send(vim.bo[terminal_buf].channel, wrapped_text .. "\n")

    -- If terminal window is visible, switch to it briefly to show the input
    if terminal_win then
      local current_win = vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(terminal_win)
      vim.schedule(function()
        vim.api.nvim_set_current_win(current_win)
      end)
    end
  else
    print("AI CLI terminal not found. Use <leader>aa to create it first.")
  end
end, { desc = "Send visual selection to AI CLI" })
