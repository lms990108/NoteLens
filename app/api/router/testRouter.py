from fastapi import APIRouter

testRouter = APIRouter()

@testRouter.get("/")
def read_root():
    return {"message": "Hello, World from router!"}

@testRouter.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
