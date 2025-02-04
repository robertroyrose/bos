#

ARG BASEIMAGE=fedora:41

FROM ${BASEIMAGE}

RUN \
	dnf clean all && \
	dnf -y update && \
	dnf install -y \
		ccache \
		clang \
		clang-tools-extra \
		cmake \
		gcc \
		gcc-c++ \
		git \
		patch \
		protobuf-compiler \
		python3 \
		vim

COPY --from=tianon/gosu /gosu /usr/local/bin/

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
