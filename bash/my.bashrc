git_prompt() {
    foreLightGreen="\[\033[1;32m\]"
    foreRed="\[\033[1;31m\]"
    foreBlue="\[\033[1;34m\]"
    colorOff="\[\033[0m\]"
    user="${foreLightGreen}\u${colorOff}"
    cwd="${foreBlue}\w${colorOff}"
    echo "${user} ${cwd}${foreRed}\$(__git_ps1) ${colorOff}\$ "
}
PS1=$(git_prompt)
