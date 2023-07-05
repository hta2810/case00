#/bin/bash

my_name="Andy HUYNH"
db_file="./users.db"

if [ "$1" == "help" ]; then
    echo "(c) ${my_name}"
elif [ "$1" == "list" ]; then
    cat $db_file
elif [ "$1" == "search" ] && [ "$#" == "2" ]; then
    cat $db_file | grep $2
elif [ "$1" == "add" ] && [ "$#" == "3" ]; then
    echo -e "${2}\t${3}" >> $db_file
elif [ "$1" == "remove" ] && [ "$#" == "2" ]; then
    sed -i "/${2}/d" $db_file
fi

#/bin/bash
read input

IFS=' '

read -a strarr <<< "$input"

declare -i sum
for val in "${strarr[@]}"; do
    if [[ $val =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
        sum+=$val*$(( $val < 0 ? -1 : 1 ))
    else
        exit 1
    fi
done
echo $sum

#!/bin/bash
case_dir=./case
newdir_list=('music' 'images' 'videos')

for newdir in "${newdir_list[@]}"; do
    if [[ ! -d $newdir ]]; then
        mkdir $case_dir/$newdir
    fi
done

files=$(ls -a ${case_dir})
for file in ${files[@]}; do
    if [[ ($file == *.mp3) || ($file == *.flac) ]]; then
        mv $case_dir/$file $case_dir/music
    elif [[ $file == *.jpg || $file == *.png ]]; then
        mv $case_dir/$file $case_dir/images
    elif [[ $file == *.avi || $file == *.mov ]]; then
        mv $case_dir/$file $case_dir/videos
    elif [[ $file == *.log ]]; then
        rm $case_dir/$file
    fi
done

#!/bin/bash
case_dir=./case

declare -a files
declare -a logs

logs=$(ls -a ${case_dir} | grep '.log$')

for log in ${logs[@]}; do
    files=$(ls -a ${case_dir} | grep $log. | sort -r)
    for file in ${files[@]}; do
        file_no=$((${file#$log.}+1))
        if (( $file_no > 20 )); then
            rm "${case_dir}/${log}.20"
        else
            cp "${case_dir}/${file}" "${case_dir}/${log}.${file_no}"
        fi
    done
    cp "${case_dir}/${log}" "${case_dir}/${log}.1"
    echo '' >| "${case_dir}/${log}"
done

ls $case_dir | sort




