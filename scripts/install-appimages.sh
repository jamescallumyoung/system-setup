#! /bin/sh

# Install all the AppImages in the proides appimages.list file
# The .list should include JUST urls

if [ -z "$1" ] ; then
  echo "No list provided..."
  exit 1
fi

LINES=$(./get-lines.sh $1)
echo "Downloading $(echo $LINES | wc -w) AppImages:"
echo "$LINES\n"

TMP_DIR=$(mktemp -d -t installappimage-XXXXXXXXXXXXXX)
echo "Downloading to $TMP_DIR...\n"

# download to TMP_DIR with wget
./get-lines.sh $1 | xargs -I '{}' wget '{}' -P "$TMP_DIR" -q --show-progress

# install all AppImages in TMP_DIR
echo "\nDownloaded:\n$(ls -U $TMP_DIR)\n"

echo "Making all files in $TMP_DIR executable..."
chmod -R +x "$TMP_DIR/"*

echo "Integrating all AppImages."
cd $TMP_DIR
ls -U $TMP_DIR | xargs -I '{}' -n 1 AppImageLauncher '{}'

