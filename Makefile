#!/bin/sh

.PHONY: build
build:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: setup
setup:
	flutter clean
	flutter pub get

.PHONY: commitreset
commitreset:
	git reset --soft HEAD^

# .PHONY: cocoa
# cocoa:
# 	cd ios
# 	rm Podfile.lock
# 	pod install --repo-update
# 	flutter clean

.PHONY: killcache
killcache:
	xcrun --kill-cache
	rm -rf ~/Library/Developer/CoreSimulator/Caches/*
	rm -rf ~/Library/Developer/Xcode/DerivedData/*

# git commit --amend --date="Sun Dec 22 00:00:00 2023 +0900"