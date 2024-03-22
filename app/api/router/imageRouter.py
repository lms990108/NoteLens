from fastapi import APIRouter, File, UploadFile, HTTPException
from typing import List
from pydantic import BaseModel
import os
import logging
import logging.config

# 로그 설정 파일을 로드하여 설정 적용
logging.config.fileConfig('logging_config.ini')

# 로거 생성
logger = logging.getLogger(__name__)

imageRouter = APIRouter()

# 프로젝트 루트 디렉토리의 경로
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

class Item(BaseModel):
    img_url: str

@imageRouter.post("/url")
def create_item(item: Item):
    # 이미지 URL을 받아와서 처리하는 로직
    # 여기에 실제로 이미지를 다운로드하거나 OCR을 수행하는 로직을 추가할 수 있습니다.
    logger.info(f"Received image URL: {item.img_url}")
    return {"img_url": item.img_url}


@imageRouter.post("/file")
async def upload_image(files: List[UploadFile] = File(...)):
    # 파일을 저장할 디렉토리 경로 설정
    upload_dir = os.path.join(PROJECT_ROOT, "test", "resources")
    os.makedirs(upload_dir, exist_ok=True)  # 디렉토리가 없으면 생성

    # 업로드된 파일을 저장하고 저장된 파일의 경로를 리스트에 추가
    saved_files = []
    for file in files:
        file_path = os.path.join(upload_dir, file.filename)
        with open(file_path, "wb") as buffer:
            buffer.write(await file.read())
        saved_files.append(file_path)

    return saved_files
