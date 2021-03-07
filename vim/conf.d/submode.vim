" windowを> or <連続で幅変更
if exists('*submode#current')
  call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('bufmove', 'n', '', '>', '<C-w>>')
  call submode#map('bufmove', 'n', '', '<', '<C-w><')
  call submode#map('bufmove', 'n', '', '+', '<C-w>+')
  call submode#map('bufmove', 'n', '', '-', '<C-w>-')
endif
