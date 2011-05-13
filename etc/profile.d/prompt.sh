# unstaged (*) and staged (+) changes will be shown next
# to the branch name.
GIT_PS1_SHOWDIRTYSTATE=true

git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        #  %s current git branch and other info from git-completion
        local GIT_PROMPT=`__git_ps1 "(${GREEN}%s${NORMAL})"`
        echo ${GIT_PROMPT}
    fi
}
PS1="\u@\h:\$(git_prompt)\W \$ "

