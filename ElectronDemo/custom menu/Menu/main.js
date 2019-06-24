const { Menu } = require('electron');
let template = [
    {
        label:'文件',
        submenu:[
            {
                label:'新建窗口',
                click:()=>{
                    console.log('aaa');
                }
            },
            {
                type:'separator'
            },
            {
                label:'打开文件',
                accelerator:'ctrl+x',
                click:()=>{
                    console.log('bbb')
                }
            }
        ]
    },
    {
        label:'编辑',
        submenu:[
            {
                role:'cut',
                label:'剪切'
            },
            {
                role:'copy',
                label:'复制'
            }
        ]
    }
]

var m = Menu.buildFromTemplate(template);
Menu.setApplicationMenu(m);