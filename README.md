# Appdome Android Fuse&Sign action

An action for fuse and sign you android vanilla application with Appdome.

# Usage

See [action.yml](action.yml)

```yaml
# Auto_Dev_Private_Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  android_vanilla_file: "Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Appdome fusion set id"
  sign_options: "Auto_Dev_Private_Signing"
  signing_fingerprint: "SHA1 signing fingerprint"
  appdome_key: ${{secrets.APPDOME_API_KEY}}
```
