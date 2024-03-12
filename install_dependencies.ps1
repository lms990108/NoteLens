# 가상 환경 생성
conda create -n notelens python=3.8 -y

# 가상 환경 활성화
conda activate notelens

# conda 명령어 실행
conda install paddlepaddle-gpu==2.6.0 cudatoolkit=11.7 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ -c conda-forge -y
conda install "paddleocr>=2.0.1" -y
conda install fastapi -y
conda install "uvicorn[standard]" -y

# pip 명령어 실행
pip install -r requirements.txt
