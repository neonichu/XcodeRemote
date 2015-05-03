.PHONY: all pod

all:
	xcodebuild -workspace XcodeRemote.xcworkspace \
		-scheme XcodeRemote build
	xcodebuild -workspace XcodeRemote.xcworkspace \
		-scheme XcodeRemotePhone build

pod:
	pod install --no-repo-update
