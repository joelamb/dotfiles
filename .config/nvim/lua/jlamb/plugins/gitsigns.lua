return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- navigation
      map("n", "]h", gs.next_hunk)
      map("n", "[h", gs.prev_hunk)

      -- actions
      -- hunks
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hs', gs.stage_hunk)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hr', gs.reset_hunk)

      -- buffers
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hR', gs.reset_buffer)

      -- blame
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>hB', gs.toggle_current_line_blame)
    end,
  },
}
