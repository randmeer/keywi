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
- [Todo] Import and export mappings
- [Todo] Do all this without impacting performance

keywi does NOT require:
- Loading kernel extensions
- Accessibility-API access
- Disabling System Integrity Protection
- Root privileges

<hr>
[Todo] : Installation & Usage

`./src/keywi [source key] [destination key]` to map

`./src/keywi -clear` to clear mappings

`./src/keywi -get` to see mappings


<!--

## Installation

First, clone this repository
```
git clone https://github.com/randmeer/keywi
cd keywi
```

Then install using Makefile
```
make install
```

## Usage

-->
