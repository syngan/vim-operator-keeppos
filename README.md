#operator-keeppos.vim
=====================

[![Build Status](https://travis-ci.org/syngan/vim-operator-keeppos.svg?branch=master)](https://travis-ci.org/syngan/vim-operator-keeppos)

オペレーション実行後に元の位置に戻る．

operator-keeppos.vim is an operator of Vim to keep the cursor position
after applying any operator.

@see `:h operator`
> After applying the operator the cursor is mostly left at the start of the text
> that was operated upon.  For example, "yfe" doesn't move the cursor, but "yFe"
> moves the cursor leftwards to the "e" where the yank started.


@see https://github.com/osyo-manga/vim-precious/issues/6


##Example

```vim
noremap <expr> <Space>q operator#keeppos#map("\<Plug>(precious-quickrun-op)") 
```

