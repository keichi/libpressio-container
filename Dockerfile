FROM nvidia/cuda:12.9.1-devel-ubuntu24.04 AS builder

RUN apt-get update
RUN apt-get install -y git cmake ninja-build
WORKDIR /work
RUN --mount=type=bind,target=.,rw ./install_sz3.sh
RUN --mount=type=bind,target=.,rw ./install_zfp.sh
RUN --mount=type=bind,target=.,rw ./install_cuszp.sh
RUN --mount=type=bind,target=.,rw ./install_mgard.sh
RUN --mount=type=bind,target=.,rw ./install_libpressio.sh

FROM nvidia/cuda:12.9.1-runtime-ubuntu24.04
RUN apt-get update
RUN apt-get install -y libprotobuf-dev libpython3-dev python3-numpy python3-numcodecs
COPY --from=builder /opt/pressio /opt/pressio
COPY --from=builder /usr/local/lib/python3.12/dist-packages/* /usr/local/lib/python3.12/dist-packages
ENV PATH=/opt/pressio/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/pressio/lib:$LD_LIBRARY_PATH
