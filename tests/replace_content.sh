replace () {
    file=$1;
    delimitor=${2:-'/'};
    echo $file $2 $delimitor;
    if [ ! -f $file ]; then 
        echo "no such file $file"
        exit 1;
    fi;

    read "?input match text: " match;
    read "?input replace text: " text;

    # escape var in bash: ${match@Q}
    reg="s${delimitor}${match}${delimitor}${text}${delimitor}g"
    echo $reg
    result=`cat $file | sed "$reg"`;

    echo result $result;
    # check
    read "?looking good? [yY]" good
    if [ $good = y ]; then
        echo $result > $file;
    fi;
}

replace $1 $2