
var cheerio = require('cheerio');
var request = require('request');
var url = "https://maplestory.nexon.com/Ranking/World/Total?c=NickRoh2";

const sampleAsync = async function() {
    // for(let i=1111;i<9999;i++){
    //     url = url + i.toString();

    // }
    request(url, function(error, response, html){
        if (error) {throw error};
        var $ = cheerio.load(html);
    
    
        $("#container > div > div > div:nth-child(4) > div").each((index, element) => {
            let tmp = $($(element)).text()
          
            console.log($($(element)).text());
    
    
            
          });
        // console.log (html);
    });
}

sampleAsync();


//http://www.minjok.hs.kr/sub02_03.php