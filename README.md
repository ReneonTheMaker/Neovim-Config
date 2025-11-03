# Configuration for my neovim
## How do I get this running?
1. Make sure nodejs is installed
```bash
sudo pacman -Syu nodejs
```
2. Make sure GOPATH/bin is in your path
Add the following to your bashrc if it isn't
```bash
export PATH=$PATH:$(go env GOPATH)/bin
```
3. Install gopls the golang lsp server
```bash
go install golang.org/x/tools/gopls@latest
```
4. Clone into a folder called nvim in you ~/.config folder.
5. Run the following
```bash
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
go install golang.org/x/tools/gopls@latest
```
6. Good to go!
## What's cool about this?
Nothing in particular. Just the tweaks I make over time. I'd like to take this wherever I go, and improve it over time.
## Can I contribute to this?
Nah probably not. Enjoy or fork it if you like though. Nothing stopping you.
## This is really barebones
Ok. I literally don't give a shit. It's got everything I need.
