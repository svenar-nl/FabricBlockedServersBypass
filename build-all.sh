#!/bin/bash

# Directory to store JDKs
JDK_DIR="$(pwd)/jdks"
mkdir -p "$JDK_DIR"

# JDK download URLs
java_versions=(
    "17 https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2+8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"
    "21 https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21+35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz"
)

# Minecraft and Fabric versions to build
versions=(
    "21 1.21 1.21+build.9 0.15.11 0.101.2+1.21"
    "21 1.20.6 1.20.6+build.3 0.15.11 0.100.8+1.20.6"
    "21 1.20.5 1.20.5+build.1 0.15.11 0.97.8+1.20.5"
    "17 1.20.4 1.20.4+build.3 0.15.11 0.97.1+1.20.4"
    "17 1.20.3 1.20.3+build.1 0.15.11 0.91.1+1.20.3"
    "17 1.20.2 1.20.2+build.4 0.15.11 0.91.6+1.20.2"
    "17 1.20.1 1.20.1+build.10 0.15.11 0.92.2+1.20.1"
    "17 1.20 1.20+build.1 0.14.22 0.83.0+1.20"
    "17 1.19.4 1.19.4+build.2 0.14.22 0.87.0+1.19.4"
    "17 1.19.3 1.19.3+build.5 0.14.22 0.76.1+1.19.3"
    "17 1.19.2 1.19.2+build.28 0.14.22 0.76.1+1.19.2"
    "17 1.19 1.19+build.4 0.14.22 0.58.0+1.19"
    "17 1.18.2 1.18.2+build.4 0.14.22 0.76.0+1.18.2"
    "17 1.18.1 1.18.1+build.22 0.14.22 0.46.6+1.18"
    "17 1.18 1.18+build.1 0.14.22 0.46.6+1.18"
    "17 1.17.1 1.17.1+build.65 0.14.22 0.46.1+1.17"
    "17 1.17 1.17+build.13 0.14.22 0.46.1+1.17"
)

download_jdk() {
    local url=$1
    local dest_dir=$2

    echo "Downloading JDK from $url..."
    curl -L "$url" -o "$dest_dir.tar.gz"
    mkdir -p "$dest_dir"
    tar -xzf "$dest_dir.tar.gz" --strip-components=1 -C "$dest_dir"
    rm "$dest_dir.tar.gz"
}

check_and_download_jdk() {
    local java_version=$1

    if [ ! -d "$JDK_DIR/jdk-$java_version" ]; then
        for java_version_info in "${java_versions[@]}"; do
            read -r java_dl_version url <<< "$java_version_info"
            if [ "$java_version" == "$java_dl_version" ]; then
                download_jdk "$url" "$JDK_DIR/jdk-$java_dl_version"
                break
            fi
        done
    fi
}

echo "Cleaning up..."
./gradlew clean
rm -rf dist
mkdir dist

echo "Building..."
for version_info in "${versions[@]}"; do
    read -r java_version minecraft_version yarn_mappings loader_version fabric_version <<< "$version_info"

    check_and_download_jdk "$java_version"
    JAVA_HOME="$JDK_DIR/jdk-$java_version"

    echo "> building for $minecraft_version on java $java_version"

    ./gradlew build jar -q \
        -Dorg.gradle.java.home="$JAVA_HOME" \
        -Dorg.gradle.project.java_version="$java_version" \
        -Dorg.gradle.project.minecraft_version="$minecraft_version" \
        -Dorg.gradle.project.yarn_mappings="$yarn_mappings" \
        -Dorg.gradle.project.loader_version="$loader_version" \
        -Dorg.gradle.project.fabric_version="$fabric_version"

    echo "Done"
done

mv build/libs/* dist
echo "Complete!"
