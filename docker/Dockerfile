FROM ubuntu:18.04

ARG DEBIAN_FRONTEND noninteractive
WORKDIR /root/src

# Base tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	git \
	vim \
	curl \
	wget \
	clang \
	cmake \
	ffmpeg \
	python-dev \
	python3-dev \
	libglfw3 \
	libglfw3-dev \
	libgtk-3-dev \
	libglew-dev \
	ca-certificates \
	libc++-dev \
	libgtk2.0-dev \
	libgstreamer1.0-dev \
	libvtk6-dev \
	libavresample-dev \
	build-essential \
	libgoogle-glog-dev \
	libgflags-dev \
	libatlas-base-dev \
	libeigen3-dev \
	libsuitesparse-dev \
	software-properties-common

RUN git clone --recursive https://github.com/SpectacularAI/HybVIO.git \
	&& cd HybVIO/3rdparty/mobile-cv-suite \
	&& CC=clang CXX=clang++ ./scripts/build.sh && cd ../.. \
	&& mkdir target \
	&& cd target \
	&& CC=clang CXX=clang++ cmake -DBUILD_VISUALIZATIONS=ON -DUSE_SLAM=ON .. \
	&& make -j$(nproc)

RUN cd HybVIO && ./src/slam/download_orb_vocab.sh

COPY --chmod=755 ./docker-entrypoint.sh /root/docker-entrypoint.sh

ENTRYPOINT [ "/root/docker-entrypoint.sh" ]
