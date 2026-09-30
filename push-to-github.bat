@echo off
chcp 65001 >nul
cd /d "%~dp0"

where git >nul 2>nul
if errorlevel 1 (
  echo [错误] 未检测到 Git，请先安装 Git for Windows: https://git-scm.com/download/win
  pause
  exit /b 1
)

echo ===== 1/6 初始化仓库 =====
git init

echo ===== 2/6 设置提交者信息（仅本仓库）=====
git config user.name "txryy226"
git config user.email "txryy226@users.noreply.github.com"

echo ===== 3/6 添加文件 =====
git add .

echo ===== 4/6 提交 =====
git commit -m "first commit"

echo ===== 5/6 设置分支与远程仓库 =====
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/txryy226/my-python-project.git

echo ===== 6/6 推送到 GitHub =====
echo    提示：弹窗里 Username 填 txryy226，Password 粘贴你的 PAT（不是账号密码）
git push -u origin main

echo.
echo 完成！去 https://github.com/txryy226/my-python-project/actions 查看运行结果。
echo 若出现 "Failed to connect to github.com port 443"，请改用 SSH（教程 1.1~1.5）。
pause
