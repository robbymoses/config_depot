# Download Latest Neovim Release
curl -L https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz -o /tmp/nvim.tar.gz

# Remove existing Neovim binary
sudo rm -rf /usr/local/bin/nvim

# Extract to Local User folder
sudo tar -C /usr/local/bin -xzf /tmp/nvim.tar.gz

# Remove Downloaded tar
rm /tmp/nvim.tar.gz
