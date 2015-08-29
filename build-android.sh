#!/bin/sh -e

#   ________    _______    ________                                            
#  |\   ___  \ |\  ___ \  |\   __  \                                           
#  \ \  \\ \  \\ \   __/| \ \  \|\  \                                          
#   \ \  \\ \  \\ \  \_|/__\ \  \\\  \                                         
#    \ \  \\ \  \\ \  \_|\ \\ \  \\\  \                                        
#     \ \__\\ \__\\ \_______\\ \_______\                                       
#      \|__| \|__| \|_______| \|_______|                                       
#   ________   ________                                                        
#  |\   __  \ |\   ___  \                                                      
#  \ \  \|\  \\ \  \\ \  \                                                     
#   \ \  \\\  \\ \  \\ \  \                                                    
#    \ \  \\\  \\ \  \\ \  \                                                   
#     \ \_______\\ \__\\ \__\                                                  
#      \|_______| \|__| \|__|                                                  
#   ________   ________    ________   ________   ________   ___   ________     
#  |\   __  \ |\   ___  \ |\   ___ \ |\   __  \ |\   __  \ |\  \ |\   ___ \    
#  \ \  \|\  \\ \  \\ \  \\ \  \_|\ \\ \  \|\  \\ \  \|\  \\ \  \\ \  \_|\ \   
#   \ \   __  \\ \  \\ \  \\ \  \ \\ \\ \   _  _\\ \  \\\  \\ \  \\ \  \ \\ \  
#    \ \  \ \  \\ \  \\ \  \\ \  \_\\ \\ \  \\  \|\ \  \\\  \\ \  \\ \  \_\\ \ 
#     \ \__\ \__\\ \__\\ \__\\ \_______\\ \__\\ _\ \ \_______\\ \__\\ \_______\
#      \|__|\|__| \|__| \|__| \|_______| \|__|\|__| \|_______| \|__| \|_______|
#                                                                              
#                                                                              
#       

echo " ________    _______    ________                                            ";
echo "|\\   ___  \\ |\\  ___ \\  |\\   __  \\                                           ";
echo "\\ \\  \\\\ \\  \\\\ \\   __/| \\ \\  \\|\\  \\                                          ";
echo " \\ \\  \\\\ \\  \\\\ \\  \\_|/__\\ \\  \\\\\\  \\                                         ";
echo "  \\ \\  \\\\ \\  \\\\ \\  \\_|\\ \\\\ \\  \\\\\\  \\                                        ";
echo "   \\ \\__\\\\ \\__\\\\ \\_______\\\\ \\_______\\                                       ";
echo "    \\|__| \\|__| \\|_______| \\|_______|                                       ";
echo " ________   ________                                                        ";
echo "|\\   __  \\ |\\   ___  \\                                                      ";
echo "\\ \\  \\|\\  \\\\ \\  \\\\ \\  \\                                                     ";
echo " \\ \\  \\\\\\  \\\\ \\  \\\\ \\  \\                                                    ";
echo "  \\ \\  \\\\\\  \\\\ \\  \\\\ \\  \\                                                   ";
echo "   \\ \\_______\\\\ \\__\\\\ \\__\\                                                  ";
echo "    \\|_______| \\|__| \\|__|                                                  ";
echo " ________   ________    ________   ________   ________   ___   ________     ";
echo "|\\   __  \\ |\\   ___  \\ |\\   ___ \\ |\\   __  \\ |\\   __  \\ |\\  \\ |\\   ___ \\    ";
echo "\\ \\  \\|\\  \\\\ \\  \\\\ \\  \\\\ \\  \\_|\\ \\\\ \\  \\|\\  \\\\ \\  \\|\\  \\\\ \\  \\\\ \\  \\_|\\ \\   ";
echo " \\ \\   __  \\\\ \\  \\\\ \\  \\\\ \\  \\ \\\\ \\\\ \\   _  _\\\\ \\  \\\\\\  \\\\ \\  \\\\ \\  \\ \\\\ \\  ";
echo "  \\ \\  \\ \\  \\\\ \\  \\\\ \\  \\\\ \\  \\_\\\\ \\\\ \\  \\\\  \\|\\ \\  \\\\\\  \\\\ \\  \\\\ \\  \\_\\\\ \\ ";
echo "   \\ \\__\\ \\__\\\\ \\__\\\\ \\__\\\\ \\_______\\\\ \\__\\\\ _\\ \\ \\_______\\\\ \\__\\\\ \\_______\\ ";
echo "    \\|__|\\|__| \\|__| \\|__| \\|_______| \\|__|\\|__| \\|_______| \\|__| \\|_______|";
echo "                                                                            ";
echo "                                                                            ";
echo "                                                                            ";

if [ -z "$1" ]
  then
    echo "No argument supplied."
    read -p "Do you want to continue in interactive mode? (Y/n) : " yesno
    
    if [ "$yesno" == "n" ]; then
	exit 0
    fi

    read -p "Where is your local copy of the Neo source code located? (./neoengine) : " sourcecode
    read -p "Where should the build directory be created? (./) : " builddir
    read -p "Where is your Android SDK? (./android-sdk-linux) : " androidsdk
    read -p "Where is your Android NDK? (./android-ndk-r10e) : " androidndk

else
	while getopts "s:o:a:n:h" opt; do
	case "$opt" in
	h|\?)
		echo "Possible options:"
		echo; echo -e "\t-s <path_to_neo> \t : Specifies the path to the Neo source tree"
		echo -e "\t-o <output> \t\t : Specifies the build directory"
		echo -e "\t-a <android_sdk_home> \t : Specifies the path to the Android SDK"
		echo -e "\t-n <android_ndk> \t : Specifies the path to the Android NDK"
		exit 0
		;;
	s)  sourcecode=$OPTARG
		;;
	o)  builddir=$OPTARG
		;;
	a)  androidsdk=$OPTARG
		;;
	n)  androidndk=$OPTARG
		;;

	esac
	done
fi

    echo; echo
    if [ -z "$sourcecode" ]; then
	sourcecode="./neoengine"
    fi
        
    if [ -z "$builddir" ]; then
	builddir="./"
    fi
    
    if [ -z "$androidsdk" ]; then
	androidsdk="./android-sdk-linux"
    fi
    
    if [ -z "$androidndk" ]; then
	androidndk="./android-ndk-r10e"
    fi
    
    echo; echo
    echo "Summary:"
    echo "Using Neo sources at: " $sourcecode
    echo "Creating build directory: " $builddir
    echo "Using Android SDK: " $androidsdk
    echo "Using Android NDK: " $androidndk

    read -p "Proceed? (Y/n) : " yesno
    
    if [ "$yesno" == "n" ]; then
	exit 0
    fi

startdir=$PWD
mkdir -p $builddir/cmake-build
cd $builddir/cmake-build

ANDROID_NDK=$startdir/$androidndk cmake -DCMAKE_TOOLCHAIN_FILE=$startdir/$sourcecode/CMake/Toolchains/Android.cmake $startdir/$sourcecode -DANDROID_NATIVE_API_LEVEL=android-17 -DANDROID_USE_STLPORT=TRUE
make -j8

cd ..

mkdir -p libs/armeabi-v7a
mkdir -p Additional

cp cmake-build/BinaryOutput/*.a libs/armeabi-v7a/
cp -r $startdir/$sourcecode/Additional/AndroidApp ./Additional

cd Additional/AndroidApp
$startdir/$androidndk/ndk-build -B -j8

ANDROID_HOME=$startdir/$androidsdk/ ant debug
#ANDROID_HOME=$startdir/$androidsdk/ ant release
cp bin/*.apk $startdir

cd ../../