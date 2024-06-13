echo  One_Click_Optimization_for_The_Overcloking_SYSTEM
echo 请保证安装的是最新的 Windows10 或者 Windows11 ISO 再使用，感谢合作

echo This script was written by neil78@bilibili ;  禁止全文复制粘贴 (Prohibit copying and pasting of the full text)
timeout /t 1 /nobreak
echo. & pause 

echo =
echo  01.  禁用动态计时器时钟周期功能
bcdedit /deletevalue useplatformtick
bcdedit /set useplatformclock false
bcdedit /deletevalue useplatformclock
bcdedit /set tscsyncpolicy Default
bcdedit /deletevalue tscsyncpolicy
bcdedit /set disabledynamictick yes
REM  ## 调出高级启动菜单
bcdedit /set {default} bootmenupolicy legacy
REM  ##  恢复部分默认设置
bcdedit /set {current}  nx Optin
timeout /t 1 /nobreak

echo =
echo  02.  关掉快速启动  (为了超频系统，强烈建议)
powercfg -h off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak

echo =
echo  03.  为程序优化性能
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
timeout /t 1 /nobreak

echo =
echo  04.  关掉 Exploit Protection 中的 SEHOPE 和 CFG
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak

echo =
echo 05.  关闭 Large System Cache, 为程序优化性能2
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak

echo =
echo 06.  SerializeTimerExpiration
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak

echo =
echo 已经执行必要内容，下面只是系统优化
echo 如不需要系统优化，请关掉本脚本程序； 按任意键将继续执行
echo. & pause 

echo =
echo  07.  NTFS 优化
echo Applying NTFS Tweaks
fsutil behavior set memoryusage 2
fsutil behavior set mftzone 4
timeout /t 1 /nobreak

echo =
echo 08.  Setting System Responsiveness
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "9" /f 
timeout /t 1 /nobreak

echo 已经完全执行脚本，感谢使用，再见。
echo. & pause 
