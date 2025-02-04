
default:	f.41

all:	f.40 f.41 f.42

f.42:
	docker image build --build-arg BASEIMAGE=fedora:42 --force-rm -t fedora.42 -f Dockerfile .

f.41:
	docker image build --build-arg BASEIMAGE=fedora:41 --force-rm -t fedora.41 -f Dockerfile .

f.40:
	docker image build --build-arg BASEIMAGE=fedora:40 --force-rm -t fedora.40 -f Dockerfile .
