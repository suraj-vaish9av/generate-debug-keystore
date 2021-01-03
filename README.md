# generate-debug-keystore

While developing android apps, we often have encountered a problem when moving our android project to another system, we need to reconfigure the SHA1 in various platforms like Firebase, Facebook, etc.

To get rid of this problem, we can create a debug Keystore file, and configure it in our build.gradle(app level) file, so that the same Keystore file could be used across the system.



<h3>Step 1: To generate debug.keystore, you can download this shell script file, and run it : </h3>
 
 ```
sh generate-debug-keystore.sh
```

It will ask you to enter some relevant data, proceed with it, and it will generate your debug.keystore

Note: This will also print the SHA1, copy it if you may need to give it to firebase or Facebook, etc. 

<h3>Step 2: Configure it in your build.gradle (app level) </h3> 


```
 android {
    ...
    signingConfigs {
        debug {
            storeFile file('../debug.keystore')
            storePassword 'android'
            keyAlias = 'androiddebugkey'
            keyPassword 'android'
        }
    }
}
 
  ```

You can store debug.keystore under the project's root directory, and set the path for storeFile:  '../debug.keystore'
Other fields storePassword, keyAlias, keyPassword must match with those which were used when generating debug.keystore file.




