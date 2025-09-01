# Custom Server Access Mod

## A Fabric Mod for Customizing Server Filter Behavior

Minecraft includes a system to filter servers from the multiplayer list based on server-side moderation reports or internal policy decisions.
This mod gives technical users the ability to override this behavior on the client side.

The goal of this mod is to support:
* Offline, archival, or educational use cases
* Players using custom server software
* Client-side experimentation and mod interoperability

This mod does not modify or interfere with authentication, and it does not spoof server status.
It simply disables the automatic filter that blocks certain servers from being shown in the multiplayer list.

## Legal Disclaimer

⚠️ This mod is not affiliated with or endorsed by Mojang or Microsoft.

By using this mod, you acknowledge the potential impact on your multiplayer experience.
Always use mods responsibly and in accordance with the [`Minecraft EULA`](https://www.minecraft.net/en-us/eula) and [`community guidelines`](https://www.minecraft.net/en-us/community-standards).

## Building
This mod uses Gradle to handle dependencies & building.

#### Requirements
* Java 21 JDK or newer
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
* customserveraccess-X.X.X-X.X.(X).jar

## License
This mod is licensed under the permissive MIT license. Please see the [`LICENSE`](https://github.com/svenar-nl/FabricBlockedServersBypass/blob/master/LICENSE) file for more info.
