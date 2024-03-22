
## ./before_pr.sh 명령어를 실행한 후 의존성 변경점이 있으면 최종 commit을 하고 PR보낼 것
## ./run_server.sh 명령어를 통해 서버를 실행할 것

---
## 목표

github action을 통해 cicd 를 구성할 예정

- workflow

1. 코드 품질 검사
    - Lint 검사
    - Mypy를 통한 타입 검사
2. 빌드 자동화
    - 라이브러리 의존성 관리를 위해 pull request 를 실행하면 pip freeze를 통해 requirements.txt 최신화
3. 스크립트를 통한 편의성 개선
    - 실행 명령어 (uvicorn main:app --reload)와 
    라이브러리 동기화 명령어 (pip install -r requirements.txt) 
    및 추가적인 명령어를 병합한 개발용 스크립트 생성
4. 배포 자동화
    3번에서 만든 스크립트를 활용해서 배포 또한 자동화
5. 실행/에러 로깅

---
## 설계방향

현재 배포를 진행하지는 않고 있기때문에 github action을 통한 cicd 대신 스크립트를 활용

1. PR을 위한 스크립트
    - pylint 검사 실행
    - mypy 검사 실행
    - requirements.txt 생성 -> 여기서 변동사항 생길 시 의존성 수정이라고 commit 후 pr

2. 실행을 위한 스크립트