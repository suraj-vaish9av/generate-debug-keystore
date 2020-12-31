#!/bin/bash
# few constants, change these if you want or you can ask these from user
FILE_NAME="debug.keystore"
STORE_PASSWORD="android"
KEY_PASSWORD="android"
ALIAS_NAME="androiddebugkey"

# by default keystore file will be stored where this shell script resides,
# we are asking here if user want to store that file somewhere else
echo "Do you want to change the path to store the keystore file? (y/n)"
read SHOULD_CHANGE_FILE_PATH

# just changing the path wherever user want to store the keytore file
if [ "$SHOULD_CHANGE_FILE_PATH" != "${SHOULD_CHANGE_FILE_PATH#[Yy]}" ] ;then
    echo "Enter the new path:"
    read NEW_PATH
    cd $NEW_PATH
fi

# generate and store the keystore file
keytool -genkey -v -keystore $FILE_NAME -storepass $STORE_PASSWORD -alias $ALIAS_NAME -keypass $KEY_PASSWORD -keyalg RSA -keysize 2048 -validity 10000
KEYSTORE_GENERATED_RESULT=$?

if [ $KEYSTORE_GENERATED_RESULT -eq 0 ]; then
    # print the SHA1 and SHA256
    keytool -list -v -keystore $FILE_NAME -alias $ALIAS_NAME -storepass $STORE_PASSWORD -keypass $KEY_PASSWORD

    echo 
    echo "-------------------------------------------------------"
    echo "$FILE_NAME genereated successfully and stored at : "
    CURRENT_PATH=`pwd`
    echo "$CURRENT_PATH/$FILE_NAME" 
    echo 
    echo 
fi

