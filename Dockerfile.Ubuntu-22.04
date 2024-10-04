# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 更新软件源，并安装基本工具和依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    wget \
    curl \
    openssh-server \
    sudo \
    bzip2 \
    ca-certificates \
    gnupg \
    gnupg2

# 设置工作目录为 /root
WORKDIR /root

SHELL ["/bin/bash", "-c"]

# 安装 Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/root/miniconda3/bin:$PATH"

# 将 conda 初始化命令追加到 /root/.bashrc 中
RUN echo "# >>> conda initialize >>>" >> /root/.bashrc && \
    echo "# !! Contents within this block are managed by 'conda init' !!" >> /root/.bashrc && \
    echo "__conda_setup=\"\$('/root/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)\"" >> /root/.bashrc && \
    echo "if [ \$? -eq 0 ]; then" >> /root/.bashrc && \
    echo "    eval \"\$__conda_setup\"" >> /root/.bashrc && \
    echo "else" >> /root/.bashrc && \
    echo "    if [ -f \"/root/miniconda3/etc/profile.d/conda.sh\" ]; then" >> /root/.bashrc && \
    echo "        . \"/root/miniconda3/etc/profile.d/conda.sh\"" >> /root/.bashrc && \
    echo "    else" >> /root/.bashrc && \
    echo "        export PATH=\"/root/miniconda3/bin:\$PATH\"" >> /root/.bashrc && \
    echo "    fi" >> /root/.bashrc && \
    echo "fi" >> /root/.bashrc && \
    echo "unset __conda_setup" >> /root/.bashrc && \
    echo "# <<< conda initialize <<<" >> /root/.bashrc

# 配置 conda 环境
# ENV PATH="/root/miniconda/bin:$PATH"
RUN source /root/miniconda3/bin/activate && \ 
    conda init --all && \
    source /root/.bashrc

# 安装 Jupyter Notebook
RUN pip install notebook jupyterlab-language-pack-zh-CN && \
    jupyter notebook || true && \
    jupyter notebook --generate-config

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY jupyter /etc/init.d/jupyter
RUN chmod +x /etc/init.d/jupyter

# 配置 SSH 允许 root 登录和密码认证
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 创建 SSH 运行时目录
RUN mkdir -p /var/run/sshd

# 安装 Prometheus Node-Exporter
RUN apt-get install -y prometheus
COPY prometheus /etc/init.d/prometheus
COPY prometheus.yml /etc/prometheus/prometheus.yml
RUN chmod +x /etc/init.d/prometheus

COPY prometheus-node-exporter /etc/init.d/prometheus-node-exporter
RUN chmod +x /etc/init.d/prometheus-node-exporter

# 安装 Nvidia-Gpu-Exporter
RUN wget https://github.com/utkuozdemir/nvidia_gpu_exporter/releases/download/v1.2.1/nvidia_gpu_exporter_1.2.1_linux_x86_64.tar.gz -O nvidia_gpu_exporter_1.2.1_linux_x86_64.tar.gz && \
    tar -zxvf nvidia_gpu_exporter_1.2.1_linux_x86_64.tar.gz && \
    mv nvidia_gpu_exporter /usr/bin/ && \
    rm nvidia_gpu_exporter_1.2.1_linux_x86_64.tar.gz LICENSE
COPY nvidia_gpu_exporter /etc/init.d/nvidia_gpu_exporter
RUN chmod +x /etc/init.d/nvidia_gpu_exporter

# 安装 Grafana
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && \
    echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list && \
    apt-get update && \
    apt-get install -y grafana
COPY grafana.db /var/lib/grafana/grafana.db

RUN apt-get clean && rm -r /var/lib/apt/lists/* && \
    conda clean -y --all && \
    rm -r ~/.cache/pip/*

# 暴露 Jupyter Notebook 的默认端口 8888 和 SSH 默认端口 22
EXPOSE 8888 22 3000

# 换源
COPY sources.list /etc/apt/sources.list
COPY .condarc /root/.condarc
RUN pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple/

# 复制入口脚本
COPY Ubuntu-22.04/entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

# 设置容器启动时的入口
ENTRYPOINT ["/opt/entrypoint.sh"]

