mkdir files
mkdir output
VAR=$1
if [[ $VAR == htt* ]]; then
  echo "Downloading keystore file"
  wget $VAR -O files/file.keystore
elif [[ $VAR != '!' ]]; then
  echo "copy keystore file to files/file.keystore"
  cp $VAR files/file.keystore
else
  echo "Keystore file not provided!"
fi
VAR=$2
if [[ $VAR == htt* ]]; then
  echo "Downloading json sign overrides"
  wget $VAR -O files/sign_overrides.json
elif [[ $VAR != '!' ]]; then
  echo "copy sign overrides file to files/sign_overrides.json"
  cp $VAR files/sign_overrides.json
else
  echo "sign overrides file not provided!"
fi
VAR=$3
if [[ $VAR == htt* ]]; then
  echo "Downloading vanilla application"
  wget $3 -O files/vanilla.apk
elif [[ $VAR != '!' ]]; then
  echo "copy vanilla file to files/vanilla.apk"
  cp $VAR files/vanilla.apk
else
  echo "vanilla file not provided!"
fi
ls files
