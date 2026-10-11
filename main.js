// Yashima Timer を Electron の専用ウィンドウで起動する
const { app, BrowserWindow, Menu, shell } = require('electron');
const path = require('path');

function createWindow() {
    const win = new BrowserWindow({
        width: 1280,
        height: 720,
        backgroundColor: '#000000', // 読み込み中に白く光らないようにアプリと同じ黒にする
        autoHideMenuBar: true,
    });

    // 外部リンクはアプリ内ではなく既定のブラウザで開く
    win.webContents.setWindowOpenHandler(({ url }) => {
        shell.openExternal(url);
        return { action: 'deny' };
    });

    win.loadFile(path.join(__dirname, 'index.html'));
}

// メニューバーは使わないので消す（F・S キーなどの操作は index.html 側で処理している）
Menu.setApplicationMenu(null);

app.whenReady().then(createWindow);

app.on('window-all-closed', () => app.quit());
