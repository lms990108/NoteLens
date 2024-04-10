# 가상 환경이 존재하는지 확인하고, 없으면 생성하고 있으면 활성화합니다.
$envList = conda env list
if ($envList -match "notelens") {
    Write-Output "notelens environment already exists. Activating..."
    conda activate notelens
} else {
    Write-Output "Creating notelens environment..."
    conda create -n notelens python=3.8 -y
    Write-Output "Activating notelens environment..."
    conda activate notelens
}

# conda 명령어 실행
conda install paddlepaddle==2.6.1 --channel https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ # cpu 버전
pip install "paddleocr>=2.0.1"
conda install fastapi -y
conda install "uvicorn[standard]" -y
conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 cpuonly -c pytorch # cpu 버전
