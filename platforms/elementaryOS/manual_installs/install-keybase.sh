# Install the Keybase app for linux (official build)

echo "Installing Keybase..."

TMP_DIR_RTN=$(pwd)
TMP_DIR_INSTALL_KB=$(mktemp -d -t installfiles-keybase-XXXXXXXXXXXXXX)
cd $TMP_DIR_INSTALL_KB

# The following lines were copied from https://keybase.io/docs/the_app/install_linux
#  (I added the -y flag to apt install)
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb -y
run_keybase

cd $TMP_DIR_RTN

echo "Finished installing Keybase."
