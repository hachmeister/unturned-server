#!/bin/bash

# Unturned will run as a dedicated server if +InternetServer/ServerId or +LanServer/ServerId are found on the command-line.

# ServerId differentiates multiple servers running from the same installation, and a directory for each server's savedata
# and configuration will be created in the Servers/ServerId directory. Startup commands can be specified in the
# ServerId/Server/Commands.dat file, or on the command-line with -CommandName/Arg0/Arg1/Arg# before +InternetServer/LanServer.

# Running multiple servers simultaneously requires specifying different ports using the Port command. Each server uses two
# consecutive ports. The first is for server list queries, and the second for in-game traffic. Recommended port values are
# 27015 for the first server, 27017 for the second server, 27019 for the third server, so on and so forth.
# These can be set as a line in Commands.dat e.g. "Port 27017" (without quotes) or on the command-line "-Port/27019" (without quotes).

# Note for the server to be visible on the in-game internet server list you will need to set a Game Server Login Token (GSLT):
# https://github.com/SmartlyDressedGames/U3-Docs/blob/master/GameServerLoginTokens.md

# Other common startup commands to use in Commands.dat are:
# Name XYZ - Advertise server as "XYZ", or "Unturned" if left unset.
# Owner SteamId - Allows player to invoke admin commands in chat e.g. "/give 132" to spawn a Dragonfang.
# Password XYZ - Requires password "XYZ" to join server. Note that password is only SHA1 hashed, so don't use the same password anywhere else.
# Perspective Both - Can be set to "First", "Third", "Both", or "Vehicle" to change camera options.
# Cheats - Allows admins to invoke cheat commands like spawning items or vehicles from the chat.

# Useful commands to use from chat or console while server is running are:
# Help XYZ - List all commands, or describe XYZ command.
# Shutdown - Save and cleanly exit server process.

# For more information read the official server hosting documentation here:
# https://github.com/SmartlyDressedGames/U3-Docs/blob/master/ServerHosting.md

# ServerHelper.sh acts as an intermediary for any future required Unity arguments, and to workaround misc Linux issues.
# Custom scripts can pass additional arguments to ServerHelper.sh e.g. "-Port/27017 +InternetServer/My Server" (without quotes).
# By default this script will launch a LAN server and save to the Servers/Example directory.
./ServerHelper.sh +InternetServer/EndzeitServer
