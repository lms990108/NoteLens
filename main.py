# 실행 명령어 uvicorn main:app --reload
# 포트번호 : 8000번
# api list : localhost:8000/docs
from fastapi import FastAPI
from app.api.router import testRouter, imageRouter

app = FastAPI()

app.include_router(testRouter, prefix="/api/test")
app.include_router(imageRouter, prefix="/api/img")
