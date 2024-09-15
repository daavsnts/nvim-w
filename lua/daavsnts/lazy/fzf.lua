return {
  {
    "junegunn/fzf.vim",
    dependencies = {
      { "junegunn/fzf", dir = "C:\\Custom Programs\\fzf", build = "./install --all" }
    },
    config = function()
      vim.keymap.set("n", "<leader>ag", ":Ag <CR>")
      vim.keymap.set("n", "<leader>rg", ":Rg <CR>")
    end
  }
}
