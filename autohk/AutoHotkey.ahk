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

;change japanese
^Space::send,{vk19}

; delete
^BackSpace::send,{Delete}

;invalid keys
CapsLock::Return

; reload
#z::
Reload
Sleep,500
MsgBox, reload failed
Return
