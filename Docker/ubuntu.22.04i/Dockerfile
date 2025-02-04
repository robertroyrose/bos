# syntax = docker/dockerfile:experimental

#ARG BASEIMAGE=ubuntu:20.04@sha256:fd92c36d3cb9b1d027c4d2a72c6bf0125da82425fc2ca37c414d4f010180dc19
#ARG BASEIMAGE=ubuntu:24.04
ARG BASEIMAGE=ubuntu:22.04

##############################################################################
# BUILDER
##############################################################################
FROM ${BASEIMAGE} AS builder

ENV TZ=America/Los_Angeles \
    LANG=en_US.UTF-8 \
    DISPLAY=:0

#
# apt packages
#
RUN     set -ex \
    &&  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    &&  apt-get update \
    &&  apt-get install --yes       \
            automake                \
            build-essential         \
            libboost-dev            \
            libboost-system-dev     \
            cmake                   \
            curl                    \
            git                     \
            git-core                \
            gosu                    \
            libcurl4-openssl-dev    \
            libdbus-1-dev           \
            libdbus-c++-dev         \
            libexpat1-dev           \
            libfmt-dev              \
            libglib2.0-dev-bin      \
            libglibmm-2.4-dev       \
            libgtest-dev            \
            liblua5.1-0-dev         \
            liblz4-dev              \
            libmhash-dev            \
            libprotobuf-dev         \
            librrd-dev              \
            libspdlog-dev           \
            libsqlite3-dev          \
            libssl-dev              \
            libsystemd-dev          \
            libtool-bin             \
            libwebsocketpp-dev      \
            ninja-build             \
            nlohmann-json3-dev      \
            pkg-config              \
            procps                  \
            protobuf-compiler       \
            python3                 \
            python3-jinja2          \
            python3-markupsafe      \
            python3-pip             \
            python3-setuptools      \
            rapidjson-dev           \
            socat                   \
            sudo                    \
            unzip                   \
            vim                     \
            wget                    \
    &&  apt-get clean               \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
