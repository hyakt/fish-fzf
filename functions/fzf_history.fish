function fzf_history
  history | fzf --layout default | read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
