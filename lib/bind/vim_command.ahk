#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Vim_Normal"))
:::Vim.State.SetMode("Command") ;(:)
`;::Vim.State.SetMode("Command") ;(;)
#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Command"))
w::Vim.State.SetMode("Command_w")
q::Vim.State.SetMode("Command_q")
h::
  Send, {F1}
  Vim.State.SetMode("Vim_Normal")
Return

#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Command_w"))
Return::
  Send, ^s
  Vim.State.SetMode("Vim_Normal")
Return

q::
  Send, ^s
  Send, !{F4}
  Vim.State.SetMode("Insert")
Return

Space::
  Send, !fa
  Vim.State.SetMode("Insert")
Return

#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Command_q"))
a::
  ; mserik: Close all opened editor tabs.
  Send, ^+w
  Vim.State.SetMode("Vim_Normal")
Return
Return::
  ; mserik: Close active editor tab.
  Send, ^w
  Vim.State.SetMode("Vim_Normal")
Return

#If
