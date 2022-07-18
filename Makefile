.PHONY: all build install-cli clean

all:
	@echo "run 'make build' to build the keywi gui application"

# builds the gui application
build:
	make clean

	swiftc -target x86_64-apple-macos12.4 src/app/main.swift -o build/main-amd64
	swiftc -target arm64-apple-macos12.4 src/app/main.swift -o build/main-arm64

	lipo -create build/main-amd64 build/main-arm64 -o build/Keywi
	chmod +x build/Keywi

	mkdir -p build/Keywi.app/Contents/MacOS
	cp build/Keywi build/Keywi.app/Contents/MacOS/Keywi

# installs the cli application
install:
	cp src/cli/keywi /usr/local/bin/keywi

# uninstalls the cli application
uninstall:
	rm /usr/local/bin/keywi

clean:
	rm -rf build/*
