#!/bin/bash

# pylint 검사
echo "** pylint 검사 시작 **" >> server.log
pylint --rcfile .pylintrc src/ >> server.log
echo "** pylint 검사 종료 **" >> server.log

# mypy 타입 검사
echo "** mypy 타입 검사 시작 **" >> server.log
mypy src/ >> server.log
echo "** mypy 타입 검사 종료 **" >> server.log

# 에러 발생 시 종료
if [ $? -ne 0 ]; then
  echo "코드 검사에 실패했습니다. 다시 시도해주세요." >> server.log
  exit 1
fi

# uvicorn 실행
echo "** uvicorn 서버 실행 시작 **" >> server.log
uvicorn main:app --reload >> server.log
echo "** uvicorn 서버 실행 종료 **" >> server.log

# 에러 발생 시 종료
if [ $? -ne 0 ]; then
  echo "서버 실행에 실패했습니다. 다시 시도해주세요." >> server.log
  exit 1
fi

echo "코드 검사 및 서버 실행이 성공적으로 완료되었습니다." >> server.log
