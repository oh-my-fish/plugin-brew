# check and set $HOMEBREW_BIN
if not set -q HOMEBREW_BIN
  set HOMEBREW_BIN /usr/local/bin/brew
end

# export $HOMEBREW_BIN and initialized brew shell environment if $HOMEBREW_BIN is valid
if type -q $HOMEBREW_BIN; and $HOMEBREW_BIN shellenv > /dev/null 2>&1
  set -gx HOMEBREW_BIN $HOMEBREW_BIN
  eval ($HOMEBREW_BIN shellenv)
else
  echo "Error! 'brew' not found at $HOMEBREW_BIN.
Please make sure Homebrew is installed and \$HOMEBREW_BIN is correctly set!
To install Homebrew, please check https://brew.sh
Note that setting \$HOMEBREW_BIN is optional if the default Homebrew installation path is used."
end
