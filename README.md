# TODO
- [x] arrow key navigation rolls across lines
- [x] telescope no live preview
- [ ] telescope hidden and git ignore files
    - [ ] telescope shows hidden and git ignore files but ignores node_modules/ and .git/
    - [ ] some system to turn those folders back on to be searched
        -  maybe double ff before 
    - [ ] the gitignore and not gitignore toggle for fuzzy find and grep
- [ ] cntrl right at the start of the last word on a line does not go to the end of the word, instead it goes to the start of the next line
    - this may have been relevant on windows or nvchad but on mac cntrl and alt dont move the cursor around at all
- [ ] telescope.lua cntrl shift f should be grep but there's something else there instead
- [ ] nvterm
- [x] bufferline.nvim
- [ ] copy paste from windows https://lloydrochester.com/post/vim/wsl-neovim-copy-paste/
- [x] copy paste fro mac https://superuser.com/questions/1726375/how-can-i-always-yank-text-to-clipboard
- [ ] surround text with quotes and brackets
- [ ] auto bracket completion
- [ ] tabout
- [ ] markdown auto complete
- [ ] markdown render
- [ ] nvim cheatsheet
- [x] block roll up and down
    - za and zf
- [x] sticky block header
- [ ] open pdfs
- [ ] I abandoned this because NvChad's cheatsheet was so nice but I can't get diagnostics on their custom nvui plugin tabufline so I'll do it on this and use https://github.com/sudormrfbin/cheatsheet.nvim
- [ ] jump to last spot and forward spot with alt arrow
    - cntrl o
- [x] jumping using w and b considers periods to be whole periods not seperators
    - pe.rio.ds, hyp-hens, under_scores, forward/slash, 
- [x] hover diagnostics (leader + d)
- [x] hover code signatures (K)
- [x] migrate over to new nvim 0.11 lsp management
- [!] shift tab indent (won't fix because we use this for tab navigation)
- [ ] when you gd to something with multiple defs you get a window to select which one you want to go to. make that window close on selection
- [ ] need code or lsp hints when inside bracket for func params
- insert-mode hover helper
```lua
-- place inside LspAttach callback
local function show_hover_if_clear()
  if vim.api.nvim_get_mode().mode ~= "i" then return end
  if vim.fn.pumvisible() == 1 then return end
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative ~= "" then return end
  end
  vim.lsp.buf.hover({ focus = false })
end

vim.api.nvim_create_autocmd("CursorHoldI", {
  buffer = ev.buf,
  callback = show_hover_if_clear,
})
```
- [ ] remove text LSP from code or make it lower priority then the regular LSP
- [ ] gd should jump me with the line in the middle of the screen or all/any jumps should make that the middle of the screen
    - unless its already within the viewport?
- [ ] JSON lsp and formatter and linter
