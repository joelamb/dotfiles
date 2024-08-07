return {
  "numToStr/Comment.nvim",
  event = "User FileOpened",
  keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },

  config = function()
    local comment = require("Comment")
    comment.setup()
  end,
}
