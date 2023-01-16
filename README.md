# Appdome Android Fuse&Sign action

An action for fuse and sign you android vanilla application with Appdome.

# Usage

See [action.yml](action.yml)

```yaml
# Appdome Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  android_vanilla_file: "Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Appdome fusion set id"
  sign_options: "Appdome_Signing"
  appdome_key: ${{secrets.APPDOME_API_KEY}}
  sign_overrides: "Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
  keystore_file: "Https download link OR path to keystore file on your repository"
  keystore_password: "keystore_password"
  keystore_alias: "keystore_alias"
  key_pass: "keystore key password"

# Private Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  android_vanilla_file: "Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Appdome fusion set id"
  sign_options: "Private_Signing"
  signing_fingerprint: "SHA1 signing fingerprint"
  appdome_key: ${{secrets.APPDOME_API_KEY}}
  google_play_signing: true/false
  sign_overrides: "Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "


# Auto-Dev Private Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  android_vanilla_file: "Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Appdome fusion set id"
  sign_options: "Auto_Dev_Private_Signing"
  signing_fingerprint: "SHA1 signing fingerprint"
  appdome_key: ${{secrets.APPDOME_API_KEY}}
  google_play_signing: true
```
