amd64:
	rm -rf ./target/
	./build-x264.sh amd64
	./build-zlib.sh amd64
	./build-ffnvcodec.sh amd64
	./build-ffmpeg.sh amd64
