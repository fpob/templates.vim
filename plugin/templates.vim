if exists('b:loaded_templates') && b:loaded_templates
    finish
endif

function s:FindTemplates(filetype)
    let l:templates = {}

    for l:dir in split(&runtimepath, ',')
        for l:file in split(globpath(l:dir . '/templates', '*.' . a:filetype), "\n")
            let l:templates[fnamemodify(l:file, ':t:r')] = l:file
        endfor

        for l:file in split(globpath(l:dir . '/templates/' . a:filetype, '*'), "\n")
            let l:templates[fnamemodify(l:file, ':t:r')] = l:file
        endfor
    endfor

    return l:templates
endfunction

function s:SelectTemplate(templates, ...)
    if a:0 && has_key(a:templates, a:1)
        return a:templates[a:1]
    endif

    let l:names = keys(a:templates)

    if len(l:names) == 1
        return a:templates[l:names[0]]
    endif

    call sort(l:names)

    for l:i in range(len(l:names))
        echo printf('%2d: %s', l:i + 1, l:names[l:i])
    endfor

    let l:sel = input('Template: ')
    if l:sel > 0 && l:sel <= len(l:names)
        return a:templates[l:names[l:sel - 1]]
    endif
    return ''
endfunction

function s:ErrorMsg(message)
    echohl ErrorMsg
    echom a:message
    echohl None
endfunction

function s:Template(bang, ...)
    let l:templates = s:FindTemplates(&filetype)
    if len(l:templates) == 0
        return s:ErrorMsg('Templates not found')
    endif

    if a:0 >= 1
        let l:template = s:SelectTemplate(l:templates, a:1)
    else
        let l:template = s:SelectTemplate(l:templates)
    endif

    if len(l:template)
        if a:bang
            normal! ggdG
        endif

        call append(line('.'), readfile(l:template))
        if getline(line('.')) == ''
            normal! dd
        endif
    endif
endfunction

command -nargs=* -bang Template call <SID>Template(<bang>0, <q-args>)

let b:loaded_templates = 1
