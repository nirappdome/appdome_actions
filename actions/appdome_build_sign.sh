# $1 = ${{github.event.inputs.sign_otions}}
# $2 = ${{github.event.inputs.sign_overrids}}
# $3 = ${{github.event.inputs.google_play_signing}}
# $4 = ${{github.event.inputs.fusion_set_id}}
# $5 = ${{github.event.inputs.keystore_password}}
# $6 = ${{github.event.inputs.keystore_alias}}
# $7 = ${{github.event.inputs.key_pass}}
# $8 = ${{github.event.inputs.signing_fingerprint}}


CHOICE=$1
if [[ $CHOICE == "Appdome Signing" ]];then
  VAR=$2
  if [[ -n $VAR ]]; then
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --sign_on_appdome -fs $4 --keystore ./files/file.keystore --keystore_pass $5 --keystore_alias $6 --key_pass $7 --sign_overrides files/sign_overrides.json --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
  else
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --sign_on_appdome -fs $4 --keystore ./files/file.keystore --keystore_pass $5 --keystore_alias $6 --key_pass $7 --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
  fi
elif [[ $CHOICE == "Private Signing" ]];then
  VAR=$2
  if [[ -n $VAR ]]; then
    VAR=$3
    if [ $VAR = true ] ; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --private_signing -fs $4 --signing_fingerprint $8 --sign_overrides files/sign_overrides.json --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --private_signing -fs $4 --signing_fingerprint $8 --sign_overrides files/sign_overrides.json --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    fi
  else
    VAR=$3
    if [ $VAR = true ] ; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --private_signing -fs $4 --signing_fingerprint $8 --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --private_signing -fs $4 --signing_fingerprint $8 --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    fi
  fi
elif [[ $CHOICE == "Auto-Dev Private Signing" ]];then
  sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} --app ./files/vanilla.apk --auto_dev_private_signing -fs $4 --signing_fingerprint $8 --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
fi
ls output
