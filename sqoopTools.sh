bold=`echo -en "\e[1m"`
underline=`echo -en "\e[4m"`
dim=`echo -en "\e[2m"`
strickthrough=`echo -en "\e[9m"`
blink=`echo -en "\e[5m"`
reverse=`echo -en "\e[7m"`
hidden=`echo -en "\e[8m"`
normal=`echo -en "\e[0m"`
black=`echo -en "\e[30m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
purple=`echo -en "\e[35m"`
aqua=`echo -en "\e[36m"`
gray=`echo -en "\e[37m"`
darkgray=`echo -en "\e[90m"`
lightred=`echo -en "\e[91m"`
lightgreen=`echo -en "\e[92m"`
lightyellow=`echo -en "\e[93m"`
lightblue=`echo -en "\e[94m"`
lightpurple=`echo -en "\e[95m"`
lightaqua=`echo -en "\e[96m"`
white=`echo -en "\e[97m"`
default=`echo -en "\e[39m"`
BLACK=`echo -en "\e[40m"`
RED=`echo -en "\e[41m"`
GREEN=`echo -en "\e[42m"`
ORANGE=`echo -en "\e[43m"`
BLUE=`echo -en "\e[44m"`
PURPLE=`echo -en "\e[45m"`
AQUA=`echo -en "\e[46m"`
GRAY=`echo -en "\e[47m"`
DARKGRAY=`echo -en "\e[100m"`
LIGHTRED=`echo -en "\e[101m"`
LIGHTGREEN=`echo -en "\e[102m"`
LIGHTYELLOW=`echo -en "\e[103m"`
LIGHTBLUE=`echo -en "\e[104m"`
LIGHTPURPLE=`echo -en "\e[105m"`
LIGHTAQUA=`echo -en "\e[106m"`
WHITE=`echo -en "\e[107m"`
DEFAULT=`echo -en "\e[49m"`;
start-all.sh
clear
echo "Please Enter Your Name"
read name
echo -e "Welcome \e[4m"$lightyellow$dim$name"\e[0m, Here You Can Perform Various Sqoop Tasks"
echo ""


echo -e '\e[0m'$aqua'\e[0m'
echo -e '\e[0m'$aqua'███████╗ ██████╗  ██████╗  ██████╗ ██████╗     ████████╗ ██████╗  ██████╗ ██╗     ███████╗\e[0m'
echo -e '\e[0m'$aqua'██╔════╝██╔═══██╗██╔═══██╗██╔═══██╗██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝\e[0m'
echo -e '\e[0m'$aqua'███████╗██║   ██║██║   ██║██║   ██║██████╔╝       ██║   ██║   ██║██║   ██║██║     ███████╗\e[0m'
echo -e '\e[0m'$aqua'╚════██║██║▄▄ ██║██║   ██║██║   ██║██╔═══╝        ██║   ██║   ██║██║   ██║██║     ╚════██║\e[0m'
echo -e '\e[0m'$aqua'███████║╚██████╔╝╚██████╔╝╚██████╔╝██║            ██║   ╚██████╔╝╚██████╔╝███████╗███████║\e[0m'
echo -e '\e[0m'$aqua'╚══════╝ ╚══▀▀═╝  ╚═════╝  ╚═════╝ ╚═╝            ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝\e[0m'
echo -e '\e[0m'$aqua'                                                                                          \e[0m'
echo -e '	Author: \e[4m'$yellow$RED'PRABHAT SRIVASTAVA\e[0m'
echo -e '	Contact: \e[4m'$yellow$RED'+919336836104\e[0m'
echo -e '	email: \e[4m'$yellow$RED'srivastavaprbhat23@gmail.com\e[0m'
echo ''

while :
do
	echo -e '\e[0m'$red$LIGHTYELLOW"Choose From The Options\e[0m"
	echo -e "\e[0m"$aqua"Press 1 To Import\e[0m"
	echo -e "\e[0m"$aqua"Press 2 To Export\e[0m"
	echo -e "\e[0m"$aqua"Press 3 To List Tables Or Databases\e[0m"
	echo -e "\e[0m"$aqua"Press 4 For Job Operations\e[0m"
	echo -e "\e[0m"$aqua"Press 5 For Codegen\e[0m"
	echo -e "\e[0m"$aqua"Press 6 For Incremental Import\e[0m"
	echo -e "\e[0m"$aqua"Press 7 To See Results of Incremental Import\e[0m"
	echo -e "\e[0m"$aqua"Press 8 For Incremental Export\e[0m"
	echo -e "\e[0m"$aqua"Press 0 To Exit\e[0m"

	read label
	case $label in

	0) break
	;;
#Import
	1) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name To Import\e[0m"
		read databaseName
		echo -e '\e[0m'$red$LIGHTYELLOW"Enter Table Name Whose Fields Is To Be Imported\e[0m"
		read tableName
		echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Path of Target Directory In HDFS Starting With Root\e[0m"
		read targetPath
		sqoop import --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root -P -m 1 --target-dir $targetPath
	;;
#Export
	2) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name To Export\e[0m"
        	read databaseName
        	echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Path of Source File From HDFS Starting With Root\e[0m"
        	read sourceFile
		echo -e "\e[0m"$aqua"Press 1 To Export In Existing Table\e[0m"
		echo -e "\e[0m"$aqua"Press 2 To Create New Table To Export\e[0m"
		read label
		case $label in
		#Export In Existing Table
		1) echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Existing Table Name In Which Fields Will Be Inserted\e[0m"
               		read tableName
	        	sqoop export --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root -P --export-dir $sourceFile --input-fields-terminated-by ','
		;;
		#Export To New Table
		2) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Table Name To Be Created\e[0m"
			read tableName
			echo -e '\e[0m'$red$LIGHTYELLOW"Enter Number Of Columns To Be Created\e[0m"
			read col
			args=""
			for ((i=1;i<=col;i++))
			do
				echo -e '\e[0m'$red$LIGHTYELLOW"Enter Column "$i" Name\e[0m"
				read column
				echo -e '\e[0m'$red$LIGHTYELLOW"Enter DataType\e[0m"
				read dataType
				args=$args$column" "$dataType
				if [ $i != $col ]
				then
					args=$args','
				fi
			done
			sqoop eval --connect jdbc:mysql://localhost/$databaseName --username root -query "create table $tableName($args)" -P
			sqoop export --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root -P --export-dir $sourceFile --input-fields-terminated-by ','
		;;

		*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
		;;

		esac
	;;
#List
	3) echo -e "\e[0m"$aqua"Press 1 To List Databases\e[0m"
		echo -e "\e[0m"$aqua"Press 2 To List Tables\e[0m"
		read label
		case $label in
		#Databases Listing
		1) sqoop list-databases --connect jdbc:mysql://localhost/ --username root -P
		;;
		#tables Listing
		2) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name To List All Its Tables\e[0m"
			read databaseName
			sqoop list-tables --connect jdbc:mysql://localhost/$databaseName --username root -P
		;;

		*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
		;;
		esac
	;;
#Job
	4) echo -e "\e[0m"$aqua"Press 1 To Create A Job\e[0m"
		echo -e "\e[0m"$aqua"Press 2 To List Jobs\e[0m"
		echo -e "\e[0m"$aqua"Press 3 To Show A Job\e[0m"
		echo -e "\e[0m"$aqua"Press 4 To Execute A Job\e[0m"
		read label
		case $label in
#Job Creation
		1) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name\e[0m"
			read databaseName
			echo -e '\e[0m'$red$LIGHTYELLOW"Enter Name of Job To Be Created\e[0m"
			read jobName
			echo -e "\e[0m"$aqua"Press 1 To Create An Import Job\e[0m"
			echo -e "\e[0m"$aqua"Press 2 To Create An Export Job\e[0m"
			read label
			case $label in
		#Import Job
			1) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Table Name To Be Imported\e[0m"
				read tableName
				echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Path of Target Directory In HDFS\e[0m"
				read targetPath
				sqoop job --create $jobName -- import --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root -m 1 --target-dir $targetPath
			;;
		#Export Job
			2) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name Where Fields Will Be Exported\e[0m"
               			read databaseName
               			echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Path of Source File From HDFS\e[0m"
		        	read sourceFile
               			echo -e "\e[0m"$aqua"Press 1 To Export In Existing Table\e[0m"
			        echo -e "\e[0m"$aqua"Press 2 To Create New Table To Export\e[0m"
        		       	read label
			        case $label in
		       #Export In Existing Table
        		        1) echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Existing Table Name In Which Fields Will Be Exported\e[0m"
				    	read tableName
                			sqoop job --create $jobName -- export --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root --export-dir $sourceFile --input-fields-terminated-by ','
                		;;
                	#Export To New Table
		        	2) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Table Name To Be Created\e[0m"
                			read tableName
		        		echo -e '\e[0m'$red$LIGHTYELLOW"Enter Number Of Columns To Be Created\e[0m"
                			read col
		       			args=""
                    			for ((i=1;i<=col;i++))
		        		do
                		    		echo -e '\e[0m'$red$LIGHTYELLOW"Enter "$i" Column\e[0m"
                				read column
		          			echo -e '\e[0m'$red$LIGHTYELLOW"Enter DataType\e[0m"
                    				read dataType
                        			args=$args$column" "$dataType
                				if [ $i != $col ]
                        			then
		                    			args=$args','
                				fi
					done
                    			sqoop eval --connect jdbc:mysql://localhost/$databaseName --username root -query "create table $tableName($args)" -P
                    			sqoop job --create $jobName -- export --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root --export-dir $sourceFile --input-fields-terminated-by ','
        			;;

				*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
				;;
				esac
			;;

			*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
			;;
			esac
		;;
#Job Listing
		2) sqoop job --list
		;;
#Show Job
		3) echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Name of Job To Show\e[0m"
			read jobName
			sqoop job --show $jobName
		;;
#Job Execution
		4)  echo -e '\e[0m'$red$LIGHTYELLOW"Enter The Name of Job To Be Executed\e[0m"
			read jobName
			sqoop job --exec $jobName
		;;

		*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
		;;
		esac
	;;
#Codegen
	5) echo -e '\e[0m'$red$LIGHTYELLOW"Enter Database Name\e[0m"
		read databaseName
		echo -e '\e[0m'$red$LIGHTYELLOW"Enter Table Name\e[0m"
		read tableName
		sqoop codegen --connect jdbc:mysql://localhost/$databaseName --username root --table $tableName -P
	;;
#Incremental Import
	6) echo -e '\e[0m'$red$LIGHTYELLOW'Enter Database Name\e[0m'
		read databaseName
		echo -e '\e[0m'$red$LIGHTYELLOW'Enter The Source Table Name For Incremental Import\e[0m'
		read tableName
		echo -e '\e[0m'$red$LIGHTYELLOW"Enter Job Name To Be Created For Incremental Import\e[0m"
		read jobName
		echo -e '\e[0m'$red$LIGHTYELLOW"Enter Last Value\e[0m"
		read lastValue
		echo -e '\e[0m'$lightyellow$RED"After Successfull Creation of Job Execute That Job Every Time For Incremental Import\e[0m"
		sqoop job --create $jobName -- import --connect jdbc:mysql://localhost/$databaseName --table $tableName --username root -m 1 --incremental append --check-column id --last-value $lastValue
	;;
#Incremental Import Results
	7) echo -e '\e[0m'$red$LIGHTYELLOW'Enter Database Name of The Desired Incremental Import Result\e[0m'
		read databaseName
		echo -e '\e[0m'$red$LIGHTYELLOW'Enter Table Name of The Desired Incremental Import Result\e[0m'
		read tableName
		hadoop fs -cat /user/$databaseName/$tableName/part-m-*
	;;
#Incremental Export
	8) echo -e '\e[0m'$lightyellow$RED"Work In Progress :)\e[0m"
	;;

	*) echo -e '\e[0m'$lightyellow$RED"Wrong Input\e[0m"
	;;
	esac
done
echo -e "Thank You "'\e[4m'$red$LIGHTYELLOW$name'\e[0m\e[0m'
exit
