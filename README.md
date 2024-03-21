# NoteLens
단국대학교 캡스톤/졸업 프로젝트 NoteLens

<img src="https://github.com/lms990108/NoteLens/assets/103021300/5a6bc04c-1e1d-4504-aa8e-9644f20e7f0b" height="300"/>


해당 Repostiory는 OCR 모델이 들어있는fastAPI를 관리할 예정

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


