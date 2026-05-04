# PATH additions

fish_add_path $HOME/.cargo/bin

set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

fish_add_path $HOME/.rbenv/bin
fish_add_path /home/zatch/.opencode/bin
