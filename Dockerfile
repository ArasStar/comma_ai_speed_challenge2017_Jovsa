#base image Cuda 8 - cudnn 5 - ubuntu 16.04
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

#INSTALLING PYTHON

#set up environment : downloading python and pip with the given versions
RUN 	apt-get update &&\
	apt-get install -y --no-install-recommends ffmpeg &&\
	apt-get install -y build-essential checkinstall  &&\
	apt-get install -y  libreadline-gplv2-dev libncursesw5-dev libssl-dev \
			libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev  &&\
	apt-get install --no-install-recommends --no-install-suggests -q -y curl &&\
	apt-get install -q  unzip &&\
	apt-get install -y -q  wget &&\
	wget -q  https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz &&\
	tar xf Python-3.5.2.tgz &&\
	cd Python-3.5.2/ &&\
	./configure -q --enable-optimizations &&\
	make --quiet &&\
	make --quiet install&&\
	pip3 install --upgrade pip==9.0.1
#	apt-get install -q -y python3-pip
#	 &&\
#	pip3 install -q --upgrade pip==9.0.1

#setting up requirements.txt
COPY requirements.txt .
RUN  pip3 install numpy==1.13.1  &&  pip3 install -r requirements.txt 

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

#DATA directories & CODE  
#copies CODE form local host to container
#COPY  /code /code

#WORKDIR /app
