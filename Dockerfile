# Image Args
ARG UBUNTU_VER
ARG CUDA_VER

FROM ghcr.io/walkerlab/docker-data-science-essentials-cuda:ubuntu${UBUNTU_VER}-cuda${CUDA_VER}
ARG TORCH_VER
ARG TORCHVISION_VER
ARG TORCHAUDIO_VER
ARG PYTORCH_EXTRA_IDX_URL

LABEL maintainer="Edgar Y. Walker <eywalker@uw.edu>, Daniel Sitonic <sitonic@uw.edu>"

# Install PyTorch
RUN pip3 --no-cache-dir install torch==$TORCH_VER torchvision==$TORCHVISION_VER torchaudio==$TORCHAUDIO_VER $([ -z "$PYTORCH_EXTRA_IDX_URL" ] && echo "" || echo "--extra-index-url $PYTORCH_EXTRA_IDX_URL")

WORKDIR /src