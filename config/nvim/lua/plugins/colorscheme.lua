return {
  -- Add Dracula colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Show the '~' characters after the end of buffers
      show_end_of_buffer = true,
      -- Use transparent background
      transparent_bg = true,
      -- Set italic comment
      italic_comment = false,
    },
  },

  -- Configure LazyVim to use Dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
