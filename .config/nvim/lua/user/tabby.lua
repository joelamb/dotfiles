local filename = require('tabby.module.filename')
local colors = require('tabby.module.colors')
local tab = require('tabby.tab')

local hl_head = { fg = colors.black(), bg = colors.red(), style = 'italic' }
-- local hl_tabline = 'TabLineSel'
local hl_tabline_sel = { fg = colors.black(), bg = colors.magenta(), style = 'bold' }
local hl_tabline_fill = 'TabLineFill'

local function cwd()
  return ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
end
local function tab_label(tabid, active)
  local icon = active and '●' or ''
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = tab.get_name(tabid)
  return string.format(' %s %d: %s ', icon, number, name)
end

local function win_label(winid, top)
  local icon = top and '●' or ''
  return string.format(' %s %s ', icon, filename.unique(winid))
end

---@type TabbyTablineOpt
local tabline = {
  hl = hl_tabline_fill,
  layout = 'active_wins_at_tail',
  head = {
    { cwd, hl = hl_head },
    { ' ', hl = hl_tabline_fill },
  },
  active_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, true),
        hl = 'TabLineSel',
      }
    end,
    right_sep = { ' ', hl = hl_tabline_fill },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        tab_label(tabid),
        hl = 'TabLine',
      }
    end,
    right_sep = { ' ', hl = hl_tabline_fill },
  },
  top_win = {
    label = function(winid)
      return {
        win_label(winid, true),
        hl = 'TabLineSel'
      }
    end,
    left_sep = { ' ', hl = hl_tabline_fill },
  },
  win = {
    label = function(winid)
      return {
        win_label(winid),
        hl = 'Tabline',
      }
    end,
    left_sep = { ' ', hl = hl_tabline_fill },
  },
}

require('tabby').setup({
  tabline = tabline,
})
