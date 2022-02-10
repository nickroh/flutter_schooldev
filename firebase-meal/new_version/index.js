const firebase = require("firebase");
require("firebase/firestore");

firebase.initializeApp({
    apiKey: "AIzaSyDdU5r-NF7dNCMvCFV6WUoVBd0e8BkBD_w",
    authDomain: "flutter-schooldev.firebaseapp.com",
    projectId: "flutter-schooldev"
  });

var db = firebase.firestore();

const School = require('school-kr');
const school = new School();


const example = async function () {
  // 학교 검색 및 첫 번째 결과의 학교 코드로 초기화
  const result = await school.search(School.Region.KANGWON, '민족사관고등학교');
  school.init(School.Type.HIGH, School.Region.KANGWON, 'K100000414');

  const meal = await school.getMeal();
  //const calendar = await school.getCalendar();

  // 오늘 날짜
  console.log(`${meal.month}월 ${meal.day}일`);

  // 오늘 급식 정보
  console.log(meal.today);

  // 이번 달 급식 정보
  //console.log(meal);

  // 이번 달 학사일정
  //console.log(calendar);

  // 년도와 달을 지정하여 해당 날짜의 데이터를 조회할 수 있습니다.
  //const mealCustom = await school.getMeal(2021, 3);
  //const calendarCustom = await school.getCalendar(2017, 4);

  //console.log(mealCustom);
  //console.log(calendarCustom);

  // 년도값 대신 옵션 객체를 전달하여 데이터 수집 가능
  // year: 년도 (기본값: 현재 시점의 년도)
  // month: 달 (기본값: 현재 시점의 달)
  // default: 급식이 없는 경우 기본값 (기본값: '')
//   const optionMeal = await school.getMeal({
//     year: 2018,
//     month: 9,
//     default: '급식이 없습니다',
//   });

  // 년도값 대신 옵션 객체를 전달하여 데이터 수집 가능
  // year: 년도 (기본값: 현재 시점의 년도)
  // month: 달 (기본값: 현재 시점의 달)
  // default: 급식이 없는 경우 기본값 (기본값: '')
  // separator: 하루에 2개 이상의 일정이 있는 경우의 구분문자 (기본값: ,)
  //            예: 겨울방학,토요휴업일
//   const optionCalendar = await school.getCalendar({
//     default: '일정 없는 날',
//     separator: '\n',
//   });

  //console.log(optionMeal);
  //console.log(optionCalendar);


  for(var objVarName in meal){
    console.log(meal[objVarName])
    console.log(meal[objVarName]=="")
    if(meal[objVarName] == ""){
      meal[objVarName] = "[  ]No Data [  ][  ]"
    }else if(!meal[objVarName].toString().includes('중식')){
      meal[objVarName] = meal[objVarName] + "[중식] no data [석식] no data";
    }else if(!meal[objVarName].toString().includes('석식')){
      meal[objVarName] = meal[objVarName] + "[석식] no data";
    }
    
    // console.log(mealCustom[objVarName] + "date" +objVarName)
    data = {
        date : "day" + objVarName,
        meal : meal[objVarName]
    }
    db.collection('meals').doc(objVarName).set(data);

}
};

example();