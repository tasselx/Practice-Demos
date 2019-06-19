//引入electron模块
var electron = require('electron');
var path = require('path');
//创建electron引用
var app = electron.app;

var BrowserWindow = electron.BrowserWindow;

var mainWindow = null;

app.on('ready',()=>{
    mainWindow = new BrowserWindow({width:600,height:400,
    webPreferences:{
        nodeIntegration:true
    }});
    // mainWindow.loadFile('index.html');//加载到窗口
    mainWindow.loadURL(path.join('file:',__dirname,'index.html'));
    mainWindow.webContents.openDevTools()
    mainWindow.on('close',()=>{
        mainWindow = null;
    });
    
});