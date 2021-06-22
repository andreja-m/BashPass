echo "Welcome to BashPass installation"
echo "i - install"
echo "h - help"
echo "u - unistall"
read INP
if [ $INP == i ]
then
  echo "In the first step you will be asked"
  echo "to log in as a super user; If you are"
  echo "installation will continue automaticly."
  read -t 1
  echo
  echo "[+] Making database"
  cd /etc
  sudo mkdir bashpass
  #sudo chmod 700 bashpass
  cd -
  cd /etc/bashpass
  sudo mkdir query
  read -t 0.25
  echo
  echo "[+] Giving database permisions"
  sudo chmod 600 query
  cd -
  read -t 0.25
  echo
  echo "[+] Copying daemon"
  cp daemon.sh bashpass
  read -t 0.25
  echo
  echo "[+] Giving the daemon permissions"
  sudo chmod 100 bashpass
  read -t 0.25
  echo
  echo "[+] Making program executable by typing 'bashpass' in terminal"
  sudo mv bashpass /usr/bin
  read -t 0.25
  echo
  echo "[+] Copying program"
  cp bp.sh bp
  sed -i -e "/cat banner.txt/d" bp
  sed -i "4 i\cat banner" bp
  read -t 0.25
  echo
  echo "[+] Giving permisions to the program"
  chmod 100 bp
  sudo mv bp /etc/bashpass
  read -t 0.25
  echo
  echo "[+] Copying banner"
  cp banner.txt banner
  chmod 200 banner
  sudo mv banner /etc/bashpass
  read -t 0.25
  echo
  echo "Your BashPass manager is intalled"
  echo "type 'bashpass' in terminal to start program"
elif [ $INP == h ]
then
  cat README.md | less
elif [ $INP == u ]
then
  sudo rm -rf /etc/bashpass/
  sudo rm -rf /usr/bin/bashpass
else
  echo
fi
