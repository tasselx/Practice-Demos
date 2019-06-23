const button = document.querySelector('#button');
const path = require('path');
const BrowserWindow = require('electron').remote.BrowserWindow;
button.onclick = function(){
	win = new BrowserWindow({
		width:300,
		height:200,
		frame:true,
		transparent:false
	});
	win.loadURL(`file://${__dirname}/news.html`);
	win.on('close',()=>{win = null});
}