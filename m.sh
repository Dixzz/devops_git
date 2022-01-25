git_cmd=0
while [ "$git_cmd" != "-1" ]; do
read -p "git command: " git_cmd
if  [ "$git_cmd" != "-1" ];then
eval $"$git_cmd"
cur_date=$(date '+%Y-%m-%d__%H_%M.png')
nircmd savescreenshot "$cur_date"
python n.py $"$git_cmd" $"$cur_date"
clear
fi
done
