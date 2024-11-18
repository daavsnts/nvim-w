return {
  {
    "junegunn/fzf.vim",
    dependencies = {
      {
        "junegunn/fzf",
        dir = "~/.fzf",
        build = "./install --all"
      }
    },
    config = function()
      vim.keymap.set("n", "<leader>ag", ":call fzf#run(fzf#wrap({'options': ['--preview', 'bat -n --color=always {}']})) <CR>")
      vim.keymap.set("n", "<leader>rg", ":Rg <CR>")
    end
  }
}
