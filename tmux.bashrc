IP='^192\.168\.[0-9]{2,3}\.[0-9]{2,3}:[0-9]{4,5}\s*$'
PORT='^[0-9]{4,5}\s*$'

adb_connect() {
  if [[ "$1" =~ $IP ]]
  then
    echo "Connect to IP" $1
    adb connect $1
  elif [[ "$1" =~ $PORT ]]
  then
    echo "Connect to localhost":$1
    adb connect localhost:$1
  else
    echo "Wrong input."
  fi
}

adb_pair() {
  if [[ "$1" =~ $IP ]]
  then
    echo "Pair with IP" $1
    adb pair $1
  elif [[ "$1" =~ $PORT  ]]
  then
    echo "Pair with localhost":$1
    adb pair localhost:$1
  else
    echo "Wrong input"
  fi
}

alias ac=adb_connect
alias ad="echo adb disconnect;adb disconnect"
alias ak="echo adb kill-server;adb kill-server"
alias ap=adb_pair
alias as="echo adb shell;adb shell"
alias shizuku="adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh"

