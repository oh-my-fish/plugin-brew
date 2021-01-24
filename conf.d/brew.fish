if type -q brew
  set -l brew_paths /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin

  # Append all existing brew paths to PATH
  set -l existing_brew_paths
  for brew_path in $brew_paths
    if test -d $brew_path
      set PATH $PATH $brew_path
      set existing_brew_paths $existing_brew_paths $brew_path
    end
  end

  # Remove brew paths from tail to head that were not recently added
  set -l number_of_paths_to_ignore (math (count $PATH) - (count $existing_brew_paths))
  for i in (seq (count $PATH))[-1..1]
    if test $i -le $number_of_paths_to_ignore
      if contains $PATH[$i] $brew_paths
        set -e PATH[$i]
      end
    end
  end
else
  echo "Please install 'brew' first!"
end
