# ${args[0]} = ${{github.event.inputs.sign_options}}
# ${args[1]} = ${{github.event.inputs.sign_overrids}}
# ${args[2]} = ${{github.event.inputs.google_play_signing}}
# ${args[3]} = ${{github.event.inputs.fusion_set_id}}
# ${args[4]} = ${{github.event.inputs.keystore_password}}
# ${args[5]} = ${{github.event.inputs.keystore_alias}}
# ${args[6]} = ${{github.event.inputs.key_pass}}
# ${args[7]} = ${{github.event.inputs.signing_fingerprint}}
# ${args[8]} = ${{secrets.APPDOME_API_KEY}}
args=("$@")
CHOICE=${args[0]}
if [[ $CHOICE == "Appdome_Signing" ]];then
  VAR=${args[1]}
  if [[ $VAR != '!' ]]; then
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --sign_on_appdome -fs ${args[3]} --keystore ./files/file.keystore --keystore_pass ${args[4]} --keystore_alias ${args[5]} --key_pass ${args[6]} --sign_overrides files/sign_overrides.json --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
  else
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --sign_on_appdome -fs ${args[3]} --keystore ./files/file.keystore --keystore_pass ${args[4]} --keystore_alias ${args[5]} --key_pass ${args[6]} --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
  fi
elif [[ $CHOICE == "Private_Signing" ]];then
  VAR=${args[1]}
  if [[ $VAR != '!' ]]; then
    VAR=${args[2]}
    if [ $VAR = true ] ; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --private_signing -fs ${args[3]} --signing_fingerprint ${args[7]} --sign_overrides files/sign_overrides.json --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --private_signing -fs ${args[3]} --signing_fingerprint ${args[7]} --sign_overrides files/sign_overrides.json --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    fi
  else
    VAR=${args[2]}
    if [ $VAR = true ] ; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --private_signing -fs ${args[3]} --signing_fingerprint ${args[7]} --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --private_signing -fs ${args[3]} --signing_fingerprint ${args[7]} --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
    fi
  fi
elif [[ $CHOICE == "Auto_Dev_Private_Signing" ]];then
  sudo python3 appdome/appdome-api-python/appdome_api.py -key ${args[8]} --app ./files/vanilla.apk --auto_dev_private_signing -fs ${args[3]} --signing_fingerprint ${args[7]} --google_play_signing --output ./output/appdome_vanilla.apk --certificate_output ./output/certificate.pdf
fi
ls output
