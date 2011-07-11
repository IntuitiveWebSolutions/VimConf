" Simple Commenter
"   Support most file type.
"   Depends on 'commentstring' option
"
"   Author: Cornelius 林佑安 <cornelius.howl@gmail.com>
"   Date:   四  3/ 4 14:39:34 2010
"   Github: http://github.com/c9s
"   Script Name: simplecommenter
"   Script Type: plugin
if exists('loaded_scommenter') && ! exists('force_reload')
  finish
endif
if exists('force_reload')
  redraw
  echo "Force Reloading : SimpleCommenter"
endif
let loaded_scommenter = 1

fun! s:def(name,value)
  if ! exists(a:name)
    let {a:name} = a:value
  endif
endf


fun! s:select(a,e)
  if g:scomment_reselect && a:a != a:e
    normal gv
  endif
endf

fun! s:ensureOnelineBlock(pattern,a,e)
  let succ = 1
  for i in range(a:a,a:e)
    if getline(i) !~ a:pattern
      let succ = 0
    endif
  endfor
  return succ
endf


fun! s:trimCommentLines(pattern,a,e)
  for i in range(a:a,a:e)
    let line = substitute(getline(i),a:pattern,'','')
    cal setline(i,line)
  endfor
endf

fun! s:getCommentMarks()
  " try to find comment mark pair in &comments.
  let oneline_mark = ''
  let mark1 = ''
  let mark2 = ''

  let cs = split(&comments,',')
  for c in cs 
    " oneline comment
    if c =~ '^s1:'
      let mark1 = strpart(c,3)
    elseif c =~ '^ex:'
      let mark2 = strpart(c,3)
    elseif c =~ '^:'
      let oneline_mark = strpart(c,1) . ' '
    endif
  endfor

  " some small patch
  let ft = &filetype
  if !g:scomment_prefer_commentstring && strlen(oneline_mark) == 0 
    if ft == 'vim'
      let oneline_mark = '" '
    elseif ft = 'php'
      let oneline_mark = '// '
    endif
  endif
  if strlen(mark1) == 0 && strlen(mark2) == 0
    if ft == 'python'
      let [ mark1 , mark2 ] = [ '"""' ,'"""' ]
    elseif ft == 'perl'
      let [ mark1 , mark2 ] = [ '=pod' ,'=cut' ]
    elseif ft == 'php'
      let [ mark1 , mark2 ] = [ '/*' , '*/' ]
    endif
  endif
  return [ mark1 , mark2 , oneline_mark ]
endf

fun! s:doComment(force_oneline,a,e)
  " case:
  "     oneline comment mark only. (from comments 
  "             or commentstring)
  " case: 
  "     comment mark pair found and oneline comment markonly
  "
  " case:
  "     comment mark pair found only.
  let cs = &commentstring
  let css = split( cs , '%s' )
  let mark1 = ''
  let mark2 = ''

  let [m1,m2,s1] = s:getCommentMarks()

  let onlyoneline = strlen(m1)==0 && strlen(m2)==0 
        \ && (strlen(s1)>0 || len(css)==1)

  let onlyblock   = strlen(m1)>0 && strlen(m2)>0
        \ && (strlen(s1)==0 || len(css)==2)

  if a:force_oneline || onlyoneline
    let mark = ''
    if len(css) == 2 && strlen(s1) > 0
      let mark = s1
    elseif len(css) == 1
      let mark = strlen(s1) > 0 ? s1 : css[0]
      let mark = g:scomment_prefer_commentstring ? css[0] : mark
    endif
    if strlen(mark) > 0
      for i in range(a:a,a:e)
        cal setline(i, mark . g:oneline_comment_padding . getline(i) )
      endfor
      cal s:select(a:a,a:e)
      return
    endif
  endif

  if (len(css) == 2 && g:scomment_prefer_commentstring)
    let mark1 = css[0]
    let mark2 = css[1]
  else
    let mark1 = m1
    let mark2 = m2
  endif

  " has comment start mark and end mark
  let sep = a:a == a:e ? g:block_comment_padding : ""

  cal setline(a:a,  mark1 . sep . getline(a:a)  )
  cal setline(a:e, getline(a:e) . sep . mark2 )
  "cal s:select(a:a,a:e)
endf



fun! s:_unComment(m1,m2,a,e)

  let mark1 = s:escape_cm( a:m1 )
  let mark2 = s:escape_cm( a:m2 )

  let line1 = getline(a:a)
  let line2 = getline(a:e)

  " check if text is mark as begin comment mark and end comment mark
  if strlen(matchstr( line1 ,'^\s*' . mark1)) > 0
        \ && strlen(matchstr( line2 , mark2 .'\s*$')) > 0

    let sep = a:a == a:e ? g:block_comment_padding : ""

    " unComment
    let line1 = getline(a:a)
    let line = substitute(line1,'^\s*'. mark1 . sep ,'','')
    cal setline(a:a,line)

    let line2 = getline(a:e)
    let line = substitute( line2, sep . mark2.'\s*$','','')
    cal setline(a:e,line)
    return 1
  endif
  return 0
