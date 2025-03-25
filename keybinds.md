
# 🔥 MY HYPRLAND KEYBINDS

## 🖥️ System Commands
<details>
  <summary><b>Window & System Management</b></summary>

  - **SUPER + ESC** → Kill Active Window
  - **SUPER + DELETE** → Exit Hyprland
  - **SUPER + RETURN** → Toggle Floating Mode
  - **SUPER + P** → Pseudo Tiling Mode

</details>

## 📂 Application Shortcuts
<details>
  <summary><b>Launch Applications</b></summary>

  - **SUPER + B** → Open Browser
  - **SUPER + F** → Open File Manager
  - **SUPER + J** → Toggle Split Mode
  - **SUPER + Q** → Open Terminal
  - **SUPER + A** → Open Xpad (Notes)
  - **SUPER + SPACE** → Open Application Menu

</details>

## 🖼️ Screenshots & Lock
<details>
  <summary><b>Screenshot & Lock</b></summary>

  - **PRINT** → Screenshot Active Window
  - **SUPER + SHIFT + S** → Screenshot Selected Area
  - **SUPER + L** → Lock Screen (Hyprlock)
  - **SUPER + W** → Change Wallpaper
  - **SUPER + F4** → Open Logout Screen

</details>

## 🔄 Window & Focus Management
<details>
  <summary><b>Switch Windows</b></summary>

  - **SUPER + ALT + Left** → Swap Left
  - **SUPER + ALT + Right** → Swap Right
  - **SUPER + ALT + Up** → Swap Up
  - **SUPER + ALT + Down** → Swap Down

</details>

<details>
  <summary><b>Move Focus</b></summary>

  - **SUPER + Left** → Move Focus Left
  - **SUPER + Right** → Move Focus Right
  - **SUPER + Up** → Move Focus Up
  - **SUPER + Down** → Move Focus Down

</details>

## 🖥️ Workspaces
<details>
  <summary><b>Switch & Move Workspaces</b></summary>

  - **SUPER + [1-9]** → Switch to Workspace
  - **SUPER + SHIFT + [1-9]** → Move Active Window to Workspace
  - **SUPER + TAB** → Toggle Special Workspace "magic"
  - **SUPER + SHIFT + Z** → Move Window to Special Workspace
  - **SUPER + Scroll** → Cycle Workspaces

</details>

## 🖱️ Mouse Controls
<details>
  <summary><b>Window Management</b></summary>

  - **SUPER + Left Mouse** → Move Window
  - **SUPER + Right Mouse** → Resize Window

</details>

## 🔊 Media & Brightness
<details>
  <summary><b>Volume Control</b></summary>

  - **XF86AudioRaiseVolume** → Increase Volume (+5%)
  - **XF86AudioLowerVolume** → Decrease Volume (-5%)
  - **XF86AudioMute** → Mute Sound
  - **XF86AudioMicMute** → Mute Microphone

</details>

<details>
  <summary><b>Brightness Control</b></summary>

  - **XF86MonBrightnessUp** → Increase Brightness (+10%)
  - **XF86MonBrightnessDown** → Decrease Brightness (-10%)
  - **SUPER + F2** → Lower Brightness
  - **SUPER + F3** → Raise Brightness

</details>

<details>
  <summary><b>Media Controls (Playerctl)</b></summary>

  - **SUPER + XF86AudioNext** → Next Track
  - **SUPER + XF86AudioPrev** → Previous Track
  - **SUPER + XF86AudioPlay** → Play/Pause
  - **SUPER + XF86AudioPause** → Pause

</details>

# Tmux Keybindings

## General
- **Prefix (Leader):** `Alt + Space`
- **Detach Session:** `<Prefix> d`
- **Kill Session:** `<Prefix> :kill-session`
- **Reload Config:** `<Prefix> r` (Run `tmux source-file ~/.tmux.conf`)

## Panes
- **Split Horizontally:** `<Prefix> -`
- **Split Vertically:** `<Prefix> |`
- **Switch Pane:** `<Prefix> Arrow Keys`
- **Close Pane:** `<Prefix> x`

## Windows & Sessions
- **New Window:** `<Prefix> c`
- **Next Window:** `<Prefix> n`
- **Previous Window:** `<Prefix> p`
- **Move Between Windows:** `<Prefix> w`
- **Rename Window:** `<Prefix> ,`
- **Kill Window:** `<Prefix> &`

## Resizing Panes
- **Resize Up:** `<Prefix> Alt + Up`
- **Resize Down:** `<Prefix> Alt + Down`
- **Resize Left:** `<Prefix> Alt + Left`
- **Resize Right:** `<Prefix> Alt + Right`

## Scrolling & Copy Mode
- **Enter Copy Mode:** `<Prefix> [`
- **Scroll Up:** `Up Arrow`
- **Scroll Down:** `Down Arrow`
- **Copy Selection:** `Enter`
- **Paste:** `<Prefix> ]`

## Sessions
- **List Sessions:** `tmux list-sessions`
- **Attach to Last Session:** `tmux attach-session -t <session-name>`
- **Detach from Session:** `<Prefix> d`
- **Kill Session:** `tmux kill-session -t <session-name>`


# 🚀 MY NEOVIM KEYBINDS

## 📂 File Management
<details>
  <summary><b>Basic File Operations</b></summary>

  - **:w** → Save File
  - **:q** → Quit Neovim
  - **:wq** → Save & Quit
  - **:q!** → Quit Without Saving
  - **:e filename** → Open File
  - **:Ex** → Open File Explorer
  
