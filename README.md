# MEGREZ 容器实例镜像

本仓库存放 MEGREZ 容器实例镜像的 Dockerfile 及相关配置文件。


## 镜像列表

> [!TIP]
如果您有其他深度学习框架或特殊版本的打包镜像需求,, 请在 [MEGREZ 打包镜像仓库](https://github.com/XShengTech/MEGREZ-images) 中提交 issue
:::

### PyTorch

| 镜像标签 | PyTorch | CUDA | Python | Ubuntu |
| --- | ------- | ---- | ------ | ------ |
| pytorch-1.8.1_cuda-11.1_python-3.8_ubuntu-20.04 | 1.8.1 | 11.1 | 3.8 | 20.04 |
| pytorch-1.10.2_cuda-11.1_python-3.9_ubuntu-20.04 | 1.10.2 | 11.1 | 3.9 | 20.04 |
| pytorch-1.13.1_cuda-11.7_python-3.10_ubuntu-22.04 | 1.13.1 | 11.7 | 3.10 | 22.04 |
| pytorch-2.0.1_cuda-11.8_python-3.10_ubuntu-22.04 | 2.0.1 | 11.8 | 3.10 | 22.04 |
| pytorch-2.1.2_cuda-12.1_python-3.10_ubuntu-22.04 | 2.1.2 | 12.1 | 3.10 | 22.04 |
| pytorch-2.3.1_cuda-12.1_python-3.11_ubuntu-22.04 | 2.3.1 | 12.1 | 3.11 | 22.04 |
| pytorch-2.4.0_cuda-12.1_python-3.12_ubuntu-22.04 | 2.4.0 | 12.1 | 3.12 | 22.04 |
| pytorch-2.6.0_cuda-12.6_python-3.12_ubuntu-22.04 | 2.6.0 | 12.6 | 3.12 | 22.04 |
| pytorch-2.8.0_cuda-12.8_python-3.12_ubuntu-22.04 | 2.8.0 | 12.8 | 3.12 | 22.04 |

### TensorFlow

### PaddlePaddle

### Ubuntu

| 镜像标签 | 说明 |
| --- | --- |
| ubuntu-22.04 | 仅包含基础环境（MiniConda、CodeServer、Jupter Notebook、性能监控）, 没有安装任何深度学习框架、CUDA/cuDNN 等 |


## 📌 贡献者许可协议 (CLA)

> [!NOTE]
> 本项目要求贡献者签署我们的贡献者许可协议（CLA）。  
> 协议: https://github.com/XShengTech/.github/blob/main/CLA.md


> [!NOTE]
> This project requires contributors to sign our Contributor License Agreement (CLA).  
> See: https://github.com/XShengTech/.github/blob/main/CLA.md