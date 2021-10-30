set -l brew_paths /opt/homebrew/bin /usr/local/bin /usr/bin /bin /opt/homebrew/sbin /usr/local/sbin /usr/sbin /sbin

for brew_path in $brew_paths
  if contains $brew_path $PATH
    continue
  end

  if test -f $brew_path/brew
    set brew_found true
    set PATH $brew_path $PATH
    break
  end
end

if not set -q brew_found
  echo "Please install 'brew' first!"
end
