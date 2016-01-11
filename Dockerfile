FROM registry.docker.dev.sogou-inc.com:5000/clouddev/bigdatakit:1.0

ENV APPROOT /search/app
WORKDIR $APPROOT
ADD .tmp $APPROOT
