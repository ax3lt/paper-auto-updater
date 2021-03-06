# name="server.jar"
# version="1.18.1" # Custom static version

read -p "Output name: " name

type="paper" # Supported variables actually: paper, travertine, waterfall, velocity
version=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/ | jq -r .versions[-1]') # Latest version
build=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/versions/$version/ | jq -r .builds[-1]') # Latest build
download=$(eval 'curl -s https://papermc.io/api/v2/projects/$type/versions/$version/builds/$build | jq -r .downloads.application.name') # Download name
file="https://papermc.io/api/v2/projects/$type/versions/$version/builds/$build/downloads/$download" # Complete download string


if [ ! -e latestBuildInstalled ]; then
    touch latestBuildInstalled
    echo "undefined" >> latestBuildInstalled
    echo "undefined" >> latestBuildInstalled
    echo "undefined" >> latestBuildInstalled
fi


if [ $(eval 'sed '1!d' latestBuildInstalled') == $type ] && [ $(eval 'sed '2!d' latestBuildInstalled') == $version ] && [ $(eval 'sed '3!d' latestBuildInstalled') == $build ]; then
    echo "JAR up to date"
else
    # If you want to make the wget silend uncomment the next line and comment the default one
    # wget $file -O $name 2>/dev/null
    wget $file -O $name
    echo $type > latestBuildInstalled
    echo $version >> latestBuildInstalled
    echo $build >> latestBuildInstalled
fi
