" Vim color scheme
"
" Name:         blackboard.vim
" Maintainer:   Ben Wyrosdick <ben.wyrosdick@gmail.com> 
" Last Change:  2 July 2008
" License:      public domain
" Version:      1.1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "blackboard"

if has("gui_running")
  "GUI Colors
  highlight Normal guifg=White   guibg=#0B1022
  highlight Cursor guifg=Black   guibg=Yellow
  highlight CursorLine guibg=#191E2F
  highlight CursorColumn guibg=#191E22
  highlight LineNr guibg=#323232 guifg=#888888
  highlight Folded guifg=White guibg=#0B1022

  highlight ColorColumn guibg=black

  highlight Pmenu guibg=#333333

  "General Colors
  highlight Comment guifg=#AEAEAE
  highlight Constant guifg=#CAFE1E
  highlight Keyword guifg=#FFDE00
  highlight String guifg=#00D42D
  highlight Type guifg=#84A7C1
  highlight Identifier guifg=#00D42D gui=NONE
  highlight Function guifg=#FF5600 gui=NONE
  highlight clear Search
  highlight Search guibg=#1C3B79
  highlight PreProc guifg=Grey

  highlight pythonClassName guifg=#FFBB00
  highlight pythonFuncName guifg=#FF88FF
  highlight pythonParens guifg=#FFDE00
  highlight pythonDot guifg=#FF00FF
  highlight pythonBrackets guifg=#4444CC
  highlight pythonFunc guifg=Lightblue
  highlight pythonClass guifg=Lightblue

  "Ruby Colors
  highlight link rubyClass Keyword
  highlight link rubyDefine Keyword
  highlight link rubyConstant Type
  highlight link rubySymbol Constant
  highlight link rubyStringDelimiter rubyString
  highlight link rubyInclude Keyword
  highlight link rubyAttribute Keyword
  highlight link rubyInstanceVariable Normal

  "Rails Colors
  highlight link railsMethod Type
end

