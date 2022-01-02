# name = "server.jar"
# version="1.18.1" # Custom static version

read -p "Output name: " name

type="paper" # Supported varibles actually: paper, travertine, waterfall, velocity
version=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/ | jq -r .versions[-1]') # Latest version
build=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/versions/$version/ | jq -r .builds[-1]') # Latest build
download=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/versions/$version/builds/$build | jq -r .downloads.application.name') # Download name

file="https://papermc.io/api/v2/projects/$type/versions/$version/builds/$build/downloads/$download" # Complete download string

wget $file -O $name
