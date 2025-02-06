vim.keymap.set(
  "n",
  "<C-u>",
  function()
    vim.fn.VSCodeNotify("cursorMove", {
      to = "up",
      by = "wrappedLine",
      value = 20,
    })
  end
)

vim.keymap.set(
  "n",
  "<C-d>",
  function()
    vim.fn.VSCodeNotify("cursorMove", {
      to = "down",
      by = "wrappedLine",
      value = 20,
    })
  end
)
