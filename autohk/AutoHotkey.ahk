#UseHook
#InstallKeybdHook

; keyremap
^j::send,{down}
^k::send,{up}
^h::send,{left}
^l::send,{right}

+^j::send,+{down}
+^k::send,+{up}
+^h::send,+{left}
+^l::send,+{right}

; delete
^g::send,{BS}
^d::send,{Del}



; reload
#z::
Reload
Sleep,500
MsgBox, reload failed
Return
