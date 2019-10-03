const firebase = require("firebase");
// Required for side-effects
require("firebase/firestore");

// Initialize Cloud Firestore through Firebase
firebase.initializeApp({
    apiKey: "AIzaSyDdU5r-NF7dNCMvCFV6WUoVBd0e8BkBD_w",
    authDomain: "flutter-schooldev.firebaseapp.com",
    projectId: "flutter-schooldev"
  });
  
var db = firebase.firestore();

const School = require('node-school-kr') 
const school = new School()

school.init(School.Type.HIGH, School.Region.KANGWON, 'K100000414')
var meal

const sampleAsync = async function() {
meal = await school.getMeal()

//   // 오늘 날짜
//   console.log(`${meal.month}월 ${meal.day}일`)

//   // 오늘 급식 정보
//   console.log(meal.today)

  // 이번 달 급식 정보
//   console.log(meal)
 
//   // 년도와 달을 지정하여 해당 날짜의 데이터를 조회할 수 있습니다.
  const mealCustom = await school.getMeal(2019, 10)

//   console.log(mealCustom)
// console.log(meal)

for(var objVarName in mealCustom) {
    console.log(mealCustom[objVarName])
    db.collection("meal").add({
        meal : mealCustom[objVarName],
        date : "day"+ objVarName
    }).then(function(docRef) {
        console.log("Document written with ID: ", docRef.id);
    })
    .catch(function(error) {
        console.error("Error adding document: ", error);
    });
}

}
sampleAsync()

  
// meal.forEach(function(obj) {
//     db.collection("meal").add({
//         day1: obj[1],
//         day2: obj[2],
//         day3: obj[3],
//         day4: obj[4],
//         day5: obj[5],
//         day6: obj[6],
//         day7: obj[7],
//         day8: obj[8],
//         day9: obj[9],
//         day10: obj[10],
//         day11: obj[11],
//         day12: obj[12],
//         day13: obj[13],
//         day14: obj[14],
//         day15: obj[15],
//         day16: obj[16],
//         day17: obj[17],
//         day18: obj[18],
//         day19: obj[19],
//         day20: obj[20],
//         day21: obj[21],
//         day22: obj[22],
//         day23: obj[23],
//         day24: obj[24],
//         day25: obj[25],
//         day26: obj[26],
//         day27: obj[27],
//         day28: obj[28],
//         day29: obj[29],
//         day30: obj[30],
//         day31: obj[31],

//     }).then(function(docRef) {
//         console.log("Document written with ID: ", docRef.id);
//     })
//     .catch(function(error) {
//         console.error("Error adding document: ", error);
//     });
// });
// var menu =[  
//     {  
//        "id":1,
//        "name":"Focaccia al rosmarino",
//        "description":"Wood fired rosemary and garlic focaccia",
//        "price":8.50,
//        "type":"Appetizers"
//     },
//     {  
//        "id":2,
//        "name":"Burratta con speck",
//        "description":"Burratta cheese, imported smoked prok belly prosciutto, pached balsamic pear",
//        "price":13.50,
//        "type":"Appetizers"
//     }
//  ]

// menu.forEach(function(obj) {
//     db.collection("menu").add({
//         day1: obj.day1,
//         day2: obj.2,
//         description: obj.description,
//         price: obj.price,
//         type: obj.type
//     }).then(function(docRef) {
//         console.log("Document written with ID: ", docRef.id);
//     })
//     .catch(function(error) {
//         console.error("Error adding document: ", error);
//     });
// });