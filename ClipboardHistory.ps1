$signature = @"
using System;
using System.Runtime.InteropServices;
public class KB {
  [DllImport("user32.dll")]
  public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
}
"@
Add-Type $signature

$VK_LWIN = 0x5B
$VK_V    = 0x56
$KEYUP   = 0x0002

Start-Sleep -Milliseconds 200

# Winキー押下
[KB]::keybd_event($VK_LWIN, 0, 0, 0)
Start-Sleep -Milliseconds 50

# Vキー押下
[KB]::keybd_event($VK_V, 0, 0, 0)
Start-Sleep -Milliseconds 50

# Vキー解放
[KB]::keybd_event($VK_V, 0, $KEYUP, 0)
Start-Sleep -Milliseconds 30

# Winキー解放
[KB]::keybd_event($VK_LWIN, 0, $KEYUP, 0)
