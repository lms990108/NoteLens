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

# 필요한 패키지 설치
$requiredPackages = @("paddlepaddle-gpu==2.6.0", "paddleocr>=2.0.1", "fastapi", "uvicorn[standard]")
foreach ($package in $requiredPackages) {
    $packageInstalled = conda list | Select-String -Pattern $package
    if (!$packageInstalled) {
        Write-Output "$package not installed. Installing..."
        conda install $package -y
    } else {
        Write-Output "$package already installed."
    }
}