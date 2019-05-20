if status is-login
  # check $HOMEBREW_BIN and set $brew
  set -q HOMEBREW_BIN
    and set -l brew $HOMEBREW_BIN
    or set -l brew /usr/local/bin/brew

  # By default, `brew shellenv` sets $fish_user_paths as a global variable instead of directly
  # setting $PATH. This behavior should be avoided and thus is overriden here, since setting 
  # a global $fish_user_paths will shadow the universal $fish_user_paths, which is supposed 
  # to be set manually by users by design.
  if type -q $brew; and set cmd ($brew shellenv | sed 's/fish_user_paths/PATH/g') ^ /dev/null
    # initialized brew shell environment if $brew is valid
    eval $cmd
    set -gx HOMEBREW_BIN $brew
    set -gxp PATH
  else
    echo "Error! 'brew' not found at $brew."
    echo "Please make sure Homebrew is installed and \$HOMEBREW_BIN is correctly set!"
    echo "To install Homebrew, please check https://brew.sh"
    echo "Note that setting \$HOMEBREW_BIN is optional if the default Homebrew installation path is used."
  end >& 2
end
