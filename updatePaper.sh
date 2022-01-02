# name = "server.jar"
read -p "Output name: " name

#version="1.18.1" # Custom static version
version=$(eval "curl -s https://papermc.io/api/v2/projects/paper/ | jq -r .versions[-1]") # Latest version
build=$(eval 'curl -s https://papermc.io/api/v2/projects/paper/versions/$version/ | jq -r .builds[-1]') # Latest build
download=$(eval 'curl -s https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build | jq -r .downloads.application.name') # Download name

file="https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build/downloads/$download" # Complete download string

wget $file -O $name