</details>

## 📜 Navigation
<details>
  <summary><b>Moving Around</b></summary>

  - **h** → Move Left
  - **j** → Move Down
  - **k** → Move Up
  - **l** → Move Right
  - **Ctrl + d** → Scroll Half-Page Down
  - **Ctrl + u** → Scroll Half-Page Up
  - **gg** → Go to Beginning of File
  - **G** → Go to End of File
  - **zz** → Center Cursor on Screen

</details>

<details>
  <summary><b>Search & Replace</b></summary>

  - **/word** → Search for "word"
  - **n** → Next Search Match
  - **N** → Previous Search Match
  - **:%s/old/new/g** → Replace "old" with "new" in entire file

</details>

## 📝 Editing & Inserting
<details>
  <summary><b>Editing Shortcuts</b></summary>

  - **i** → Insert Mode
  - **a** → Append Mode
  - **o** → Open New Line Below
  - **O** → Open New Line Above
  - **x** → Delete Character
  - **dd** → Delete Line
  - **yy** → Copy Line
  - **p** → Paste

</details>

<details>
  <summary><b>Undo & Redo</b></summary>

  - **u** → Undo
  - **Ctrl + r** → Redo

</details>

## 🖥️ Windows & Tabs
<details>
  <summary><b>Split Windows</b></summary>

  - **:vsplit** → Vertical Split
  - **:split** → Horizontal Split
  - **Ctrl + w + h/j/k/l** → Move Between Splits
  - **Ctrl + w + q** → Close Split

</details>

<details>
  <summary><b>Tabs</b></summary>

  - **:tabnew** → Open New Tab
  - **gt** → Next Tab
  - **gT** → Previous Tab
  - **:tabclose** → Close Current Tab

</details>

## 🔥 Plugins & LSP
<details>
  <summary><b>Common Plugin Shortcuts</b></summary>

  - **:PackerSync** → Sync Plugins (Packer)
  - **:Telescope find_files** → Fuzzy Find Files
  - **:Telescope live_grep** → Live Grep Search
  - **:NvimTreeToggle** → File Explorer (NvimTree)
  
</details>

<details>
  <summary><b>LSP & Formatting</b></summary>

  - **gd** → Go to Definition
  - **K** → Show Documentation
  - **gr** → Show References
  - **[d** → Previous Diagnostic
  - **]d** → Next Diagnostic
  - **<leader>f** → Format Code

</details>


# Neo-tree Keybindings

## General
- **Toggle Neo-tree Sidebar:** `<C-b>`
- **Focus/Unfocus Neo-tree:** `<leader>b`

## File Operations
- **Create File/Directory:** `a`
- **Rename File/Directory:** `r`
- **Delete File/Directory:** `d`
- **Move File/Directory:** `m`
- **Copy File/Directory:** `c`
- **Paste File/Directory:** `p`

## Navigation
- **Open File in Split:** `s`
- **Open File in Vertical Split:** `v`
- **Go Up a Directory:** `h`
- **Open Directory or Expand Node:** `l`
- **Refresh Neo-tree:** `R`

# Noice.nvim
- **Open Noice UI:** `<leader>n`
- **Dismiss Noice Messages:** `<leader>c`
- **Show Noice History:** `<leader>nh`

# nvim-dap (Debugging)
- **Toggle Breakpoint:** `<Leader>dt`
- **Start/Continue Debugging:** `<Leader>dc`

# LazyGit
- **Open LazyGit:** `<leader>gg`

# LSP Keybindings
- **Hover Information:** `K`
- **Go to Definition:** `gd`
- **Code Actions:** `<leader>ca`
- **Format Buffer:** `<leader>gf`

# Buffer Navigation
- **Next Buffer:** `<Tab>`
- **Previous Buffer:** `<S-Tab>`
- **Close Current Buffer:** `<leader>x`

# Telescope
- **Find Files:** `<C-p>`
- **Live Grep:** `<C-g>`

# TODO Comments
- **Next TODO Comment:** `]t`
- **Previous TODO Comment:** `[t`
- **Open TODOs with Telescope:** `<C-T>`
- **Open TODOs in Location List:** `T`

# Multi-Cursor (Visual Multi)
- **Find Under (like VS Code multi-cursor):** `<C-d>`
- **Find Subword Under:** `<C-d>`
- **Remove Region (remove one cursor):** `<C-x>`
- **Skip Region (skip current match and move to next):** `<C-n>`
- **Undo Last Selection:** `<C-z>`
- **Redo Last Selection:** `<C-r>`
- **Start Regex Search:** `g/`

# Neovim Keybindings

## Comment.nvim
- **Toggle Comment on Line:** `<leader>gc`
- **Toggle Comment on Selection:** `<leader>gc`

## Noice.nvim
- **Open Noice UI:** `<leader>n`
- **Dismiss Noice Messages:** `<leader>c`
- **Show Noice History:** `<leader>nh`

## nvim-dap (Debugging)
- **Toggle Breakpoint:** `<Leader>dt`
- **Start/Continue Debugging:** `<Leader>dc`

## LazyGit
- **Open LazyGit:** `<leader>gg`

## LSP Keybindings
- **Hover Information:** `K`
- **Go to Definition:** `gd`
- **Code Actions:** `<leader>ca`
