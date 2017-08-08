function fzf_git_recent_branch -d "Efficient fish keybinding for fzf with git branch"
  eval "git branch --sort=-authordate | __fzfcmd --query (commandline)" | read -z select

  if not test -z $select
    eval "git checkout (builtin string trim --left --chars='* ' '$select')"
  end

  commandline -f repaint
end
