echo -e "┌-------------------┐"
echo -e "| \e[34mhexo 网页部署工具\e[0m |"
echo -e "|    \e[34m作者 小番茄\e[0m    |"
echo -e "└-------------------┘"
echo -e ""
echo -e ""

read -p "即将开始部署网页 > Github [Y/n] " yn
if [[ $yn == "y" || $yn == "Y" ]]; then
	echo -e "\e[33m========执行1/3 : 清理========\e[0m" 2>&1 | tee deploy.log
	hexo clean 2>&1 | tee -a deploy.log
	echo -e "\e[33m========执行2/3 : 生成========\e[0m" 2>&1 | tee -a deploy.log
	hexo g 2>&1 | tee -a deploy.log
	echo -e "\e[33m========执行3/3 : 部署========\e[0m" 2>&1 | tee -a deploy.log
	hexo d 2>&1 | tee -a deploy.log
elif [[ $yn == "n" || $yn == "N" ]]; then
	echo -e "\e[31m您取消了网页部署\e[0m > Github" 2>&1 | tee deploy.log
elif [[ $yn != "y" && $yn != "Y" && $yn != "n" && $yn != "N" ]]; then
	echo -e "\e[31m你都输了一些啥东东？\e[0m > $yn" 2>&1 | tee deploy.log
fi
echo -e "\e[32m执行完毕 5秒后窗口自动关闭\e[0m"
sleep 5