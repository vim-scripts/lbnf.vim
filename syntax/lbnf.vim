" Vim syntax file
" Language: LBNF
" Add this to your vimrc "au bufreadpre,bufnewfile *.cf set ft=lbnf" 
" and put this file in ~/.vim/syntax/
" Author: Peter Berry <pwberry [AT] gmail [DOT] com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match lbnfIntLiteral /[0-9]*/
syn match lbnfIndexedIdent /[A-Z][a-zA-Z0-9_]*/ transparent
syn match lbnfIdent     /[A-Z][a-zA-Z]*/ containedin=lbnfIndexedIdent nextgroup=lbnfIndex
syn match lbnfIndex     /[0-9]*/ contained containedin=lbnfIndexedIdent
syn match lbnfCopula    /::=/
syn match lbnfEnd       /;/
syn match lbnfDot       /\./

syn match lbnfRegexOp /|/
syn match lbnfRegexOp /-/
syn match lbnfRegexOp /*/
syn match lbnfRegexOp /+/
syn match lbnfRegexOp /?/
syn region lbnfRegexOp start=/\[/ end=/]/ contains=lbnfString,lbnfIdent
syn region lbnfRegexOp start=/{/  end=/}/ contains=lbnfString

syn match lbnfRuleHead  /^[A-Z][a-zA-Z0-9_]*\./
syn match lbnfRuleHead  /^_\./
syn match lbnfRuleHead  /^(:)\./
syn match lbnfRuleHead  /^(:\[])\./

syn keyword lbnfKeyword coercions
syn keyword lbnfKeyword rules
syn keyword lbnfKeyword internal
syn keyword lbnfKeyword token
syn keyword lbnfKeyword position
syn keyword lbnfKeyword entrypoints
syn keyword lbnfKeyword separator
syn keyword lbnfKeyword nonempty
syn keyword lbnfKeyword terminator
syn keyword lbnfKeyword coercions
syn keyword lbnfKeyword rules
syn keyword lbnfKeyword layout
syn keyword lbnfKeyword stop
syn keyword lbnfKeyword toplevel

syn keyword lbnfBuiltinRule eps
syn keyword lbnfBuiltinRule digit
syn keyword lbnfBuiltinRule letter
syn keyword lbnfBuiltinRule upper
syn keyword lbnfBuiltinRule lower
syn keyword lbnfBuiltinRule char

syn keyword lbnfBuiltinType Integer
syn keyword lbnfBuiltinType Double
syn keyword lbnfBuiltinType Char
syn keyword lbnfBuiltinType String
syn keyword lbnfBuiltinType Ident

syn region lbnfChar     start=/'/   end=/'/
syn region lbnfString   start=/"/   end=/"/
syn region lbnfComment  start=/--/  end=/$/
syn region lbnfComment  start=/{-/  end=/-}/
syn keyword lbnfTodo TODO FIXME XXX containedin=lbnfComment

let b:current_syntax = "lbnf"

hi link lbnfIntLiteral  Number
hi link lbnfChar        String
hi link lbnfString      String
hi link lbnfCopula      Operator
hi link lbnfDot         Operator
hi link lbnfIdent       Identifier
hi link lbnfComment     Comment
hi link lbnfRuleHead    Statement
hi link lbnfTodo        Todo

hi link lbnfKeyword     Keyword
hi link lbnfEnd         Keyword
hi link lbnfIndex       Keyword

hi link lbnfBuiltinRule Number
hi link lbnfBuiltinType Type
hi link lbnfRegexOp     Operator
