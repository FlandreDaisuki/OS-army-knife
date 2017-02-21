#!/bin/bash
target=$HOME

isYes() {
    if [[ "$1" = "y" || "$1" = "Y" || "$1" = "yes" || "$1" = "Yes" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

rewrite_bashrc() {
    cp example.bashrc $target/.bashrc
    echo "" >> $target/.bashrc
    echo "# # # # # # # # # # #" >> $target/.bashrc
    echo "# My bashrc setting #" >> $target/.bashrc
    echo "# # # # # # # # # # #" >> $target/.bashrc
    echo "" >> $target/.bashrc
    cat my.bashrc >> $target/.bashrc
}

if [[ -f $target/.bashrc ]]; then
    echo "~/.bashrc exists. Rewrite it all? [y/N]"
    read _rewrite
    if [[ `isYes $_rewrite` = "true" ]]; then
        rewrite_bashrc
    else
        echo "Append my.bashrc to ~/.bashrc? [y/N]"
        read _append
        if [[ `isYes $_append` = "true" ]]; then
            echo "" >> $target/.bashrc
            cat my.bashrc >> $target/.bashrc
        fi
    fi
else
    rewrite_bashrc
fi

echo "Append my.bash_aliases to ~/.bash_aliases? [y/N]"
read _append
if [[ `isYes $_append` = "true" ]]; then
    cat my.bash_aliases >> $target/.bash_aliases
    sort -u $target/.bash_aliases | grep "alias" > tmp.bash_aliases
    mv tmp.bash_aliases $target/.bash_aliases
fi
