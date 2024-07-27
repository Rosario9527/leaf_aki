
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# 修改跟目录Cargo.toml members 增加leaf-android
# ios只用静态库(减少.a文件大小)， 修改leaf-ffi/Cargo.toml crate-type 去掉dylib


# make -f MakefileEx.mk apple
# make -f MakefileEx.mk apple-debug
# make -f MakefileEx.mk android
# make -f MakefileEx.mk android-debug
# make -f MakefileEx.mk windows
# make -f MakefileEx.mk windows-debug
# make -f MakefileEx.mk clean



android:
	NDK_HOME=/Users/macc/Library/Android/sdk/ndk/27.0.12077973 ./scripts/build_android.sh

android-debug: 
	NDK_HOME=/Users/macc/Library/Android/sdk/ndk/27.0.12077973 ./scripts/build_android.sh debug

apple:
	./scripts/build_apple_xcframework.sh

apple-debug:
	./scripts/build_apple_xcframework.sh debug

# windows 在windows上才能编译
# 这里编译为exe
windows:
	cargo build -p leaf-cli --target x86_64-pc-windows-msvc --release

windows-debug:
	cargo build -p leaf-cli --target x86_64-pc-windows-msvc

clean:
	rm -rf target