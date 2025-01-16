#### Goto parent directory
```bash
alias e=" cd .. ; "
```

#### Git push helpers
```bash
alias mc='  make clean '
alias ga='  git add . '
alias gc='  git commit -m " update " '
alias gt='  echo <github-access-token> | xclip -selection c '
alias gp='  git push '
alias gg='  mc ; ga ; gc ; gt ; gp ; '
```

#### Git helpers
```bash
alias gd=' git diff '
alias gst=' git status '
alias gsc=' git branch --show-current '
alias gs=' git switch '
alias gr='  git reset HEAD^ '
alias gl='  git log origin/backtest..HEAD'
alias g1='  git branch --all '
alias gpsu=' git push --set-upstream '
alias gat5='echo <github-access-token>'
alias ev='  evince '
alias pdf=' pdflatex '
```

#### Print info about Git commands 
TODO: fix formatting... replace with printf
```bash
j2(){
  # ++-----------------------++
  # || author: gabriel hofer ||
  # ++-----------------------++
  # https://stackoverflow.com/questions/4470523/create-a-branch-in-git-from-another-branch
  echo '        CREATE NEW BRANCH (don"t switch):  git branch <new_name> '
  echo '        CREATE NEW BRANCH (switch):        git checkout -b <new_branch_name> <source_branch_name>'
  echo '        SWITCH BRANCHES:                   git swtich <other_name> '
  echo '        DELETE BRANCH:                     git push <remote_name> --delete <branch_name> '
  echo '        DELETE LOCAL BRANCH:               git branch -d <local_branch> '
  echo '                                   git branch -D <local_branch> '
  echo '  DELETE REMOTE BRANCH:              git push origin -d <branch-name> '
  echo '        SET UPSTREAM BRANCH:               git push --set-upstream origin <branch_name> '
  echo '        LIST BRANCHES:                     git branch --all   OR   git branch --avv '
  echo '                                   git branch -a '
  echo '  SHOW CHANGES                       git diff <file-name>'
  echo '  CREATE NEW REPOSITORY              gh repo create <new-repo-name>'
  echo ""
  echo ""
  echo '        alias d=" node main.js ";'
  echo '  alias gst= " git status "'
  echo '        alias gsc="git branch --show-current";'
  echo '  alias gr=" git reset HEAD^ "'
  echo '        alias g1=" git branch --all ";'
  echo '  alias gl=" git log origin/backtest..HEAD "'
  echo '$ j --> custom dir listing'
  echo ' $ m --> $(type m)'
  echo ' $ f --> $(type f)'
  echo ' $ v --> $(type v)'
  echo ' $ whereis --> tells you where binary is located'
}
```

#### Output datetime to stdout
```bash
dt(){
  vi ~/.bashrc
  export DATETIME="$(date)"
  echo "$DATETIME"
  sed -i "1s/.*/### last-opened: $DATETIME/ test_file.txt"
}
```

#### Edit .bashrc
```bash
b(){
  vi ~/.bashrc ;
  . ~/.bashrc ;
  echo "-- edited bashrc --"
  echo "DATE: $(date)"
}
```

#### Edit .vimrc
```bash
v(){
  vi ~/.vimrc ;
  echo "-- edited vimrc --"
  echo "DATE: $(date)"
}
```

#### Run 'make'
```bash
m(){
  vi ./Makefile
  echo "-- edited Makefile --"
  echo "DATE: $(date)"
}
```

#### Custom Directory Listing
```bash
j(){
  # ++-----------------------++
  #       || author: gabriel hofer ||
  # ++-----------------------++
  #https://stackoverflow.com/questions/54161556/how-can-i-show-all-the-branches-in-a-repository
  #git branch -a
  #git branch -r
  #git show-branch
  alias io="cd /mnt/c/Users/Owner/Desktop/gabrieldhofer.github.io"
  alias cld="cd /mnt/c/Users/Owner/Desktop/gabrieldhofer.github.io/intheclouds"
  alias dsk="cd /mnt/c/Users/Owner/Desktop/"
  alias dnl="cd /mnt/c/Users/Owner/Downloads"
  alias dir1="cd /mnt/c/Users/Owner/Desktop/angular-stuff/gabes-app"
  alias dir2="cd /mnt/c/Users/Owner/Desktop/node-v20.18.1-linux-x64"

  echo "io.   /mnt/c/Users/Owner/Desktop/gabrieldhofer.github.io"
  echo "dnl.  /mnt/c/Users/Owner/Downloads"
  echo "dsk.  /mnt/c/Users/Owner/Desktop"
  echo "dir1. /mnt/c/Users/Owner/Desktop/angular-stuff/gabes-app"
  echo "dir2. /mnt/c/Users/Owner/Desktop/node-v20.18.1-linux-x64"

  #PATH="$PATH:/mnt/c/Users/Owner/Desktop/node-v20.18.1-linux-x64/bin"
  echo "++-----------------------------------------------++"
  git branch
  echo "++-----------------------------------------------++"
  i=1
  # files first
  echo -e "\e[1;94m~~FILES~~\e[0m"
  for f in *
  do
    if [[ -f $f ]]
    then
      if [[ -x $f ]]
      then
        if [[ $f == "__sept05_2024__.py" || $f == "__ad_hoc__.py" ]]
        then
          echo -e "\e[1;35m     $i. $f \e[0m"
        else
          echo -e "\e[1;36m     $i. $f \e[0m"
        fi
      else
        echo -e "\e[1;36m     $i. $f \e[0m"
      fi
      alias $i=" vi '$f' "
      i=$((i+1))
    fi
  done
  # directories second
  echo -e "\e[1;94m~~DIRS~~\e[0m"
  for f in *
  do
    if [[ -d $f ]]
    then
      echo -e "\e[1;33m     $i. $f/ \e[0m"
      alias $i=" cd '$f' ; j "
      i=$((i+1))
    fi
  done

}
```

