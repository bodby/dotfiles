local mkdnflow = require("mkdnflow")
mkdnflow.setup({
  modules = {
    bib = true,
    buffers = true,
    conceal = true,
    cursor = true,
    folds = false,
    foldtext = false,
    links = true,
    lists = true,
    maps = true,
    paths = true,
    tables = true,
    yaml = true,
    cmp = false
  },

  mappings = {
    MkdnEnter = {{ 'n', 'v' }, "<CR>"},
    MkdnTab = false,
    MkdnSTab = false,
    MkdnNextLink = {'n', "<Tab>" },
    MkdnPrevLink = {'n', "<S-Tab>" },
    MkdnNextHeading = {'n', "]]" },
    MkdnPrevHeading = {'n', "[[" },
    MkdnGoBack = {'n', "[n" },
    MkdnGoForward = {'n', "]n" },
    MkdnCreateLink = false,
    MkdnCreateLinkFromClipboard = {{ 'n', 'v' }, "<Leader>mp" },
    MkdnFollowLink = false,
    MkdnDestroyLink = { 'n', "<Leader>md" },
    MkdnTagSpan = { 'v', "<Leader>mt" },
    -- Check this bind out.
    MkdnMoveSource = false,
    MkdnYankAnchorLink = { 'n', "ya#" },
    MkdnYankFileAnchorLink = { 'n', "yf#" },
    MkdnIncreaseHeading = false,
    MkdnDecreaseHeading = false,
    MkdnToggleToDo = {{ 'n', 'v' }, "<Leader>ml" },
    MkdnNewListItem = false,
    MkdnNewListItemBelowInsert = { 'n', 'o' },
    MkdnNewListItemAboveInsert = { 'n', 'O' },
    MkdnExtendList = false,
    MkdnUpdateNumbering = { 'n', "<Leader>mn" },
    MkdnTableNextCell = { 'i', "<Tab>" },
    MkdnTablePrevCell = { 'i', "<S-Tab>" },
    MkdnTableNextRow = false,
    MkdnTablePrevRow = { 'i', "<M-CR>" },
    MkdnTableNewRowBelow = {'n', "<Leader>mr" },
    MkdnTableNewRowAbove = {'n', "<Leader>mR" },
    MkdnTableNewColAfter = {'n', "<Leader>mc" },
    MkdnTableNewColBefore = {'n', "<Leader>mC" },
    MkdnFoldSection = {'n', "<Leader>f" },
    MkdnUnfoldSection = {'n', "<Leader>F" }
  },

  filetypes = { md = true, rmd = true, markdown = true },

  create_dirs = true,

  perspective = {
    priority = "root",
    root_tell = "vault-index.md",
    fallback = "current"
  },

  wrap = false,

  silent = true,

  links = {
    style = "markdown",
    name_is_source = true,
    conceal = true,
    context = 1,

    transform_explicit = function(input)
      input = input:gsub(' ', '-')
      input = input:lower()
      input = os.date("%Y-%m-%d-") .. input

      return(input)
    end,

    transform_implicit = function(input)
      if input:match('%d%d%d%d%-%d%d%-%d%d') then
        return("kasten/" .. input)
      else
        return(input)
      end
    end
  },

  new_file_template = {
    use_template = true,
    placeholders = {
      before = {
        title = "link_title",
        date = "os_date"
      }
    },

    template = [[
    ---
    created: {{date}}
    aliases:
    - {{title}}
    links:
    ---

    # {{title}}
    ]]
  },

  to_do = {
    symbols = { ' ', 'i', 'd' },
    update_parents = true,
    not_started = ' ',
    in_progress = '-',
    complete = 'd'
  },

  tables = {
    trim_whitespace = true,
    format_on_move = true,
    auto_extend_rows = false,
    auto_extend_cols = false,
    style = {
      cell_padding = 1,
      separator_padding = 1,
      outer_pipes = true,
      mimic_alignment = true
    }
  }
})

-- Add backlinks on CTRL-Enter.
vim.keymap.set('n', "<C-CR>", function()
  local file = "[*]" .. '(' .. vim.fn.expand("%") .. ')'

  local fmt_link = string.gsub(file, [[*]], "ALIAS")

  if (mkdnflow.links.getLinkUnderCursor() == nil) then
    return
  end

  mkdnflow.links.followLink()

  vim.api.nvim_feedkeys('G' ..
  vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
  'x', false)

  vim.api.nvim_put({ fmt_link }, 'l', true, true)

end, { silent = true })
