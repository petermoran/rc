let g:ale_c_clangformat_executable = 'clang-format-9'
let g:ale_cpp_clangtidy_executable = 'clang-tidy-9'

let b:ale_linters = ['ccls']
let b:ale_fixers = ['clang-format']

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" And they really are spaces, *not* tabs
setlocal expandtab

" Setup for indending
setlocal nosmartindent
setlocal autoindent
setlocal cinoptions=
setlocal cinoptions+=>s  " Normal indent by shiftwidth
"setlocal cinoptions+=N-s " No indent inside namespaces
"setlocal cinoptions+=e+s" modify indent ±0 when /{$/
"setlocal cinoptions+=n0  " modify indent ±0 for braceless control block
"setlocal cinoptions+=f0  " first brace in column 0
"setlocal cinoptions+={0  " modify opening brace indent by ±0
"setlocal cinoptions+=}0  " modify closing brace indent by ±0
"setlocal cinoptions+=^0  " modify indent inside braces by ±0
"setlocal cinoptions+=:0  " case labels are 0 from switch()
"setlocal cinoptions+==0  " modify case statement indent by ±0
"setlocal cinoptions+=l1  " align statements relative to case label
"setlocal cinoptions+=b0  " align break with statements, not case label
setlocal cinoptions+=g0  " scope declarations align with braces
"setlocal cinoptions+=h0  " statements after scope statements are indented <sw>
"setlocal cinoptions+=p0  " K&R parameters are indented <sw>
"setlocal cinoptions+=t0  " return type declarations should not be indented
"setlocal cinoptions+=i-s  " indent C++ base classes and cinits <sw>
"setlocal cinoptions+=+0  " indent continuation lines <sw>
"setlocal cinoptions+=c3  " indent comment lines +3 after comment opener.
"setlocal cinoptions+=C0  " Comments behave correctly
"setlocal cinoptions+=/0  " Indent comments <sw> extra
setlocal cinoptions+=(0  " Indent continuation in unclosed parens
"setlocal cinoptions+=u0  " Same as above, one level deeper, add <sw>
"setlocal cinoptions+=U0  " Ignore (/u if parens is first non-ws char.
"setlocal cinoptions+=w1  " Line up with first unclosed paren.
"setlocal cinoptions+=W-s  " Unclosed paren change.
"setlocal cinoptions+=m0  " Parens line up properly
"setlocal cinoptions+=M0  " Parens line up properly
"setlocal cinoptions+=j1  " Anonymous classes are indented correctly.
"setlocal cinoptions+=)20 " Unclosed parens up to 20 lines away
"setlocal cinoptions+=*30 " Unclosed comments up to 30 lines away

" setlocal cinoptions=N-s,g0,:0,(0,W4,+s,t0,i-s,p0,e-s,+0

" Highlight strings inside C comments
let c_comment_strings=1

" Custom indentation
setlocal indentexpr=CppjmIndent(v:lnum)

function! CppjmIndent(lnum)
    " Initialization
    let l:currLineNum = a:lnum
    let l:prevLineNum = prevnonblank(l:currLineNum - 1)
    let l:currLine = getline(l:currLineNum)
    let l:prevLine = getline(l:prevLineNum)
    " while l:prevLine =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    while l:prevLine =~# '^\s*//'
        let l:prevLineNum = prevnonblank(l:prevLineNum - 1)
        let l:prevLine = getline(l:prevLineNum)
    endwhile
    let l:prevIndent = indent(l:prevLineNum)

    " Indent rules...
    " Follow empty opening brackets with single shift
    if l:prevLine =~# '(\s*$'
        let l:currIndent = l:prevIndent + &shiftwidth
    " Don't indent after single line templates
    elseif l:prevLine =~# '^\s*template\s*<.*>'
        let l:currIndent = l:prevIndent
    " Align multiple line templates on <
    elseif l:prevLine =~# '^\s*template\s*<'
        let l:currIndent = 1 + match(l:prevLine, '<', 8)
    " Use previous indent inside namespaces
    elseif l:prevLine =~# '^\s*namespace.*'
        let l:currIndent = l:prevIndent
    " The opening brace of class/struct should not be indented
    elseif l:prevLine =~# '^\s*\(class\|struct\)'
        let l:currIndent = l:prevIndent
    " Constructor initialization colon on it's own line
    elseif l:currLine =~# '^\s*:\s*$'
        let l:currIndent = l:prevIndent
    " Constructor initialization colon one shiftwidth
    elseif l:currLine =~# '^\s*:' && l:prevLine =~# ')'
        " Find opening brace and use indent from that line)
        " cursor(l:currLineNum, 1)
        " let l:startLineNum = search('(', 'bcnW')
        let l:currIndent = cindent(a:lnum) + &shiftwidth
    " Starting comma (usually constructor initializer)
    elseif l:currLine =~# '^\s*,'
        let l:currIndent = l:prevIndent
    " Decrement shift after the end of a template block
    elseif l:prevLine =~# '^[\t\ a-zA-Z]*>'
        " (first we need to see if the > is part of a template)
        " cursor(l:currLineNum, 1)
        let l:startLineNum = search('<', 'bcnW')
        let l:startLine = getLine(l:startLineNum)
        if match(l:startLine, 'template')
            let l:currIndent = indent(l:startLineNum)
        else
            let l:currIndent = cindent(a:lnum)
        endif
    " In all other cases just use cindent
    else
        let l:currIndent = cindent(a:lnum)
    endif

    return l:currIndent
endfunction

" C++ Filetype Plugin
" Derek Wyatt (derek <at> [my first name][mylastname] <dot> org)
" http://derekwyatt.org

"
" Helper functions for the Indent code below
"
function! IsBlockComment(lnum)
    if getline(a:lnum) =~ '^\s*/\*'
        return 1
    else
        return 0
    endif
endfunction

function! IsBlockEndComment(lnum)
    if getline(a:lnum) =~ '^\s*\*/'
        return 1
    else
        return 0
    endif
endfunction

function! IsLineComment(lnum)
    if getline(a:lnum) =~ '^\s*//'
        return 1
    else
        return 0
    endif
endfunction

function! IsBrace(lnum)
    if getline(a:lnum) =~ '^\s*{'
        return 1
    else
        return 0
    endif
endfunction

function! IsCode(lnum)
    if !IsBrace(a:lnum) && getline(a:lnum) =~ '^\s*\S'
        return 1
    else
        return 0
    endif
endfunction

"
" GetCppIndentNoNamespace()
"
" This little function calculates the indent level for C++ and treats the
" namespace differently than usual - we ignore it.  The indent level is the for
" a given line is the same as it would be were the namespace not event there.
"
function! GetCppIndentNoNamespace(lnum)
    let nsLineNum = search('^\s*\<namespace\>\s\+\S\+', 'bnW')
    if nsLineNum == 0
        return cindent(a:lnum)
    else
        let inBlockComment = 0
        let inLineComment = 0
        let inCode = 0
        for n in range(nsLineNum + 1, a:lnum - 1)
            if IsBlockComment(n)
                let inBlockComment = 1
            elseif IsBlockEndComment(n)
                let inBlockComment = 0
            elseif IsLineComment(n) && inBlockComment == 0
                let inLineComment = 1
            elseif IsCode(n) && inBlockComment == 0
                let inCode = 1
                break
            endif
        endfor
        if inCode == 1
            if IsBrace(a:lnum) && GetCppIndentNoNamespace(a:lnum - 1) == 0
                return 0
            else
                return cindent(a:lnum)
            endif
        elseif inBlockComment
            return cindent(a:lnum)
        elseif inLineComment
            if IsCode(a:lnum)
                return cindent(nsLineNum)
            else
                return cindent(a:lnum)
            endif
        elseif inBlockComment == 0 && inLineComment == 0 && inCode == 0
            return cindent(nsLineNum)
        endif
    endif
endfunction

