# 베이스 이미지 선택
FROM continuumio/miniconda3:latest

# 작업 디렉토리 설정 (원하는 디렉토리로 변경)
WORKDIR /app

# conda 환경 생성
RUN conda create -n notelens python=3.8 -y

# 쉘을 PowerShell로 변경
SHELL ["powershell", "-Command"]

# 필요한 패키지 설치
RUN conda activate notelens; \
    conda install paddlepaddle-gpu==2.6.0 cudatoolkit=11.7 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ -c conda-forge -y ; \
    conda install "paddleocr>=2.0.1" -y ; \
    conda install fastapi -y ; \
    conda install "uvicorn[standard]" -y

# Docker 컨테이너 실행 시 실행될 명령어
CMD ["powershell"]
