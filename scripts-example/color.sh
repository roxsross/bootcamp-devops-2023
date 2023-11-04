Color_Off='\033[0m' # Text Reset

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;97m'  # White

# Additional colors
LGrey='\033[0;37m'  # Ligth Gray
DGrey='\033[0;90m'  # Dark Gray
LRed='\033[0;91m'   # Ligth Red
LGreen='\033[0;92m' # Ligth Green
LYellow='\033[0;93m' # Ligth Yellow
LBlue='\033[0;94m'  # Ligth Blue
LPurple='\033[0;95m' # Light Purple
LCyan='\033[0;96m'  # Ligth Cyan


# Bold
BBlack='\033[1;30m' # Black
BRed='\033[1;31m'   # Red
BGreen='\033[1;32m' # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'  # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'  # Cyan
BWhite='\033[1;37m' # White

# Underline
UBlack='\033[4;30m' # Black
URed='\033[4;31m'   # Red
UGreen='\033[4;32m' # Green
UYellow='\033[4;33m' #Yellow
UBlue='\033[4;34m'  # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'  # Cyan
UWhite='\033[4;37m' # White

# Background
On_Black='\033[40m' # Black
On_Red='\033[41m'   # Red
On_Green='\033[42m' # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'  # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'  # Cyan
On_White='\033[47m' # White


# Example of usage
echo -e "${Green}This is GREEN text${Color_Off} and normal text"
echo -e "${Red}${On_White}This is Red test on White background${Color_Off}" 
# option -e is mandatory, it enable interpretation of backslash escapes
printf "${Red} This is red \n"