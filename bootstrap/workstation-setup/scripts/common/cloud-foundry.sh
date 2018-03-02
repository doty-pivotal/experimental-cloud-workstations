echo
echo "Installing Cloud Foundry Command-line Interface"

wget -q -O /tmp/cf https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.34.1
sudo cp /tmp/cf /usr/local/bin/

wget -q -O /tmp/bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.48-linux-amd64
sudo cp /tmp/bosh /usr/local/bin/

# Punt for now
# brew install bbl
