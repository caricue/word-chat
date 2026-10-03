# WARNING!

DO NOT USE THIS!

THIS IS A WORK IN PROGRESS, DO NOT USE THIS!

The repo is public because it helps me figure out how this would work practically. When this is ready to use, this warning will be removed.

# About

This project is intended to help other solo developers make their multiplayer chats easier to manage. If you disagree with any changes, it is designed to make creating/using your own fork simple.

# What does implementation look like?

### Typing a message:

![Typing a message](https://media.tenor.com/ZuPq1jPOZdwAAAAi/placeholder-placeholder-cube.gif)

### Example of a filtered message:

![Example of a filtered message](https://media.tenor.com/ZuPq1jPOZdwAAAAi/placeholder-placeholder-cube.gif)

# How to download on the client

Before a client joins a game, it must send a HTTP request to https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/version.json to download version.json and store it locally. The file is extremely small and is located in the repository root.

```cpp
// Pseudocode
req = create_http_request()
req.set_download_path("PATH/new_version.txt")
req.request("https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/version.json")
```

# How version.json is used on the client

When version.json is already stored on the system, the old file is compared with the downloaded file to check for any changes.

If changes are present, or version.json was not installed prior, the client must download the new whitelist(s).

- English Whitelist: https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/english/whitelist.json

```cpp
// Pseudocode
old_version = file_to_json("PATH/version.txt")
new_version = file_to_json("PATH/new_version.txt")

if new_version["english-whitelist"] > old_version["english-whitelist"] {
    req = create_http_request()
    req.set_download_path("PATH/english-whitelist.txt")
    req.request("https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/english/whitelist.json")
}
```

Afterwards, the old files must be destroyed and the new file must be renamed.

```cpp
// Pseudocode
old_version = file_to_json("PATH/version.txt")
new_version = file_to_json("PATH/new_version.txt")

delete(old_version)
new_version.set_name("version.txt")
```

# How to download on the server

The idea is the same as the client, however instead of solely downloading the whitelist, you need to download the blacklist as well.

- English Whitelist: https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/english/whitelist.json
- English Blacklist: https://raw.githubusercontent.com/caricue/word-chat/refs/heads/main/english/blacklist.json

# How the client and server communicate

Still working this out, it will send the ID's from the whitelist.json or something like that.

# How the server filters chats

Does the instructinos listed in the english blacklist
