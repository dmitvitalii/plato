# Description #

These scripts are made to make work with Android Framework and Android applications easier.

## plato ##
Plato stands for **PLA**tform **TO**ols. A tool, which combines several shortcuts and scripts, used for the android platform development.

Future replacement for all of the other scripts in this repository.

## la root ##
`la rr` or `la root` performs the `adb root && adb remount`

*(`rr` script replacement)*

## la push ##
Gets an apk and pushes it on the device. Figures out where to push by itself, e.g.:
```
la push Dialer.apk
```
Will push Dialer to the `/system/priv-app/Dialer/` dir.
```
la push Stk.apk
```
Will push it to the `/system/app/Stk/` dir.

**TODO:** Add an ability to push the whole directory, instead of pushing just an `.apk` file.

*(`push_apk` script replacement)*

## mignore ##

Works only for projects with `Android.mk`. If you have Android O with `Android.bp` files, the script won't work for you yet.

Script to make Android projects be excluded from the build system, or included back.
Just renames the Android.mk file to AndroidIgnore.mk, which won't be included in the main mk file while building.
**Example**:
```
mignore $ANDROID_BUILD_TOP/packages/apps/Dialer
```
Will exclude Dialer application from build if there is an `Android.mk` file.

```
mignore $ANDROID_BUILD_TOP/packages/apps/Dialer
```
Will make Dialer be buildable again, if there is an `.ignore.Android.mk` file.

**TODO:**
* Make it be able to set `enabled: false/true` to `Android.bp` files and ignore a project in any build systems;
* Make it recursive with an `r` key and nonrecursive without it;

## fast ##
Script, made to simplify pushing firmwares to the device.
**Usage**:
```
fast -rU
```
Will flash device with userdata and reboot.

## flashd ##
Simple script, which also pushes firmwares to devices, but with only device ids as a parameter,
and optimised to use on Raspberry Pi (with 768Mb RAM minimum).
**Usage**:
```
flashd 123ab456 789cd987
```

## dget ##
Script to download bugreports and databases from an android device.

## cpstr ##
Script to copy all strings from one directory with .xml files to another.
**Example**:
```
cpstr -s /path/to/directory/res -d /path/to/dir/res -c "name=\"mongooze\""
```

## pai ##
```
adb root
adb remount
adb push *.idc /system/usr/idc
adb reboot
```

## inst ##
Dummy script.
Installs some built framework projects:
- InputFlinger;
- Framework;
- Framework Services;
- SystemUI.

## gerpush ##
Push changes to gerrit. Instead of alias again.

## findout ##
Find something inside the `out/` directory of AOSP build tree.
```
findout LIBTHEsome.so # strict search
findout -f thesome # case insensitive search of a word entrances
```

## pl & pb ##

Push libraries or binaries to the `/system/lib64` and `/system/bin` respectively.
TODO: "pusher" with an ability to push with chosing where to push: `/system`, `/vendor`, or even `/data`.

## License ##

```
Copyright (C) 2019 Vitalii Dmitriev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
