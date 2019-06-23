var fs = require('fs');
var content = document.querySelector('#content');
content.ondragenter = content.ondragover = content.ondrageleave = function(){
	return false;//阻止默认行为
}
content.ondrop = function(e){
	e.preventDefault();
	var path = e.dataTransfer.files[0].path;
	console.log(path);
	fs.readFile(path,'utf-8',(err,data)=>{
		content.innerHTML = data;
	});
}
