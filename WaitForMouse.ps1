Add-Type @"
using System;
using System.Runtime.InteropServices;
public class MouseWatcher {
  [DllImport("user32.dll")]
  public static extern short GetAsyncKeyState(int vKey);
}
"@


Write-Host "マウス操作があるまで待機中..."

while ($true) {
    Start-Sleep -Milliseconds 50

    # 左クリック(0x01) or 右クリック(0x02) or 中クリック(0x04)
    if (([MouseWatcher]::GetAsyncKeyState(0x01) -band 0x8000) -or
        ([MouseWatcher]::GetAsyncKeyState(0x02) -band 0x8000) -or
        ([MouseWatcher]::GetAsyncKeyState(0x04) -band 0x8000)) {
        break
    }
}

Write-Host "マウス入力を検知しました。終了します。"