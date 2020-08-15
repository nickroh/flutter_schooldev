const firebase = require("firebase");
// Required for side-effects
require("firebase/firestore");

firebase.initializeApp({
    apiKey: "AIzaSyDkxRxnpbL6Jt3RHOMjSJbSvs5_s0LSxHQ",
    authDomain: "my-awesome-calender.firebaseapp.com",
    databaseURL: "https://my-awesome-calender.firebaseio.com",
    projectId: "my-awesome-calender",
    storageBucket: "my-awesome-calender.appspot.com",
    messagingSenderId: "145107159650",
    appId: "1:145107159650:web:b21a19a03172c0aec4df3b",
    measurementId: "G-B5CQL7R3WE"
});

var db = firebase.firestore();

var cheerio = require('cheerio');
var request = require('request');
var url = "http://www.minjok.hs.kr/sub02_03.php";

const sampleAsync = async function() {
    request(url, function(error, response, html){
        if (error) {throw error};
        var $ = cheerio.load(html);
    
    
        $("body > table > tbody > tr > td > table > tbody > tr > td:nth-child(1) > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(4) > table > tbody > tr:nth-child(3) > td > table > tbody > tr > td:nth-child(2) > table > tbody > tr:nth-child(3) > td > table > tbody > tr:nth-child(4) > td > table > tbody").each((index, element) => {
            let tmp = $($(element).find("td")[1]).text()
          
            console.log($($(element).find("td")[0]).text());
    
            console.log(tmp);
            if(tmp == ""){
                console.log("false");
            }
            let cnt = 1;
            for(var i=0;i<35;i++){
                let tmp = $($(element).find("td")[i]).text()
                if(tmp == ""){
                    console.log("false");
                }else{
                    data = {
                        date : "day" + cnt,
                        meal : tmp
                    }
                    db.collection('calendar').doc(cnt.toString()).set(data);
                    console.log(data);
                    cnt++;
                }
            }
          });
        // console.log (html);
    });
}

sampleAsync();


//http://www.minjok.hs.kr/sub02_03.php