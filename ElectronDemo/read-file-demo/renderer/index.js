var fs = require('fs');
window.onload = function(){
    var btn = this.document.querySelector('#btn');
    var text = this.document.querySelector('#text');
    btn.onclick= function(){
        fs.readFile('package.json',(err,data)=>{
            text.innerHTML = data;
        });
    };
}