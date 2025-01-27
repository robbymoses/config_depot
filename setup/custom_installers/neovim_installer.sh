# Download Latest Neovim Release
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o /tmp/nvim-linux64.tar.gz

# Remove existing Neovim binary
sudo rm -rf /usr/local/bin/nvim-linux64

# Extract to Local User folder
sudo tar -C /usr/local/bin -xzf /tmp/nvim-linux64.tar.gz

# Remove Downloaded tar
rm /tmp/nvim-linux64.tar.gz
