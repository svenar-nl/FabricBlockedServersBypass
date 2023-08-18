#!/bin/bash

versions=(
    "1.20.1 1.20.1+build.10 0.14.22 0.87.0+1.20.1"
    "1.20 1.20+build.1 0.14.22 0.83.0+1.20"
    "1.19.4 1.19.4+build.2 0.14.22 0.87.0+1.19.4"
    "1.19.3 1.19.3+build.5 0.14.22 0.76.1+1.19.3"
    "1.19.2 1.19.2+build.28 0.14.22 0.76.1+1.19.2"
    "1.19 1.19+build.4 0.14.22 0.58.0+1.19"
    "1.18.2 1.18.2+build.4 0.14.22 0.76.0+1.18.2"
    "1.18.1 1.18.1+build.22 0.14.22 0.46.6+1.18"
    "1.18 1.18+build.1 0.14.22 0.46.6+1.18"
    "1.17.1 1.17.1+build.65 0.14.22 0.46.1+1.17"
    "1.17 1.17+build.13 0.14.22 0.46.1+1.17"
)

echo "Cleaning up..."

./gradlew clean
rm -rf dist
mkdir dist

echo "Building..."
for version_info in "${versions[@]}"; do
    read -r minecraft_version yarn_mappings loader_version fabric_version <<<$version_info

    echo "> $minecraft_version"
    ./gradlew build jar -q \
        -Dorg.gradle.project.minecraft_version="$minecraft_version" \
        -Dorg.gradle.project.yarn_mappings="$yarn_mappings" \
        -Dorg.gradle.project.loader_version="$loader_version" \
        -Dorg.gradle.project.fabric_version="$fabric_version"
    echo "Done"
done

mv build/libs/* dist

echo "Complete!"