" Name:       Greybeard
" Version:    0.1.0
" Maintainer: github.com/montlebalm
" License:    Apache 2
"
" A minimal colorscheme for Vim/Neovim.
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='greybeard'

let s:black           = {"gui": "#333333", "cterm": "0"}
let s:light_gray      = {"gui": "#BBBBBB", "cterm": "3"}
let s:medium_gray     = {"gui": "#777777", "cterm": "1"}
let s:white           = {"gui": "#EEEEEE", "cterm": "15"}
let s:dark_black      = {"gui": "#111111", "cterm": "10"}
let s:lighter_black   = {"gui": "#555555", "cterm": "14"}
let s:yellow          = {"gui": "#F9D972", "cterm": "13"}

let s:background = &background

if &background == "dark"
  let s:fg              = s:white
  let s:bg              = s:dark_black
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:black
  let s:norm            = s:white
  let s:norm_subtle     = s:light_gray
  let s:cursorlinenr    = s:white
else
  let s:fg              = s:black
  let s:bg              = s:white
  let s:bg_subtle       = s:medium_gray
  let s:bg_very_subtle  = s:white
  let s:norm            = s:black
  let s:norm_subtle     = s:medium_gray
  let s:cursorlinenr    = s:black
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "bold")  ? a:style.cterm    : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"fg": s:fg})
hi! Normal ctermbg=NONE guibg=NONE

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:fg, "fg": s:bg })
call s:h("Comment",       {"fg": s:light_gray})

" TSX tags
"   <div />
"    ^^^
call s:h("@tag.tsx",          {"fg": s:fg, "cterm": "bold"})
hi! link @tag.builtin.tsx     @tag.tsx

call s:h("Constant",      {"fg": s:norm_subtle})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

call s:h("Identifier",     {"fg": s:fg})
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:fg})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm})

call s:h("PreProc",       {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

hi! link Type             Special
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:white, "bg": s:black})
call s:h("Todo",          {"fg": s:black, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:black})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:norm})
call s:h("ErrorMsg",      {"fg": s:black})
call s:h("IncSearch",     {"bg": s:norm, "fg": s:bg})
hi! link CurSearch IncSearch
call s:h("Search",        {"bg": s:bg_very_subtle, "fg": s:norm})
call s:h("MoreMsg",       {"fg": s:medium_gray})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:cursorlinenr, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:black})
call s:h("StatusLine",    {"bg": s:bg_very_subtle, "fg": s:black})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:medium_gray})
call s:h("Visual",        {"bg": s:yellow, "fg": s:black})
call s:h("VisualNOS",     {"bg": s:bg_very_subtle})
hi! link WarningMsg       Visual
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:black})
call s:h("DiffDelete",    {"fg": s:medium_gray})
hi! link DiffChange       Visual
call s:h("DiffText",      {"fg": s:black})
call s:h("SignColumn",    {"fg": s:black})
call s:h("WinSeparator",  {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:medium_gray})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:black})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:medium_gray})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:black})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:medium_gray})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:black})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:medium_gray})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:black})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg})
call s:h("PmenuSel",      {"fg": s:bg, "bg": s:norm})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:black, "bg": s:black})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})
call s:h("NormalFloat",   {"fg": s:norm, "bg": s:bg})

call s:h("DiagnosticFloatingInfo", { "fg": s:norm})
hi! link DiagnosticFloatingError    DiagnosticFloatingInfo
hi! link DiagnosticFloatingWarn     DiagnosticFloatingInfo
hi! link DiagnosticFloatingHint     DiagnosticFloatingInfo

call s:h("MatchParen",    {"bg": s:yellow, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" which-key.nvim
call s:h("WhichKey",                {"bg": s:bg, "fg": s:norm})
call s:h("WhichKeyDesc",            {"bg": s:bg, "fg": s:norm})
call s:h("WhichKeySeparator",       {"bg": s:bg, "fg": s:norm})
call s:h("WhichKeyFloat",           {"bg": s:bg})
hi! link WhichKeyGroup WhichKey

" Neomake
hi! link NeomakeWarningSign	SyntasticWarningSign
hi! link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi! link ALEWarningSign	SyntasticWarningSign
hi! link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi! link SignifySignAdd              LineNr
hi! link SignifySignDelete           LineNr
hi! link SignifySignChange           LineNr
hi! link GitGutterAdd                LineNr
hi! link GitGutterDelete             LineNr
hi! link GitGutterChange             LineNr
hi! link GitGutterChangeDelete       LineNr

" Git diff
call s:h("Added", { "bg": s:yellow, "fg": s:black })

" Markdown
call s:h("markdownCode", { "fg": s:bg_subtle })
call s:h("markdownLinkReference", { "fg": s:bg_subtle })
call s:h("markdownJekyllFrontMatter", { "fg": s:bg_subtle })
call s:h("markdownCodeBlock", { "fg": s:norm })
call s:h("markdownCodeDelimiter", { "fg": s:norm })
call s:h("markdownHeadingDelimiter", { "fg": s:fg })
call s:h("markdownRule", { "fg": s:bg_subtle })
call s:h("markdownHeadingRule", { "fg": s:bg_subtle })
call s:h("htmlH1", { "fg": s:fg})
call s:h("htmlH2", { "fg": s:fg})
call s:h("htmlH3", { "fg": s:fg})
call s:h("htmlH4", { "fg": s:fg})
call s:h("htmlH5", { "fg": s:fg})
call s:h("htmlH6", { "fg": s:fg})
call s:h("mkdDelimiter", { "fg": s:fg })
call s:h("markdownId", { "fg": s:medium_gray })
call s:h("markdownBlockquote", { "fg": s:bg_subtle })
call s:h("markdownItalic", { "fg": s:medium_gray})
call s:h("mkdBold", { "fg": s:fg})
call s:h("mkdInlineURL", { "fg": s:fg})
call s:h("mkdListItem", { "fg": s:fg })
call s:h("markdownOrderedListMarker", { "fg": s:fg })
call s:h("mkdLink", { "fg": s:fg})
call s:h("markdownLinkDelimiter", { "fg": s:fg })
call s:h("mkdURL", { "fg": s:norm_subtle})

"
" vim-startify
"

call s:h("StartifyHeader", { "fg": s:norm})

"
" Treesitter
"

" Functions
"   const foo = useMemo(...)
"               ^^^^^^^
"   obj.method()
"       ^^^^^^
hi! link @lsp.type.function.typescriptreact Variable
hi! link @function.method.call.tsx Variable

" Built-in
"   window.addEventListener(...)
"   ^^^^^^
hi! link @variable.builtin.tsx Variable

" Strings
"   foo('bar')
"        ^^^
call s:h("@string.tsx ", { "fg": s:medium_gray})
