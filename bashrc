####---------------------------------------------------------------
#### Saves time when experimenting with bashrc/vimrc modifications
####---------------------------------------------------------------
bind -x '"\C-g":" vi ~/.bashrc ; source ~/.bashrc ; echo .bashrc reloaded "'
bind -x '"\C-h":" vi ~/.vimrc "'
bind -x '"\C-j":" vi main.py ; clear ; df "'


####---------------------------------------------------------------
#### probably use eventuallly
####---------------------------------------------------------------
## shopt -s autocd 

####---------------------------------------------------------------
#### Saves a few keystrokes
####---------------------------------------------------------------
alias e=" cd .. ; df "

####---------------------------------------------------------------
#### 
#### Explanation: 
####
####    - Extends the 'ls' command
####    - Assigns number to each item in directory
####    - If item is a dir, the number assigned becomes aliased
####      to the command that changes (CDs) to that dir
####    - If item is a file, the number assigned becomes aliased
####      to the command that opens that file in the vi editor
####
####---------------------------------------------------------------
df(){
  i=1
  # directories first
  echo "DIRS"
  for f in *
  do
    if [[ -d $f ]]
    then
      echo -e "\e[1;33m   $i.  $f/ \e[0m"
      alias $i=" cd '$f' ; df "
      i=$((i+1))
    fi
  done
  # files second
  echo "FILES"
  for f in *
  do
    if [[ -f $f ]]
    then
      if [[ -x $f ]]
      then
        echo -e "$i.\e[1;44m     $f \e[0m"
      else
        echo -e "$i.\e[1;36m     $f \e[0m"
      fi
      alias $i=" vi '$f' "
      i=$((i+1))
    fi
  done
}