#### Create New Branch
```bash
newbranch(){
  #-------------------------------------------------------------+
  #       Author: Gabriel Hofer
  #       Date: 11/9/2024
  #       Modified: 11/9/2024
  # Purpose:
  #   To easily create branches with datetime-postfixed names.
  #-------------------------------------------------------------+
  # TODO:
  #               1. add getopts
  #-------------------------------------------------------------+

  echo "+------------------------------------+"
  echo "|         Creating Branch            |"
  echo "+------------------------------------+"

  display_names(){
    printf "\n++------------------------------------++\n"
    printf "\nBRANCH_NAME: $BRANCH_NAME "
    printf "\nBASED_ON: $BASED_ON "
    printf "\n++------------------------------------++\n\n"
  }

  read -p "Create branch? [Y/n]: " DECISION

  if [ $DECISION = 'Y' ];
  then
    read -p "Enter new branch name (prefix): " BRANCH_NAME
    printf "Based-On Options\n"
    git branch
    read -p "Enter branch on which to base new branch: " BASED_ON
    display_names
    # create branch
    git checkout -b $BRANCH_NAME $BASED_ON
    if [ $? -eq 0 ];
    then
      sleep 0.3
      echo "-- Branch CREATED --"
      cd </path/to/git/repository/>
      mkdir $BRANCH_NAME
      sleep 0.2
      echo "-- Directory CREATED --"
      cd $BRANCH_NAME
     else
      echo "Command failed with exit code $?"
      sleep 0.2
      echo "Branch NOT created"
    fi
    else
      sleep 0.3
      echo "Branch NOT created"
  fi
}
```

#### Angular Stuff
```bash
#export PATH=$PATH:/mnt/c/Users/Owner/Desktop/node-v20.18.1-linux-x64/bin
alias ngbuild1='ng build --configuration production --base-href "https://gabrieldhofer.github.io/'
alias ngversion="ng version"
alias ngserve='ng serve -o'

function ngbuild1(){
  GITHUB_IO_URL='https://gabrieldhofer.github.io'
  ng build\
    --configuration production\
    --base-href $GITHUB_IO_URL
}
```

#### Random commands to remember
```bash
type
whereis
getopts
```

#### Print formatted PATH
```bash
function print_formatted_path() {
	#------------------
	# AI generated code
	#------------------
	IFS=:
	for dir in $PATH; do
					printf "%s\n" "$dir"
	done
}
alias fp=print_formatted_path
```

#### Add to PATH
```bash
function add_to_path {
	#------------------
	# AI generated code
	#------------------
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
    echo "Added $1 to PATH."
  else
    echo "Error: $1 is not a directory."
  fi
}
```

#### Remove from PATH
```bash
function remove_from_path() {
	#------------------
	# AI generated code
	#------------------
  local dir_to_remove="$1"

  if [[ -z "$dir_to_remove" ]]; then
    echo "Usage: remove_from_path <directory>"
    return 1
  fi

  # Check if the directory exists in the PATH
  if [[ ":$PATH:" == *":$dir_to_remove:"* ]]; then
    # Use sed to remove the directory from the PATH
    PATH="$(echo "$PATH" | sed "s/:\?$dir_to_remove://g")"
    export PATH
  else
    echo "Directory not found in PATH: $dir_to_remove"
  fi
}
```

#### Remove from PATH by index
```bash
remove_from_path_by_index() {
	#------------------
	# AI generated code
	# date: 2025-01-14
	#------------------
  local index="$1"
  local path_array=(${PATH//:/ })

  if [[ "$index" -ge 0 && "$index" -lt "${#path_array[@]}" ]]; then
    unset path_array[$index]
    PATH="${path_array[*]}"
    export PATH
  else
    echo "Invalid index: $index" >&2
  fi
}
```

```bash
alias rdm="vi readme.md"
```
