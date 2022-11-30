function git-back(){
    git_hash=$(git rev-parse HEAD)
    git revert ${git_hash}
}

function git-pull-force(){
    git fetch origin main
    git reset --hard origin/main
}

function git-push(){
    git_now_branch=$(git branch --contains | cut -d " " -f 2)
    echo "Your now branch is ${git_now_branch}, can I stage and push changes to a remote repository with the same name? [Y/N]"
    read y_or_n
    if [ {y_or_n = "Y"} || {y_or_n = "y"} ]; then
        if [ $# = 0]; then
	    echo "Please tell me your commit comment: "
            read commit_comment
        else
            commit_comment=$1
        fi    
        git add .
        git commit -m "$1"
    fi
}
