#!/bin/bash

# 로그 파일 설정
log_file="before_pr.log"

# pylint 검사
echo "** pylint 검사 시작 **" >> $log_file
pylint --rcfile .pylintrc src/ >> $log_file
echo "** pylint 검사 종료 **" >> $log_file

# mypy 타입 검사
echo "** mypy 타입 검사 시작 **" >> $log_file
mypy src/ >> $log_file
echo "** mypy 타입 검사 종료 **" >> $log_file

# pip freeze > requirements.txt
echo "** requirements.txt 생성 시작 **" >> $log_file
pip freeze > requirements.txt
echo "** requirements.txt 생성 종료 **" >> $log_file

# 에러 발생 시 종료
if [ $? -ne 0 ]; then
  echo "코드 검사에 실패했습니다. 다시 시도해주세요." >> $log_file
  exit 1
fi

echo "코드 검사가 성공적으로 완료되었습니다." >> $log_file

