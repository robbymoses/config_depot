# Find Latest Version of Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')

# echo $LAZYGIT_VERSION
# lazygit --version | sed -n 's/.*, version=\([^,]*\),.*/\1/p'

curl -L "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" -o /tmp/lazygit.tar.gz

# Remove existing Lazygit Binary
sudo rm -rf /usr/local/bin/lazygit

# Extract to Local User Bin
sudo tar -C /usr/local/bin -xzf /tmp/lazygit.tar.gz

# Delete the Downloaded tar
rm /tmp/lazygit.tar.gz

