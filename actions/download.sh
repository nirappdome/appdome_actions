mkdir files
mkdir output
VAR=$1
if [[ $VAR != '' ]]; then
  echo "Downloading keystore file"
  wget $VAR -O files/file.keystore
fi
VAR=$2
if [[ $VAR != '' ]]; then
  echo "Downloading json sign overrides"
  wget $VAR -O files/sign_overrides.json
fi
wget $3 -O files/vanilla.apk
ls files
