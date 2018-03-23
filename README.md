# templates.vim

Simple Vim plugin to load some predefined file template. For example when I
begin writing new LaTeX document, first thing what is needed to do is write
some prelude, usepackage, etc., which is nearly the same for all documents, so
I always copy template from my `~/Templates` folder. This plugin should
simplify this workflow.

This plugin adds only one command `Template`, without any configuration, which
look into the templates folder, print list of templates (if more than one
template exists) and content of the selected template paste into current
buffer. Templates are filtered by their filetype, see below.

## Templates

Templates are files with some predefined content, nothing more. They must be
placed into your `~/.vim/templates` folder and their name must be
`<name>.<filetype>` or `<filetype>/<name>` (in subfolder).

```
~/.vim/templates
├── html                        # templates for ft=html
│   ├── bootstrap.html
│   └── simple.html
├── make                        # templates for ft=make
│   ├── c.make
│   ├── cpp.make
│   └── tex.make
├── tex                         # templates for ft=tex
│   ├── article.tex
│   ├── beamer.tex
│   ├── book.tex
│   ├── letter.tex
│   └── simple.tex
├── index.php                   # template for ft=php
└── click.python                # template for ft=python
```

## Installation

If you don't have a preferred installation method, one option is to install
[pathogen.vim](https://github.com/tpope/vim-pathogen), and then copy and paste
following commands into terminal:

```
cd ~/.vim/bundle
git clone https://github.com/fpob/templates.vim
```
