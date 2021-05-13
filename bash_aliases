# bash
alias update="sudo apt update && sudo apt upgrade -y"
alias sbash="source ~/.bash_aliases"
alias aws="ssh -i ~/Documents/class/aws/my-key.pem ec2-user@175.41.211.252"

# if this script called, then execute ./.bash_profile
source ~/.bash_profile
