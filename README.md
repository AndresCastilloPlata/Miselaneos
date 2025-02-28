# permissions_app

A new Flutter project.

Renombrar App ID
```
dart run change_app_package_name:main com.andrescastilloplata.permissions_app
```

sha-256
```
cd android

./gradlew signingReport
```

prueba

```
adb shell 'am start -a android.intent.action.VIEW \
    -c android.intent.category.BROWSABLE \
    -d "https://deep-linking-flutter-pokemon-production.up.railway.app/pokemons/1/"' \
    com.andrescastilloplata.permissions_app

```