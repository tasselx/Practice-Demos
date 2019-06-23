//引入electron模块
var electron = require('electron');
var path = require('path');
//创建electron引用
var app = electron.app;

var BrowserWindow = electron.BrowserWindow;

var mainWindow = null;

function createWindow(){
    mainWindow = new BrowserWindow({width:1104,height:620,webPreferences:{
        nodeIntegration:true
    }});
        // mainWindow.loadFile('index.html');//加载到窗口
    mainWindow.loadURL(path.join('file:',__dirname,'index.html'));
    mainWindow.webContents.openDevTools();

    mainWindow.on('closed',()=>{
        mainWindow = null;
    });
}

app.on('ready',createWindow);
app.on('window-all-closed',()=>{
    if (process.platform!=='darwin'){
        app.quit();
    }
});
app.on('activate',()=>{
    if(mainWindow == null) {
        createWindow();
    }
});