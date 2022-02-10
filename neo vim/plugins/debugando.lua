local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
dapui.setup({
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.5, -- Can be float or integer > 1
      },
      { id = "watches", size = 0.2 },
      { id = "stacks", size = 0.15 },
      { id = "breakpoints", size = 0.15 },
    },
    -- width = 40,
    position = "left", -- Can be "left" or "right"
  },
})
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- adjust as needed
  -- command = "/usr/bin/rust-lldb", -- adjust as needed
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
dap.adapters.python = {
  type = "executable",
  command = "/usr/bin/python",
  args = { "-m", "debugpy.adapter" },
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.python = {
  {
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",
    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}
