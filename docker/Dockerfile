FROM ubuntu:18.04

ARG DEBIAN_FRONTEND noninteractive
WORKDIR /root/src

# Base tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	git \
	vim \
	curl \
	wget \
	file \
	clang \
	cmake \
	ffmpeg \
	unzip \
	python-dev \
	python3-dev \
	python3-pip \
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
	&& make -j$(nproc) \
	&& cd .. && ./src/slam/download_orb_vocab.sh

RUN pip3 install pyyaml numpy

RUN git clone https://github.com/AaltoML/vio_benchmark \
	&& cd vio_benchmark \
	&& python3 convert/euroc_to_benchmark.py \
	&& rm -rf data/raw \
	&& cd ../HybVIO && mkdir -p data && cd data \
	&& ln -s ../../vio_benchmark/data/benchmark .

COPY --chmod=755 ./docker-entrypoint.sh /root/docker-entrypoint.sh

ENTRYPOINT [ "/root/docker-entrypoint.sh" ]
