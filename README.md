# Description #

These scripts are made to make work with Android Framework and Android applications easier.

## plato ##
Plato stands for **PLA**tform **TO**ols. A tool, which combines several shortcuts and scripts, used for the android platform development.

Future replacement for all of the other scripts in this repository.

## la root ##
`la rr` or `la root` performs the `adb root && adb remount`

## la push ##
Gets an apk and pushes it on the device. Figures out where to push by itself, e.g.:
```
la push Dialer.apk
```
Will push Dialer to the `/system/priv-app/Dialer/` dir.
```
la push Stk
```
Will push it to the `/system/app/Stk/` dir.
```
la push -d SystemUI
```
Will push everything from `SystemUI/` directory, including `oat/` to `/system/priv-app/SystemUI` directory.

## la make ##
Builds a firmware or an application. Here are some options.

To build a firmware using number of cores + 1, with a previously initialized environment:
```
la make
```

To setup a `userdebug` build and build a frameworks.jar using 5 jobs for `make`:
```
la make --lunch userdebug --app platform/frameworks/base -j5
```

To setup an `eng` build and build a firmware using 8 jobs:
```
la make -l eng -j8
```

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
~~Push changes to gerrit. Instead of alias again.~~ 

`la ship branch_name`

## findout ##
Find something inside the `out/` directory of AOSP build tree.
```
findout LIBTHEsome.so # strict search
findout -f thesome # case insensitive search of a word entrances
```

## pl & pb ##

~~Push libraries or binaries to the `/system/lib64` and `/system/bin` respectively.~~

`la push some.so`
