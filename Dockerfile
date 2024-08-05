FROM XXX
# FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime

RUN mkdir /workcenter && \
    cd /workcenter && \
    pip install debugpy && \
    # apt update && apt install gcc build-essential -y && \ #* DO SOMETHING HERE
    # pip install hdbscan==0.8.33 overrides==6.1.0 drain3 tqdm regex pandas debugpy && \ 
    # pip install --extra-index-url=https://pypi.nvidia.com cudf-cu12==24.6.* cuml-cu12==24.6.* && \ 
    export PYTHONPATH=/workcenter

WORKDIR /workcenter
ENV PYTHONPATH="/workcenter"

# 5678 is the default remote debugpy port
EXPOSE 5678


# HOW TO RUN:

# docker build -t [IMGNAME:IMGVER] .

# docker run --gpus all --name [CONTAINER_NAME] -v $(pwd):/workcenter -p [YOUR_PORT_IN_launch.json]:5678 -dit [IMGNAME:IMGVER]
# docker run --gpus all --name test1 -v $(pwd):/workcenter -p 49869:5678 -dit IMGNAME:IMGVER

# for debug:
# docker exec -it [CONTAINER_NAME] python -Xfrozen_modules=off -m debugpy --listen 0.0.0.0:5678  --wait-for-client [PYTHONFILE.py]
# for exec:
# docker exec -it [CONTAINER_NAME] python [PYTHONFILE.py]

