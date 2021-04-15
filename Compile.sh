#!/bin/bash

echo 'Havingh fun with some things uwu'
echo -e '======================================================\n'

echo 'This bash compiles this repository into a new folder'
echo -e 'called compiled, makeobj must be in root folder.\n'

ReadObject() {
	local Line="$1"
	local OutputFile="$2"

	if [[ ! -z $Line ]];then
		shift
		local PosComma=`expr index "$Line" ','`
		#echo $PosComma
		#echo $Line

		if [ $PosComma -gt 1 ]
		then
			local Text=${Line:0:$((PosComma - 1))}
			Line=${Line:$PosComma:${#Line}}
			#echo $Text >> $OutputFile
			#echo $Text
			echo $Line
		fi
	fi
	#echo "test"

}


ReadLine() {
	#reads a line and adds it to the ObjectArray
	local Line="$1"
	local OutputFile="$2"

	#echo $Line
	#ReadObject $Line
	Line=$(ReadObject $Line $OutputFile)
	echo $Line
}



WriteHead() {
	local OutputFile="$1"
	echo "echovar form = FormApp.create('New Form');" >> $OutputFile
	echo "var item = form.addCheckboxItem();" >> $OutputFile
}



InputFile="test.csv"
IFS='
'
File=`cat $InputFile | tr -d '\r'`
#File=`cat $InputFile`


OutputFile="Test.sh"
`rm $OutputFile`


WriteHead $OutputFile

for Line in $File; do
	ReadLine $Line $OutputFile
	done
