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
conda install paddlepaddle-gpu==2.6.0 cudatoolkit=11.7 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/Paddle/ -c conda-forge -y
conda install "paddleocr>=2.0.1" -y
conda install fastapi -y
conda install "uvicorn[standard]" -y
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.7 -c pytorch -c nvidia