endf

fun! s:unComment(a,e)
  let cs = &commentstring
  let css = split( cs , '%s' )
  let mark1 = ''
  let mark2 = ''

  let [m1,m2,s1] = s:getCommentMarks()
  let onlyoneline = strlen(m1)==0 && strlen(m2)==0 
        \ && (strlen(s1) || len(css)==1)


  if len(css) == 2
    let succ =  s:_unComment(css[0],css[1],a:a,a:e)
    if succ 
      cal s:select(a:a,a:e)
      return
    endif
  endif

  if strlen(m1) > 0 && strlen(m2) > 0
    let succ =  s:_unComment(m1,m2,a:a,a:e)
    if succ 
      cal s:select(a:a,a:e)
      return
    endif
  endif

  if g:scomment_prefer_commentstring && len(css) == 1
    " single comment mark
    let succ = s:ensureOnelineBlock( '^\s*' . s:escape_cm(css[0]) . g:oneline_comment_padding,a:a,a:e)
    if succ
      cal s:trimCommentLines( '^\s*' . s:escape_cm(css[0]) . g:oneline_comment_padding , a:a , a:e )
      cal s:select(a:a,a:e)
      return
    endif
  endif

  " pair comment mark not found , try to uncomment oneline mark
  if strlen(s1) > 0
    let succ = s:ensureOnelineBlock( '^\s*'. s:escape_cm(s1) . g:oneline_comment_padding ,a:a,a:e)
    if succ 
      cal s:trimCommentLines( '^\s*' . s:escape_cm(s1) . g:oneline_comment_padding , a:a , a:e )
      cal s:select(a:a,a:e)
      return
    endif
  endif

  if len(css) == 1
    " single comment mark
    let succ = s:ensureOnelineBlock( '^\s*' . s:escape_cm(css[0]) . g:oneline_comment_padding,a:a,a:e)
    if succ
      cal s:trimCommentLines( '^\s*' . s:escape_cm(css[0]) . g:oneline_comment_padding , a:a , a:e )
      cal s:select(a:a,a:e)
      return
    endif
  endif
endf


fun! s:escape_cm(mark)
  return escape( a:mark , '.*/!"' )
endf

" should also support comment toggle.
fun! s:onelineComment(a,e)
  " force oneline comment
  let css = split(&commentstring,'%s')
  let [m1,m2,s1] = s:getCommentMarks()

  if getline(a:a) =~ '^\s*' . s:escape_cm(css[0])
        \ || strlen(s1) > 0 && getline(a:a) =~ '^\s*' . s:escape_cm(s1)
        \ || strlen(m1) > 0 && getline(a:a) =~ '^\s*' . s:escape_cm(m1)
    cal s:unComment(a:a,a:e)
  else
    cal s:doComment(1,a:a,a:e)
  endif
  cal s:select(a:a,a:e)
endf



cal s:def('g:oneline_comment_padding',' ')
cal s:def('g:block_comment_padding', ' ')

cal s:def('g:scomment_prefer_commentstring', 1)
cal s:def('g:scomment_reselect',1)
cal s:def('g:scomment_default_mapping',1)


fun! s:init_python()
  let g:scomment_prefer_commentstring = 1
  setlocal comments+=s1:\"\"\",ex:\"\"\"
endf

fun! s:init_perl()
  setlocal comments=s1:=pod,ex:=cut,:#
endf

aug CommentFix
  au!
  au filetype python :cal s:init_python()
  au filetype perl   :cal s:init_perl() 
aug END

com!        CommentReselectEnable    :let g:scomment_reselect = 1 | echo "Comment reselecting On"
com!        CommentReselectDisable   :let g:scomment_reselect = 0 | echo "Comment reselecting Off"

com! -range DoComment :cal s:doComment(0,<line1>,<line2>)
com! -range UnComment :cal s:unComment(<line1>,<line2>)
com! -range OneLineComment :cal s:onelineComment(<line1>,<line2>)

map <silent> <Plug>(do-comment)  :DoComment<CR>
map <silent> <Plug>(un-comment)  :UnComment<CR>
map <silent> <Plug>(one-line-comment) :OneLineComment<CR>

if g:scomment_default_mapping
  map <silent>   ,c    <Plug>(do-comment)
  map <silent>   ,C    <Plug>(un-comment)
  map <silent>   ,,    <Plug>(one-line-comment)
endif
