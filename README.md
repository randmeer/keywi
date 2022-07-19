<p align="center">
  <img width="70%" src="assets/banner.png" alt="Banner">
</p>
<p align="center">
  <b>A key remapping utility for macOS.</b>
</p>


## About
MacOS lacks a native utility for simple and fast key remapping.
There is plenty of solutions for this problem, I however decided to create my own.
Unlike similar applications, keywi doesn't need to load kernel extension or utilize Accessibility API.
This makes keywi limited feature-wise, but if you want to simply map one key to another, you're in the right place.


## Features

keywi can:
- Remap keys instantly via command-line
- Preserve mappings after logout or reboot
- Import and export mappings
- Do all this without impacting performance

keywi does NOT require:
- Loading kernel extensions
- Accessibility-API access
- Disabling System Integrity Protection
- Root privileges


## Installation

### App

> _!!! WARNING: The app is still in early stages of development. It is stable but lacks functionality_

Download the latest release from the [releases' section](https://github.com/randmeer/keywi/releases)
of this repository.

That's it, just double-click on the downloaded Application to open it.
You might want to move it in your /Applications folder, just to keep everything in one place.

The App is a so-called "Universal Application", meaning the executable inside determines
your processor architecture and chooses the respective binary. This means Keywi runs natively
on both x86 and ARM mac's.

### CLI

First, clone this repository
```
git clone https://github.com/randmeer/keywi
cd keywi
```

Then install using Makefile
```
sudo make install
```


## Usage

### App

[Todo]

### CLI

`./src/keywi [source key] [destination key]` to map

`./src/keywi -clear` to clear mappings

`./src/keywi -get` to see mappings


## Building the app

First, clone this repository
```
git clone https://github.com/randmeer/keywi
cd keywi
```

Then build using Makefile
```
make build
```

## FAQ

* > Help! I accidentally mapped some letter keys and can't type out `keywi -clear` anymore.

  Either copy the command from the usage section and paste it into your terminal, or simply delete 
  `~/Library/LaunchAgents/tv.rande.keywi.plist` using Finder and log out and in again.

* > Why do I need sudo to install keywi-cli?? The main selling point is that it doesn't need sudo!
  
  Well, macOS has no local binary folder in its default PATH, which would be the only binary folder
  make has permission to write in without sudo. I will implement adding a local binary folder to PATH,
  but for now this is the way. `sudo make install` just copies keywi into `/usr/local/bin`.
