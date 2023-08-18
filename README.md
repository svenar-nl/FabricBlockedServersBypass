# Blocked server bypass for Fabric

## Building
This mod uses Gradle to handle dependencies & building.

#### Requirements
* Java 17 JDK or newer
* Git

#### Compiling from source
```sh
git clone https://github.com/svenar-nl/FabricBlockedServersBypass.git
cd FabricBlockedServersBypass/
```
After that run
```sh
./gradlew build jar
```
or
```sh
./build-all.sh
```

You can find the output jar in the `build/libs` directory (or in the `dist/` directory if using `build-all.sh`).

# Installing
To install and use the mod you need to have following:
* Fabric
* mc-blacklist-bypass-X.X.X-X.X.(X).jar

## License
This mod is licensed under the permissive MIT license. Please see the [`LICENSE`](https://github.com/svenar-nl/FabricBlockedServersBypass/blob/master/LICENSE) file for more info.
