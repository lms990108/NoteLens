# NoteLens
단국대학교 캡스톤/졸업 프로젝트 NoteLens

<img src="https://github.com/lms990108/NoteLens/assets/103021300/5a6bc04c-1e1d-4504-aa8e-9644f20e7f0b" height="300"/>


## 해당 Repostiory는 OCR 모델이 들어있는fastAPI를 관리할 예정

- 해당 api의 메인로직 
1. img 입력
2. 라벨링 (의존성 문제로인해 분리할 수 도 있음)
3. OCR
4. JSON 출력

- 데이터 저장 및 사용 방식
1. img : 메인서버(nest.js)에서 s3에 저장 후 문자열로 제공 될 것
2. ocr 결과 : JSON출력할 것. 저장은 메인서버에서 받아서 할 것
-> 따라서 db가 필요 없음. 

- 최종 구현 흐름
1. img 주소를 입력받는 POST요청 필요 (api)
2. 해당 이미지를 처리해서 문자열 추출 (ai)
3. 추출된 문자열을 json으로 전송 (api)

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