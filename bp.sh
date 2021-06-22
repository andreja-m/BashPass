function banner()
{
  echo "========================================="
  cat banner.txt
  echo "========================================="
  echo
  echo "r - read password query"
  echo "c - create new password query"
  echo "e - edit/detele your password querys"
  echo "b - bonus: basic string encrypt"
  echo "x - exit"
  echo
}

function menu()
{
  read INP
  if [ $INP == r ]
  then
    open
  elif [ $INP == c ]
  then
    create
  elif [ $INP == e ]
  then
    rud
  elif [ $INP == b ]
  then
    encryption
  elif [ $INP == x ]
  then
    exit
  else
    clear
    echo "wrong input"
    read -t 0.5
    clear
    app
  fi
}

function open()
{
  clear
  cd query
  echo "=============================="
  echo "**This is your passwod query**"
  echo "=============================="
  ls | rev | cut -c4- | rev
  echo "=============================="
  read INP
  echo "====================="
  cat $INP.gz | gzip -d
  echo "====================="
  echo "Press enter for back."
  echo "====================="
  read
  cd ..
  app
}

function create()
{
  clear
  echo "=============================="
  echo "[+] Enter name of the page: "
  echo "=============================="
  echo
  read NAME
  cd query
  touch $NAME

  echo "=============================="
  echo "[+] Enter name of the platform: "
  echo "=============================="
  echo
  read PLATFORM
  echo "[+] Platform: " $PLATFORM >> $NAME

  echo "=============================="
  echo "[+] Enter username/mail: "
  echo "=============================="
  echo
  read USER
  echo "[+] Username: " $USER >> $NAME

  echo "=============================="
  echo "[+] Enter password: "
  echo "=============================="
  echo
  read PASS
  echo "[+] Password: " $PASS >> $NAME

  gzip $NAME

  cd ..

  #read ENC = $NAME | base64
  #touch ENC

  app
}

function rud()
{
  clear
  echo "=============================="
  echo "THIS IS YOUR PASSWORD QUERY!!!"
  echo "=============================="
  echo
  cd query
  ls | rev | cut -c4- | rev
  echo
  read NAME
  echo
  cat $NAME.gz | gzip -d
  echo
  echo "======================================"
  echo "what do you want to do with this note?"
  echo "e - edit"
  echo "d - delete"
  echo "======================================"
  echo
  read INP
  if [ $INP == e ]
  then
    rm -rf $NAME.gz
    cd ..
    create
  elif [ $INP == d ]
  then
    rm -rf $NAME.gz
    cd ..
    app
  else
    cd ..
    app
  fi
}

function againEncrypt()
{
  echo "do you want to encrypt again?"
  echo "y/n"
  read INPUT
  if [ $INPUT == y ]
  then
    encryption
  else
    app
  fi
}

function encryption()
{
  echo "================"
  echo "Chose encryption"
  echo "1) base32"
  echo "2) base64"
  echo "3) md5"
  echo "4) rot13"
  echo "5) sha256"
  echo "6) sha512"
  echo "================"
  read INPUT 
  if [ $INPUT -eq 1 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | base32
    againEncrypt
  elif [ $INPUT -eq 2 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | base64
    againEncrypt
  elif [ $INPUT -eq 3 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | md5sum
    againEncrypt
elif [ $INPUT -eq 4 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | tr 'A-Za-z' 'N-ZA-Mn-za-m'
    againEncrypt
elif [ $INPUT -eq 5 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | base32
    againEncrypt
elif [ $INPUT -eq 6 ]
  then
    echo "enter string"
    read INPUT 
    echo $INPUT | base32
    againEncrypt
  else
    echo "wrong"
  fi
}

function app()
{
  clear
  banner
  menu
}

app
