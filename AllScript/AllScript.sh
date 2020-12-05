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
deps=('xsel')
currServerPath=""
echo -e "$BLUE
                                                                                                                   
       db         88           88                  888b      88                       88                           
      d88b        88           aa                  8888b     88                       88                           
     d8ss8b       88                               88 a8b    88                       88                           
    d8a  a8b      88 dPPYba    88  8b8dPPYba       88  a8b   88  aadPPYYbaa   aadPPYb,88  ,adPPYYbaa 18b       d8a 
   d8YaaaaY8b     88P      8a  88  88P'    Y8      88   a8b  88  aa     aY8  a8a    aY88  aa     1Y   8b      d8a  
  d8aaaaaaaa8b    88       d8  88  88              88    a8b 88  aadPPPPP88  8b       88  ,adPPPPP88   a8b   d8a   
 d8         a8b   88b     a8   88  88              88     a8888  88a    a88  a8aa   ad88  88a    a88    a8bad8a    
d8           a8b  8YaYbbd8aa   88  88              88      aa88  aa8bbdPaY8   aa8bbdP8Y8  aa8bbdPaY8      a8a      
                                                                                                                   
                                                                                                                   


$GREEN Welcome To AllScript Macro Tool by Abir Nadav $BLUE

Version ---> 1.0 
GitHub  ---> https://github.com/AbirNadav-dev/AllScript
_________________________________________________________________________________________________________________




"



echo -e "$WHITE"
echo -e "Testing if you have Tool Dependencies...
"


function checkDep (){
if ! command -v $1 &> /dev/null
then
    echo -e "$RED"
    echo -e "[WARNING] $1 could not be found $BLUE"
    echo -e "Trying to install $1 now.$WHITE
    "
    sudo apt-get install $1
else
    echo -e "$GREEN"
    echo -e "[FOUND] ----> $1"
fi
}


for item in ${deps[*]}
do
    checkDep $item
done


# Copy To ClipBoard Function

function copyToClip(){
    echo "$1" | xsel -ib
}

function getServerIP(){
   IP=$(hostname -I | awk '{print $1}')
    currServerPath="http://$IP:8000" 
}





echo -e "$BLUE
_________________________________________________________________________________________________________________


$GREEN
"

# Start HTTP Server
function http () {
    echo "HTTP.Server Started."
  python3 -m http.server
}


pwd=$('pwd')
PS3='
Please enter your choice: '
options=("Start HTTP Server" "Open NetCat Listener" "Lin Peas Server" "LinSmartPE Server" "LinEnum Server" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start HTTP Server")
            echo -e "$PURP"
            echo -e "HTTP.Server Started."
            python3 -m http.server
            echo -e "$GREEN "
            ;;
        "Open NetCat Listener")
            echo -e "$PURP"
            echo -e "Starting NetCat Listener"
            echo -e "Insert Listen LPORT"
            read lport
            sudo nc -nlvp $lport 
             echo -e "$GREEN "
            ;;
        "Lin Peas Server")
            echo -e "$PURP"
            echo -e "you chose choice $REPLY which is $opt"
            getServerIP
            path="$currServerPath/linpeas.sh" 
            copyToClip "$path"
            python3 -m http.server --directory "$pwd/lib/linPEAS/"
            echo -e "$GREEN "
            ;;
        "LinSmartPE Server")
            echo -e "$PURP"
            echo -e "you chose choice $REPLY which is $opt"
            getServerIP
            path="$currServerPath/lse.sh" 
            copyToClip "$path"
            python3 -m http.server --directory "$pwd/lib/LSE/"
            echo -e "$GREEN "
            ;;  
          "LinEnum Server")
            echo -e "$PURP"
            echo -e "you chose choice $REPLY which is $opt"
            getServerIP
            path="$currServerPath/LinEnum.sh" 
            copyToClip "$path"
            python3 -m http.server --directory "$pwd/lib/linEnum/"
            echo -e "$GREEN "
            ;; 
        "Quit")
            break
            ;;
        *) echo echo -e "$RED invalid option $REPLY";;
    esac
done

