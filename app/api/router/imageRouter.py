from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

imageRouter = APIRouter()

class Item(BaseModel):
    img_url: str

@imageRouter.post("/items/")
def create_item(item: Item):
    # 여기서는 받은 이미지 URL을 그대로 반환하도록 설정하였습니다.
    # 여기에 실제로 이미지를 다운로드하거나 OCR을 수행하는 로직을 추가할 수 있습니다.
    return {"img_url": item.img_url}
