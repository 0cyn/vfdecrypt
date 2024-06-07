# `vfdecrypt`

This is a cross platform `.dmg` decryption tool. Maintained by 0cyn, but credit goes to its original owner.


## Prerequisites

On macOS, you will need to `brew install openssl`.

On Linux, you will need to `apt install openssl openssl-dev`.


## Building

To build on Linux, run `make linux`.

To build on macOS, run `make mac`.

On macOS, you can use the environment variable `OPENSSL_DIR` to override the one in the `Makefile`. Currently, it points to OpenSSL 3.3.1, which is what Homebrew installs on macOS Sonoma as of 2024-06-07.

To install, run `sudo make install`.

To clean, run `make clean`.

To uninstall, run `sudo make uninstall`.


## Using

To run, run `vfdecrypt`:

```
Usage: vfdecrypt -i in-file [-p password] [-k key] -o out-file
```

NOTICE: The -i and -o flags are extremely important, as without them, the program will never terminate unless forced to.

NOTICE: ONLY the -k -i and -o flags have been tested.

### Example
Let's say you have a file like `iPhone4,1_9.3.5_13G36_Restore.ipsw` and you want to extract the root file system. First, unzip the file:

```
unzip iPhone4,1_9.3.5_13G36_Restore.ipsw
```

Next, find the decryption keys [on the iPhone wiki](https://www.theiphonewiki.com/wiki/Firmware_Keys#Firmware_Versions). This file is from an iPhone 4S (`iPhone4,1`) running iOS 9.3.5 with the build ID `13G36`. So, following the links, you should arrive at [this page](https://www.theiphonewiki.com/wiki/Genoa_13G36_(iPhone4,1)), which tells us that the root filesystem is in `058-48374-036.dmg` with the key `677d05afbb9a1eaa5f5e353829df15c4a5a6a2f7c2f354dadbff11e4aad7e97bf8f9275d`.

You can now run `vfdecrypt`:

```
vfdecrypt -i iPhone4,1_9.3.5_13G36_Restore/058-48374-036.dmg -k 677d05afbb9a1eaa5f5e353829df15c4a5a6a2f7c2f354dadbff11e4aad7e97bf8f9275d -o decrypted.dmg
```

Finally, you can mount `decrypted.dmg` (or whatever you chose as a filename).
