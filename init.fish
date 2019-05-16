# check and set $HOMEBREW_BIN
if not set -q HOMEBREW_BIN
  set HOMEBREW_BIN /usr/local/bin/brew
end

# initialized brew shell environment if $HOMEBREW_BIN is valid
if type -q $HOMEBREW_BIN; and $HOMEBREW_BIN shellenv > /dev/null 2>&1
  # By default, `brew shellenv` sets $fish_user_paths as a global variable instead of directly
  # setting $PATH. This behavior should be avoided and thus is overriden here, since setting 
  # a global $fish_user_paths will shadow the universal $fish_user_paths, which is supposed 
  # to be set manually by the user by design.
  eval ($HOMEBREW_BIN shellenv | sed 's/fish_user_paths/PATH/g')
  set -gx HOMEBREW_BIN $HOMEBREW_BIN
  set -gx PATH $PATH
else
  echo "Error! 'brew' not found at $HOMEBREW_BIN.
Please make sure Homebrew is installed and \$HOMEBREW_BIN is correctly set!
To install Homebrew, please check https://brew.sh
Note that setting \$HOMEBREW_BIN is optional if the default Homebrew installation path is used."
end
