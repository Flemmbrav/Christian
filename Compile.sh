#!/bin/bash

echo 'Havingh fun with some things uwu'
echo -e '======================================================\n'

echo 'This bash compiles this repository into a new folder'
echo -e 'called compiled, makeobj must be in root folder.\n'


WriteHead() {
	local OutputFile="$1"
	local FileName="$2"
	echo "echovar form = FormApp.create('"$FileName"');" >> $OutputFile
}



ReadObject() {
	local Line="$1"
	local OutputFile="$2"
	local Language="$3"
	local IsFirst="$4"
	local Relevance=0
	local Type=""
	local Sensible=1
	local InternalName=""
	local Translation=""

	if [[ ! -z $Line ]];then
		shift
		local PosComma=`expr index "$Line" ','`
		#echo $PosComma
		#echo $Line

		if [ $PosComma -gt 1 ]
		then
			#local Text=${Line:0:$((PosComma - 1))}
			Relevance=${Line:0:$((PosComma - 1))}
			Line=${Line:$PosComma:${#Line}}
			#echo $Text >> $OutputFile
			#echo $Text
			#echo $Line
		fi
		PosComma=`expr index "$Line" ','`
		if [ $PosComma -gt 1 ]
		then
			Type=${Line:0:$((PosComma - 1))}
			Line=${Line:$PosComma:${#Line}}
		fi
		PosComma=`expr index "$Line" ','`
		if [ $PosComma -gt 1 ]
		then
			Sensible=${Line:0:$((PosComma - 1))}
			Line=${Line:$PosComma:${#Line}}
		fi
		PosComma=`expr index "$Line" ','`
		if [ $PosComma -gt 1 ]
		then
			InternalName=${Line:0:$((PosComma - 1))}
			Line=${Line:$PosComma:${#Line}}
		fi
	fi
	#echo "test"
	echo $InternalName

}


ReadLine() {
	#reads a line and adds it to the ObjectArray
	local Line="$1"
	local OutputFile="$2"

	#echo $Line
	#ReadObject $Line
	Line=$(ReadObject $Line $OutputFile "")
	echo $Line
}





InputFile="test.csv"
FileName="testform"
IFS='
'
File=`cat $InputFile | tr -d '\r'`
#File=`cat $InputFile`


OutputFile="Test.sh"
`rm $OutputFile`


WriteHead $OutputFile $FileName

for Line in $File; do
	ReadLine $Line $OutputFile
	done
