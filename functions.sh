#!/bin/bash

#inside this file are all fuctions necessary to connect to Huawei FusionSolarApp API


inverter_state () {
# List of possible Inverter Status (inverter_state) Description by Huawei. Based on documentation SmartPVMS.V300R006C10_API_Northbound.Interface.Reference.1.pdf pages 87-88 and my own obserations of device status and new documentation SmartPVMS V500R007C00 Northbound Interface Reference.pdf pages 97-98

#both documents
if [ $1 == "000"  ] ||  [ $1 == "0" ];
then
	printf "Standby: initializing"
elif [ $1 == "001"  ] ||  [ $1 == "1" ];
then	
	printf "Standby: insulation resistance detection"
elif [ $1 == "002"  ] ||  [ $1 == "2" ];
then	
	printf "Standby: sunlight detection"
elif [ $1 == "003"  ] ||  [ $1 == "3" ];
then	
	printf "Standby: power grid detection"
		
#SmartPVMS V500R007C00	version
elif [ $1 == "256"  ];
then	
	printf "Start"	
elif [ $1 == "512"  ];
then	
	printf "Grid-connected"
elif [ $1 == "513"  ];
then	
	printf "Grid connection: limited power"		
elif [ $1 == "514"  ];
then	
	printf "Grid connection: self-derating"	
elif [ $1 == "768"  ];
then	
	printf "Shutdown: unexpected shutdown"
elif [ $1 == "769"  ];
then	
	printf "Shutdown: commanded shutdown"
elif [ $1 == "770"  ];
then	
	printf "Shutdown: OVGR"
elif [ $1 == "771"  ];
then	
	printf "Shutdown: communication disconnection"
elif [ $1 == "772"  ];
then	
	printf "Shutdown: limited power"
elif [ $1 == "773"  ];
then	
	printf "Shutdown: manual startup is required"	
elif [ $1 == "774"  ];
then	
	printf "Shutdown: DC switch disconnected"
elif [ $1 == "1025"  ];
then	
	printf "Grid schedule: cosφ-P curve"
elif [ $1 == "1026"  ];
then	
	printf "Grid schedule: Q-U curve"
elif [ $1 == "1280"  ];
then	
	printf "Spot-check ready"
elif [ $1 == "1281"  ];
then	
	printf "Spot-checking"
elif [ $1 == "1536"  ];
then	
	printf "Inspecting"
elif [ $1 == "1792"  ];
then	
	printf "AFCI self-check"
elif [ $1 == "2048"  ];
then	
	printf "I-V scanning"
elif [ $1 == "2304"  ];
then	
	printf "DC input detection"
elif [ $1 == "40960"  ];
then
	printf "Standby: No sunlight"
elif [ $1 == "45056"  ];
then
	printf "Communication disconnection (written by the SmartLogger)"
elif [ $1 == "49152"  ];
then
	printf "Loading (written by the SmartLogger)"
	
#SmartPVMS V300R006C10	version
elif [ $1 == "100"  ];
then	
	printf "Startup"
elif [ $1 == "200"  ];
then	
	printf "On-grid"
elif [ $1 == "201"  ];
then	
	printf "Grid connection: power limited"
elif [ $1 == "202"  ];
then	
	printf "Grid connection: self-derating"
elif [ $1 == "300"  ];
then	
	printf "Shutdown: unexpected shutdown"	
elif [ $1 == "301"  ];
then	
	printf "Shutdown: commanded shutdown"
elif [ $1 == "302"  ];
then	
	printf "Shutdown: OVGR"
elif [ $1 == "303"  ];
then	
	printf "Shutdown: communication disconnection"	
elif [ $1 == "304"  ];
then	
	printf "Shutdown: limited power"
elif [ $1 == "305"  ];
then	
	printf "Shutdown: manual startup is required"
elif [ $1 == "306"  ];
then	
	printf "Shutdown: DC switch disconnected"
elif [ $1 == "401"  ];
then	
	printf "Grid schedule: cosφ-P curve"
elif [ $1 == "402"  ];
then	
	printf "Grid schedule: Q-U curve"
elif [ $1 == "500"  ];
then	
	printf "Spot-check ready"
elif [ $1 == "501"  ];
then	
	printf "Spot-checking"
elif [ $1 == "600"  ];
then	
	printf "Inspecting"
elif [ $1 == "700"  ];
then	
	printf "AFCI self-test"
elif [ $1 == "800"  ];
then	
	printf "I-V scanning"
elif [ $1 == "900"  ];
then	
	printf "DC input detection"
elif [ $1 == "a000"  ] ||  [ $1 == "A000" ];
then	
	printf "Standby: No sunlight"
elif [ $1 == "b000"  ] ||  [ $1 == "B000" ];
then	
	printf "Communication disconnection (written by the SmartLogger)"
elif [ $1 == "c000"  ] ||  [ $1 == "C000" ];
then	
	printf "Loading (written by the SmartLogger)"	
else
	printf "Unknown state"
fi


} 

Device_type_ID () {
# List of possible smart devices in Power Plant by Huawei. Based on documentation SmartPVMS.V300R006C10_API_Northbound.Interface.Reference.1.pdf pages 28-30 and SmartPVMS V500R007C00 Northbound Interface Reference.pdf pages 41-42

if [ -z "$2" ];
then
	#SmartPVMS V500R007C00	version
	if [ $1 == "1"  ];
	then	
		printf "String Inverter"	
	elif [ $1 == "8"  ];
	then	
		printf "Transformer"
	elif [ $1 == "10"  ];
	then	
		printf "EMI"
	elif [ $1 == "13"  ];
	then	
		printf "Protocol converter"
	elif [ $1 == "16"  ];
	then	
		printf "General device"
	elif [ $1 == "17"  ];
	then	
		printf "Grid meter"
	elif [ $1 == "22"  ];
	then	
		printf "PID"
	elif [ $1 == "37"  ];
	then	
		printf "Pinnet data logger"
	elif [ $1 == "38"  ];
	then	
		printf "Residential inverter"
	elif [ $1 == "39"  ];
	then	
		printf "Battery"
	elif [ $1 == "40"  ];
	then	
		printf "Backup Box"
	elif [ $1 == "45"  ];
	then	
		printf "PLC"
	elif [ $1 == "46"  ];
	then	
		printf "Optimizer"
	elif [ $1 == "47"  ];
	then	
		printf "Power Sensor"
	elif [ $1 == "62"  ];
	then	
		printf "Dongle"
	elif [ $1 == "63"  ];
	then	
		printf "Distributed SmartLogger"
	elif [ $1 == "70"  ];
	then	
		printf "Safety box"

	#SmartPVMS V300R006C10	version
	elif [ $1 == "2"  ];
	then	
		printf "SmartLogger"
	elif [ $1 == "3"  ];
	then	
		printf "String"
	elif [ $1 == "6"  ];
	then	
		printf "Bay"
	elif [ $1 == "7"  ];
	then	
		printf "Busbar"
	elif [ $1 == "9"  ];
	then	
		printf "Transformer meter"
	elif [ $1 == "11"  ];
	then	
		printf "AC combiner box"
	elif [ $1 == "14"  ];
	then	
		printf "Central Inverter"
	elif [ $1 == "15"  ];
	then	
		printf "DC combiner box"
	elif [ $1 == "18"  ];
	then	
		printf "Step-up station"
	elif [ $1 == "19"  ];
	then	
		printf "Factory-used energy generation area meter"
	elif [ $1 == "20"  ];
	then	
		printf "Solar power forecasting system"
	elif [ $1 == "21"  ];
	then	
		printf "Factory-used energy non-generation area meter"
	elif [ $1 == "23"  ];
	then	
		printf "Virtual device of plant monitoring system"
	elif [ $1 == "24"  ];
	then	
		printf "Power quality device"
	elif [ $1 == "25"  ];
	then	
		printf "Step-up transformer"
	elif [ $1 == "26"  ];
	then	
		printf "Photovoltaic grid-connection cabinet"
	elif [ $1 == "27"  ];
	then	
		printf "Photovoltaic grid-connection panel"
	elif [ $1 == "52"  ];
	then	
		printf "SAJ data logger"
	elif [ $1 == "53"  ];
	then	
		printf "High voltage bay of the main transformer"
	elif [ $1 == "54"  ];
	then	
		printf "Main transformer"
	elif [ $1 == "55"  ];
	then	
		printf "Low voltage bay of the main transformer"
	elif [ $1 == "56"  ];
	then	
		printf "Bus bay"
	elif [ $1 == "57"  ];
	then	
		printf "Line bay"
	elif [ $1 == "58"  ];
	then	
		printf "Plant transformer bay"
	elif [ $1 == "59"  ];
	then	
		printf "SVC/SVG bay"
	elif [ $1 == "60"  ];
	then	
		printf "Bus tie/section bay"
	elif [ $1 == "61"  ];
	then	
		printf "Plant power supply device"
		
	else
		printf "Unknown Device"
	fi
	
elif [ ! -z "$2" ] && [ $2 == "no_whitespace" ];
then
	if [ $1 == "1"  ];
	then	
		printf "String_Inverter"	
	elif [ $1 == "2"  ];
	then	
		printf "SmartLogger"
	elif [ $1 == "3"  ];
	then	
		printf "String"
	elif [ $1 == "6"  ];
	then	
		printf "Bay"
	elif [ $1 == "7"  ];
	then	
		printf "Busbar"
	elif [ $1 == "8"  ];
	then	
		printf "Transformer"
	elif [ $1 == "9"  ];
	then	
		printf "Transformer_meter"
	elif [ $1 == "10"  ];
	then	
		printf "EMI"
	elif [ $1 == "11"  ];
	then	
		printf "AC_combiner_box"
	elif [ $1 == "13"  ];
	then	
		printf "Protocol_converter"
	elif [ $1 == "14"  ];
	then	
		printf "Central_Inverter"
	elif [ $1 == "15"  ];
	then	
		printf "DC_combiner_box"
	elif [ $1 == "16"  ];
	then	
		printf "General_device"
	elif [ $1 == "17"  ];
	then	
		printf "Grid_meter"
	elif [ $1 == "18"  ];
	then	
		printf "Step-up station"
	elif [ $1 == "19"  ];
	then	
		printf "Factory-used_energy_generation_area_meter"
	elif [ $1 == "20"  ];
	then	
		printf "Solar_power_forecasting_system"
	elif [ $1 == "21"  ];
	then	
		printf "Factory-used_energy_non-generation_area_meter"
	elif [ $1 == "22"  ];
	then	
		printf "PID"
	elif [ $1 == "23"  ];
	then	
		printf "Virtual_device_of_plant_monitoring_system"
	elif [ $1 == "24"  ];
	then	
		printf "Power_quality_device"
	elif [ $1 == "25"  ];
	then	
		printf "Step-up_transformer"
	elif [ $1 == "26"  ];
	then	
		printf "Photovoltaic_grid-connection_cabinet"
	elif [ $1 == "27"  ];
	then	
		printf "Photovoltaic_grid-connection_panel"
	elif [ $1 == "37"  ];
	then	
		printf "Pinnet_data_logger"
	elif [ $1 == "38"  ];
	then	
		printf "Residential_inverter"
	elif [ $1 == "39"  ];
	then	
		printf "Battery"
	elif [ $1 == "40"  ];
	then	
		printf "Backup_Box"
	elif [ $1 == "45"  ];
	then	
		printf "PLC"
	elif [ $1 == "46"  ];
	then	
		printf "Optimizer"
	elif [ $1 == "47"  ];
	then	
		printf "Power_Sensor"
	elif [ $1 == "52"  ];
	then	
		printf "SAJ_data_logger"
	elif [ $1 == "53"  ];
	then	
		printf "High_voltage_bay_of_the_main_transformer"
	elif [ $1 == "54"  ];
	then	
		printf "Main_transformer"
	elif [ $1 == "55"  ];
	then	
		printf "Low_voltage_bay_of_the_main_transformer"
	elif [ $1 == "56"  ];
	then	
		printf "Bus_bay"
	elif [ $1 == "57"  ];
	then	
		printf "Line_bay"
	elif [ $1 == "58"  ];
	then	
		printf "Plant_transformer_bay"
	elif [ $1 == "59"  ];
	then	
		printf "SVC/SVG_bay"
	elif [ $1 == "60"  ];
	then	
		printf "Bus_tie/section_bay"
	elif [ $1 == "61"  ];
	then	
		printf "Plant_power_supply_device"
	elif [ $1 == "62"  ];
	then	
		printf "Dongle"
	elif [ $1 == "63"  ];
	then	
		printf "Distributed_SmartLogger"
	elif [ $1 == "70"  ];
	then	
		printf "Safety_box"
	else
		printf "Unknown_Device"
	fi
else
	printf "Error"
fi
}

Error_Codes_List () {

#Errors which are possible during login and connection to Huawei SolarFussion API based on documentation SmartPVMS V500R007C00 Northbound Interface Reference.pdf pages 100-101 and own observations and tests.
  
if [ $1 == "0"  ];
then
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nNormal Status"
	else		
		echo "Normal Status"
	fi
elif [ $1 == "20001"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe third-party system ID does not exist."
	else		
		echo "The third-party system ID does not exist."
	fi	
elif [ $1 == "305"  ] || [ $1 = "306" ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nYou are not in the login state. You need to log in again."
	else		
		echo "You are not in the login state. You need to log in again."
	fi
	
elif [ $1 == "401"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nYou do not have the permission on the related data interface."
	else		
		echo "You do not have the permission on the related data interface."
	fi
	
elif [ $1 == "407"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe interface access frequency is too high."
	else		
		echo "The interface access frequency is too high."
	fi
	
elif [ $1 == "413"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nYour IP is locked."
	else		
		echo "Your IP is locked."
	fi
	
elif [ $1 == "20002"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe third-party system has been disabled."
	else		
		echo "The third-party system has been disabled."
	fi
	
elif [ $1 == "20003"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe third-party system has expired."
	else		
		echo "The third-party system has expired."
	fi
	
elif [ $1 == "20004"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe server is abnormal."
	else		
		echo "The server is faulty."
	fi
	
elif [ $1 == "20005"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe device ID cannot be empty."
	else		
		echo "The device ID cannot be empty."
	fi
	
elif [ $1 == "20006"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nSome devices do not match the device type."
	else		
		echo "Some devices do not match the device type."
	fi
	
elif [ $1 == "20007"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe system does not have the related power plant resources."
	else		
		echo "The system does not have the related power plant resources."
	fi
	
elif [ $1 == "20008"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe system does not have the related device resources."
	else		
		echo "The system does not have the related device resources."
	fi
	
elif [ $1 == "20009"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe system does not have the permission to query related interfaces. Contact the system administrator to configure the permission."
	else		
		echo "The system does not have the permission to query related interfaces. Contact the system administrator to configure the permission."
	fi
	
elif [ $1 == "20010"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe plant list cannot be empty."
	else		
		echo "The plant list cannot be empty."
	fi
	
elif [ $1 == "20011"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe device list cannot be empty."
	else		
		echo "The device list cannot be empty."
	fi
	
elif [ $1 == "20012"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe query time cannot be empty."
	else		
		echo "The query time cannot be empty."
	fi
	
elif [ $1 == "20013"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe device type is incorrect. The interface does not support operations on the devices."
	else		
		echo "The device type is incorrect. The interface does not support operations on the devices."
	fi
	
elif [ $1 == "20014" ] || [ $1 = "20015" ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nA maximum of 100 plants can be queried at a time."
	else		
		echo "A maximum of 100 plants can be queried at a time."
	fi
	
elif [ $1 == "20016" ] || [ $1 = "20017" ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nA maximum of 100 devices can be queried at a time."
	else		
		echo "A maximum of 100 devices can be queried at a time."
	fi
	
elif [ $1 == "20018"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nA maximum of 10 devices can be manipulated at a time."
	else		
		echo "A maximum of 10 devices can be manipulated at a time."
	fi
	
elif [ $1 == "20019"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe switch type is incorrect. (1: switch-on; 2: switch-off)"
	else		
		echo "The switch type is incorrect. (1: switch-on; 2: switch-off)"
	fi
	
elif [ $1 == "20020"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe upgrade package corresponding to the device version cannot be found."
	else		
		echo "The upgrade package corresponding to the device version cannot be found."
	fi
	
elif [ $1 == "20021"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe upgrade file does not exist."
	else		
		echo "The upgrade file does not exist."
	fi
	
elif [ $1 == "20022"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nNo upgrade record of the related device is found."
	else		
		echo "No upgrade record of the related device is found."
	fi
	
elif [ $1 == "20023"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe query start time cannot be later than the query end time."
	else		
		echo "The query start time cannot be later than the query end time."
	fi
	
elif [ $1 == "20024"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe language cannot be empty."
	else		
		echo "The language cannot be empty."
	fi
	
elif [ $1 == "20025"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe value of the language parameter is incorrect."
	else		
		echo "The value of the language parameter is incorrect."
	fi
	
elif [ $1 == "20026"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nOnly data of the latest 365 days can be queried."
	else		
		echo "Only data of the latest 365 days can be queried."
	fi
	
elif [ $1 == "20027"  ];
then	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nThe query period cannot be longer than 31 days."
	else		
		echo "The query period cannot be longer than 31 days."
	fi
	
else
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen=$info_for_dialog_screen"\nUnknown error."
	else		
		echo "Unknown error."
	fi
	
fi

}


function in_case_of_error_with_connection_to_API {

	local immediately=$(echo ''$1''  | jq '.data.immediately' )
		if [[ $immediately == true ]];
		then
			local when_relogin="NOW"
		elif [[ $immediately == false ]];
		then
			local when_relogin="NOT NOW"
		else
			local when_relogin="Don't know when"
		fi	

	local message=$(echo ''$1''  | jq '.data.message' )
		if [[ ! $message =~ "null"  ]];
		then
			if [ ! -z "$DIALOG" ];
				then
					info_for_dialog_screen=$info_for_dialog_screen"\nMessage: "$when_relogin" "$message
				else		
					echo "Message: "$when_relogin" "$message
				fi
		fi
		
		

}


function login_to_API {


#check if data about dialog is active are delivered into function
#echo $1
#echo $DIALOG

# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title " Please wait connecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nConnection to API" 10 30    		
			else
			$DIALOG --title " Please wait connecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nConnection to API" 10 30
       		fi

	else
		echo "Please wait connecting!"
		echo "Connection to API"
		echo ""		
	fi

# Login to FusionSolarAPI with Username and Password
local logowanie=$(echo '{"userName": "'$userName'", "systemCode": "'$systemCode'"}'| http --print=hb --follow --timeout 3600 POST 'https://eu5.fusionsolar.huawei.com/thirdData/login' Content-Type:'application/json' Cookie:'Cookie_1=value; web-auth=true;')
 
#show as answer of of API for question
#echo $logowanie


#coping a long string with answer to new variable from which we extract JOSN answer
local logowanie_for_josn_extraction=$logowanie
local josn=$logowanie
#show for tests header in request
#echo $logowanie_for_josn_extraction
#echo $josn


IFS=';'
local array=( $logowanie )

# showing diffrent values experimenting with postion in array
#echo ""
#echo ""
#echo "value = ${array[1]}"

local logowanie=${array[1]}
#jsesionid=${array[6]}

IFS=':'
local array=( $logowanie )

# showing diffrent values experimenting with postion in array
#echo ""
#echo ""
#echo "value = ${array[3]}"

local logowanie=${array[3]}


IFS='='
local array=( $logowanie )

# showing diffrent values experimenting with postion in array
#echo ""
#echo ""
#echo "value = ${array[1]}"

local logowanie=${array[1]}

# finally XSRF-TOKEN extracted
xsrf_token=$logowanie

#echo ""
#echo "XSRF-TOKEN: "$xsrf_token
#echo ""

#extracting from rubish string JOSN answer part
#echo $logowanie_for_josn_extraction

# Now we extract true or false word
IFS=':'
local array2=( $logowanie_for_josn_extraction )
# showing diffrent values experimenting with postion in array
#echo ""
#echo ""
#echo "value = ${array2[18]}"

for i in ${array2[*]}; do

	if [[ ${array2[*]} == *"true"*  ]];
  	then
  		local logowanie_for_josn_extraction=$(echo ${array2[-4]})
  	elif [[ ${array2[*]} == *"false"*  ]];
  	then 
  		local logowanie_for_josn_extraction=$(echo ${array2[-5]})
  	fi
done


IFS=','
local array2=( $logowanie_for_josn_extraction )
#echo ""
#echo ""
#echo "whole array = ${array2[@]}"
#echo "value true or false = ${array2[0]}"
#echo ""
#echo ""

#checking whole array2 for word true or false existing inside
for i in ${array2[*]}; do
	if [[ ${array2[*]} =~ "true"  ]];
  	then
  		local sucesfully_login_true_or_false=$(echo ${array2[*]})
  	elif [[ ${array2[*]} =~ "false"  ]];
  	then 
  		local sucesfully_login_true_or_false=$(echo ${array2[*]})
  	fi
done

# finally true or false login data extracted
#local sucesfully_login_true_or_false=$(echo ${array2[0]})


#echo $sucesfully_login_true_or_false

#echo $josn

# extracting JOSN from full response with headers
IFS=$' \r\n\r\n'
local array3=( $josn )
#show response from API in JOSN
#echo ""
#echo ""
#echo "value = ${array3[40]}"
#echo "value = ${array3[@]}"

#checking whole array3 for word true or false existing inside
for i in ${array3[*]}; do
	if [[ ${array3[*]} == "true"  ]];
  	then
  		local sucesfully_login_true_or_false=$(echo ${array3[*]})
  		local sucesfully_login_true_or_false=$(echo $sucesfully_login_true_or_false | jq '.success')
  				
  	elif [[ ${array3[*]} == "false"  ]];
  	then 
  		local sucesfully_login_true_or_false=$(echo ${array3[*]})
  		local sucesfully_login_true_or_false=$(echo $sucesfully_login_true_or_false | jq '.success')

	fi
  	
done



if [[ $sucesfully_login_true_or_false =~ "false"  ]];
	then		
			if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="API login to server Error"
				info_for_dialog_backtitle=$info_for_dialog_screen
			else
				echo -e "API \e[4mlogin\e[0m to server \e[41mError\e[0m"			
			fi

		# our JOSN response from server postion in array we extract that from headers and add to variable we chose last postion in our array
		local josn_final=$(echo ${array3[-1]})
		#echo $josn_final  | jq
						
elif [[ $sucesfully_login_true_or_false =~ "true"  ]];
	then		
			if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="API login to server OK"
				info_for_dialog_backtitle=$info_for_dialog_screen
			else		
				echo -e "API \e[4mlogin\e[0m to server \e[42mOK\e[0m"
			fi
			
		# our JOSN response from server postion in array we extract that from headers and add to variable we chose last postion in our array
		local josn_final=$(echo ${array3[-1]})
		#echo $josn_final  | jq
else

	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen="Undefined problem with conection to Huawei Server" 
		info_for_dialog_backtitle=$info_for_dialog_screen
	else
		echo ""
		echo -e "Undefined problem with conection to Huawei Server" 
	fi
fi

# showing response JOSN from login API
#echo $josn_final  | jq

local success=$(echo ''$josn_final''  | jq '.success' )
local failCode=$(echo ''$josn_final''  | jq '.failCode' )
local message=$(echo ''$josn_final''  | jq '.message' )
local data=$(echo ''$josn_final''  | jq '.data' )


if [[ $success =~ "false"  ]];
	then		
		params=$(echo ''$josn_final''  | jq '.params' )	
			currentTime=$(echo ''$josn_final''  | jq '.params.currentTime' )
elif [[ $success =~ "true"  ]];
	then
		params=$(echo ''$josn_final''  | jq '.params' )	
fi


#removing " on begining and end
#buildCode=`echo "$buildCode" | grep -o '[[:digit:]]'`

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="$info_for_dialog_screen\nUsername & Password accepted by Huawei Server"
			else		
				echo "Username & Password accepted by Huawei Server"
		fi
		login_status=true
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="$info_for_dialog_screen\nUsername & Password not accepted by Huawei Server"
			else		
				echo "Username & Password not accepted by Huawei Server"
		fi
		login_status=false
else

	if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen="$info_for_dialog_screen\nUndefined Error Returned data: $data"
		else		
			echo ""
			echo -e "\e[41mUndefined Error\e[0m" 
			echo "\nReturned data: "$data
			#program stops
			exit
	fi

fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="$info_for_dialog_screen\nOptional message:  $message"
			else		
				echo "Optional message: " $message
		fi
	fi
	
fi
		

if [[ $success =~ "false"  ]];
then	
	#shorter time for read in unix
	local curent_time_actually=$(echo ${currentTime::-3})
	local curent_time_actually=$(date -d @$curent_time_actually)
	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen="$info_for_dialog_screen\nTime of your Request to API: $curent_time_actually"
		info_for_dialog_screen="$info_for_dialog_screen\n\nYour data:"
		info_for_dialog_screen="$info_for_dialog_screen\nUsername: $userName"
		info_for_dialog_screen="$info_for_dialog_screen\nPassword: $systemCode"
	else		
		echo "Time of your Request to API: "$curent_time_actually
	
		echo "Your data:"
		echo "	Username: "$userName
		echo "	Password: "$systemCode
	fi


fi
		
if [[ $success =~ "true"  ]];
then	
	if [[ ! $params == "null"  ]];
	then	
		if [[ ! $params == "{}"  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
			info_for_dialog_screen="$info_for_dialog_screen\nRequest parameter: $params"
			else		
			echo "\nRequest parameter: "$params
			fi
		fi		
	fi
fi


if [[ ! $data == "null"  ]];
then	
	if [[ ! $params == "null"  ]];
	then	
		if [ ! -z "$DIALOG" ];
		then
		info_for_dialog_screen="$info_for_dialog_screen\nReturned data: $data"
		else		
		echo "\nReturned data: "$data
		fi		
	fi		
fi


}



function logout_from_API {


#check if data about dialog is active are delivered into function
#echo $1
#echo $DIALOG

# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title " Please wait disconnecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nDisconnection from API" 10 30    		
			else
			$DIALOG --title " Please wait disconnecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nDisconnection from API" 10 30
       		fi
       		

	else
		echo "Please wait disconnecting!"
		echo "Disconnection from API"
		echo ""		
	fi

# Testing that data are correct
#echo $xsrf_token

# Request to API logout
local logout=$(printf '{"xsrfToken": "'$xsrf_token'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/logout  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')



#show result of qustion in JOSN
#echo $logout  | jq

local success=$(echo ''$logout''  | jq '.success' )
local failCode=$(echo ''$logout''  | jq '.failCode' )
local message=$(echo ''$logout''  | jq '.message' )



#local data=$(echo ''$logout''  | jq '.data[]' )

if [[ $success =~ "false"  ]];
	then		
		# we take actually time for other question to API too
		curent_time=$(echo ''$logout''  | jq '.params' )
			curent_time=$(echo ''$curent_time''  | jq '.currentTime' )



		#curent_time_actually=${curent_time::-3}
		#echo $curent_time_actually

		#shorter time for read in unix
		#curent_time=${curent_time::-3}

		#echo $curent_time
		#date=$(date -d @''$(echo ${curent_time::-3})'')
		#echo $date

		#date=$curent_time
fi

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="API logout from server OK"
				info_for_dialog_backtitle=$info_for_dialog_screen
			else		
				echo -e "API \e[4mlogout\e[0m from server \e[42mOK\e[0m"
		fi
		#login_status=true
		
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="API Logout from server Error"
				info_for_dialog_backtitle=$info_for_dialog_screen
			else		
				echo -e "API \e[4mlogout\e[0m from server \e[41mError\e[0m"
		fi
		#login_status=false
		
else

	if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen="Undefined Error Returned data: $data"
				info_for_dialog_backtitle=$info_for_dialog_screen
		else		
			echo ""
			echo -e "\e[41Undefined Error\e[0m" 
			echo "\nReturned data: "$data
			#program stops
			exit
	fi

fi

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="$info_for_dialog_screen\nLogout accepted by Huawei Server"
			else		
				echo "Logout accepted by Huawei Server"
		fi
		login_status=true
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="$info_for_dialog_screen\nLogout not accepted by Huawei Server"
			else		
				echo "Logout not accepted by Huawei Server"
		fi
		login_status=false
else

	if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen="$info_for_dialog_screen\nUndefined Error Returned data: $data"
		else		
			echo ""
			echo -e "\e[41mUndefined Error\e[0m" 
			echo "\nReturned data: "$data
			#program stops
			exit
	fi

fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


if [[ $success =~ "false"  ]];
then	
	#shorter time for read in unix
	local curent_time_actually=$(date -d @''$(echo ${curent_time::-3})'')
	
	if [ ! -z "$DIALOG" ];
	then
		info_for_dialog_screen="$info_for_dialog_screen\nTime of your Request to API: $curent_time_actually"
		info_for_dialog_screen="$info_for_dialog_screen\n\nYour data:"
		info_for_dialog_screen="$info_for_dialog_screen\nxsrfToken: $xsrf_token"
	else		
		echo "Time of your Request to API: "$curent_time_actually
		echo ""
		echo "Your data:"
		echo "	xsrfToken: "$xsrf_token
		echo ""
	fi


fi


# in case of error
if [[ $success == "false"  ]];
	then	
	#fuction which works when connection error apears	
	in_case_of_error_with_connection_to_API $logout
fi


}


function getStationList {

#check if data about dialog is active are delivered into function
#echo $1
#echo $DIALOG


# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title "Please wait connecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetStationList" 10 30  		
			else
			$DIALOG --title "Please wait connecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetStationList" 10 30
       		fi
	
fi

# Testing that data are correct
#echo $xsrf_token

# Request to API getStationList
local getStationList=$(printf '{}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getStationList  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#show result of qustion in JOSN
#echo $getStationList  | jq


local success=$(echo ''$getStationList''  | jq '.success' )
local failCode=$(echo ''$getStationList''  | jq '.failCode' )
local message=$(echo ''$getStationList''  | jq '.message' )

# we take actually time for other question to API too
curent_time=$(echo ''$getStationList''  | jq '.params' )
	curent_time=$(echo ''$curent_time''  | jq '.currentTime' )

curent_time_actually=$(echo ${curent_time::-3})


#curent_time_actually=${curent_time::-3}
#echo $curent_time_actually

#shorter time for read in unix
#curent_time=${curent_time::-3}

#echo $curent_time
#date=$(date -d @''$(echo ${curent_time::-3})'')
#echo $date
date=$curent_time

local data=$(echo ''$getStationList''  | jq '.data[]' )
	local aidType=$(echo ''$data''  | jq '.aidType' )
	local buildState=$(echo ''$data''  | jq '.buildState' )
	local combineType=$(echo ''$data''  | jq '.combineType' )
	local capacity=$(echo ''$data''  | jq '.capacity' ) # in MWp Mega-Watt-pik
	local owner_phone=$(echo ''$data''  | jq '.linkmanPho' )
	local station_Addres=$(echo ''$data''  | jq '.stationAddr' )
	local station_Code=$(echo ''$data''  | jq '.stationCode' )
	local station_Linkman=$(echo ''$data''  | jq '.stationLinkman' )
	local station_Name=$(echo ''$data''  | jq '.stationName' )
	#echo $station_Code
	#echo $station_Name
	
	
# Conversion of long variable string with answers to array
eval "stations_aidType_array=(${aidType})"
eval "stations_buildState_array=(${buildState})"
eval "stations_combineType_array=(${combineType})"
eval "stations_capacity_array=(${capacity})"
eval "stations_owner_phone_array=(${owner_phone})"
eval "stations_Addres_array=(${station_Addres})"
eval "stations_Code_array=(${station_Code})"
eval "stations_Linkman_array=(${station_Linkman})"
eval "stations_Name_array=(${station_Name})"

#printf '%s\n' "${stations_aidType_array[@]}"
#printf '%s\n' "${stations_buildState_array[@]}"
#printf '%s\n' "${stations_combineType_array[@]}"
#printf '%s\n' "${stations_capacity_array[@]}"
#printf '%s\n' "${stations_owner_phone_array[@]}"
#printf '%s\n' "${stations_Addres_array[@]}"
#printf '%s\n' "${stations_Code_array[@]}"
#printf '%s\n' "${stations_Linkman_array[@]}"
#printf '%s\n' "${stations_Name_array[@]}"

#count number of plants in your possesion
number_of_plants=${#stations_Name_array[@]}

#removing " on begining and end
#station_Addres="$(echo "$station_Addres" | tr -d '[:punct:]')"

#removing " on begining and end
local buildState=`echo "$buildState" | grep -o '[[:digit:]]'`
local combineType=`echo "$combineType" | grep -o '[[:digit:]]'`

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
then
			if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getStationList connection OK"
			else
				echo ""
				echo -e "API \e[4mgetStationList\e[0m connection \e[42mOK\e[0m"
			fi	
	getStationList_connection=true
elif [[ $success == "false"  ]];
then
			if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getStationList connection Error"
			else
				echo ""
				echo -e "API \e[4mgetStationList\e[0m connection \e[41mError\e[0"
			fi
	getStationList_connection=false
else
			if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="Undefined Error "
			else
				echo ""
				echo -e "\e[41Undefined Error\e[0m" 
				echo "\nReturned data: "$data
			fi
	#program stops
	exit

fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


#echo "Current Time: "$curent_time
#shorter time for read in unix
if [[ $success == "true"  ]];
	then	
		curent_time_actually=$(echo ${curent_time::-3})
		curent_time_actually=$(date -d @$curent_time_actually)
		
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nTime of your Request to API: "$curent_time_actually
			else
				echo "Time of your Request to API: "$curent_time_actually
		fi
fi

local count=0
for s in "${#stations_Name_array[@]}"; do
	number_plant[$count]=$(( $count+1 ))
			if [ ! -z "$DIALOG" ];
			then
			results_for_dialog_screen[$count]="\nPlant ID: "${stations_Code_array[$count]}
			else
				echo ""
				echo -e "	\e[93mPlant "${number_plant[$count]}": \e[0m\e[1m"${stations_Code_array[$count]}"\e[0m"
			fi
	
	if [[ ! ${stations_Name_array[$count]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant Name: "${stations_Name_array[$count]}
			else
				echo "	Plant Name: "${stations_Name_array[$count]}
			fi
	fi
	if [[ ! ${stations_Addres_array[$count]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nAddress of the plant: "${stations_Addres_array[$count]}
			else
				echo "	Address of the plant: "${stations_Addres_array[$count]}
			fi
		
	fi
	if [[ ! ${stations_capacity_array[$count]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nInstalled capacity: "${stations_capacity_array[$count]}" MWp"
			else
				echo "	Installed capacity: "${stations_capacity_array[$count]}" MWp"
			fi
		
	fi
	if [[ ! ${stations_Linkman_array[$count]} == null  ]];
		then
			case "${stations_Linkman_array[$count]}" in
   				"000000010000000"*)
           				 if [ ! -z "$DIALOG" ];
						then
							results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant contact: Encrypted"
					else
							echo "	Plant contact: Encrypted"
					fi
				;;
				*)
           				if [ ! -z "$DIALOG" ];
						then
							results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant contact: "${stations_Linkman_array[$count]}
					else
							echo "	Plant contact: "${stations_Linkman_array[$count]}
					fi
				;;
				esac
	fi
	if [[ ! ${stations_owner_phone_array[$count]} == null  ]];
		then
		
				case "${stations_owner_phone_array[$count]}" in
   				"000000010000000"*)
           				if [ ! -z "$DIALOG" ];
						then
							results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nContact phone number: Encrypted"
					else
							echo "	Contact phone number: Encrypted"
					fi
				;;
				*)
           				if [ ! -z "$DIALOG" ];
						then
							results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nContact phone number: "${stations_owner_phone_array[$count]}
					else
							echo "	Contact phone number: "${stations_owner_phone_array[$count]}
					fi
				;;
				esac
	
		
	fi
	
	if [[ ! ${stations_buildState_array[$count]} == null  ]];
		then
	
		if [[ ${stations_buildState_array[$count]} == 1 ]];
			then	
			plant_status="Not constructed"
		elif [[ ${stations_buildState_array[$count]} == 2 ]];
			then
			plant_status="Under construction"
		elif [[ ${stations_buildState_array[$count]} == 3 ]];
			then
			plant_status="Grid-connected"
		else
			plant_status="Unknown"
		fi
		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant Status: "$plant_status
			else
				echo "	Plant Status: "$plant_status
			fi
		
	fi
	
	if [[ ! ${stations_combineType_array[$count]} == null  ]];
		then
		
		if [[ ${stations_combineType_array[$count]} == 1 ]];
			then	
			Grid_connection_type="Utility"
		elif [[ ${stations_combineType_array[$count]} == 2 ]];
			then
			Grid_connection_type="commercial & industrial plant"
		elif [[ ${stations_combineType_array[$count]} == 3 ]];
			then
			Grid_connection_type="Residential plant"
		else
			Grid_connection_type="Unknown"
		fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nGrid connection type: "$Grid_connection_type
			else
				echo "	Grid connection type: "$Grid_connection_type
			fi	
	fi
	
	if [[ ! ${stations_aidType_array[$count]}  == null  ]];
		then
		if [[ ${stations_aidType_array[$count]} == 0 ]];
			then	
			Poverty_alleviation_plant_flag="Yes"
		elif [[ ${stations_aidType_array[$count]} == 1 ]];
			then
			Poverty_alleviation_plant_flag="No"
		else
			Poverty_alleviation_plant_flag="Unknown"
		fi
		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPoverty alleviation plant: "$Poverty_alleviation_plant_flag
			else
				echo "	Poverty alleviation plant: "$Poverty_alleviation_plant_flag
			fi
	fi


	echo ""
    (( count++ ))
done

# in case of error
if [[ $success == "false"  ]];
	then	
	#fuction which works when connection error apears	
	in_case_of_error_with_connection_to_API $getStationList
fi


}



function getDevList {

#check if data about dialog is active are delivered into function
#echo $1
#echo $DIALOG


# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title "Please wait connecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetDevList" 10 30  		
			else
			$DIALOG --title "Please wait connecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetDevList" 10 30
       		fi
	
fi


# Request to API getDevList
local getDevList=$(printf '{"stationCodes": "'$1'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevList  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#show result of qustion in JOSN
#echo $getDevList | jq

local success=$(echo ''$getDevList''  | jq '.success' )
local failCode=$(echo ''$getDevList''  | jq '.failCode' )
local message=$(echo ''$getDevList''  | jq '.message' )

local data=$(echo ''$getDevList''  | jq '.data[]' )
	local device_Name=$(echo ''$data''  | jq '.devName' )
	local device_TypeId=$(echo ''$data''  | jq '.devTypeId' )
	local esnCode=$(echo ''$data''  | jq '.esnCode' )
	local Id=$(echo ''$data''  | jq '.id' )
	local inverter_Type=$(echo ''$data''  | jq '.invType' )
	local latitude=$(echo ''$data''  | jq '.latitude' )
	local longitude=$(echo ''$data''  | jq '.longitude' )
	local software_Version=$(echo ''$data''  | jq '.softwareVersion' )
	local stationCode=$(echo ''$data''  | jq '.stationCode' )

local parms=$(echo ''$getDevList''  | jq '.params' )
	local currentTime=$(echo ''$parms''  | jq '.currentTime' )
	local stationCodes=$(echo ''$parms''  | jq '.stationCodes' )

#echo $device_Name | jq



# Conversion of long variable string with answers to array
eval "device_Name_array=(${device_Name})"
eval "device_TypeId_array=(${device_TypeId})"
eval "device_esnCode_array=(${esnCode})"
eval "device_Id_array=(${Id})"
eval "device_inverter_Type_array=(${inverter_Type})"
eval "device_latitude_array=(${latitude})"
eval "device_longitude_array=(${longitude})"
eval "device_software_Version_array=(${software_Version})"
eval "device_stationCode_array=(${stationCode})"

#printf '%s\n' "${device_Name_array[@]}"
#printf '%s\n' "${device_TypeId_array[@]}"
#printf '%s\n' "${device_esnCode_array[@]}"
#printf '%s\n' "${device_Id_array[@]}"
#printf '%s\n' "${device_inverter_Type_array[@]}"
#printf '%s\n' "${device_latitude_array[@]}"
#printf '%s\n' "${device_longitude_array[@]}"
#printf '%s\n' "${device_software_Version_array[@]}"
#printf '%s\n' "${device_stationCode_array[@]}"

#count number of devices in station taken from number of postions in one array
local number_of_devices=${#device_Name_array[@]}

#Removing both " from string
local inverter_Type="$(echo "$inverter_Type" | tr -d '[:punct:]')"


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevList connection OK"
		else
				echo ""
				echo -e "API \e[4mgetDevList\e[0m connection \e[42mOK\e[0m"
		fi	
		getDevList_connection=true
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevList connection Error"
		else
				echo ""
				echo -e "API \e[4mgetDevList\e[0m connection \e[41mError\e[0"
		fi
		getDevList_connection=false
else
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="Undefined Error "
		else
				echo ""
				echo -e "\e[41Undefined Error\e[0m" 
				echo "\nReturned data: "$data
		fi
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi



#echo "Current Time: "$currentTime
#shorter time for read in unix
if [[ $success == "true"  ]];
	then	
		local curent_time_actually=$(echo ${currentTime::-3})
		local curent_time_actually=$(date -d @$curent_time_actually)
		
		if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen=$info_for_dialog_screen"\nTime of your Request to API: "$curent_time_actually
		else
				echo "Time of your Request to API: "$curent_time_actually
		fi
#fi

if [ ! -z "$DIALOG" ];
then
	summary_for_dialog_screen[$count]="\nPlant "$2": "${device_stationCode_array[$count]}"\nNumber of devices: "$number_of_devices
else
	echo ""
	echo -e "\e[93mPlant "$2": \e[0m\e[1m"${device_stationCode_array[$count]}"\e[0m"
	echo "Number of devices: "$number_of_devices
	echo ""
fi

local count=0
for s in "${device_Name_array[@]}"; do 
	local number_of_device=$(( $count+1 ))
	
	if [ ! -z "$DIALOG" ];
	then
		results_for_dialog_screen[$count]="\nDevice "$number_of_device": "${device_Id_array[$count]} 
		results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nType: "$( Device_type_ID ${device_TypeId_array[$count]} )
	else
			echo -e "	\e[93mDevice "$number_of_device":\e[0m ${device_Id_array[$count]}"
			#echo "	Device type ID: "${device_TypeId_array[$count]}
			# we call to function with Devices ID list
			printf "	" 
			Device_type_ID ${device_TypeId_array[$count]}			
	fi	
	if [ ! -z "${device_inverter_Type_array[$count]}" ]
	then	
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nModel: "${device_inverter_Type_array[$count]}	 
			
		else
			echo "	Model: "${device_inverter_Type_array[$count]}		
		fi				
	fi
	
	if [ ! -z "${device_Name_array[$count]}" ]
	then
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nDevice Name: "${device_Name_array[$count]}
		else
			echo "	Device Name: "${device_Name_array[$count]}
		fi
	fi
	if [ ! -z "${device_esnCode_array[$count]}" ]
	then
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nDevice SN: "${device_esnCode_array[$count]}
		else
			echo "	Device SN: "${device_esnCode_array[$count]}
		fi
	fi	
	if [[ ! $1 == ${device_stationCode_array[$count]}  ]];
	then	
		if [ ! -z "$DIALOG" ];
		then
		results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant name: "${device_stationCode_array[$count]}
		else
			echo "	Plant name: "${device_stationCode_array[$count]}
		fi
	fi
	if [[ ! $1 == ${device_software_Version_array[$count]} ]];
	then	
		if [ ! -z "$DIALOG" ];
		then
		results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nSoftware version: "${device_software_Version_array[$count]}
		else
			echo "	Software version: "${device_software_Version_array[$count]}
		fi
	fi		
	if [[ ! $1 == ${device_longitude_array[$count]} ]];
	then	
		if [[ ! ${device_longitude_array[$count]} == null  ]];
		then
			if [ ${device_longitude_array[$count]} == 1 ] && [ ${device_latitude_array[$count]} == 1 ] ;
			then
				if [ ! -z "$DIALOG" ];
				then
					results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nlongitude: Not existing"
				else
					echo "	longitude: Not existing"
				fi
			else
				if [ ! -z "$DIALOG" ];
				then
					results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nlongitude: "${device_longitude_array[$count]}
				else
					echo "	longitude: "${device_longitude_array[$count]}
				fi
			fi
		fi
	fi	
	if [[ ! $1 == ${device_latitude_array[$count]} ]];
	then	
		if [[ ! ${device_latitude_array[$count]} == null  ]];
		then
			if [ ${device_latitude_array[$count]} == 1 ] && [ ${device_longitude_array[$count]} == 1 ] ;
			then
				if [ ! -z "$DIALOG" ];
				then
					results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nlatitude: Not existing"
				else
					echo "	latitude: Not existing"
					echo ""
				fi
			else
				if [ ! -z "$DIALOG" ];
				then
					results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nlatitude: "${device_latitude_array[$count]}
				else
					echo "	latitude: "${device_latitude_array[$count]}
					echo ""
				fi
			fi
		fi
	fi

    (( count++ ))
done

fi

# in case of error
if [[ $success == "false"  ]];
	then	
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevList
fi

}


function getStationRealKpi {

# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title "Please wait connecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetStationRealKpi" 10 30  		
			else
			$DIALOG --title "Please wait connecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetStationRealKpi" 10 30
       		fi
	
fi


# Request to API getStationRealKpi
local getStationRealKpi=$(printf '{"stationCodes": "'$1'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getStationRealKpi  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')


#show result of qustion in JOSN
#echo $getStationRealKpi | jq

local success=$(echo ''$getStationRealKpi''  | jq '.success' )
local failCode=$(echo ''$getStationRealKpi''  | jq '.failCode' )
local  message=$(echo ''$getStationRealKpi''  | jq '.message' )

local data_RealKpi=$(echo ''$getStationRealKpi''  | jq '.data[]' )
	local stationCode=$(echo ''$data_RealKpi''  | jq '.stationCode' )
	local data_RealKpi=$(echo ''$data_RealKpi''  | jq '.dataItemMap' )
		local Day_power=$(echo ''$data_RealKpi''  | jq '.day_power' )
		local month_power=$(echo ''$data_RealKpi''  | jq '.month_power' )
		local total_power=$(echo ''$data_RealKpi''  | jq '.total_power' )
		local day_income=$(echo ''$data_RealKpi''  | jq '.day_income' )
		local total_income=$(echo ''$data_RealKpi''  | jq '.total_income' )
		local real_health_state=$(echo ''$data_RealKpi''  | jq '.real_health_state' )

local data_RealKpi=$(echo ''$getStationRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_RealKpi''  | jq '.currentTime' )
	local stationCodes=$(echo ''$data_RealKpi''  | jq '.stationCodes' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local Day_power="$(echo "$Day_power" | tr -d '"')"
local month_power="$(echo "$month_power" | tr -d '"')"
local total_power="$(echo "$total_power" | tr -d '"')"
local day_income="$(echo "$day_income" | tr -d '"')"
local total_income="$(echo "$total_income" | tr -d '"')"
local real_health_state="$(echo "$real_health_state" | tr -d '"')"
local stationCodes="$(echo "$stationCodes" | tr -d '"')"
local stationCode="$(echo "$stationCode" | tr -d '"')"
#echo $data_RealKpi | jq


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a stationCodes_array <<< $stationCodes

#echo "My array Station Codes: ${stationCodes_array[@]}"
#echo "Number of elements in the array Station Code: ${#stationCodes_array[@]}"

# Conversion of long variable string with answers to array
eval "stationCode_array=(${stationCode})"
eval "Day_power_array=(${Day_power})"
eval "month_power_array=(${month_power})"
eval "total_power_array=(${total_power})"
eval "day_income_array=(${day_income})"
eval "total_income_array=(${total_income})"
eval "real_health_state_array=(${real_health_state})"


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevList connection OK"
		else
				echo ""
				echo -e "API \e[4mgetStationRealKpi\e[0m connection \e[42mOK\e[0m"
		fi	
		getStationRealKpi_connection=true
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevList connection Error"
		else
				echo ""
				echo -e "API \e[4mgetStationRealKpi\e[0m connection \e[41mError\e[0m"
		fi
		getStationRealKpi_connection=false
else
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="Undefined Error "
		else
				echo ""
				echo -e "\e[41Undefined Error\e[0m" 
				echo "\nReturned data: "$data
		fi
	#program stops
	exit
fi


#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi



#echo "Current Time: "$currentTime
#shorter time for read in unix
if [[ $success == "true"  ]];
	then	
		local curent_time_actually=$(echo ${currentTime::-3})
		local curent_time_actually=$(date -d @$curent_time_actually)
		
		if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen=$info_for_dialog_screen"\nTime of your Request to API: "$curent_time_actually
		else
				echo "Time of your Request to API: "$curent_time_actually
		fi
#fi

if [ ! -z "$DIALOG" ];
then
	summary_for_dialog_screen[$count]="\nNumbers of plants to check: "${#stationCodes_array[@]}
else
	echo ""
	echo -e "\e[93mNumbers of plants to check: \e[0m\e[1m"${#stationCodes_array[@]}"\e[0m"
	echo ""
fi


local count=0
for s in "${#stationCode_array[@]}"; do
	local number_plant=$(( $count+1 ))
	
	if [[ ! ${stationCode_array[$count]} == null  ]];
	then	
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="\nPlant $number_plant: "${stationCode_array[$count]}
		else
			echo ""
			echo -e "	\e[93mPlant "$number_plant": \e[0m\e[1m"${stationCode_array[$count]}"\e[0m"
		fi
		
		csv[$count]="Plant $number_plant;"${stationCode_array[$count]}"\r"
		xml[$count]="<Plant_$number_plant>${stationCode_array[$count]}</Plant_$number_plant>\r" 
		josn[$count]="		\"Plant_$number_plant\": \"${stationCode_array[$count]}\",\r" 
		
	fi
		
	if [[ ${real_health_state_array[$count]} == 1 ]];
		then	
		plant_health="Disconnected"
	elif [[ ${real_health_state_array[$count]} == 2 ]];
		then
		plant_health="Faulty"
	elif [[ ${real_health_state_array[$count]} == 3 ]];
		then
		plant_health="Healthy"
	else
		plant_health="Unknown"
	fi
	
	if [[ ! $plant_health == null  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]=${results_for_dialog_screen[$count]}"\nPlant health status: "$plant_health
		else
			echo ""
			echo "	Plant health status: "$plant_health
		fi
		csv[$count]=${csv[$count]}"Plant health status;"$plant_health"\r"	
		xml[$count]=${xml[$count]}"<plant_health>$plant_health</plant_health>\r"
		josn[$count]=${josn[$count]}"		\"plant_health\": \"$plant_health\",\r"
	fi	
	if [[ ! ${Day_power_array[$count]} == null  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="${results_for_dialog_screen[$count]}\nYield today: "${Day_power_array[$count]}" kWh"
		else
			echo "	Yield today: "${Day_power_array[$count]}" kWh"
		fi
		csv[$count]=${csv[$count]}"Yield today;"${Day_power_array[$count]}";kWh\r"
		xml[$count]=${xml[$count]}"<yield_today><value>${Day_power_array[$count]}</value><unit>kWh</unit></yield_today>\r"
		josn[$count]=${josn[$count]}"		\"yield_today\": {\r			\"value\": \"${Day_power_array[$count]}\",\r			\"unit\": \"kWh\"\r		},\r"
		
      
		
	fi	
	if [[ ! ${month_power_array[$count]} == null  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="${results_for_dialog_screen[$count]}\nYield this month: "${month_power_array[$count]}" kWh"
		else
			echo "	Yield this month: "${month_power_array[$count]}" kWh"
		fi
		csv[$count]=${csv[$count]}"Yield this month;"${month_power_array[$count]}";kWh\r"
		xml[$count]=${xml[$count]}"<yield_month><value>${month_power_array[$count]}</value><unit>kWh</unit></yield_month>\r"
		josn[$count]=${josn[$count]}"		\"yield_month\": {\r			\"value\": \"${month_power_array[$count]}\",\r			\"unit\": \"kWh\"\r		},\r"
	fi
	if [[ ! ${total_power_array[$count]} == null  ]];
	then		
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="${results_for_dialog_screen[$count]}\nTotal yield: "${total_power_array[$count]}" kWh"
		else
			echo "	Total yield: "${total_power_array[$count]}" kWh"
		fi
		csv[$count]=${csv[$count]}"Total yield;"${total_power_array[$count]}";kWh\r"
		xml[$count]=${xml[$count]}"<total_yield><value>${total_power_array[$count]}</value><unit>kWh</unit></total_yield>\r"
		josn[$count]=${josn[$count]}"		\"total_yield\": {\r			\"value\": \"${total_power_array[$count]}\",\r			\"unit\": \"kWh\"\r		},\r"
	fi
	if [[ ! ${day_income_array[$count]} == null  ]];
	then					
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="${results_for_dialog_screen[$count]}\nRevenue today: "${day_income_array[$count]}" ¥"
		else
			echo "	Revenue today: "${day_income_array[$count]}" ¥"
		fi
		csv[$count]=${csv[$count]}"Revenue today;"${day_income_array[$count]}";¥\r"
		xml[$count]=${xml[$count]}"<today_revenue><value>${day_income_array[$count]}</value><unit>¥</unit></today_revenue>\r"
		josn[$count]=${josn[$count]}"		\"today_revenue\": {\r			\"value\": \"${day_income_array[$count]}\",\r			\"unit\": \"¥\"\r		},\r"
	fi
	if [[ ! ${total_income_array[$count]} == null  ]];
	then						
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$count]="${results_for_dialog_screen[$count]}\nTotal revenue: "${total_income_array[$count]}" ¥"
		else
			echo "	Total revenue: "${total_income_array[$count]}" ¥"
		fi
		csv[$count]=${csv[$count]}"Total revenue;"${total_income_array[$count]}";¥\r"
		xml[$count]=${xml[$count]}"<total_revenue><value>${total_income_array[$count]}</value><unit>¥</unit></total_revenue>\r"
		josn[$count]=${josn[$count]}"		\"total_revenue\": {\r			\"value\": \"${total_income_array[$count]}\",\r			\"unit\": \"¥\"\r		},\r"
	fi
	
	
	(( count++ ))
done

fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getStationRealKpi
fi

echo ""


}



function getKpiStationHour {

# Request to API getKpiStationHour
local getKpiStationHour=$(printf '{"stationCodes": "'$1'", "collectTime": "'$2'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getKpiStationHour  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

echo $2
echo $getKpiStationHour | jq
#echo $getKpiStationHour | jq '.data[]'
#echo $getKpiStationHour | jq '.data[].collectTime, .data[].dataItemMap.inverter_power'

local success=$(echo ''$getKpiStationHour''  | jq '.success' )
local buildCode=$(echo ''$getKpiStationHour''  | jq '.buildCode' )
local failCode=$(echo ''$getKpiStationHour''  | jq '.failCode' )
local message=$(echo ''$getKpiStationHour''  | jq '.message' )


local hour_of_the_day=( $(echo ''$getKpiStationHour''  | jq '.data[].collectTime' ) )
	local stationCode=( $(echo ''$getKpiStationHour''  | jq '.data[].stationCode' ) )
		local radiation_intensity=( $(echo ''$getKpiStationHour''  | jq '.data[].dataItemMap.radiation_intensity' ) )
		local theory_power=( $(echo ''$getKpiStationHour''  | jq '.data[].dataItemMap.theory_power' ) )
		local power_inverted=( $(echo ''$getKpiStationHour''  | jq '.data[].dataItemMap.inverter_power' ) )
		local ongrid_power=( $(echo ''$getKpiStationHour''  | jq '.data[].dataItemMap.ongrid_power' ) )
		local power_profit=( $(echo ''$getKpiStationHour''  | jq '.data[].dataItemMap.power_profit' ) )

local data_getKpiStationHour=$(echo ''$getKpiStationHour''  | jq '.params' )
	local currentTime=$(echo ''$data_getKpiStationHour''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getKpiStationHour''  | jq '.collectTime' )
	local stationCodes=$(echo ''$data_getKpiStationHour''  | jq '.stationCodes' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a stationCodes_array <<< $stationCodes

# Conversion of long variable string with hours in unix format to bash array 
eval "hour_of_the_day_array=(${hour_of_the_day})"

#we cut last three digits for corect time and date  in loop + corect timezone for grafana
count=0
for s in "${hour_of_the_day_array[@]}"; do 
    local date_with_cut_three_digits=$(echo ${s::-3})

    #convert UCT timestamp to CEST we add +1h in secounds
    local date_with_cut_three_digits=$(( $date_with_cut_three_digits+3600 ))

    hour_of_the_day_array[$count]=$date_with_cut_three_digits
    (( count++ ))
done

# Conversion of long variable string with hourly inverter production to array
eval "stationCode_array=(${stationCode})"
eval "radiation_intensity_array=(${radiation_intensity})"
eval "theory_power_array=(${theory_power})"
eval "power_inverted_array=(${power_inverted})"
eval "ongrid_power_array=(${ongrid_power})"
eval "power_profit_array=(${power_profit})"

#Tested variable to text file for checking what is on output
#truncate=$(truncate -s0 wyjscie.txt)
#echo $hour_of_the_day >> wyjscie.txt

#printf '%s\n' "${hour_of_the_day_array[@]}"
#echo "Number of positions in array ""${#hour_of_the_day_array[@]}"
#printf '%s\n' "${stationCode_array[@]}"
#echo "Number of positions in array ""${#stationCode_array[@]}"
#printf '%s\n' "${radiation_intensity_array[@]}"
#echo "Number of positions in array ""${#radiation_intensity_array[@]}"
#printf '%s\n' "${theory_power_array[@]}"
#echo "Number of positions in array ""${#theory_power_array[@]}"
#printf '%s\n' "${power_inverted_array[@]}"
#echo "Number of positions in array ""${#power_inverted_array[@]}"
#printf '%s\n' "${ongrid_power_array=[@]}"
#echo "Number of positions in array ""${#ongrid_power_array[@]}"
#printf '%s\n' "${power_profit_array[@]}"
#echo "Number of positions in array ""${#power_profit_array[@]}"

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetKpiStationHour\e[0m connection \e[42mOK\e[0m"
		getKpiStationHour_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetKpiStationHour\e[0m connection \e[41mError\e[0m"
		getKpiStationHour_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually
		


if [[ $success == "true"  ]];
	then
	
	echo ""
	echo "Numbers of plants to check: "${#stationCodes_array[@]}
	echo ""
	echo -e "\e[93m"$(date "+%d %B %Y" -d @${hour_of_the_day_array[$c]})"\e[0m"
	echo ""
	
	for (( c=0; c<=((${#stationCode_array[@]}-1)); c++ )); do
			echo -e "\e[1m	"$(date "+%X %Z" -d @${hour_of_the_day_array[$c]})" \e[0m"${number_plant_array[$c]}" "${stationCode_array[$c]}
			if [[ ! ${radiation_intensity_array[$c]} == null  ]];
			then	
				echo -e "	Global irradiation: "${radiation_intensity_array[$c]}" kWh/m2"
			fi
			if [[ ! ${theory_power_array[$c]} == null  ]];
			then	
				echo -e "	Theoretical yield: "${theory_power_array[$c]}" kWh"
			fi
			if [[ ! ${power_inverted_array[$c]} == null  ]];
			then	
				echo -e "	Inverter yield: "${power_inverted_array[$c]}" kWh"
			fi
			if [[ ! ${ongrid_power_array[$c]} == null  ]];
			then	
				echo -e "	Grid feed-in: "${ongrid_power_array[$c]}" kWh"
			fi
			if [[ ! ${power_profit_array[$c]} == null  ]];
			then	
				echo -e "	Revenue: "${power_profit_array[$c]}" ¥"
			fi
			echo ""
	done

fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getKpiStationHour
		
fi

echo ""


}


function getKpiStationDay {

# Request to API getKpiStationDay
local getKpiStationDay=$(printf '{"stationCodes": "'$1'", "collectTime": '$2'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getKpiStationDay  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')


echo $getKpiStationDay | jq


local success=$(echo ''$getKpiStationDay''  | jq '.success' )
local failCode=$(echo ''$getKpiStationDay''  | jq '.failCode' )
local message=$(echo ''$getKpiStationDay''  | jq '.message' )

	local day_of_the_month=( $(echo ''$getKpiStationDay''  | jq '.data[].collectTime' ) )
	local stationCode=( $(echo ''$getKpiStationDay''  | jq '.data[].stationCode' ) )
		local installed_capacity=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.installed_capacity' ) )
		local radiation_intensity=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.radiation_intensity' ) )	
		local theory_power=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.theory_power' ) )
		local performance_ratio=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.performance_ratio' ) )	
		local power_inverted_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.inverter_power' ) )
		local ongrid_power=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.ongrid_power' ) )
		local use_power=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.use_power' ) )		
		local power_profit_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.power_profit' ) )		
		local perpower_ratio_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.perpower_ratio' ) )
		local reduction_total_co2_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.reduction_total_co2' ) )
		local reduction_total_coal_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.reduction_total_coal' ) )
		local reduction_total_tree_whole_day=( $(echo ''$getKpiStationDay''  | jq '.data[].dataItemMap.reduction_total_tree' ) )


local data_getKpiStationDay=$(echo ''$getKpiStationDay''  | jq '.params' )
	local currentTime=$(echo ''$data_getKpiStationDay''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getKpiStationDay''  | jq '.collectTime' )
	local stationCodes=$(echo ''$data_getKpiStationDay''  | jq '.stationCodes' )


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a stationCodes_array <<< $stationCodes


# Conversion of long variable string with days in unix format to bash array 
eval "day_array=(${day_of_the_month})"

#we cut last three digits for corect time and date  in loop
count_day=0
for s in "${day_array[@]}"; do 
    day_with_cut_three_digits=$(echo ${s::-3})

    #convert UCT timestamp to CEST we add -1h in secounds
    #day_with_cut_three_digits=$(( $day_with_cut_three_digits-3600 ))

    day_array[$count_day]=$day_with_cut_three_digits
    (( count_day++ ))
done


# Conversion of long variable string with daily inverter production to array
eval "stationCode_array=(${stationCode})"
eval "installed_capacity_array=(${installed_capacity})"
eval "radiation_intensity_array=(${radiation_intensity})"
eval "theory_power_array=(${theory_power})"
eval "performance_ratio_array=(${performance_ratio})"
eval "power_inverted_whole_day_array=(${power_inverted_whole_day})"
eval "ongrid_power_array=(${ongrid_power})"
eval "use_power_array=(${use_power})"
eval "power_profit_whole_day_array=(${power_profit_whole_day})"
eval "perpower_ratio_whole_day_array=(${perpower_ratio_whole_day})"
eval "reduction_total_co2_whole_day_array=(${reduction_total_co2_whole_day})"
eval "reduction_total_coal_whole_day_array=(${reduction_total_coal_whole_day})"
eval "reduction_total_tree_whole_day_array=(${reduction_total_tree_whole_day})"

#printf '%s\n' "${day[@]}"
#printf '%s\n' "${day_array[@]}"
#echo "Number of positions in array ""${#hour_of_the_day_array[@]}"
#echo '\n'
#printf '%s\n' "${power_iverted_whole_day[@]}"
#printf '%s\n' "${power_iverted_whole_day_array[@]}"
#echo '\n'
# printf '%s\n' "${power_profit_whole_day[@]}"
#printf '%s\n' "${perpower_ratio_whole_day[@]}"
#echo '\n'
#printf '%s\n' "${reduction_total_co2_whole_day[@]}"
#echo '\n'
#printf '%s\n' "${reduction_total_coal_whole_day[@]}"
#echo '\n'



#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetKpiStationDay\e[0m connection \e[42mOK\e[0m"
		getKpiStationDay_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetKpiStationDay\e[0m connection \e[41mError\e[0m"
		getKpiStationDay_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi

local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually
		
if [[ $success == "true"  ]];
	then
	
	echo ""
	echo "Numbers of plants to check: "${#stationCodes_array[@]}
	echo ""
	echo -e "\e[93m"$(date "+%B %Y" -d @${day_array[$c]})"\e[0m"
	echo ""
	
	
	for (( c=0; c<=((${#stationCode_array[@]}-1)); c++ )); do
		echo -e "\e[1m	"$(date "+%A %d %B %Y" -d @${day_array[$c]})" \e[0m"${number_plant_array[$c]}" "${stationCode_array[$c]}
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
			then	
				echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
		if [[ ! ${radiation_intensity_array[$c]} == null  ]];
			then	
				echo -e "	Global irradiation: "${radiation_intensity_array[$c]}" kWh/m2" 				
		fi
		if [[ ! ${theory_power_array[$c]} == null  ]];
			then	
				echo -e "	Theoretical yield: "${theory_power_array[$c]}" kWh"				
		fi
		if [[ ! ${performance_ratio_array[$c]} == null  ]];
			then	
				echo -e "	Performance ratio: "${performance_ratio_array[$c]}" kWh" 				
		fi
		if [[ ! ${power_inverted_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	Inverter yield: "${power_inverted_whole_day_array[$c]}" kWh"				
		fi
		if [[ ! ${ongrid_power_array[$c]} == null  ]];
			then	
				echo -e "	Grid Feed-in: "${ongrid_power_array[$c]}" kWh"				
		fi
		if [[ ! ${use_power_array[$c]} == null  ]];
			then	
				echo -e "	Consumption: "${use_power_array[$c]}" kWh"				
		fi
		if [[ ! ${power_profit_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	Revenue: "${power_profit_whole_day_array[$c]}" ¥" 				
		fi
		if [[ ! ${perpower_ratio_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_whole_day_array[$c]}" h" 				
		fi
		if [[ ! ${reduction_total_co2_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	CO2 emission reduction: "${reduction_total_co2_whole_day_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_coal_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	Standard coal saved: "${reduction_total_coal_whole_day_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_tree_whole_day_array[$c]} == null  ]];
			then	
				echo -e "	Equivalent tree planted: "${reduction_total_tree_whole_day_array[$c]}" tree" 				
		fi
		echo ""
	done
	
fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getKpiStationDay
		
fi

echo ""


}




function getKpiStationMonth {

# Request to API getKpiStationMonth
local getKpiStationMonth=$(printf '{"stationCodes": "'$1'", "collectTime": '$2'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getKpiStationMonth  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'; JSESSIONID='$jsesionid'')

echo $getKpiStationMonth | jq

local success=$(echo ''$getKpiStationMonth''  | jq '.success' )
local buildCode=$(echo ''$getKpiStationMonth''  | jq '.buildCode' )
local failCode=$(echo ''$getKpiStationMonth''  | jq '.failCode' )
local message=$(echo ''$getKpiStationMonth''  | jq '.message' )

	local stationCode=( $(echo ''$getKpiStationMonth''  | jq '.data[].stationCode' ) )
	local month=( $(echo ''$getKpiStationMonth''  | jq '.data[].collectTime' ) )
		local installed_capacity=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.installed_capacity' ) )
		local radiation_intensity=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.radiation_intensity' ) )	
		local theory_power=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.theory_power' ) )
		local performance_ratio=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.performance_ratio' ) )	
		local power_inverted_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.inverter_power' ) )
		local ongrid_power=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.ongrid_power' ) )
		local use_power=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.use_power' ) )
		local power_profit_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.power_profit' ) )
		local perpower_ratio_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.perpower_ratio' ) )
		local reduction_total_co2_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.reduction_total_co2' ) )
		local reduction_total_coal_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.reduction_total_coal' ) )
		local reduction_total_tree_whole_month=( $(echo ''$getKpiStationMonth''  | jq '.data[].dataItemMap.reduction_total_tree' ) )
	
local data_getKpiStationMonth=$(echo ''$getKpiStationMonth''  | jq '.params' )
	local currentTime=$(echo ''$data_getKpiStationMonth''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getKpiStationMonth''  | jq '.collectTime' )
	local stationCodes=$(echo ''$data_getKpiStationMonth''  | jq '.stationCodes' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a stationCodes_array <<< $stationCodes


# Conversion of long variable string with months in unix format to bash array 
eval "month_array=(${month})"

#we cut last three digits for corect time and date  in loop
count_month=0
for s in "${month_array[@]}"; do 
    month_with_cut_three_digits=$(echo ${s::-3})
    month_array[$count_month]=$month_with_cut_three_digits
    (( count_month++ ))
done

# Conversion of long variable string to array
eval "stationCode_array=(${stationCode})"
eval "installed_capacity_whole_month_array=(${installed_capacity})"
eval "radiation_intensity_whole_month_array=(${radiation_intensity})"
eval "theory_power_whole_month_array=(${theory_power})"
eval "performance_ratio_whole_month_array=(${performance_ratio})"
eval "power_inverted_whole_month_array=(${power_inverted_whole_month})"
eval "ongrid_power_whole_month_array=(${ongrid_power})"
eval "use_power_whole_month_array=(${use_power})"
eval "power_profit_whole_month_array=(${power_profit_whole_month})"
eval "perpower_ratio_whole_month_array=(${perpower_ratio_whole_month})"
eval "reduction_total_co2_whole_month_array=(${reduction_total_co2_whole_month})"
eval "reduction_total_coal_whole_month_array=(${reduction_total_coal_whole_month})"
eval "reduction_total_tree_whole_month_array=(${reduction_total_tree_whole_month})"


# printf '%s\n' "${month[@]}"
# printf '%s\n' "${month_array[@]}"
# echo '\n'	
# printf '%s\n' "${power_iverted_whole_month[@]}"
# printf '%s\n' "${power_iverted_whole_month_array[@]}"
# printf '%s\n' "${power_profit_whole_month[@]}"
# echo '\n'
# printf '%s\n' "${perpower_ratio_whole_month[@]}"
# printf '%s\n' "${perpower_ratio_whole_month_array[@]}"
# echo '\n'
# printf '%s\n' "${reduction_total_co2_whole_month[@]}"
# echo '\n'
# printf '%s\n' "${reduction_total_coal_whole_month[@]}"


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetKpiStationMonth\e[0m connection \e[42mOK\e[0m"
		getKpiStationMonth_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetKpiStationMonth\e[0m connection \e[41mError\e[0m"
		getKpiStationMonth_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually

if [[ $success == "true"  ]];
	then
	
	echo ""
	echo "Numbers of plants to check: "${#stationCodes_array[@]}
	echo ""
	echo -e "\e[93m"$(date "+%Y" -d @${month_array[0]})"\e[0m"
	echo ""
	
	
	for (( c=0; c<=((${#stationCode_array[@]}-1)); c++ )); do
		echo -e "\e[1m	"$(date "+%B %Y" -d @${month_array[$c]})" \e[0m"${number_plant_array[$c]}" "${stationCode_array[$c]}
		if [[ ! ${installed_capacity_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Installed capacity: "${installed_capacity_whole_month_array[$c]}" kWp"				
		fi
		if [[ ! ${radiation_intensity_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Global irradiation: "${radiation_intensity_whole_month_array[$c]}" kWh/m2" 				
		fi
		if [[ ! ${theory_power_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Theoretical yield: "${theory_power_whole_month_array[$c]}" kWh"				
		fi
		if [[ ! ${performance_ratio_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Performance ratio: "${performance_ratio_whole_month_array[$c]}" kWh" 				
		fi
		if [[ ! ${power_inverted_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Inverter yield: "${power_inverted_whole_month_array[$c]}" kWh"				
		fi
		if [[ ! ${ongrid_power_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Grid Feed-in: "${ongrid_power_whole_month_array[$c]}" kWh"				
		fi
		if [[ ! ${use_power_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Consumption: "${use_power_whole_month_array[$c]}" kWh"				
		fi
		if [[ ! ${power_profit_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Revenue: "${power_profit_whole_month_array[$c]}" ¥" 				
		fi
		if [[ ! ${perpower_ratio_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_whole_month_array[$c]}" h" 				
		fi
		if [[ ! ${reduction_total_co2_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	CO2 emission reduction: "${reduction_total_co2_whole_month_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_coal_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Standard coal saved: "${reduction_total_coal_whole_month_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_tree_whole_month_array[$c]} == null  ]];
			then	
				echo -e "	Equivalent tree planted: "${reduction_total_tree_whole_month_array[$c]}" tree" 				
		fi
		echo ""
	done
	
fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getKpiStationMonth
		
fi

echo ""
}



function getKpiStationYear {


# Request to API getKpiStationYear
local getKpiStationYear=$(printf '{"stationCodes": "'$1'", "collectTime": '$2'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getKpiStationYear  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')


echo $getKpiStationYear | jq

local success=$(echo ''$getKpiStationYear''  | jq '.success' )
local failCode=$(echo ''$getKpiStationYear''  | jq '.failCode' )
local message=$(echo ''$getKpiStationYear''  | jq '.message' )

	local stationCode=( $(echo ''$getKpiStationYear''  | jq '.data[].stationCode' ) )
	local year=( $(echo ''$getKpiStationYear''  | jq '.data[].collectTime' ) )
		local installed_capacity_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.installed_capacity' ) )
		local radiation_intensity=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.radiation_intensity' ) )
		local theory_power=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.theory_power' ) )
		local performance_ratio=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.performance_ratio' ) )	
		local power_iverted_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.inverter_power' ) )
		local ongrid_power=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.ongrid_power' ) )
		local use_power=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.use_power' ) )
		local power_profit_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.power_profit' ) )
		local perpower_ratio_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.perpower_ratio' ) )
		local reduction_total_co2_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.reduction_total_co2' ) )
		local reduction_total_coal_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.reduction_total_coal' ) )
		local reduction_total_tree_year=( $(echo ''$getKpiStationYear''  | jq '.data[].dataItemMap.reduction_total_tree' ) )

local data_getKpiStationYear=$(echo ''$getKpiStationYear''  | jq '.params' )
	local currentTime=$(echo ''$data_getKpiStationYear''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getKpiStationYear''  | jq '.collectTime' )
	local stationCodes=$(echo ''$data_getKpiStationYear''  | jq '.stationCodes' )


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a stationCodes_array <<< $stationCodes


# Conversion of long variable string with year in unix format to bash array 
eval "year_array=(${year})"

#we cut last three digits for corect time and date  in loop
count_year=0
for s in "${year_array[@]}"; do 
    year_with_cut_three_digits=$(echo ${s::-3})
    year_array[$count_year]=$year_with_cut_three_digits
    (( count_year++ ))
done

# Conversion of long variable string with yearly inverter production to array
eval "stationCode_array=(${stationCode})"
eval "installed_capacity_whole_year_array=(${installed_capacity_year})"
eval "radiation_intensity_whole_year_array=(${radiation_intensity})"
eval "theory_power_whole_year_array=(${theory_power})"
eval "performance_ratio_whole_year_array=(${performance_ratio})"
eval "power_iverted_year_array=(${power_iverted_year})"
eval "ongrid_power_year_array=(${ongrid_power})"
eval "use_power_year_array=(${use_power})"
eval "power_profit_year_array=(${power_profit_year})"
eval "perpower_ratio_year_array=(${perpower_ratio_year})"
eval "reduction_total_co2_year_array=(${reduction_total_co2_year})"
eval "reduction_total_coal_year_array=(${reduction_total_coal_year})"
eval "reduction_total_tree_year_array=(${reduction_total_tree_year})"


# printf '%s\n' "${year[@]}"
# printf '%s\n' "${year_array[@]}"
# printf '%s\n' "${installed_capacity_year[@]}"
# printf '%s\n' "${power_iverted_year[@]}"
# printf '%s\n' "${power_profit_year[@]}"
# printf '%s\n' "${perpower_ratio_year[@]}"
# printf '%s\n' "${reduction_total_co2_year[@]}"
# printf '%s\n' "${reduction_total_coal_year[@]}"
# printf '%s\n' "${reduction_total_tree_year[@]}"

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetKpiStationYear\e[0m connection \e[42mOK\e[0m"
		getKpiStationYear_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetKpiStationYear\e[0m connection \e[41mError\e[0m"
		getKpiStationYear_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually

if [[ $success == "true"  ]];
	then
	
	echo ""
	echo "Numbers of plants to check: "${#stationCodes_array[@]}
	echo ""
	echo ""
	
	for (( c=0; c<=((${#stationCode_array[@]}-1)); c++ )); do
		echo -e "\e[1m	"$(date "+%Y" -d @${year_array[$c]})" \e[0m"${stationCode_array[$c]}
		if [[ ! ${installed_capacity_whole_year_array[$c]} == null  ]];
			then	
				echo -e "	Installed capacity: "${installed_capacity_whole_year_array[$c]}" kWp"				
		fi
		if [[ ! ${radiation_intensity_whole_year_array[$c]} == null  ]];
			then	
				echo -e "	Global irradiation: "${radiation_intensity_whole_year_array[$c]}" kWh/m2" 				
		fi
		if [[ ! ${theory_power_whole_year_array[$c]} == null  ]];
			then	
				echo -e "	Theoretical yield: "${theory_power_whole_year_array[$c]}" kWh"				
		fi
		if [[ ! ${performance_ratio_whole_year_array[$c]} == null  ]];
			then	
				echo -e "	Performance ratio: "${performance_ratio_whole_year_array[$c]}" kWh" 				
		fi
		if [[ ! ${power_iverted_year_array[$c]} == null  ]];
			then	
				echo -e "	Inverter yield: "${power_iverted_year_array[$c]}" kWh"				
		fi
		if [[ ! ${ongrid_power_year_array[$c]} == null  ]];
			then	
				echo -e "	Grid Feed-in: "${ongrid_power_year_array[$c]}" kWh"				
		fi
		if [[ ! ${use_power_year_array[$c]} == null  ]];
			then	
				echo -e "	Consumption: "${use_power_year_array[$c]}" kWh"				
		fi
		if [[ ! ${power_profit_year_array[$c]} == null  ]];
			then	
				echo -e "	Revenue: "${power_profit_year_array[$c]}" ¥" 				
		fi
		if [[ ! ${perpower_ratio_year_array[$c]} == null  ]];
			then	
				echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_year_array[$c]}" h" 				
		fi
		if [[ ! ${reduction_total_co2_year_array[$c]} == null  ]];
			then	
				echo -e "	CO2 emission reduction: "${reduction_total_co2_year_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_coal_year_array[$c]} == null  ]];
			then	
				echo -e "	Standard coal saved: "${reduction_total_coal_year_array[$c]}" t" 				
		fi
		if [[ ! ${reduction_total_tree_year_array[$c]} == null  ]];
			then	
				echo -e "	Equivalent tree planted: "${reduction_total_tree_year_array[$c]}" tree" 				
		fi
		echo ""
	done
	
fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getKpiStationYear
		
fi

echo ""


}



function getDevRealKpi {

# window for dialog TUI progress of login or simple echo in case if dialog TUI wasn't in use.
if [ ! -z "$DIALOG" ];
	then
			if [ $DIALOG == "whiptail" ]
			then
			TERM=ansi $DIALOG --title "Please wait connecting!" \
			     	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\ngetDevRealKpi" 10 30  		
			else
			$DIALOG --title "Please wait connecting!" \
			      	--backtitle "Huawei FusionSolarApp API" \
       			--infobox "\nQuestion to API:\n getDevRealKpi" 10 30
       		fi
	
fi


# Request to API getKpiStationYear
local getDevRealKpi=$(printf '{"devIds": "'$1'", "devTypeId": "'$2'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevRealKpi  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#echo $getDevRealKpi | jq

local success=$(echo ''$getDevRealKpi''  | jq '.success' )
local failCode=$(echo ''$getDevRealKpi''  | jq '.failCode' )
local message=$(echo ''$getDevRealKpi''  | jq '.message' )


#we have inverter
if [[ $2 == 1  ]];
then	

	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local inverter_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.inverter_state' )
		local ab_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_i' )
		local efficiency=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.efficiency' )
		local temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.temperature' )
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.elec_freq' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )
		local day_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.day_cap' )
		local mppt_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_power' )
		local pv1_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv1_u' )
		local pv2_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv2_u' )
		local pv3_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv3_u' )
		local pv4_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv4_u' )
		local pv5_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv5_u' )
		local pv6_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv6_u' )
		local pv7_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv7_u' )
		local pv8_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv8_u' )
		local pv9_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv9_u' )
		local pv10_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv10_u' )
		local pv11_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv11_u' )
		local pv12_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv12_u' )
		local pv13_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv13_u' )
		local pv14_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv14_u' )
		local pv15_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv15_u' )
		local pv16_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv16_u' )
		local pv17_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv17_u' )
		local pv18_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv18_u' )
		local pv19_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv19_u' )
		local pv20_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv20_u' )
		local pv21_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv21_u' )
		local pv22_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv22_u' )
		local pv23_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv23_u' )
		local pv24_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv24_u' )
		local pv1_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv1_i' )
		local pv2_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv2_i' )
		local pv3_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv3_i' )
		local pv4_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv4_i' )
		local pv5_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv5_i' )
		local pv6_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv6_i' )
		local pv7_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv7_i' )
		local pv8_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv8_i' )
		local pv9_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv9_i' )
		local pv10_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv10_i' )
		local pv11_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv11_i' )
		local pv12_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv12_i' )
		local pv13_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv13_i' )
		local pv14_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv14_i' )
		local pv15_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv15_i' )
		local pv16_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv16_i' )
		local pv17_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv17_i' )
		local pv18_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv18_i' )
		local pv19_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv19_i' )
		local pv20_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv20_i' )
		local pv21_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv21_i' )
		local pv22_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv22_i' )
		local pv23_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv23_i' )
		local pv24_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv24_i' )
		local total_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.total_cap' )
		local open_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.open_time' )
		local close_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.close_time' )
		local mppt_total_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_total_cap' )
		local mppt_1_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_1_cap' )
		local mppt_2_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_2_cap' )
		local mppt_3_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_3_cap' )
		local mppt_4_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_4_cap' )
		local mppt_5_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_5_cap' )
		local mppt_6_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_6_cap' )
		local mppt_7_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_7_cap' )
		local mppt_8_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_8_cap' )
		local mppt_9_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_9_cap' )
		local mppt_10_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_10_cap' )
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "inverter_state_array=(${inverter_state})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "efficiency_array=(${efficiency})"
		eval "temperature_array=(${temperature})"
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"
		eval "day_cap_array=(${day_cap})"
		eval "mppt_power_array=(${mppt_power})"
		eval "pv1_u_array=(${pv1_u})"
		eval "pv2_u_array=(${pv2_u})"
		eval "pv3_u_array=(${pv3_u})"
		eval "pv4_u_array=(${pv4_u})"
		eval "pv5_u_array=(${pv5_u})"
		eval "pv6_u_array=(${pv6_u})"
		eval "pv7_u_array=(${pv7_u})"
		eval "pv8_u_array=(${pv8_u})"
		eval "pv9_u_array=(${pv9_u})"
		eval "pv10_u_array=(${pv10_u})"
		eval "pv11_u_array=(${pv11_u})"
		eval "pv12_u_array=(${pv12_u})"
		eval "pv13_u_array=(${pv13_u})"
		eval "pv14_u_array=(${pv14_u})"
		eval "pv15_u_array=(${pv15_u})"
		eval "pv16_u_array=(${pv16_u})"
		eval "pv17_u_array=(${pv17_u})"
		eval "pv18_u_array=(${pv18_u})"
		eval "pv19_u_array=(${pv19_u})"
		eval "pv20_u_array=(${pv20_u})"
		eval "pv21_u_array=(${pv21_u})"
		eval "pv22_u_array=(${pv22_u})"
		eval "pv23_u_array=(${pv23_u})"
		eval "pv24_u_array=(${pv24_u})"
		eval "pv1_i_array=(${pv1_i})"
		eval "pv2_i_array=(${pv2_i})"
		eval "pv3_i_array=(${pv3_i})"
		eval "pv4_i_array=(${pv4_i})"
		eval "pv5_i_array=(${pv5_i})"
		eval "pv6_i_array=(${pv6_i})"
		eval "pv7_i_array=(${pv7_i})"
		eval "pv8_i_array=(${pv8_i})"
		eval "pv9_i_array=(${pv9_i})"
		eval "pv10_i_array=(${pv10_i})"
		eval "pv11_i_array=(${pv11_i})"
		eval "pv12_i_array=(${pv12_i})"
		eval "pv13_i_array=(${pv13_i})"
		eval "pv14_i_array=(${pv14_i})"
		eval "pv15_i_array=(${pv15_i})"
		eval "pv16_i_array=(${pv16_i})"
		eval "pv17_i_array=(${pv17_i})"
		eval "pv18_i_array=(${pv18_i})"
		eval "pv19_i_array=(${pv19_i})"
		eval "pv20_i_array=(${pv20_i})"
		eval "pv21_i_array=(${pv21_i})"
		eval "pv22_i_array=(${pv22_i})"
		eval "pv23_i_array=(${pv23_i})"
		eval "pv24_i_array=(${pv24_i})"
		eval "total_cap_array=(${total_cap})"
		eval "open_time_array=(${open_time})"
		eval "close_time_array=(${close_time})"
		eval "mppt_total_cap_array=(${mppt_total_cap})"
		eval "mppt_1_cap_array=(${mppt_1_cap})"
		eval "mppt_2_cap_array=(${mppt_2_cap})"
		eval "mppt_3_cap_array=(${mppt_3_cap})"
		eval "mppt_4_cap_array=(${mppt_4_cap})"
		eval "mppt_5_cap_array=(${mppt_5_cap})"
		eval "mppt_6_cap_array=(${mppt_6_cap})"	
		eval "mppt_7_cap_array=(${mppt_7_cap})"	
		eval "mppt_8_cap_array=(${mppt_8_cap})"	
		eval "mppt_9_cap_array=(${mppt_9_cap})"	
		eval "mppt_10_cap_array=(${mppt_10_cap})"	
		eval "run_state_array=(${run_state})"	

#if device is Central inverter
elif [[ $2 == 14  ]];
then

	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local inverter_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.inverter_state' )
		local day_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.day_cap' )
		local total_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.total_cap' )
		local temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.temperature' )
		local center_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_u' )
		local center_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i' )
		local center_i_1=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_1' )
		local center_i_2=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_2' )
		local center_i_3=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_3' )
		local center_i_4=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_4' )
		local center_i_5=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_5' )
		local center_i_6=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_6' )
		local center_i_7=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_7' )
		local center_i_8=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_8' )
		local center_i_9=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_9' )
		local center_i_10=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.center_i_10' )
		local mppt_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_power' )
		local a_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_i' )		
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.elec_freq' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )		
		local open_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.open_time' )
		local close_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.close_time' )	
		local aop=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.aop' )	
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )
		

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "inverter_state_array=(${inverter_state})"
		eval "day_cap_array=(${day_cap})"
		eval "total_cap_array=(${total_cap})"
		eval "temperature_array=(${temperature})"		
		eval "center_u_array=(${center_u})"
		eval "center_i_array=(${center_i})"
		eval "center_i_1_array=(${center_i_1})"
		eval "center_i_2_array=(${center_i_2})"
		eval "center_i_3_array=(${center_i_3})"
		eval "center_i_4_array=(${center_i_4})"
		eval "center_i_5_array=(${center_i_5})"
		eval "center_i_6_array=(${center_i_6})"
		eval "center_i_7_array=(${center_i_7})"
		eval "center_i_8_array=(${center_i_8})"
		eval "center_i_9_array=(${center_i_9})"
		eval "center_i_10_array=(${center_i_10})"
		eval "mppt_power_array=(${mppt_power})"		
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"	
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"
		eval "open_time_array=(${open_time})"
		eval "close_time_array=(${close_time})"		
		eval "aop_array=(${aop})"			
		eval "run_state_array=(${run_state})"			
	
	
# device is Smart Energy Center	
elif [[ $2 == 38  ]];
then


	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local inverter_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.inverter_state' )
		local ab_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_i' )
		local efficiency=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.efficiency' )
		local temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.temperature' )
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.elec_freq' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )
		local day_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.day_cap' )
		local mppt_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_power' )
		local pv1_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv1_u' )
		local pv2_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv2_u' )
		local pv3_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv3_u' )
		local pv4_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv4_u' )
		local pv5_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv5_u' )
		local pv6_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv6_u' )
		local pv7_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv7_u' )
		local pv8_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv8_u' )
		local pv1_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv1_i' )
		local pv2_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv2_i' )
		local pv3_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv3_i' )
		local pv4_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv4_i' )
		local pv5_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv5_i' )
		local pv6_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv6_i' )
		local pv7_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv7_i' )
		local pv8_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv8_i' )
		local total_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.total_cap' )
		local open_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.open_time' )
		local close_time=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.close_time' )
		local mppt_1_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_1_cap' )
		local mppt_2_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_2_cap' )
		local mppt_3_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_3_cap' )
		local mppt_4_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.mppt_4_cap' )
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )		

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "inverter_state_array=(${inverter_state})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "efficiency_array=(${efficiency})"
		eval "temperature_array=(${temperature})"
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"
		eval "day_cap_array=(${day_cap})"
		eval "mppt_power_array=(${mppt_power})"
		eval "pv1_u_array=(${pv1_u})"
		eval "pv2_u_array=(${pv2_u})"
		eval "pv3_u_array=(${pv3_u})"
		eval "pv4_u_array=(${pv4_u})"
		eval "pv5_u_array=(${pv5_u})"
		eval "pv6_u_array=(${pv6_u})"
		eval "pv7_u_array=(${pv7_u})"
		eval "pv8_u_array=(${pv8_u})"
		eval "pv1_i_array=(${pv1_i})"
		eval "pv2_i_array=(${pv2_i})"
		eval "pv3_i_array=(${pv3_i})"
		eval "pv4_i_array=(${pv4_i})"
		eval "pv5_i_array=(${pv5_i})"
		eval "pv6_i_array=(${pv6_i})"
		eval "pv7_i_array=(${pv7_i})"
		eval "pv8_i_array=(${pv8_i})"
		eval "total_cap_array=(${total_cap})"
		eval "open_time_array=(${open_time})"
		eval "close_time_array=(${close_time})"
		eval "mppt_1_cap_array=(${mppt_1_cap})"
		eval "mppt_2_cap_array=(${mppt_2_cap})"
		eval "mppt_3_cap_array=(${mppt_3_cap})"
		eval "mppt_4_cap_array=(${mppt_4_cap})"
		eval "run_state_array=(${run_state})"		

# device is DC combiner box
elif [[ $2 == 15  ]];
then


	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local inverter_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.inverter_state' )
		local dc_i1=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i1' )
		local dc_i2=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i2' )
		local dc_i3=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i3' )
		local dc_i4=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i4' )
		local dc_i5=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i5' )
		local dc_i6=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i6' )
		local dc_i7=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i7' )
		local dc_i8=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i8' )
		local dc_i9=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i9' )
		local dc_i10=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i10' )
		local dc_i11=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i11' )
		local dc_i12=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i12' )
		local dc_i13=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i13' )
		local dc_i14=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i14' )
		local dc_i15=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i15' )
		local dc_i16=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i16' )
		local dc_i17=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i17' )
		local dc_i18=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i18' )
		local dc_i19=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i19' )
		local dc_i20=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.dc_i20' )		
		local photc_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.photc_i' )
		local photc_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.photc_u' )
		local temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.temperature' )
		local thunder_count=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.thunder_count' )
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )		

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "dc_i1_array=(${dc_i1})"
		eval "dc_i2_array=(${dc_i2})"	
		eval "dc_i3_array=(${dc_i3})"	
		eval "dc_i4_array=(${dc_i4})"	
		eval "dc_i5_array=(${dc_i5})"	
		eval "dc_i6_array=(${dc_i6})"	
		eval "dc_i7_array=(${dc_i7})"	
		eval "dc_i8_array=(${dc_i8})"	
		eval "dc_i9_array=(${dc_i9})"	
		eval "dc_i10_array=(${dc_i10})"	
		eval "dc_i11_array=(${dc_i11})"	
		eval "dc_i12_array=(${dc_i12})"	
		eval "dc_i13_array=(${dc_i13})"	
		eval "dc_i14_array=(${dc_i14})"	
		eval "dc_i15_array=(${dc_i15})"	
		eval "dc_i16_array=(${dc_i16})"	
		eval "dc_i17_array=(${dc_i17})"	
		eval "dc_i18_array=(${dc_i18})"	
		eval "dc_i19_array=(${dc_i19})"	
		eval "dc_i20_array=(${dc_i20})"		
		eval "photc_i_array=(${photc_i})"	
		eval "photc_u_array=(${photc_u})"
		eval "temperature_array=(${temperature})"	
		eval "thunder_count_array=(${thunder_count})"
		eval "run_state_array=(${run_state})"

# device is EMI
elif [[ $2 == 10  ]];
then

	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.temperature' )
		local pv_temperature=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.pv_temperature' )
		local wind_speed=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.wind_speed' )
		local wind_direction=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.wind_direction' )
		local radiant_total=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.radiant_total' )
		local radiant_line=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.radiant_line' )
		local horiz_radiant_line=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.horiz_radiant_line' )
		local horiz_radiant_total=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.horiz_radiant_total' )		
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "temperature_array=(${temperature})"
		eval "pv_temperature_array=(${pv_temperature})"
		eval "wind_speed_array=(${wind_speed})"
		eval "wind_direction_array=(${wind_direction})"
		eval "radiant_total_array=(${radiant_total})"
		eval "radiant_line_array=(${radiant_line})"
		eval "horiz_radiant_line_array=(${horiz_radiant_line})"
		eval "horiz_radiant_total_array=(${horiz_radiant_total})"
		eval "run_state_array=(${run_state})"

# device is Meter (Grid meter)
elif [[ $2 == 17  ]];
then

	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local ab_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_i' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local active_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_cap' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )
		local reverse_active_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_cap' )
		local forward_reactive_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.forward_reactive_cap' )
		local reverse_reactive_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_reactive_cap' )
		local active_power_a=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power_a' )
		local active_power_b=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power_b' )
		local active_power_c=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power_c' )
		local reactive_power_a=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power_a' )
		local reactive_power_b=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power_b' )
		local reactive_power_c=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power_c' )
		local total_apparent_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.total_apparent_power' )
		local grid_frequency=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.grid_frequency' )
		local reverse_active_peak=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_peak' )
		local reverse_active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_power' )
		local reverse_active_valley=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_valley' )
		local reverse_active_top=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_top' )
		local positive_active_peak=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_active_peak' )
		local positive_active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_active_power' )
		local positive_active_valley=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_active_valley' )
		local positive_active_top=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_active_top' )
		local reverse_reactive_peak=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_reactive_peak' )
		local reverse_reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_reactive_power' )
		local reverse_reactive_valley=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_reactive_valley' )
		local reverse_reactive_top=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_reactive_top' )
		local positive_reactive_peak=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_reactive_peak' )
		local positive_reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_reactive_power' )
		local positive_reactive_valley=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_reactive_valley' )
		local positive_reactive_top=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.positive_reactive_top' )
		

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "active_power_array=(${active_power})"
		eval "power_factor_array=(${power_factor})"
		eval "active_cap_array=(${active_cap})"
		eval "reactive_power_array=(${reactive_power})"
		eval "reverse_active_cap_array=(${reverse_active_cap})"
		eval "forward_reactive_cap_array=(${forward_reactive_cap})"
		eval "reverse_reactive_cap_array=(${reverse_reactive_cap})"
		eval "active_power_a_array=(${active_power_a})"
		eval "active_power_b_array=(${active_power_b})"
		eval "active_power_c_array=(${active_power_c})"
		eval "reactive_power_a_array=(${reactive_power_a})"
		eval "reactive_power_b_array=(${reactive_power_b})"
		eval "reactive_power_c_array=(${reactive_power_c})"
		eval "total_apparent_power_array=(${total_apparent_power})"
		eval "grid_frequency_array=(${grid_frequency})"
		eval "reverse_active_peak_array=(${reverse_active_peak})"
		eval "reverse_active_power_array=(${reverse_active_power})"
		eval "reverse_active_valley_array=(${reverse_active_valley})"
		eval "reverse_active_top_array=(${reverse_active_top})"
		eval "positive_active_peak_array=(${positive_active_peak})"
		eval "positive_active_power_array=(${positive_active_power})"
		eval "positive_active_valley_array=(${positive_active_valley})"
		eval "positive_active_top_array=(${positive_active_top})"
		eval "reverse_reactive_peak_array=(${reverse_reactive_peak})"		
		eval "reverse_reactive_power_array=(${reverse_reactive_power})"
		eval "reverse_reactive_valley_array=(${reverse_reactive_valley})"
		eval "reverse_reactive_top_array=(${reverse_reactive_top})"
		eval "positive_reactive_peak_array=(${positive_reactive_peak})"
		eval "positive_reactive_power_array=(${positive_reactive_power})"
		eval "positive_reactive_valley_array=(${positive_reactive_valley})"
		eval "positive_reactive_top_array=(${positive_reactive_top})"
		
# device is Power Sensor
elif [[ $2 == 47  ]];
then	
	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local meter_status=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.meter_status' )
		local meter_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.meter_u' )
		local meter_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.meter_i' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )		
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local grid_frequency=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.grid_frequency' )		
		local active_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_cap' )
		local reverse_active_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reverse_active_cap' )
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )

		

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "meter_status_array=(${meter_status})"
		eval "meter_u_array=(${meter_u})"
		eval "meter_i_array=(${meter_i})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"		
		eval "power_factor_array=(${power_factor})"
		eval "grid_frequency_array=(${grid_frequency})"
		eval "active_cap_array=(${active_cap})"
		eval "reverse_active_cap_array=(${reverse_active_cap})"
		eval "run_state_array=(${run_state})"	

# device is Battery
elif [[ $2 == 39  ]];
then
	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local battery_status=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.battery_status' )
		local max_charge_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.max_charge_power' )
		local max_discharge_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.max_discharge_power' )
		local ch_discharge_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ch_discharge_power' )
		local busbar_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.busbar_u' )		
		local battery_soc=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.battery_soc' )
		local battery_soh=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.battery_soh' )		
		local ch_discharge_model=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap. ch_discharge_model' )
		local charge_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.charge_cap' )
		local discharge_cap=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.discharge_cap' )
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )
	

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "battery_status_array=(${battery_status})"
		eval "max_charge_power_array=(${max_charge_power})"
		eval "max_discharge_power_array=(${max_discharge_power})"
		eval "ch_discharge_power_array=(${ch_discharge_power})"
		eval "busbar_u_array=(${busbar_u})"
		eval "battery_soc_array=(${battery_soc})"		
		eval "battery_soh_array=(${battery_soh})"
		eval "ch_discharge_model_array=(${ch_discharge_model})"
		eval "charge_cap_array=(${charge_cap})"
		eval "discharge_cap_array=(${discharge_cap})"
		eval "run_state_array=(${run_state})"	
		
# device is Transformer
elif [[ $2 == 8  ]];
then
	local devId=$(echo ''$getDevRealKpi''  | jq '.data[].devId' )
		local ab_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.c_i' )
		local active_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.reactive_power' )
		local power_factor=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.elec_freq' )		
		local run_state=$(echo ''$getDevRealKpi''  | jq '.data[].dataItemMap.run_state' )
	

local data_getDevRealKpi=$(echo ''$getDevRealKpi''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevRealKpi''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevRealKpi''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevRealKpi''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"		
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"		
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "run_state_array=(${run_state})"	
fi

										
# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a devIds_array <<< $devIds
IFS="," read -a devTypeId_array <<< $devTypeId


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevRealKpi connection OK"
		else
			echo ""
			echo -e "API \e[4mgetDevRealKpi\e[0m connection \e[42mOK\e[0m"
		fi
		getDevRealKpi_connection=true
elif [[ $success == "false" ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="getDevRealKpi connection Error"
		else
			echo ""
			echo -e "API \e[4mgetDevRealKpi\e[0m connection \e[41mError\e[0m"
		fi
		getDevRealKpi_connection=false
else
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen="Undefined Error "
		else
				echo ""
				echo -e "\e[41Undefined Error\e[0m" 
				echo "\nReturned data: "$data
		fi
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi

#echo "Current Time: "$currentTime
#shorter time for read in unix
if [[ $success == "true"  ]];
	then	
		local curent_time_actually=$(echo ${currentTime::-3})
		local curent_time_of_request=$(date -d @$curent_time_actually)
		
		if [ ! -z "$DIALOG" ];
		then
				info_for_dialog_screen=$info_for_dialog_screen"\nTime of your Request to API: "$curent_time_of_request
		else
				echo "Time of your Request to API: "$curent_time_of_request
		fi



# if we have String inverter
if [[ $success == "true"  ]] && [[  $2 == 1  ]];
	then
		
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi

	
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )) 
	do
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		#xml[$c]=$(printf "<"
		#Device_type_ID ${devTypeId_array[$c]} "no_whitespace"
		#printf ">${devId_array[$c]}</"
		#Device_type_ID ${devTypeId_array[$c]} "no_whitespace"
		#printf ">\r"); 
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");

		
		if [[ ! ${inverter_state_array[$c]} == null  ]];
		then	
			#decimal number to hexdecimal
			local hex=$( printf "%x" ${inverter_state_array[$c]} );
			#echo $hex

			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter status: "
				inverter_state $hex);
			else
				printf "	Inverter status: "
				#function to check inverter status
				inverter_state $hex
				echo ""
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\n"
			printf "Inverter status;" 
			inverter_state $hex
			printf "\r");
		
			xml[$c]=$( echo ${xml[$c]}
			printf "\n<Inverter_status>"
			inverter_state $hex
			printf "</Inverter_status>"
			printf "\r"); 
		
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter status\": \""
			inverter_state $hex
			printf "\",\r"); 			
		fi
		
		#special loop  for checking if inverter is disconected
		if [[ ! $hex == "0"  ]];
		then
		
				
		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid AB voltage: "${ab_u_array[$c]}" V");
			else
				echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid AB voltage;"${ab_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_AB_voltage>"${ab_u_array[$c]}"<units>V</units></Grid_AB_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid AB voltage\": {\n		\"data\": \""${ab_u_array[$c]}"\",\n		\"units\": \"V\"},\r");
		fi
		
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid BC voltage: "${bc_u_array[$c]}" V");
			else	
				echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid BC voltage;"${bc_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_BC_voltage>"${bc_u_array[$c]}"<units>V</units></Grid_BC_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid BC voltage\": {\n		\"data\": \""${bc_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid CA voltage: "${ca_u_array[$c]}" V");			
			else
				echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"
			fi
						
			csv[$c]=$( echo ${csv[$c]}"\nGrid CA voltage;"${ca_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_CA_voltage>"${ca_u_array[$c]}"<units>V</units></Grid_CA_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid CA voltage\": {\n		\"data\": \""${ca_u_array[$c]}"\",\n		\"units\": \"V\"},\r");							
		fi
		
		if [[ ! ${a_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase A voltage: "${a_u_array[$c]}" V");			
			else	
				echo -e "	Phase A voltage: "${a_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase A voltage;"${a_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_A_voltage>"${a_u_array[$c]}"<units>V</units></Phase_A_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase A voltage\": {\n		\"data\": \""${a_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${b_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase B voltage: "${b_u_array[$c]}" V");			
			else		
				echo -e "	Phase B voltage: "${b_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase B voltage;"${b_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_B_voltage>"${b_u_array[$c]}"<units>V</units></Phase_B_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase B voltage\": {\n		\"data\": \""${b_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${c_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase C voltage: "${c_u_array[$c]}" V");			
			else		
				echo -e "	Phase C voltage: "${c_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase C voltage;"${c_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_C_voltage>"${c_u_array[$c]}"<units>V</units></Phase_C_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase C voltage\": {\n		\"data\": \""${c_u_array[$c]}"\",\n		\"units\": \"V\"},\r");								
		fi
		
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase A current: "${a_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase A current: "${a_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase A current;"${a_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_A_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_A_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase A current\": {\n		\"data\": \""${a_i_array[$c]}"\",\n		\"units\": \"A\"},\r");								
		fi
		
		if [[ ! ${b_i_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase B current: "${b_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase B current: "${b_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase B current;"${b_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_B_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_B_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase B current\": {\n		\"data\": \""${b_i_array[$c]}"\",\n		\"units\": \"A\"},\r");							
		fi
		
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase C current: "${c_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase C current: "${c_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase C current;"${c_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_C_current>"${c_i_array[$c]}"<units>A</units></Grid_phase_C_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase C current\": {\n		\"data\": \""${c_i_array[$c]}"\",\n		\"units\": \"A\"},\r");						
		fi
		
		if [[ ! ${efficiency_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %");			
			else		
				echo -e "	Inverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter conversion efficiency (manufacturer);"${efficiency_array[$c]}";%\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_conversion_efficiency_manufacturer>"${efficiency_array[$c]}"<units>%</units></Inverter_conversion_efficiency_manufacturer>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter conversion efficiency (manufacturer)\": {\n		\"data\": \""${efficiency_array[$c]}"\",\n		\"units\": \"%\"},\r");			
		fi
		
		if [[ ! ${temperature_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter internal temperature: "${temperature_array[$c]}" °C");			
			else		
				echo -e "	Inverter internal temperature: "${temperature_array[$c]}" °C"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter internal temperature;"${temperature_array[$c]}";°C\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_internal_temperature>"${temperature_array[$c]}"<units>°C</units></Inverter_internal_temperature>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter internal temperature\": {\n		\"data\": \""${temperature_array[$c]}"\",\n		\"units\": \"°C\"},\r");
		fi
			
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPower factor: "${power_factor_array[$c]});			
			else		
				echo -e "	Power factor: "${power_factor_array[$c]}
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPower factor;"${power_factor_array[$c]}";\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Power_factor>"${power_factor_array[$c]}"</Power_factor>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Power factor\": \""${power_factor_array[$c]}"\",\r");				
		fi
		
		if [[ ! ${elec_freq_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid frequency: "${elec_freq_array[$c]}" Hz");			
			else		
				echo -e "	Grid frequency: "${elec_freq_array[$c]}" Hz"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid frequency;"${elec_freq_array[$c]}";Hz\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_frequency>"${elec_freq_array[$c]}"<units>Hz</units></Grid_frequency>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid frequency\": {\n		\"data\": \""${elec_freq_array[$c]}"\",\n		\"units\": \"Hz\"},\r");			
		fi
		
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power: "${active_power_array[$c]}" Kw");			
			else		
				echo -e "	Active power: "${active_power_array[$c]}" Kw"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power;"${active_power_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power>"${active_power_array[$c]}"<units>Kw</units></Active_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power\": {\n		\"data\": \""${active_power_array[$c]}"\",\n		\"units\": \"Kw\"},\r");				
		fi
		
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive output power: "${reactive_power_array[$c]}" KVar");			
			else		
				echo -e "	Reactive output power: "${reactive_power_array[$c]}" KVar"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive output power;"${reactive_power_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_output_power>"${reactive_power_array[$c]}"<units>KVar</units></Reactive_output_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive output power\": {\n		\"data\": \""${reactive_power_array[$c]}"\",\n		\"units\": \"KVar\"},\r");						
		fi
		
		if [[ ! ${day_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nYield today: "${day_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Yield today: "${day_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nYield today;"${day_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Yield_today>"${day_cap_array[$c]}"<units>Kwh</units></Yield_today>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Yield today\": {\n		\"data\": \""${day_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		if [[ ! ${mppt_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw");			
			else		
				echo -e "	MPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw"						
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT (Maximum Power Point Tracking) total input power;"${mppt_power_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_Maximum_Power_Point_Tracking_total_input_power>"${mppt_power_array[$c]}"<units>Kw</units></MPPT_Maximum_Power_Point_Tracking_total_input_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT (Maximum Power Point Tracking) total input power\": {\n		\"data\": \""${mppt_power_array[$c]}"\",\n		\"units\": \"Kw\"},\r");		
		fi
		
		if [[ ! ${pv1_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV1 input voltage: "${pv1_u_array[$c]}" V");			
			else		
				echo -e "	PV1 input voltage: "${pv1_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV1 input voltage;"${pv1_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV1_input_voltage>"${pv1_u_array[$c]}"<units>V</units></PV1_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV1 input voltage\": {\n		\"data\": \""${pv1_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv2_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV2 input voltage: "${pv2_u_array[$c]}" V");			
			else		
				echo -e "	PV2 input voltage: "${pv2_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV2 input voltage;"${pv2_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV2_input_voltage>"${pv2_u_array[$c]}"<units>V</units></PV2_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV2 input voltage\": {\n		\"data\": \""${pv2_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv3_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV3 input voltage: "${pv3_u_array[$c]}" V");			
			else		
				echo -e "	PV3 input voltage: "${pv3_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV3 input voltage;"${pv3_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV3_input_voltage>"${pv3_u_array[$c]}"<units>V</units></PV3_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV3 input voltage\": {\n		\"data\": \""${pv3_u_array[$c]}"\",\n		\"units\": \"V\"},\r");					
		fi
		
		if [[ ! ${pv4_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV4 input voltage: "${pv4_u_array[$c]}" V");			
			else		
				echo -e "	PV4 input voltage: "${pv4_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV4 input voltage;"${pv4_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV4_input_voltage>"${pv4_u_array[$c]}"<units>V</units></PV4_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV4 input voltage\": {\n		\"data\": \""${pv4_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi	
			
		if [[ ! ${pv5_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV5 input voltage: "${pv5_u_array[$c]}" V");			
			else		
				echo -e "	PV5 input voltage: "${pv5_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV5 input voltage;"${pv5_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV5_input_voltage>"${pv5_u_array[$c]}"<units>V</units></PV5_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV5 input voltage\": {\n		\"data\": \""${pv5_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv6_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV6 input voltage: "${pv6_u_array[$c]}" V");			
			else		
				echo -e "	PV6 input voltage: "${pv6_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV6 input voltage;"${pv6_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV6_input_voltage>"${pv6_u_array[$c]}"<units>V</units></PV6_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV6 input voltage\": {\n		\"data\": \""${pv6_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv7_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV7 input voltage: "${pv7_u_array[$c]}" V");			
			else		
				echo -e "	PV7 input voltage: "${pv7_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV7 input voltage;"${pv7_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV7_input_voltage>"${pv7_u_array[$c]}"<units>V</units></PV7_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV7 input voltage\": {\n		\"data\": \""${pv7_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv8_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV8 input voltage: "${pv8_u_array[$c]}" V");			
			else		
				echo -e "	PV8 input voltage: "${pv8_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV8 input voltage;"${pv8_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV8_input_voltage>"${pv8_u_array[$c]}"<units>V</units></PV8_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV8 input voltage\": {\n		\"data\": \""${pv8_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv9_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV9 input voltage: "${pv9_u_array[$c]}" V");			
			else		
				echo -e "	PV9 input voltage: "${pv9_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV9 input voltage;"${pv9_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV9_input_voltage>"${pv9_u_array[$c]}"<units>V</units></PV9_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV9 input voltage\": {\n		\"data\": \""${pv9_u_array[$c]}"\",\n		\"units\": \"V\"},\r");								
		fi
		
		if [[ ! ${pv10_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV10 input voltage: "${pv10_u_array[$c]}" V");			
			else		
				echo -e "	PV10 input voltage: "${pv10_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV10 input voltage;"${pv10_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV10_input_voltage>"${pv10_u_array[$c]}"<units>V</units></PV10_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV10 input voltage\": {\n		\"data\": \""${pv10_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi
		
		if [[ ! ${pv11_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV11 input voltage: "${pv11_u_array[$c]}" V");			
			else		
				echo -e "	PV11 input voltage: "${pv11_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV11 input voltage;"${pv11_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV11_input_voltage>"${pv11_u_array[$c]}"<units>V</units></PV11_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV11 input voltage\": {\n		\"data\": \""${pv11_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv12_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV12 input voltage: "${pv12_u_array[$c]}" V");			
			else		
				echo -e "	PV12 input voltage: "${pv12_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV12 input voltage;"${pv12_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV12_input_voltage>"${pv12_u_array[$c]}"<units>V</units></PV12_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV12 input voltage\": {\n		\"data\": \""${pv12_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv13_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV13 input voltage: "${pv13_u_array[$c]}" V");			
			else		
				echo -e "	PV13 input voltage: "${pv13_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV13 input voltage;"${pv13_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV13_input_voltage>"${pv13_u_array[$c]}"<units>V</units></PV13_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV13 input voltage\": {\n		\"data\": \""${pv13_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv14_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV14 input voltage: "${pv14_u_array[$c]}" V");			
			else		
				echo -e "	PV14 input voltage: "${pv14_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV14 input voltage;"${pv14_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV14_input_voltage>"${pv14_u_array[$c]}"<units>V</units></PV14_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV14 input voltage\": {\n		\"data\": \""${pv14_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv15_u_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV15 input voltage: "${pv15_u_array[$c]}" V");			
			else		
				echo -e "	PV15 input voltage: "${pv15_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV15 input voltage;"${pv15_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV15_input_voltage>"${pv15_u_array[$c]}"<units>V</units></PV15_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV15 input voltage\": {\n		\"data\": \""${pv15_u_array[$c]}"\",\n		\"units\": \"V\"},\r");
		fi
		
		if [[ ! ${pv16_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV16 input voltage: "${pv16_u_array[$c]}" V");			
			else		
				echo -e "	PV16 input voltage: "${pv16_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV16 input voltage;"${pv16_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV16_input_voltage>"${pv16_u_array[$c]}"<units>V</units></PV16_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV16 input voltage\": {\n		\"data\": \""${pv16_u_array[$c]}"\",\n		\"units\": \"V\"},\r");
		fi
		
		if [[ ! ${pv17_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV17 input voltage: "${pv17_u_array[$c]}" V");			
			else		
				echo -e "	PV17 input voltage: "${pv17_u_array[$c]}" V"	
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV17 input voltage;"${pv17_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV17_input_voltage>"${pv17_u_array[$c]}"<units>V</units></PV17_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV17 input voltage\": {\n		\"data\": \""${pv17_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv18_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV18 input voltage: "${pv18_u_array[$c]}" V");			
			else		
				echo -e "	PV18 input voltage: "${pv18_u_array[$c]}" V"	
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV18 input voltage;"${pv18_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV18_input_voltage>"${pv18_u_array[$c]}"<units>V</units></PV18_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV18 input voltage\": {\n		\"data\": \""${pv18_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi
		
		if [[ ! ${pv19_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV19 input voltage: "${pv19_u_array[$c]}" V");			
			else		
				echo -e "	PV19 input voltage: "${pv19_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV19 input voltage;"${pv19_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV19_input_voltage>"${pv19_u_array[$c]}"<units>V</units></PV19_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV19 input voltage\": {\n		\"data\": \""${pv19_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv20_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV20 input voltage: "${pv20_u_array[$c]}" V");			
			else		
				echo -e "	PV20 input voltage: "${pv20_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV20 input voltage;"${pv20_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV20_input_voltage>"${pv20_u_array[$c]}"<units>V</units></PV20_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV20 input voltage\": {\n		\"data\": \""${pv20_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv21_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV21 input voltage: "${pv21_u_array[$c]}" V");			
			else		
				echo -e "	PV21 input voltage: "${pv21_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV21 input voltage;"${pv21_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV21_input_voltage>"${pv21_u_array[$c]}"<units>V</units></PV21_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV21 input voltage\": {\n		\"data\": \""${pv21_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv22_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV22 input voltage: "${pv22_u_array[$c]}" V");			
			else		
				echo -e "	PV22 input voltage: "${pv22_u_array[$c]}" V"	
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV22 input voltage;"${pv22_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV22_input_voltage>"${pv22_u_array[$c]}"<units>V</units></PV22_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV22 input voltage\": {\n		\"data\": \""${pv22_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv23_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV23 input voltage: "${pv23_u_array[$c]}" V");			
			else		
				echo -e "	PV23 input voltage: "${pv23_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV23 input voltage;"${pv23_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV23_input_voltage>"${pv23_u_array[$c]}"<units>V</units></PV23_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV23 input voltage\": {\n		\"data\": \""${pv23_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv24_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV24 input voltage: "${pv24_u_array[$c]}" V");			
			else		
				echo -e "	PV24 input voltage: "${pv24_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV24 input voltage;"${pv24_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV24_input_voltage>"${pv24_u_array[$c]}"<units>V</units></PV24_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV24 input voltage\": {\n		\"data\": \""${pv24_u_array[$c]}"\",\n		\"units\": \"V\"},\r");					
		fi
		
		if [[ ! ${pv1_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV1 input current: "${pv1_i_array[$c]}" A");			
			else		
				echo -e "	PV1 input current: "${pv1_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV1 input current;"${pv1_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV1_input_current>"${pv1_i_array[$c]}"<units>A</units></PV1_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV1 input current\": {\n		\"data\": \""${pv1_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv2_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV2 input current: "${pv2_i_array[$c]}" A");			
			else		
				echo -e "	PV2 input current: "${pv2_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV2 input current;"${pv2_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV2_input_current>"${pv2_i_array[$c]}"<units>A</units></PV2_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV2 input current\": {\n		\"data\": \""${pv2_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv3_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV3 input current: "${pv3_i_array[$c]}" A");			
			else		
				echo -e "	PV3 input current: "${pv3_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV3 input current;"${pv3_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV3_input_current>"${pv3_i_array[$c]}"<units>A</units></PV3_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV3 input current\": {\n		\"data\": \""${pv3_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv4_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV4 input current: "${pv4_i_array[$c]}" A");			
			else		
				echo -e "	PV4 input current: "${pv4_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV4 input current;"${pv4_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV4_input_current>"${pv4_i_array[$c]}"<units>A</units></PV4_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV4 input current\": {\n		\"data\": \""${pv4_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv5_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV5 input current: "${pv5_i_array[$c]}" A");			
			else		
				echo -e "	PV5 input current: "${pv5_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV5 input current;"${pv5_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV5_input_current>"${pv5_i_array[$c]}"<units>A</units></PV5_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV5 input current\": {\n		\"data\": \""${pv5_i_array[$c]}"\",\n		\"units\": \"A\"},\r");		
		fi
		
		if [[ ! ${pv6_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV6 input current: "${pv6_i_array[$c]}" A");			
			else		
				echo -e "	PV6 input current: "${pv6_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV6 input current;"${pv6_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV6_input_current>"${pv6_i_array[$c]}"<units>A</units></PV6_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV6 input current\": {\n		\"data\": \""${pv6_i_array[$c]}"\",\n		\"units\": \"A\"},\r");					
		fi
		
		if [[ ! ${pv7_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV7 input current: "${pv7_i_array[$c]}" A");			
			else		
				echo -e "	PV7 input current: "${pv7_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV7 input current;"${pv7_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV7_input_current>"${pv7_i_array[$c]}"<units>A</units></PV7_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV7 input current\": {\n		\"data\": \""${pv7_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv8_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV8 input current: "${pv8_i_array[$c]}" A");			
			else		
				echo -e "	PV8 input current: "${pv8_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV8 input current;"${pv8_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV8_input_current>"${pv8_i_array[$c]}"<units>A</units></PV8_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV8 input current\": {\n		\"data\": \""${pv8_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv9_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV9 input current: "${pv9_i_array[$c]}" A");			
			else		
				echo -e "	PV9 input current: "${pv9_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV9 input current;"${pv9_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV9_input_current>"${pv9_i_array[$c]}"<units>A</units></PV9_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV9 input current\": {\n		\"data\": \""${pv9_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv10_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV10 input current: "${pv10_i_array[$c]}" A");			
			else		
				echo -e "	PV10 input current: "${pv10_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV10 input current;"${pv10_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV10_input_current>"${pv10_i_array[$c]}"<units>A</units></PV10_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV10 input current\": {\n		\"data\": \""${pv10_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv11_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV11 input current: "${pv11_i_array[$c]}" A");			
			else		
				echo -e "	PV11 input current: "${pv11_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV11 input current;"${pv11_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV11_input_current>"${pv11_i_array[$c]}"<units>A</units></PV11_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV11 input current\": {\n		\"data\": \""${pv11_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv12_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV12 input current: "${pv12_i_array[$c]}" A");			
			else		
				echo -e "	PV12 input current: "${pv12_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV12 input current;"${pv12_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV12_input_current>"${pv12_i_array[$c]}"<units>A</units></PV12_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV12 input current\": {\n		\"data\": \""${pv12_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv13_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV13 input current: "${pv13_i_array[$c]}" A");			
			else		
				echo -e "	PV13 input current: "${pv13_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV13 input current;"${pv13_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV13_input_current>"${pv13_i_array[$c]}"<units>A</units></PV13_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV13 input current\": {\n		\"data\": \""${pv13_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv14_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV14 input current: "${pv14_i_array[$c]}" A");			
			else		
				echo -e "	PV14 input current: "${pv14_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV14 input current;"${pv14_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV14_input_current>"${pv14_i_array[$c]}"<units>A</units></PV14_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV14 input current\": {\n		\"data\": \""${pv14_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv15_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV15 input current: "${pv15_i_array[$c]}" A");			
			else		
				echo -e "	PV15 input current: "${pv15_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV15 input current;"${pv15_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV15_input_current>"${pv15_i_array[$c]}"<units>A</units></PV15_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV15 input current\": {\n		\"data\": \""${pv15_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv16_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV16 input current: "${pv16_i_array[$c]}" A");			
			else		
				echo -e "	PV16 input current: "${pv16_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV16 input current;"${pv16_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV16_input_current>"${pv16_i_array[$c]}"<units>A</units></PV16_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV16 input current\": {\n		\"data\": \""${pv16_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv17_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV17 input current: "${pv17_i_array[$c]}" A");			
			else		
				echo -e "	PV17 input current: "${pv17_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV17 input current;"${pv17_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV17_input_current>"${pv17_i_array[$c]}"<units>A</units></PV17_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV17 input current\": {\n		\"data\": \""${pv17_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv18_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV18 input current: "${pv18_i_array[$c]}" A");			
			else		
				echo -e "	PV18 input current: "${pv18_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV18 input current;"${pv18_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV18_input_current>"${pv18_i_array[$c]}"<units>A</units></PV18_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV18 input current\": {\n		\"data\": \""${pv18_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv19_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV19 input current: "${pv19_i_array[$c]}" A");			
			else		
				echo -e "	PV19 input current: "${pv19_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV19 input current;"${pv19_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV19_input_current>"${pv19_i_array[$c]}"<units>A</units></PV19_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV19 input current\": {\n		\"data\": \""${pv19_i_array[$c]}"\",\n		\"units\": \"A\"},\r");					
		fi
		
		if [[ ! ${pv20_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV20 input current: "${pv20_i_array[$c]}" A");			
			else		
				echo -e "	PV20 input current: "${pv20_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV20 input current;"${pv20_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV20_input_current>"${pv20_i_array[$c]}"<units>A</units></PV20_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV20 input current\": {\n		\"data\": \""${pv20_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${pv21_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV21 input current: "${pv21_i_array[$c]}" A");			
			else		
				echo -e "	PV21 input current: "${pv21_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV21 input current;"${pv21_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV21_input_current>"${pv21_i_array[$c]}"<units>A</units></PV21_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV21 input current\": {\n		\"data\": \""${pv21_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv22_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV22 input current: "${pv22_i_array[$c]}" A");			
			else		
				echo -e "	PV22 input current: "${pv22_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV22 input current;"${pv22_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV22_input_current>"${pv22_i_array[$c]}"<units>A</units></PV22_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV22 input current\": {\n		\"data\": \""${pv22_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv23_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV23 input current: "${pv23_i_array[$c]}" A");			
			else		
				echo -e "	PV23 input current: "${pv23_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV23 input current;"${pv23_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV23_input_current>"${pv23_i_array[$c]}"<units>A</units></PV23_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV23 input current\": {\n		\"data\": \""${pv23_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv24_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV24 input current: "${pv24_i_array[$c]}" A");			
			else		
				echo -e "	PV24 input current: "${pv24_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV24 input current;"${pv24_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV24_input_current>"${pv24_i_array[$c]}"<units>A</units></PV24_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV24 input current\": {\n		\"data\": \""${pv24_i_array[$c]}"\",\n		\"units\": \"A\"},\r");					
		fi
		
		if [[ ! ${total_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTotal yield: "${total_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Total yield: "${total_cap_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTotal yield;"${total_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Total_yield>"${total_cap_array[$c]}"<units>Kwh</units></Total_yield>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Total yield\": {\n		\"data\": \""${total_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");						
		fi
		
		if [[ ! ${open_time_array[$c]} == null  ]];
		then				
			local startup_time=$(echo ${open_time_array[$c]::-3})
			local startup_time=$(date -d @$startup_time)	
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter last startup time: "$startup_time);			
			else		
				echo -e "	Inverter last startup time: "$startup_time
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter last startup time;"$startup_time"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_last_startup_time>"$startup_time"</Inverter_last_startup_time>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter last startup time\": \""$startup_time"\",\r");										
		fi
		
		if [[ ! ${close_time_array[$c]} == null  ]];
		then	
			local shutdown_time=$(echo ${close_time_array[$c]::-3})
			local shutdown_time=$(date -d @$shutdown_time)	
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter last shutdown time: "$shutdown_time);			
			else		
				echo -e "	Inverter last shutdown time: "$shutdown_time
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter last shutdown time;"$shutdown_time"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_last_shutdown_time>"$shutdown_time"</Inverter_last_shutdown_time>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter last shutdown time\": \""$shutdown_time"\",\r");			
		fi
		
		if [[ ! ${mppt_total_cap_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTotal DC input energy: "${mppt_total_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Total DC input energy: "${mppt_total_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTotal DC input energy;"${mppt_total_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Total_DC_input_energy>"${mppt_total_cap_array[$c]}"<units>Kwh</units></Total_DC_input_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Total DC input energy\": {\n		\"data\": \""${mppt_total_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		if [[ ! ${mppt_1_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 1 DC total energy: "${mppt_1_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 1 DC total energy: "${mppt_1_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 1 DC total energy;"${mppt_1_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_1_DC_total_energy>"${mppt_1_cap_array[$c]}"<units>Kwh</units></MPPT_1_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 1 DC total energy\": {\n		\"data\": \""${mppt_1_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");						
		fi
		
		if [[ ! ${mppt_2_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 2 DC total energy: "${mppt_2_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 2 DC total energy: "${mppt_2_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 2 DC total energy;"${mppt_2_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_2_DC_total_energy>"${mppt_2_cap_array[$c]}"<units>Kwh</units></MPPT_2_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 2 DC total energy\": {\n		\"data\": \""${mppt_2_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
		
		if [[ ! ${mppt_3_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 3 DC total energy: "${mppt_3_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 3 DC total energy: "${mppt_3_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 3 DC total energy;"${mppt_3_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_3_DC_total_energy>"${mppt_3_cap_array[$c]}"<units>Kwh</units></MPPT_3_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 3 DC total energy\": {\n		\"data\": \""${mppt_3_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		if [[ ! ${mppt_4_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 4 DC total energy: "${mppt_4_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 4 DC total energy: "${mppt_4_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 4 DC total energy;"${mppt_4_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_4_DC_total_energy>"${mppt_4_cap_array[$c]}"<units>Kwh</units></MPPT_4_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 4 DC total energy\": {\n		\"data\": \""${mppt_4_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
		
		if [[ ! ${mppt_5_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 5 DC total energy: "${mppt_5_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 5 DC total energy: "${mppt_5_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 5 DC total energy;"${mppt_5_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_5_DC_total_energy>"${mppt_5_cap_array[$c]}"<units>Kwh</units></MPPT_5_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 5 DC total energy\": {\n		\"data\": \""${mppt_5_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
		
		if [[ ! ${mppt_6_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 6 DC total energy: "${mppt_6_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 6 DC total energy: "${mppt_6_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 6 DC total energy;"${mppt_6_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_6_DC_total_energy>"${mppt_6_cap_array[$c]}"<units>Kwh</units></MPPT_6_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 6 DC total energy\": {\n		\"data\": \""${mppt_6_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		if [[ ! ${mppt_7_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 7 DC total energy: "${mppt_7_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 7 DC total energy: "${mppt_7_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 7 DC total energy;"${mppt_7_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_7_DC_total_energy>"${mppt_7_cap_array[$c]}"<units>Kwh</units></MPPT_7_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 7 DC total energy\": {\n		\"data\": \""${mppt_7_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
		
		if [[ ! ${mppt_8_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 8 DC total energy: "${mppt_8_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 8 DC total energy: "${mppt_8_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 8 DC total energy;"${mppt_8_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_8_DC_total_energy>"${mppt_8_cap_array[$c]}"<units>Kwh</units></MPPT_8_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 8 DC total energy\": {\n		\"data\": \""${mppt_8_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		if [[ ! ${mppt_9_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 9 DC total energy: "${mppt_9_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 9 DC total energy: "${mppt_9_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 9 DC total energy;"${mppt_9_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_9_DC_total_energy>"${mppt_9_cap_array[$c]}"<units>Kwh</units></MPPT_9_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 9 DC total energy\": {\n		\"data\": \""${mppt_9_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");						
		fi
		
		if [[ ! ${mppt_10_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 10 DC total energy: "${mppt_10_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 10 DC total energy: "${mppt_10_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 10 DC total energy;"${mppt_10_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_10_DC_total_energy>"${mppt_10_cap_array[$c]}"<units>Kwh</units></MPPT_10_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 10 DC total energy\": {\n		\"data\": \""${mppt_10_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
		
		#special for checking if inverter is disconected 
		else
		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nNo any Real-time data when device is disconected!");			
			else		
				echo -e "	No any Real-time data when device is disconected!"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nNo any Real-time data when device is disconected\!\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<No_any_Real_time_data_when_device_is_disconected>No data</No_any_Real_time_data_when_device_is_disconected>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"No any Real-time data when device is disconected\!\": {\n		\"No any Real-time data when device is disconected\!\": \"No data\"},\r");		
		
		
		#special loop finish for checking if inverter is disconected 
		fi

		if [[ ! ${run_state_array[$c]} == null  ]];
		then	
			if [[ ${run_state_array[$c]} == 0  ]];
			then
			device_status="Disconnected"
			elif [[ ${run_state_array[$c]} == 1  ]];
			then
			device_status="Connected "
			#elif [[ ${run_state_array[$c]} == 2  ]];
			#then
			#device_status="Connected but Standby"
			else
			device_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nStatus: "$device_status);			
			else		
				echo -e "	Status: "$device_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nStatus;"$device_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Status>"$device_status"</Status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Status\": \""$device_status"\"\r");
						
		fi
	done
fi



# device is Residential inverter
if [[ $success == "true"  ]] && [[  $2 == 38  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi

	
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )); do
	
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");

		
		
		if [[ ! ${inverter_state_array[$c]} == null  ]];
		then	
		
			#decimal number to hexdecimal
			local hex=$( printf "%x" ${inverter_state_array[$c]} );
			#echo $hex

			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter status: "
				inverter_state $hex);
			else
				printf "	Inverter status: "
				#function to check inverter status
				inverter_state $hex
				echo ""
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\n"
			printf "Inverter status;" 
			inverter_state $hex
			printf "\r");
		
			xml[$c]=$( echo ${xml[$c]}
			printf "\n<Inverter_status>"
			inverter_state $hex
			printf "</Inverter_status>"
			printf "\r"); 
		
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter status\": \""
			inverter_state $hex
			printf "\",\r"); 						
		fi
		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid AB voltage: "${ab_u_array[$c]}" V");
			else
				echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid AB voltage;"${ab_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_AB_voltage>"${ab_u_array[$c]}"<units>V</units></Grid_AB_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid AB voltage\": {\n		\"data\": \""${ab_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid BC voltage: "${bc_u_array[$c]}" V");
			else	
				echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid BC voltage;"${bc_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_BC_voltage>"${bc_u_array[$c]}"<units>V</units></Grid_BC_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid BC voltage\": {\n		\"data\": \""${bc_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid CA voltage: "${ca_u_array[$c]}" V");			
			else
				echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"
			fi
						
			csv[$c]=$( echo ${csv[$c]}"\nGrid CA voltage;"${ca_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_CA_voltage>"${ca_u_array[$c]}"<units>V</units></Grid_CA_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid CA voltage\": {\n		\"data\": \""${ca_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${a_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase A voltage: "${a_u_array[$c]}" V");			
			else	
				echo -e "	Phase A voltage: "${a_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase A voltage;"${a_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_A_voltage>"${a_u_array[$c]}"<units>V</units></Phase_A_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase A voltage\": {\n		\"data\": \""${a_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${b_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase B voltage: "${b_u_array[$c]}" V");			
			else		
				echo -e "	Phase B voltage: "${b_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase B voltage;"${b_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_B_voltage>"${b_u_array[$c]}"<units>V</units></Phase_B_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase B voltage\": {\n		\"data\": \""${b_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${c_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase C voltage: "${c_u_array[$c]}" V");			
			else		
				echo -e "	Phase C voltage: "${c_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase C voltage;"${c_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_C_voltage>"${c_u_array[$c]}"<units>V</units></Phase_C_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase C voltage\": {\n		\"data\": \""${c_u_array[$c]}"\",\n		\"units\": \"V\"},\r");					
		fi
		
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase A current: "${a_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase A current: "${a_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase A current;"${a_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_A_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_A_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase A current\": {\n		\"data\": \""${a_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${b_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase B current: "${b_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase B current: "${b_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase B current;"${b_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_B_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_B_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase B current\": {\n		\"data\": \""${b_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase C current: "${c_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase C current: "${c_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase C current;"${c_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_C_current>"${c_i_array[$c]}"<units>A</units></Grid_phase_C_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase C current\": {\n		\"data\": \""${c_i_array[$c]}"\",\n		\"units\": \"A\"},\r");					
		fi
		
		if [[ ! ${efficiency_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %");			
			else		
				echo -e "	Inverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter conversion efficiency (manufacturer);"${efficiency_array[$c]}";%\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_conversion_efficiency_manufacturer>"${efficiency_array[$c]}"<units>%</units></Inverter_conversion_efficiency_manufacturer>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter conversion efficiency (manufacturer)\": {\n		\"data\": \""${efficiency_array[$c]}"\",\n		\"units\": \"%\"},\r");				
		fi
		
		if [[ ! ${temperature_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter internal temperature: "${temperature_array[$c]}" °C");			
			else		
				echo -e "	Inverter internal temperature: "${temperature_array[$c]}" °C"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter internal temperature;"${temperature_array[$c]}";°C\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_internal_temperature>"${temperature_array[$c]}"<units>°C</units></Inverter_internal_temperature>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter internal temperature\": {\n		\"data\": \""${temperature_array[$c]}"\",\n		\"units\": \"°C\"},\r");			
		fi
		
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPower factor: "${power_factor_array[$c]});			
			else		
				echo -e "	Power factor: "${power_factor_array[$c]}
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPower factor;"${power_factor_array[$c]}";\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Power_factor>"${power_factor_array[$c]}"</Power_factor>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Power factor\": \""${power_factor_array[$c]}"\",\r");			
		fi
		
		if [[ ! ${elec_freq_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid frequency: "${elec_freq_array[$c]}" Hz");			
			else		
				echo -e "	Grid frequency: "${elec_freq_array[$c]}" Hz"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid frequency;"${elec_freq_array[$c]}";Hz\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_frequency>"${elec_freq_array[$c]}"<units>Hz</units></Grid_frequency>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid frequency\": {\n		\"data\": \""${elec_freq_array[$c]}"\",\n		\"units\": \"Hz\"},\r");			
		fi
		
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power: "${active_power_array[$c]}" Kw");			
			else		
				echo -e "	Active power: "${active_power_array[$c]}" Kw"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power;"${active_power_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power>"${active_power_array[$c]}"<units>Kw</units></Active_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power\": {\n		\"data\": \""${active_power_array[$c]}"\",\n		\"units\": \"Kw\"},\r");		
		fi
		
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive output power: "${reactive_power_array[$c]}" KVar");			
			else		
				echo -e "	Reactive output power: "${reactive_power_array[$c]}" KVar"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive output power;"${reactive_power_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_output_power>"${reactive_power_array[$c]}"<units>KVar</units></Reactive_output_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive output power\": {\n		\"data\": \""${reactive_power_array[$c]}"\",\n		\"units\": \"KVar\"},\r");			
		fi
		
		if [[ ! ${day_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nYield today: "${day_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Yield today: "${day_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nYield today;"${day_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Yield_today>"${day_cap_array[$c]}"<units>Kwh</units></Yield_today>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Yield today\": {\n		\"data\": \""${day_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${mppt_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw");			
			else		
				echo -e "	MPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw"						
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT (Maximum Power Point Tracking) total input power;"${mppt_power_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_Maximum_Power_Point_Tracking_total_input_power>"${mppt_power_array[$c]}"<units>Kw</units></MPPT_Maximum_Power_Point_Tracking_total_input_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT (Maximum Power Point Tracking) total input power\": {\n		\"data\": \""${mppt_power_array[$c]}"\",\n		\"units\": \"Kw\"},\r");		
		fi
		
		if [[ ! ${pv1_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV1 input voltage: "${pv1_u_array[$c]}" V");			
			else		
				echo -e "	PV1 input voltage: "${pv1_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV1 input voltage;"${pv1_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV1_input_voltage>"${pv1_u_array[$c]}"<units>V</units></PV1_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV1 input voltage\": {\n		\"data\": \""${pv1_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${pv2_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV2 input voltage: "${pv2_u_array[$c]}" V");			
			else		
				echo -e "	PV2 input voltage: "${pv2_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV2 input voltage;"${pv2_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV2_input_voltage>"${pv2_u_array[$c]}"<units>V</units></PV2_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV2 input voltage\": {\n		\"data\": \""${pv2_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv3_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV3 input voltage: "${pv3_u_array[$c]}" V");			
			else		
				echo -e "	PV3 input voltage: "${pv3_u_array[$c]}" V"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV3 input voltage;"${pv3_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV3_input_voltage>"${pv3_u_array[$c]}"<units>V</units></PV3_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV3 input voltage\": {\n		\"data\": \""${pv3_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		
		if [[ ! ${pv4_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV4 input voltage: "${pv4_u_array[$c]}" V");			
			else		
				echo -e "	PV4 input voltage: "${pv4_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV4 input voltage;"${pv4_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV4_input_voltage>"${pv4_u_array[$c]}"<units>V</units></PV4_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV4 input voltage\": {\n		\"data\": \""${pv4_u_array[$c]}"\",\n		\"units\": \"V\"},\r");
		fi
					
		if [[ ! ${pv5_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV5 input voltage: "${pv5_u_array[$c]}" V");			
			else		
				echo -e "	PV5 input voltage: "${pv5_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV5 input voltage;"${pv5_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV5_input_voltage>"${pv5_u_array[$c]}"<units>V</units></PV5_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV5 input voltage\": {\n		\"data\": \""${pv5_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi
		
		if [[ ! ${pv6_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV6 input voltage: "${pv6_u_array[$c]}" V");			
			else		
				echo -e "	PV6 input voltage: "${pv6_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV6 input voltage;"${pv6_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV6_input_voltage>"${pv6_u_array[$c]}"<units>V</units></PV6_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV6 input voltage\": {\n		\"data\": \""${pv6_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi
		
		if [[ ! ${pv7_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV7 input voltage: "${pv7_u_array[$c]}" V");			
			else		
				echo -e "	PV7 input voltage: "${pv7_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV7 input voltage;"${pv7_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV7_input_voltage>"${pv7_u_array[$c]}"<units>V</units></PV7_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV7 input voltage\": {\n		\"data\": \""${pv7_u_array[$c]}"\",\n		\"units\": \"V\"},\r");		
		fi
		
		if [[ ! ${pv8_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV8 input voltage: "${pv8_u_array[$c]}" V");			
			else		
				echo -e "	PV8 input voltage: "${pv8_u_array[$c]}" V"		
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV8 input voltage;"${pv8_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV8_input_voltage>"${pv8_u_array[$c]}"<units>V</units></PV8_input_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV8 input voltage\": {\n		\"data\": \""${pv8_u_array[$c]}"\",\n		\"units\": \"V\"},\r");			
		fi
		if [[ ! ${pv1_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV1 input current: "${pv1_i_array[$c]}" A");			
			else		
				echo -e "	PV1 input current: "${pv1_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV1 input current;"${pv1_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV1_input_current>"${pv1_i_array[$c]}"<units>A</units></PV1_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV1 input current\": {\n		\"data\": \""${pv1_i_array[$c]}"\",\n		\"units\": \"A\"},\r");		
		fi
		
		if [[ ! ${pv2_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV2 input current: "${pv2_i_array[$c]}" A");			
			else		
				echo -e "	PV2 input current: "${pv2_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV2 input current;"${pv2_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV2_input_current>"${pv2_i_array[$c]}"<units>A</units></PV2_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV2 input current\": {\n		\"data\": \""${pv2_i_array[$c]}"\",\n		\"units\": \"A\"},\r");		
		fi
		
		if [[ ! ${pv3_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV3 input current: "${pv3_i_array[$c]}" A");			
			else		
				echo -e "	PV3 input current: "${pv3_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV3 input current;"${pv3_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV3_input_current>"${pv3_i_array[$c]}"<units>A</units></PV3_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV3 input current\": {\n		\"data\": \""${pv3_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv4_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV4 input current: "${pv4_i_array[$c]}" A");			
			else		
				echo -e "	PV4 input current: "${pv4_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV4 input current;"${pv4_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV4_input_current>"${pv4_i_array[$c]}"<units>A</units></PV4_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV4 input current\": {\n		\"data\": \""${pv4_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv5_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV5 input current: "${pv5_i_array[$c]}" A");			
			else		
				echo -e "	PV5 input current: "${pv5_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV5 input current;"${pv5_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV5_input_current>"${pv5_i_array[$c]}"<units>A</units></PV5_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV5 input current\": {\n		\"data\": \""${pv5_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv6_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV6 input current: "${pv6_i_array[$c]}" A");			
			else		
				echo -e "	PV6 input current: "${pv6_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV6 input current;"${pv6_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV6_input_current>"${pv6_i_array[$c]}"<units>A</units></PV6_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV6 input current\": {\n		\"data\": \""${pv6_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${pv7_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV7 input current: "${pv7_i_array[$c]}" A");			
			else		
				echo -e "	PV7 input current: "${pv7_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV7 input current;"${pv7_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV7_input_current>"${pv7_i_array[$c]}"<units>A</units></PV7_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV7 input current\": {\n		\"data\": \""${pv7_i_array[$c]}"\",\n		\"units\": \"A\"},\r");		
		fi
		
		if [[ ! ${pv8_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV8 input current: "${pv8_i_array[$c]}" A");			
			else		
				echo -e "	PV8 input current: "${pv8_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV8 input current;"${pv8_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV8_input_current>"${pv8_i_array[$c]}"<units>A</units></PV8_input_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV8 input current\": {\n		\"data\": \""${pv8_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${total_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTotal yield: "${total_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Total yield: "${total_cap_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTotal yield;"${total_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Total_yield>"${total_cap_array[$c]}"<units>Kwh</units></Total_yield>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Total yield\": {\n		\"data\": \""${total_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");		
		fi
		
		if [[ ! ${open_time_array[$c]} == null  ]];
		then				
			local startup_time=$(echo ${open_time_array[$c]::-3})
			local startup_time=$(date -d @$startup_time)	
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter last startup time: "$startup_time);			
			else		
				echo -e "	Inverter last startup time: "$startup_time
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter last startup time;"$startup_time"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_last_startup_time>"$startup_time"</Inverter_last_startup_time>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter last startup time\": \""$startup_time"\",\r");														
		fi
		
		if [[ ! ${close_time_array[$c]} == null  ]];
		then	
			local shutdown_time=$(echo ${close_time_array[$c]::-3})
			local shutdown_time=$(date -d @$shutdown_time)
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nInverter last shutdown time: "$shutdown_time);			
			else		
				echo -e "	Inverter last shutdown time: "$shutdown_time
			fi
			csv[$c]=$( echo ${csv[$c]}"\nInverter last shutdown time;"$shutdown_time"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Inverter_last_shutdown_time>"$shutdown_time"</Inverter_last_shutdown_time>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Inverter last shutdown time\": \""$shutdown_time"\",\r");				
		fi
		
		if [[ ! ${mppt_total_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTotal DC input energy: "${mppt_total_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Total DC input energy: "${mppt_total_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTotal DC input energy;"${mppt_total_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Total_DC_input_energy>"${mppt_total_cap_array[$c]}"<units>Kwh</units></Total_DC_input_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Total DC input energy\": {\n		\"data\": \""${mppt_total_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${mppt_1_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 1 DC total energy: "${mppt_1_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 1 DC total energy: "${mppt_1_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 1 DC total energy;"${mppt_1_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_1_DC_total_energy>"${mppt_1_cap_array[$c]}"<units>Kwh</units></MPPT_1_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 1 DC total energy\": {\n		\"data\": \""${mppt_1_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${mppt_2_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 2 DC total energy: "${mppt_2_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 2 DC total energy: "${mppt_2_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 2 DC total energy;"${mppt_2_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_2_DC_total_energy>"${mppt_2_cap_array[$c]}"<units>Kwh</units></MPPT_2_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 2 DC total energy\": {\n		\"data\": \""${mppt_2_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");		
		fi
		
		if [[ ! ${mppt_3_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 3 DC total energy: "${mppt_3_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 3 DC total energy: "${mppt_3_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 3 DC total energy;"${mppt_3_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_3_DC_total_energy>"${mppt_3_cap_array[$c]}"<units>Kwh</units></MPPT_3_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 3 DC total energy\": {\n		\"data\": \""${mppt_3_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${mppt_4_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMPPT 4 DC total energy: "${mppt_4_cap_array[$c]}" Kwh");			
			else		
				echo -e "	MPPT 4 DC total energy: "${mppt_4_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMPPT 4 DC total energy;"${mppt_4_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<MPPT_4_DC_total_energy>"${mppt_4_cap_array[$c]}"<units>Kwh</units></MPPT_4_DC_total_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"MPPT 4 DC total energy\": {\n		\"data\": \""${mppt_4_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${run_state_array[$c]} == null  ]];
		then	
			if [[ ${run_state_array[$c]} == 0  ]];
			then
			device_status="Disconnected"
			elif [[ ${run_state_array[$c]} == 1  ]];
			then
			device_status="Connected"
			else
			device_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nStatus: "$device_status);			
			else		
				echo -e "	Status: "$device_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nStatus;"$device_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Status>"$device_status"</Status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Status\": \""$device_status"\"\r");			
		fi
	done
fi


# device is EMI
if [[ $success == "true"  ]] && [[ $2 == 10  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi
	
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )); do
		
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");
					
		
		if [[ ! ${temperature_array[$c]} == null  ]];
		then		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTemperature: "${temperature_array[$c]}" °C");			
			else		
				echo -e "	Temperature: "${temperature_array[$c]}" °C"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTemperature;"${temperature_array[$c]}";°C\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Temperature>"${temperature_array[$c]}"<units>°C</units></Temperature>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Temperature\": {\n		\"data\": \""${temperature_array[$c]}"\",\n		\"units\": \"°C\"},\r");				
		fi	
				
		if [[ ! ${pv_temperature_array[$c]} == null  ]];
		then		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPV Temperature: "${temperature_array[$c]}" °C");			
			else		
				echo -e "	PV temperature: "${pv_temperature_array[$c]}" °C"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPV Temperature;"${temperature_array[$c]}";°C\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<PV_Temperature>"${temperature_array[$c]}"<units>°C</units></PV_Temperature>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"PV_Temperature\": {\n		\"data\": \""${temperature_array[$c]}"\",\n		\"units\": \"°C\"},\r");				
		fi
			
		if [[ ! ${wind_speed_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nWind speed: "${wind_speed_array[$c]}" m/s");			
			else		
				echo -e "	Wind speed: "${wind_speed_array[$c]}" m/s"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nWind speed;"${wind_speed_array[$c]}";m/s\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Wind_speed>"${wind_speed_array[$c]}"<units>m/s</units></Wind_speed>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Wind speed\": {\n		\"data\": \""${wind_speed_array[$c]}"\",\n		\"units\": \"m/s\"},\r");				
		fi	
		
		if [[ ! ${wind_direction_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nWind speed: "${wind_direction_array[$c]});			
			else		
				echo -e "	Wind direction: "${wind_direction_array[$c]}	
			fi
			csv[$c]=$( echo ${csv[$c]}"\nWind speed;"${wind_direction_array[$c]});
			xml[$c]=$( echo ${xml[$c]}"\n<Wind_speed>"${wind_direction_array[$c]}"</Wind_speed>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Wind speed\": \""${wind_direction_array[$c]}"\",\r");			
		fi
			
		if [[ ! ${radiant_total_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nDaily irradiation: "${radiant_total_array[$c]}" MJ/m 2");			
			else		
				echo -e "	Daily irradiation: "${radiant_total_array[$c]}" MJ/m 2"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nDaily irradiation;"${radiant_total_array[$c]}";MJ/m 2\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Daily_irradiation>"${radiant_total_array[$c]}"<units>MJ/m 2</units></Daily_irradiation>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Daily irradiation\": {\n		\"data\": \""${radiant_total_array[$c]}"\",\n		\"units\": \"MJ/m 2\"},\r");				
		fi
			
		if [[ ! ${radiant_line_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nIrradiance: "${radiant_line_array[$c]}" W/m 2");			
			else		
				echo -e "	Irradiance: "${radiant_line_array[$c]}" W/m 2"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nIrradiance;"${radiant_line_array[$c]}";W/m 2\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Irradiance>"${radiant_line_array[$c]}"<units>W/m 2</units></Irradiance>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Irradiance\": {\n		\"data\": \""${radiant_line_array[$c]}"\",\n		\"units\": \"W/m 2\"},\r");				
		fi	
		
		if [[ ! ${horiz_radiant_line_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nHorizontal irradiance: "${horiz_radiant_line_array[$c]}" W/m 2");			
			else		
				echo -e "	Horizontal irradiance: "${horiz_radiant_line_array[$c]}" W/m 2"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nHorizontal irradiance;"${horiz_radiant_line_array[$c]}";W/m 2\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Horizontal_irradiance>"${horiz_radiant_line_array[$c]}"<units>W/m 2</units></Horizontal_irradiance>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Horizontal irradiance\": {\n		\"data\": \""${horiz_radiant_line_array[$c]}"\",\n		\"units\": \"W/m 2\"},\r");	
		fi
		
		if [[ ! ${horiz_radiant_total_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nHorizontal irradiation: "${horiz_radiant_total_array[$c]}" MJ/m 2");			
			else		
				echo -e "	Horizontal irradiation: "${horiz_radiant_total_array[$c]}" MJ/m 2"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nHorizontal irradiation;"${horiz_radiant_total_array[$c]}";MJ/m 2\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Horizontal_irradiation>"${horiz_radiant_total_array[$c]}}"<units>MJ/m 2</units></Horizontal_irradiation>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Horizontal irradiation\": {\n		\"data\": \""${horiz_radiant_total_array[$c]}"\",\n		\"units\": \"MJ/m 2\"},\r");				
		fi
		
		if [[ ! ${run_state_array[$c]} == null  ]];
		then	
			if [[ ${run_state_array[$c]} == 0  ]];
			then
			device_status="Disconnected"
			elif [[ ${run_state_array[$c]} == 1  ]];
			then
			device_status="Connected"
			else
			device_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nStatus: "$device_status);			
			else		
				echo -e "	Status: "$device_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nStatus;"$device_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Status>"$device_status"</Status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Status\": \""$device_status"\"\r");
							
		fi

	done
fi



# device is Meter (Grid meter)
if [[ $success == "true"  ]] && [[ $2 == 17  ]];
	then
	
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi
		
			
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )); do
		
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");
					
		
		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid AB voltage: "${ab_u_array[$c]}" V");
			else
				echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid AB voltage;"${ab_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_AB_voltage>"${ab_u_array[$c]}"<units>V</units></Grid_AB_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid AB voltage\": {\n		\"data\": \""${ab_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid BC voltage: "${bc_u_array[$c]}" V");
			else	
				echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"
			fi
			
			csv[$c]=$( echo ${csv[$c]}"\nGrid BC voltage;"${bc_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_BC_voltage>"${bc_u_array[$c]}"<units>V</units></Grid_BC_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid BC voltage\": {\n		\"data\": \""${bc_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid CA voltage: "${ca_u_array[$c]}" V");			
			else
				echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"
			fi
						
			csv[$c]=$( echo ${csv[$c]}"\nGrid CA voltage;"${ca_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_CA_voltage>"${ca_u_array[$c]}"<units>V</units></Grid_CA_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid CA voltage\": {\n		\"data\": \""${ca_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${a_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase A voltage: "${a_u_array[$c]}" V");			
			else	
				echo -e "	Phase A voltage: "${a_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase A voltage;"${a_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_A_voltage>"${a_u_array[$c]}"<units>V</units></Phase_A_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase A voltage\": {\n		\"data\": \""${a_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${b_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase B voltage: "${b_u_array[$c]}" V");			
			else		
				echo -e "	Phase B voltage: "${b_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase B voltage;"${b_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_B_voltage>"${b_u_array[$c]}"<units>V</units></Phase_B_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase B voltage\": {\n		\"data\": \""${b_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${c_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPhase C voltage: "${c_u_array[$c]}" V");			
			else		
				echo -e "	Phase C voltage: "${c_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPhase C voltage;"${c_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Phase_C_voltage>"${c_u_array[$c]}"<units>V</units></Phase_C_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Phase C voltage\": {\n		\"data\": \""${c_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase A current: "${a_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase A current: "${a_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase A current;"${a_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_A_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_A_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase A current\": {\n		\"data\": \""${a_i_array[$c]}"\",\n		\"units\": \"A\"},\r");			
		fi
		
		if [[ ! ${b_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase B current: "${b_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase B current: "${b_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase B current;"${b_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_B_current>"${a_i_array[$c]}"<units>A</units></Grid_phase_B_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase B current\": {\n		\"data\": \""${b_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid phase C current: "${c_i_array[$c]}" A");			
			else		
				echo -e "	Grid phase C current: "${c_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid phase C current;"${c_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_phase_C_current>"${c_i_array[$c]}"<units>A</units></Grid_phase_C_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid phase C current\": {\n		\"data\": \""${c_i_array[$c]}"\",\n		\"units\": \"A\"},\r");					
		fi
		
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power: "${active_power_array[$c]}" Kw");			
			else		
				echo -e "	Active power: "${active_power_array[$c]}" Kw"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power;"${active_power_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power>"${active_power_array[$c]}"<units>Kw</units></Active_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power\": {\n		\"data\": \""${active_power_array[$c]}"\",\n		\"units\": \"Kw\"},\r");	
		fi
		
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPower factor: "${power_factor_array[$c]});			
			else		
				echo -e "	Power factor: "${power_factor_array[$c]}
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPower factor;"${power_factor_array[$c]}";\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Power_factor>"${power_factor_array[$c]}"</Power_factor>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Power factor\": \""${power_factor_array[$c]}"\",\r");			
		fi
		
		if [[ ! ${active_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive energy (forward active energy): "${active_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Active energy (forward active energy): "${active_cap_array[$c]}" kWh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive energy (forward active energy);"${active_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_energy_forward_active_energy>"${active_cap_array[$c]}"<units>Kwh</units></Active_energy_forward_active_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active energy (forward active energy)\": {\n		\"data\": \""${active_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r" );
		fi
		
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive power: "${reactive_power_array[$c]}" KVar");			
			else		
				echo -e "	Reactive power: "${reactive_power_array[$c]}" KVar"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive power;"${reactive_power_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_power>"${reactive_power_array[$c]}"<units>KVar</units></Reactive_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive power\": {\n		\"data\": \""${reactive_power_array[$c]}"\",\n		\"units\": \"KVar\"},\r");			
		fi
		
		if [[ ! ${reverse_active_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy: "${reverse_active_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse active energy: "${reverse_active_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy;"${reverse_active_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy>"${reverse_active_cap_array[$c]}"<units>Kwh</units></Reverse_active_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy\": {\n		\"data\": \""${reverse_active_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
		
		if [[ ! ${forward_reactive_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy: "${forward_reactive_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Forward reactive energy: "${forward_reactive_cap_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy;"${forward_reactive_cap_array[$c]}}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy>"${forward_reactive_cap_array[$c]}"<units>Kwh</units></Forward_reactive_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy\": {\n		\"data\": \""${forward_reactive_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");						
		fi	
			
		if [[ ! ${reverse_reactive_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy: "${forward_reactive_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse reactive energy: "${reverse_reactive_cap_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy;"${forward_reactive_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy>"${forward_reactive_cap_array[$c]}"<units>Kwh</units></Forward_reactive_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy\": {\n		\"data\": \""${forward_reactive_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");				
		fi
					
		if [[ ! ${active_power_a_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power PA: "${active_power_a_array[$c]}" Kw");			
			else		
				echo -e "	Active power PA: "${active_power_a_array[$c]}" Kw"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power PA;"${active_power_a_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power_PA>"${active_power_a_array[$c]}"<units>Kw</units></Active_power_PA>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power PA\": {\n		\"data\": \""${active_power_a_array[$c]}"\",\n		\"units\": \"Kw\"},\r");			
		fi
		
		if [[ ! ${active_power_b_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power PB: "${active_power_b_array[$c]}" Kw");			
			else		
				echo -e "	Active power PB: "${active_power_b_array[$c]}" Kw"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power PB;"${active_power_b_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power_PB>"${active_power_b_array[$c]}"<units>Kw</units></Active_power_PB>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power PB\": {\n		\"data\": \""${active_power_b_array[$c]}"\",\n		\"units\": \"Kw\"},\r");			
		fi
				
		if [[ ! ${active_power_c_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power PC: "${active_power_c_array[$c]}" Kw");			
			else		
				echo -e "	Active power PC: "${active_power_c_array[$c]}" Kw"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power PC;"${active_power_c_array[$c]}";Kw\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power_PC>"${active_power_c_array[$c]}"<units>Kw</units></Active_power_PC>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power PC\": {\n		\"data\": \""${active_power_c_array[$c]}"\",\n		\"units\": \"Kw\"},\r");			
		fi
				
		if [[ ! ${reactive_power_a_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive power QA: "${reactive_power_a_array[$c]}" KVar");			
			else		
				echo -e "	Reactive power QA: "${reactive_power_a_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive power QA;"${reactive_power_a_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_power_QA>"${reactive_power_a_array[$c]}"<units>KVar</units></Reactive_power_QA>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive power QA\": {\n		\"data\": \""${reactive_power_a_array[$c]}"\",\n		\"units\": \"KVar\"},\r");			
		fi
			
		if [[ ! ${reactive_power_b_array[$c]} == null  ]];
		then		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive power QB: "${reactive_power_b_array[$c]}" KVar");			
			else		
				echo -e "	Reactive power QB: "${reactive_power_b_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive power QB;"${reactive_power_b_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_power_QB>"${reactive_power_b_array[$c]}"<units>KVar</units></Reactive_power_QB>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive power QB\": {\n		\"data\": \""${reactive_power_b_array[$c]}"\",\n		\"units\": \"KVar\"},\r");			
		fi
		
		if [[ ! ${reactive_power_c_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive power QC: "${reactive_power_c_array[$c]}" KVar");			
			else		
				echo -e "	Reactive power QC: "${reactive_power_c_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive power QC;"${reactive_power_c_array[$c]}";KVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_power_QC>"${reactive_power_c_array[$c]}"<units>KVar</units></Reactive_power_QC>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive power QC\": {\n		\"data\": \""${reactive_power_b_array[$c]}"\",\n		\"units\": \"KVar\"},\r");					
		fi
		
		if [[ ! ${total_apparent_power_array[$c]} == null  ]];
		then	
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nTotal apparent power: "${total_apparent_power_array[$c]}" kVA");			
			else		
				echo -e "	Total apparent power: "${total_apparent_power_array[$c]}" kVA"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nTotal apparent power;"${total_apparent_power_array[$c]}";kVA\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Total apparent power>"${total_apparent_power_array[$c]}"<units>kVA</units></Reactive_power_QC>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Total apparent power\": {\n		\"data\": \""${total_apparent_power_array[$c]}"\",\n		\"units\": \"kVA\"},\r");					
		fi			
		
		if [[ ! ${grid_frequency_array[$c]} == null  ]];
		then			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid frequency: "${grid_frequency_array[$c]}" Hz");			
			else		
				echo -e "	Grid frequency: "${grid_frequency_array[$c]}" Hz"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid frequency;"${grid_frequency_array[$c]}";Hz\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_frequency>"${grid_frequency_array[$c]}"<units>Hz</units></Grid_frequency>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid frequency\": {\n		\"data\": \""${grid_frequency_array[$c]}"\",\n		\"units\": \"Hz\"},\r");					
		fi
		
		if [[ ! ${reverse_active_peak_array[$c]} == null  ]];
		then					
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy (peak): "${reverse_active_peak_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse active energy (peak): "${reverse_active_peak_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy (peak);"${reverse_active_peak_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy_(peak)>"${reverse_active_peak_array[$c]}"<units>Kwh</units></Reverse_active_energy_(peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy (peak)\": {\n		\"data\": \""${reverse_active_peak_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");		
		fi
		
		if [[ ! ${reverse_active_power_array[$c]} == null  ]];
		then				
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy (shoulder): "${reverse_active_power_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse active energy (shoulder): "${reverse_active_power_array[$c]}" Kwh"			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy (shoulder);"${reverse_active_power_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy_(shoulder)>"${reverse_active_power_array[$c]}"<units>Kwh</units></Reverse_active_energy_(shoulder)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy (shoulder)\": {\n		\"data\": \""${reverse_active_power_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");
		fi
		
		if [[ ! ${reverse_active_valley_array[$c]} == null  ]];
		then				
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy (off-peak): "${reverse_active_valley_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse active energy (off-peak): "${reverse_active_valley_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy (off-peak);"${reverse_active_valley_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy_(off-peak)>"${reverse_active_valley_array[$c]}"<units>Kwh</units></Reverse_active_energy_(off-peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy (off-peak)\": {\n		\"data\": \""${reverse_active_valley_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");
		fi
			
		if [[ ! ${reverse_active_top_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy (sharp): "${reverse_active_top_array[$c]}" Kwh");			
			else		
				echo -e "	Reverse active energy (sharp): "${reverse_active_top_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy (sharp);"${reverse_active_top_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy_(sharp)>"${reverse_active_top_array[$c]}"<units>Kwh</units></Reverse_active_energy_(sharp)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy (sharp)\": {\n		\"data\": \""${reverse_active_top_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");	
		fi
		
		if [[ ! ${positive_active_peak_array[$c]} == null  ]];
		then				
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward active energy (peak): "${positive_active_peak_array[$c]}" Kwh");			
			else		
				echo -e "	Forward active energy (peak): "${positive_active_peak_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward active energy (peak);"${positive_active_peak_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_active_energy_(peak)>"${positive_active_peak_array[$c]}"<units>Kwh</units></Forward_active_energy_(peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward active energy (peak)\": {\n		\"data\": \""${positive_active_peak_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");	
		fi
		
		if [[ ! ${positive_active_power_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward active energy (shoulder): "${positive_active_power_array[$c]}" Kwh");			
			else		
				echo -e "	Forward active energy (shoulder): "${positive_active_power_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward active energy (shoulder);"${positive_active_power_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_active_energy_(shoulder)>"${positive_active_power_array[$c]}"<units>Kwh</units></Forward_active_energy_(shoulder)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward active energy (shoulder)\": {\n		\"data\": \""${positive_active_power_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");
		fi
		
		if [[ ! ${positive_active_valley_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward active energy (off-peak): "${positive_active_valley_array[$c]}" Kwh");			
			else		
				echo -e "	Forward active energy (off-peak): "${positive_active_valley_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward active energy (off-peak);"${positive_active_valley_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_active_energy_(off-peak)>"${positive_active_valley_array[$c]}"<units>Kwh</units></Forward_active_energy_(off-peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward active energy (off-peak)\": {\n		\"data\": \""${positive_active_valley_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");
		fi
		
		if [[ ! ${positive_active_top_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward active energy (sharp): "${positive_active_top_array[$c]}" Kwh");			
			else		
				echo -e "	Forward active energy (sharp): "${positive_active_top_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward active energy (sharp);"${positive_active_top_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_active_energy_(sharp)>"${positive_active_top_array[$c]}"<units>Kwh</units></Forward_active_energy_(sharp)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward active energy (sharp)\": {\n		\"data\": \""${positive_active_top_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");					
		fi
			
		if [[ ! ${reverse_reactive_peak_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse reactive energy (peak): "${reverse_reactive_peak_array[$c]}" kVar");			
			else		
				echo -e "	Reverse reactive energy (peak): "${reverse_reactive_peak_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse reactive energy (peak);"${reverse_reactive_peak_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_reactive_energy_(peak)>"${reverse_reactive_peak_array[$c]}"<units>kVar</units></Reverse_reactive_energy_(peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse reactive energy (peak)\": {\n		\"data\": \""${reverse_reactive_peak_array[$c]}"\",\n		\"units\": \"kVar\"},\r");
		fi
		
		if [[ ! ${reverse_reactive_power_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse reactive energy (shoulder): "${reverse_reactive_power_array[$c]}" kVar");			
			else		
				echo -e "	Reverse reactive energy (shoulder): "${reverse_reactive_power_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse reactive energy (shoulder);"${reverse_reactive_power_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_reactive_energy_(shoulder)>"${reverse_reactive_power_array[$c]}"<units>kVar</units></Reverse_reactive_energy_(shoulder)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse reactive energy (shoulder)\": {\n		\"data\": \""${reverse_reactive_power_array[$c]}"\",\n		\"units\": \"kVar\"},\r");				
		fi
		
		if [[ ! ${reverse_reactive_valley_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse reactive energy (off-peak): "${reverse_reactive_valley_array[$c]}" kVar");			
			else		
				echo -e "	Reverse reactive energy (off-peak): "${reverse_reactive_valley_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse reactive energy (off-peak);"${reverse_reactive_valley_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_reactive_energy_(off-peak)>"${reverse_reactive_valley_array[$c]}"<units>kVar</units></Reverse_reactive_energy_(off-peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse reactive energy (off-peak)\": {\n		\"data\": \""${reverse_reactive_valley_array[$c]}"\",\n		\"units\": \"kVar\"},\r");
		fi
		
		if [[ ! ${reverse_reactive_top_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse reactive energy (sharp): "${reverse_reactive_top_array[$c]}" kVar");			
			else		
				echo -e "	Reverse reactive energy (sharp): "${reverse_reactive_top_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse reactive energy (sharp);"${reverse_reactive_top_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_reactive_energy_(sharp)>"${reverse_reactive_top_array[$c]}"<units>kVar</units></Reverse_reactive_energy_(sharp)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse reactive energy (sharp)\": {\n		\"data\": \""${reverse_reactive_top_array[$c]}"\",\n		\"units\": \"kVar\"},\r");
		fi
		
		if [[ ! ${positive_reactive_peak_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy (peak): "${positive_reactive_peak_array[$c]}" kVar");			
			else		
				echo -e "	Forward reactive energy (peak): "${positive_reactive_peak_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy (peak);"${positive_reactive_peak_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy_(peak)>"${positive_reactive_peak_array[$c]}"<units>kVar</units></Forward_reactive_energy_(peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy (peak)\": {\n		\"data\": \""${positive_reactive_peak_array[$c]}"\",\n		\"units\": \"kVar\"},\r");			
		fi
		
		if [[ ! ${positive_reactive_power_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy (shoulder): "${positive_reactive_power_array[$c]}" kVar");			
			else		
				echo -e "	Forward reactive energy (shoulder): "${positive_reactive_power_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy (shoulder);"${positive_reactive_power_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy_(shoulder)>"${positive_reactive_power_array[$c]}"<units>kVar</units></Forward_reactive_energy_(shoulder)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy (shoulder)\": {\n		\"data\": \""${positive_reactive_power_array[$c]}"\",\n		\"units\": \"kVar\"},\r");		
		fi
		
		if [[ ! ${positive_reactive_valley_array[$c]} == null  ]];
		then
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy (off-peak): "${positive_reactive_valley_array[$c]}" kVar");			
			else		
				echo -e "	Forward reactive energy (off-peak): "${positive_reactive_valley_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy (off-peak);"${positive_reactive_valley_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy_(off-peak)>"${positive_reactive_valley_array[$c]}"<units>kVar</units></Forward_reactive_energy_(off-peak)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy (off-peak)\": {\n		\"data\": \""${positive_reactive_valley_array[$c]}"\",\n		\"units\": \"kVar\"},\r");
		fi
		
		if [[ ! ${positive_reactive_top_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nForward reactive energy (sharp): "${positive_reactive_top_array[$c]}" kVar");			
			else		
				echo -e "	Forward reactive energy (sharp): "${positive_reactive_top_array[$c]}" kVar"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nForward reactive energy (sharp);"${positive_reactive_top_array[$c]}";kVar\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Forward_reactive_energy_(sharp)>"${positive_reactive_top_array[$c]}"<units>kVar</units></Forward_reactive_energy_(sharp)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Forward reactive energy (sharp)\": {\n		\"data\": \""${positive_reactive_top_array[$c]}"\",\n		\"units\": \"kVar\"},\r");				
		fi
		

	done
fi

# device is Power Sensor
if [[ $success == "true"  ]] && [[ $2 == 47  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi
	
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )); do
	
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");
					
		if [[ ! ${meter_status_array[$c]} == null  ]];
		then	
			if [[ ${meter_status_array[$c]} == 0  ]];
			then
			meter_status="Offline"
			elif [[ ${meter_status_array[$c]} == 1  ]];
			then
			meter_status="Normal"
			else
			meter_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMeter status: "$meter_status);			
			else		
				echo -e "	Meter status: "$meter_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMeter status;"$meter_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Meter_status>"$meter_status"</Meter_status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Meter status\": \""$meter_status"\"\r");
		fi
		
		if [[ ! ${meter_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid voltage: "${meter_u_array[$c]}" V");			
			else		
				echo -e "	Grid voltage: "${meter_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid voltage;"${meter_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_voltage>"${meter_u_array[$c]}"<units>V</units></Grid_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid voltage\": {\n		\"data\": \""${meter_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
		
		if [[ ! ${meter_i_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid current: "${meter_i_array[$c]}" A");			
			else		
				echo -e "	Grid current: "${meter_i_array[$c]}" A"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid current;"${meter_i_array[$c]}";A\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_current>"${meter_i_array[$c]}"<units>A</units></Grid_current>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid current\": {\n		\"data\": \""${meter_i_array[$c]}"\",\n		\"units\": \"A\"},\r");				
		fi
		
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive power: "${active_power_array[$c]}" W");			
			else		
				echo -e "	Active power: "${active_power_array[$c]}" W"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive power;"${active_power_array[$c]}";W\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_power>"${active_power_array[$c]}"<units>W</units></Active_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active power\": {\n		\"data\": \""${active_power_array[$c]}"\",\n		\"units\": \"W\"},\r");				
		fi
		
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReactive power: "${reactive_power_array[$c]}" Var");			
			else		
				echo -e "	Reactive power: "${reactive_power_array[$c]}" Var"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReactive power;"${reactive_power_array[$c]}";Var\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reactive_power>"${reactive_power_array[$c]}"<units>Var</units></Reactive_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reactive power\": {\n		\"data\": \""${reactive_power_array[$c]}"\",\n		\"units\": \"Var\"},\r");					
		fi
		
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nPower factor: "${power_factor_array[$c]});			
			else		
				echo -e "	Power factor: "${power_factor_array[$c]}
			fi
			csv[$c]=$( echo ${csv[$c]}"\nPower factor;"${power_factor_array[$c]}";\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Power_factor>"${power_factor_array[$c]}"</Power_factor>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Power factor\": \""${power_factor_array[$c]}"\",\r");
		fi
			
		if [[ ! ${grid_frequency_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nGrid frequency: "${grid_frequency_array[$c]}" Hz");			
			else		
				echo -e "	Grid frequency: "${grid_frequency_array[$c]}" Hz"				
			fi
			csv[$c]=$( echo ${csv[$c]}"\nGrid frequency;"${grid_frequency_array[$c]}";Hz\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Grid_frequency>"${grid_frequency_array[$c]}"<units>Hz</units></Grid_frequency>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Grid frequency\": {\n		\"data\": \""${grid_frequency_array[$c]}"\",\n		\"units\": \"Hz\"},\r");				
		fi
		
		if [[ ! ${active_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nActive energy (forward active energy): "${active_cap_array[$c]}" kWh");			
			else		
				echo -e "	Active energy (forward active energy): "${active_cap_array[$c]}" kWh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nActive energy (forward active energy);"${active_cap_array[$c]}";kWh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Active_energy_(forward_active_energy)>"${active_cap_array[$c]}"<units>kWh</units></Active_energy_(forward_active_energy)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Active energy (forward active energy)\": {\n		\"data\": \""${active_cap_array[$c]}"\",\n		\"units\": \"kWh\"},\r");		
		fi
		
		if [[ ! ${reverse_active_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nReverse active energy: "${reverse_active_cap_array[$c]}" kWh");			
			else		
				echo -e "	Reverse active energy: "${reverse_active_cap_array[$c]}" kWh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nReverse active energy;"${reverse_active_cap_array[$c]}";kWh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Reverse_active_energy>"${reverse_active_cap_array[$c]}"<units>kWh</units></Reverse_active_energy>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Reverse active energy\": {\n		\"data\": \""${reverse_active_cap_array[$c]}"\",\n		\"units\": \"kWh\"},\r");
		fi
		
		if [[ ! ${run_state_array[$c]} == null  ]];
		then	
			if [[ ${run_state_array[$c]} == 0  ]];
			then
			device_status="Disconnected"
			elif [[ ${run_state_array[$c]} == 1  ]];
			then
			device_status="Connected"
			else
			device_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nStatus: "$device_status);			
			else		
				echo -e "	Status: "$device_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nStatus;"$device_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Status>"$device_status"</Status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Status\": \""$device_status"\"\r");
						
		fi



	done
fi

# device is Battery (only LG batteries are supported)
if [[ $success == "true"  ]] && [[ $2 == 39  ]];
	then
		if [ ! -z "$DIALOG" ];
		then
			summary_for_dialog_screen[$count]="\nNumbers of Devices to check: "${#devIds_array[@]}"\n"
		else
			echo ""
			echo "Numbers of Devices to check: "${#devIds_array[@]}
			echo ""
			echo ""
		fi
	
	for (( c=0; c<=((${#devIds_array[@]}-1)); c++ )); do
		
		if [ ! -z "$DIALOG" ];
		then
			results_for_dialog_screen[$c]=$(printf "\n"
			Device_type_ID ${devTypeId_array[$c]}
			echo " ID: "${devId_array[$c]});

		else
			echo -e "\e[93m \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e "\e[0m ID: "${devId_array[$c]}
		fi
		
		csv[$c]=$(printf "\nDevice Type;"
		Device_type_ID ${devTypeId_array[$c]}
		printf ";\r"		
		echo "\nDevice Number;"${devId_array[$c]}";\r");
		
		xml[$c]=$(printf "<Device_Type>"
		Device_type_ID ${devTypeId_array[$c]}
		printf "</Device_Type>\r"
		echo "\n<Device_Number>"${devId_array[$c]}"</Device_Number>\r"); 
		
		
		josn[$c]=$(printf "		\"Device Type\": \""
		Device_type_ID ${devTypeId_array[$c]}
		printf "\",\r"
		echo "\n		\"Device Number\": \""${devId_array[$c]}"\",\r");
		
		if [[ ! ${battery_status_array[$c]} == null  ]];
		then	
			if [[ ${battery_status_array[$c]} == 0  ]];
			then
			Battery_status="offline"
			elif [[ ${battery_status_array[$c]} == 1  ]];
			then
			Battery_status="standby"
			elif [[ ${battery_status_array[$c]} == 2  ]];
			then
			Battery_status="running"
			elif [[ ${battery_status_array[$c]} == 3  ]];
			then
			Battery_status="faulty"
			elif [[ ${battery_status_array[$c]} == 4  ]];
			then
			Battery_status="hibernation"
			else
			Battery_status="unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nBattery running status: "$Battery_status);			
			else		
				echo -e "	Battery running status: "$Battery_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nBattery running status;"$Battery_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Battery_running_status>"$Battery_status"</Battery_running_status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Battery running status\": \""$Battery_status"\"\r");	
			fi
		
		if [[ ! ${max_charge_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMaximum charging power: "${max_charge_power_array[$c]}" W");			
			else		
				echo -e "	Maximum charging power: "${max_charge_power_array[$c]}" W"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMaximum charging power;"${max_charge_power_array[$c]}";W\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Maximum_charging_power>"${max_charge_power_array[$c]}"<units>W</units></Maximum_charging_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Maximum_charging_power\": {\n		\"data\": \""${max_charge_power_array[$c]}"\",\n		\"units\": \"W\"},\r");				
		fi
				
		if [[ ! ${max_discharge_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nMaximum discharging power: "${max_discharge_power_array[$c]}" W");			
			else		
				echo -e "	Maximum discharging power: "${max_discharge_power_array[$c]}" W"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nMaximum discharging power;"${max_discharge_power_array[$c]}";W\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Maximum_discharging_power>"${max_discharge_power_array[$c]}"<units>W</units></Maximum_discharging_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Maximum_discharging_power\": {\n		\"data\": \""${max_discharge_power_array[$c]}"\",\n		\"units\": \"W\"},\r");
		fi	
			
		if [[ ! ${ch_discharge_power_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nCharging/Discharging power: "${ch_discharge_power_array[$c]}" W");			
			else		
				echo -e "	Charging/Discharging power: "${ch_discharge_power_array[$c]}" W"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nCharging/Discharging power;"${ch_discharge_power_array[$c]}";W\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Charging_Discharging_power>"${ch_discharge_power_array[$c]}"<units>W</units></Charging_Discharging_power>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Charging/Discharging power\": {\n		\"data\": \""${ch_discharge_power_array[$c]}"\",\n		\"units\": \"W\"},\r");
		fi
		
		if [[ ! ${busbar_u_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nBattery voltage: "${busbar_u_array[$c]}" V");			
			else		
				echo -e "	Battery voltage: "${busbar_u_array[$c]}" V"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nBattery voltage;"${busbar_u_array[$c]}";V\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Battery_voltage>"${busbar_u_array[$c]}"<units>V</units></Battery_voltage>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Battery voltage\": {\n		\"data\": \""${busbar_u_array[$c]}"\",\n		\"units\": \"V\"},\r");				
		fi
			
		if [[ ! ${battery_soc_array[$c]} == null  ]];
		then		
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nBattery state of charge (SOC): "${battery_soc_array[$c]}" %");			
			else		
				echo -e "	Battery state of charge (SOC): "${battery_soc_array[$c]}" %"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nBattery state of charge (SOC);"${battery_soc_array[$c]}";%\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Battery_state_of_charge_(SOC)>"${battery_soc_array[$c]}"<units>%</units></Battery_state_of_charge_(SOC)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Battery state of charge (SOC)\": {\n		\"data\": \""${battery_soc_array[$c]}"\",\n		\"units\": \"%\"},\r");			
		fi	
			
		if [[ ! ${battery_soh_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nBattery state of health (SOH): "${battery_soh_array[$c]});			
			else		
				echo -e "	Battery state of health (SOH): "${battery_soh_array[$c]}			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nBattery state of health (SOH);"${battery_soh_array[$c]}"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Battery_state_of_health_(SOH)>"${battery_soh_array[$c]}"</Battery_state_of_health_(SOH)>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Battery state of health (SOH)\": \""${battery_soh_array[$c]}"\"\r");				
		fi
				
		if [[ ! ${ch_discharge_model_array[$c]} == null  ]];
		then	
			if [[ ${ch_discharge_model_array[$c]} == 0  ]];
			then
			Charging_discharging_model="None"
			elif [[ ${ch_discharge_model_array[$c]} == 1  ]];
			then
			Charging_discharging_model="Forced discharging/charging"
			elif [[ ${ch_discharge_model_array[$c]} == 2  ]];
			then
			Charging_discharging_model="Time of use electricity price"
			elif [[ ${ch_discharge_model_array[$c]} == 3  ]];
			then
			Charging_discharging_model="Fixed discharging/charging"
			elif [[ ${ch_discharge_model_array[$c]} == 4  ]];
			then
			Charging_discharging_model="Automatic charge/discharge"
			else
			Charging_discharging_model="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nCharging & discharging mode: "$Charging_discharging_model);			
			else		
				echo -e "	Charging & discharging mode: "$Charging_discharging_model			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nCharging & discharging mode;"$Charging_discharging_model"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Charging_and_discharging_mode>"$Charging_discharging_model"</Charging_and_discharging_mode>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Charging & discharging mode\": \""$Charging_discharging_model"\"\r");				
		fi				
		
		if [[ ! ${charge_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nCharging capacity: "${charge_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Charging capacity: "${charge_cap_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nCharging capacity;"${charge_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Charging_capacity>"${charge_cap_array[$c]}"<units>Kwh</units></Charging_capacity>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Charging capacity\": {\n		\"data\": \""${charge_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${discharge_cap_array[$c]} == null  ]];
		then	
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nDischarging capacity: "${discharge_cap_array[$c]}" Kwh");			
			else		
				echo -e "	Discharging capacity: "${discharge_cap_array[$c]}" Kwh"
			fi
			csv[$c]=$( echo ${csv[$c]}"\nDischarging capacity;"${discharge_cap_array[$c]}";Kwh\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Discharging_capacity>"${discharge_cap_array[$c]}"<units>Kwh</units></Discharging_capacity>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Discharging capacity\": {\n		\"data\": \""${discharge_cap_array[$c]}"\",\n		\"units\": \"Kwh\"},\r");			
		fi
		
		if [[ ! ${run_state_array[$c]} == null  ]];
		then	
			if [[ ${run_state_array[$c]} == 0  ]];
			then
			device_status="Disconnected"
			elif [[ ${run_state_array[$c]} == 1  ]];
			then
			device_status="Connected"
			else
			device_status="Unknow"
			fi
			
			if [ ! -z "$DIALOG" ];
			then
				results_for_dialog_screen[$c]=$( echo ${results_for_dialog_screen[$c]}"\nStatus: "$device_status);			
			else		
				echo -e "	Status: "$device_status			
			fi
			csv[$c]=$( echo ${csv[$c]}"\nStatus;"$device_status"\r" );
			xml[$c]=$( echo ${xml[$c]}"\n<Status>"$device_status"</Status>\r" ); 
			josn[$c]=$( echo ${josn[$c]}"\n		\"Status\": \""$device_status"\"\r");			
		fi


	done
fi

# end of loop if sucess=true
fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevRealKpi
		
fi

echo ""


}


function getDevFiveMinutes {


# Request to API getKpiStationYear
local getDevFiveMinutes=$(printf '{"devIds": "'$1'", "devTypeId": "'$2'", "collectTime": '$3'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevFiveMinutes  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#echo $getDevFiveMinutes | jq

local success=$(echo ''$getDevFiveMinutes''  | jq '.success' )
local failCode=$(echo ''$getDevFiveMinutes''  | jq '.failCode' )
local message=$(echo ''$getDevFiveMinutes''  | jq '.message' )


#we have String inverter
if [[ $2 == 1  ]];
then	

local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )	
		local inverter_state=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.inverter_state' )		 
		local ab_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_i' )
		local efficiency=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.efficiency' )
		local temperature=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.temperature' )
		local power_factor=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.elec_freq' )
		local active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power' )
		local day_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.day_cap' )
		local mppt_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_power' )
		local pv1_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv1_u' )
		local pv2_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv2_u' )
		local pv3_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv3_u' )
		local pv4_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv4_u' )
		local pv5_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv5_u' )
		local pv6_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv6_u' )
		local pv7_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv7_u' )
		local pv8_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv8_u' )
		local pv9_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv9_u' )
		local pv10_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv10_u' )
		local pv11_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv11_u' )
		local pv12_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv12_u' )
		local pv13_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv13_u' )
		local pv14_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv14_u' )
		local pv15_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv15_u' )
		local pv16_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv16_u' )
		local pv17_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv17_u' )
		local pv18_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv18_u' )
		local pv19_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv19_u' )
		local pv20_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv20_u' )
		local pv21_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv21_u' )
		local pv22_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv22_u' )
		local pv23_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv23_u' )
		local pv24_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv24_u' )
		local pv1_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv1_i' )
		local pv2_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv2_i' )
		local pv3_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv3_i' )
		local pv4_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv4_i' )
		local pv5_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv5_i' )
		local pv6_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv6_i' )
		local pv7_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv7_i' )
		local pv8_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv8_i' )
		local pv9_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv9_i' )
		local pv10_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv10_i' )
		local pv11_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv11_i' )
		local pv12_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv12_i' )
		local pv13_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv13_i' )
		local pv14_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv14_i' )
		local pv15_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv15_i' )
		local pv16_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv16_i' )
		local pv17_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv17_i' )
		local pv18_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv18_i' )
		local pv19_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv19_i' )
		local pv20_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv20_i' )
		local pv21_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv21_i' )
		local pv22_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv22_i' )
		local pv23_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv23_i' )
		local pv24_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv24_i' )
		local total_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.total_cap' )
		local open_time=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.open_time' )
		local close_time=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.close_time' )
		local mppt_total_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_total_cap' )
		local mppt_1_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_1_cap' )
		local mppt_2_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_2_cap' )
		local mppt_3_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_3_cap' )
		local mppt_4_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_4_cap' )
		local mppt_5_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_5_cap' )
		local mppt_6_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_6_cap' )
		local mppt_7_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_7_cap' )
		local mppt_8_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_8_cap' )
		local mppt_9_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_9_cap' )
		local mppt_10_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_10_cap' )
		

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "inverter_state_array=(${inverter_state})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "efficiency_array=(${efficiency})"
		eval "temperature_array=(${temperature})"
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"
		eval "day_cap_array=(${day_cap})"
		eval "mppt_power_array=(${mppt_power})"
		eval "pv1_u_array=(${pv1_u})"
		eval "pv2_u_array=(${pv2_u})"
		eval "pv3_u_array=(${pv3_u})"
		eval "pv4_u_array=(${pv4_u})"
		eval "pv5_u_array=(${pv5_u})"
		eval "pv6_u_array=(${pv6_u})"
		eval "pv7_u_array=(${pv7_u})"
		eval "pv8_u_array=(${pv8_u})"
		eval "pv9_u_array=(${pv9_u})"
		eval "pv10_u_array=(${pv10_u})"
		eval "pv11_u_array=(${pv11_u})"
		eval "pv12_u_array=(${pv12_u})"
		eval "pv13_u_array=(${pv13_u})"
		eval "pv14_u_array=(${pv14_u})"
		eval "pv15_u_array=(${pv15_u})"
		eval "pv16_u_array=(${pv16_u})"
		eval "pv17_u_array=(${pv17_u})"
		eval "pv18_u_array=(${pv18_u})"
		eval "pv19_u_array=(${pv19_u})"
		eval "pv20_u_array=(${pv20_u})"
		eval "pv21_u_array=(${pv21_u})"
		eval "pv22_u_array=(${pv22_u})"
		eval "pv23_u_array=(${pv23_u})"
		eval "pv24_u_array=(${pv24_u})"
		eval "pv1_i_array=(${pv1_i})"
		eval "pv2_i_array=(${pv2_i})"
		eval "pv3_i_array=(${pv3_i})"
		eval "pv4_i_array=(${pv4_i})"
		eval "pv5_i_array=(${pv5_i})"
		eval "pv6_i_array=(${pv6_i})"
		eval "pv7_i_array=(${pv7_i})"
		eval "pv8_i_array=(${pv8_i})"
		eval "pv9_i_array=(${pv9_i})"
		eval "pv10_i_array=(${pv10_i})"
		eval "pv11_i_array=(${pv11_i})"
		eval "pv12_i_array=(${pv12_i})"
		eval "pv13_i_array=(${pv13_i})"
		eval "pv14_i_array=(${pv14_i})"
		eval "pv15_i_array=(${pv15_i})"
		eval "pv16_i_array=(${pv16_i})"
		eval "pv17_i_array=(${pv17_i})"
		eval "pv18_i_array=(${pv18_i})"
		eval "pv19_i_array=(${pv19_i})"
		eval "pv20_i_array=(${pv20_i})"
		eval "pv21_i_array=(${pv21_i})"
		eval "pv22_i_array=(${pv22_i})"
		eval "pv23_i_array=(${pv23_i})"
		eval "pv24_i_array=(${pv24_i})"
		eval "total_cap_array=(${total_cap})"
		eval "open_time_array=(${open_time})"
		eval "close_time_array=(${close_time})"
		eval "mppt_total_cap_array=(${mppt_total_cap})"
		eval "mppt_1_cap_array=(${mppt_1_cap})"
		eval "mppt_2_cap_array=(${mppt_2_cap})"
		eval "mppt_3_cap_array=(${mppt_3_cap})"
		eval "mppt_4_cap_array=(${mppt_4_cap})"
		eval "mppt_5_cap_array=(${mppt_5_cap})"
		eval "mppt_6_cap_array=(${mppt_6_cap})"	
		eval "mppt_7_cap_array=(${mppt_7_cap})"	
		eval "mppt_8_cap_array=(${mppt_8_cap})"	
		eval "mppt_9_cap_array=(${mppt_9_cap})"	
		eval "mppt_10_cap_array=(${mppt_10_cap})"	


# device is Residential inverter	
elif [[ $2 == 38  ]];
then


local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )	
		local inverter_state=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.inverter_state' )
		local ab_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_i' )
		local efficiency=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.efficiency' )
		local temperature=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.temperature' )
		local power_factor=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.power_factor' )
		local elec_freq=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.elec_freq' )
		local active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power' )
		local day_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.day_cap' )
		local mppt_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_power' )
		local pv1_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv1_u' )
		local pv2_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv2_u' )
		local pv3_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv3_u' )
		local pv4_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv4_u' )
		local pv5_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv5_u' )
		local pv6_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv6_u' )
		local pv7_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv7_u' )
		local pv8_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv8_u' )
		local pv1_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv1_i' )
		local pv2_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv2_i' )
		local pv3_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv3_i' )
		local pv4_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv4_i' )
		local pv5_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv5_i' )
		local pv6_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv6_i' )
		local pv7_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv7_i' )
		local pv8_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv8_i' )
		local total_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.total_cap' )
		local open_time=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.open_time' )
		local close_time=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.close_time' )
		local mppt_1_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_1_cap' )
		local mppt_2_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_2_cap' )
		local mppt_3_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_3_cap' )
		local mppt_4_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.mppt_4_cap' )		

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "inverter_state_array=(${inverter_state})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "efficiency_array=(${efficiency})"
		eval "temperature_array=(${temperature})"
		eval "power_factor_array=(${power_factor})"
		eval "elec_freq_array=(${elec_freq})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"
		eval "day_cap_array=(${day_cap})"
		eval "mppt_power_array=(${mppt_power})"
		eval "pv1_u_array=(${pv1_u})"
		eval "pv2_u_array=(${pv2_u})"
		eval "pv3_u_array=(${pv3_u})"
		eval "pv4_u_array=(${pv4_u})"
		eval "pv5_u_array=(${pv5_u})"
		eval "pv6_u_array=(${pv6_u})"
		eval "pv7_u_array=(${pv7_u})"
		eval "pv8_u_array=(${pv8_u})"
		eval "pv1_i_array=(${pv1_i})"
		eval "pv2_i_array=(${pv2_i})"
		eval "pv3_i_array=(${pv3_i})"
		eval "pv4_i_array=(${pv4_i})"
		eval "pv5_i_array=(${pv5_i})"
		eval "pv6_i_array=(${pv6_i})"
		eval "pv7_i_array=(${pv7_i})"
		eval "pv8_i_array=(${pv8_i})"
		eval "total_cap_array=(${total_cap})"
		eval "open_time_array=(${open_time})"
		eval "close_time_array=(${close_time})"
		eval "mppt_1_cap_array=(${mppt_1_cap})"
		eval "mppt_2_cap_array=(${mppt_2_cap})"
		eval "mppt_3_cap_array=(${mppt_3_cap})"
		eval "mppt_4_cap_array=(${mppt_4_cap})"	


# device is EMI
elif [[ $2 == 10  ]];
then

local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )	
		local temperature=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.temperature' )
		local pv_temperature=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.pv_temperature' )
		local wind_speed=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.wind_speed' )
		local wind_direction=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.wind_direction' )
		local radiant_total=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.radiant_total' )
		local radiant_line=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.radiant_line' )
		local horiz_radiant_line=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.horiz_radiant_line' )
		local horiz_radiant_total=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.horiz_radiant_total' )

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "temperature_array=(${temperature})"
		eval "pv_temperature_array=(${pv_temperature})"
		eval "wind_speed_array=(${wind_speed})"
		eval "wind_direction_array=(${wind_direction})"
		eval "radiant_total_array=(${radiant_total})"
		eval "radiant_line_array=(${radiant_line})"
		eval "horiz_radiant_line_array=(${horiz_radiant_line})"
		eval "horiz_radiant_total_array=(${horiz_radiant_total})"

# device is Grid meter
elif [[ $2 == 17  ]];
then

local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )	
		local ab_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ab_u' )
		local bc_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.bc_u' )
		local ca_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ca_u' )
		local a_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_u' )
		local b_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_u' )
		local c_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_u' )
		local a_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.a_i' )
		local b_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.b_i' )
		local c_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.c_i' )
		local active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power' )
		local power_factor=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.power_factor' )
		local active_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_cap' )
		local reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power' )
		local reverse_active_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_cap' )
		local forward_reactive_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.forward_reactive_cap' )
		local reverse_reactive_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_reactive_cap' )
		local active_power_a=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power_a' )
		local active_power_b=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power_b' )
		local active_power_c=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power_c' )
		local reactive_power_a=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power_a' )
		local reactive_power_b=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power_b' )
		local reactive_power_c=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power_c' )
		local total_apparent_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.total_apparent_power' )
		local grid_frequency=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.grid_frequency' )
		local reverse_active_peak=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_peak' )
		local reverse_active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_power' )
		local reverse_active_valley=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_valley' )
		local reverse_active_top=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_top' )
		local positive_active_peak=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_active_peak' )
		local positive_active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_active_power' )
		local positive_active_valley=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_active_valley' )
		local positive_active_top=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_active_top' )
		local reverse_reactive_peak=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_reactive_peak' )
		local reverse_reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_reactive_power' )
		local reverse_reactive_valley=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_reactive_valley' )
		local reverse_reactive_top=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_reactive_top' )
		local positive_reactive_peak=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_reactive_peak' )
		local positive_reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_reactive_power' )
		local positive_reactive_valley=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_reactive_valley' )
		local positive_reactive_top=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.positive_reactive_top' )
		

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "ab_u_array=(${ab_u})"
		eval "bc_u_array=(${bc_u})"
		eval "ca_u_array=(${ca_u})"
		eval "a_u_array=(${a_u})"
		eval "b_u_array=(${b_u})"
		eval "c_u_array=(${c_u})"
		eval "a_i_array=(${a_i})"
		eval "b_i_array=(${b_i})"
		eval "c_i_array=(${c_i})"
		eval "active_power_array=(${active_power})"
		eval "power_factor_array=(${power_factor})"
		eval "active_cap_array=(${active_cap})"
		eval "reactive_power_array=(${reactive_power})"
		eval "reverse_active_cap_array=(${reverse_active_cap})"
		eval "forward_reactive_cap_array=(${forward_reactive_cap})"
		eval "reverse_reactive_cap_array=(${reverse_reactive_cap})"
		eval "active_power_a_array=(${active_power_a})"
		eval "active_power_b_array=(${active_power_b})"
		eval "active_power_c_array=(${active_power_c})"
		eval "reactive_power_a_array=(${reactive_power_a})"
		eval "reactive_power_b_array=(${reactive_power_b})"
		eval "reactive_power_c_array=(${reactive_power_c})"
		eval "total_apparent_power_array=(${total_apparent_power})"
		eval "grid_frequency_array=(${grid_frequency})"
		eval "reverse_active_peak_array=(${reverse_active_peak})"
		eval "reverse_active_power_array=(${reverse_active_power})"
		eval "reverse_active_valley_array=(${reverse_active_valley})"
		eval "reverse_active_top_array=(${reverse_active_top})"
		eval "positive_active_peak_array=(${positive_active_peak})"
		eval "positive_active_power_array=(${positive_active_power})"
		eval "positive_active_valley_array=(${positive_active_valley})"
		eval "positive_active_top_array=(${positive_active_top})"
		eval "reverse_reactive_peak_array=(${reverse_reactive_peak})"		
		eval "reverse_reactive_power_array=(${reverse_reactive_power})"
		eval "reverse_reactive_valley_array=(${reverse_reactive_valley})"
		eval "reverse_reactive_top_array=(${reverse_reactive_top})"
		eval "positive_reactive_peak_array=(${positive_reactive_peak})"
		eval "positive_reactive_power_array=(${positive_reactive_power})"
		eval "positive_reactive_valley_array=(${positive_reactive_valley})"
		eval "positive_reactive_top_array=(${positive_reactive_top})"
		
# device is Power Sensor
elif [[ $2 == 47  ]];
then	

local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )	
		local meter_status=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.meter_status' )
		local meter_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.meter_u' )
		local meter_i=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.meter_i' )
		local active_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_power' )
		local reactive_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reactive_power' )		
		local power_factor=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.power_factor' )
		local grid_frequency=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.grid_frequency' )		
		local active_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.active_cap' )
		local reverse_active_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.reverse_active_cap' )

		

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "meter_status_array=(${meter_status})"
		eval "meter_u_array=(${meter_u})"
		eval "meter_i_array=(${meter_i})"
		eval "active_power_array=(${active_power})"
		eval "reactive_power_array=(${reactive_power})"		
		eval "power_factor_array=(${power_factor})"
		eval "grid_frequency_array=(${grid_frequency})"
		eval "active_cap_array=(${active_cap})"
		eval "reverse_active_cap_array=(${reverse_active_cap})"

# device is Battery (only LG batteries are supported)
elif [[ $2 == 39  ]];
then
local devId=$(echo ''$getDevFiveMinutes''  | jq '.data[].devId' )
	local collectTime_every_five_minutes=$(echo ''$getDevFiveMinutes''  | jq '.data[].collectTime' )
		local battery_status=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.battery_status' )
		local max_charge_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.max_charge_power' )
		local max_discharge_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.max_discharge_power' )
		local ch_discharge_power=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.ch_discharge_power' )
		local busbar_u=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.busbar_u' )		
		local battery_soc=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.battery_soc' )
		local battery_soh=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.battery_soh' )		
		local ch_discharge_model=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap. ch_discharge_model' )
		local charge_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.charge_cap' )
		local discharge_cap=$(echo ''$getDevFiveMinutes''  | jq '.data[].dataItemMap.discharge_cap' )
	

local data_getDevFiveMinutes=$(echo ''$getDevFiveMinutes''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevFiveMinutes''  | jq '.currentTime' )
	local devIds=$(echo ''$data_getDevFiveMinutes''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevFiveMinutes''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"
#local devTypeId="$(echo "$devTypeId" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_five_minutes})"
		eval "battery_status_array=(${battery_status})"
		eval "max_charge_power_array=(${max_charge_power})"
		eval "max_discharge_power_array=(${max_discharge_power})"
		eval "ch_discharge_power_array=(${ch_discharge_power})"
		eval "busbar_u_array=(${busbar_u})"
		eval "battery_soc_array=(${battery_soc})"		
		eval "battery_soh_array=(${battery_soh})"
		eval "ch_discharge_model_array=(${ch_discharge_model})"
		eval "charge_cap_array=(${charge_cap})"
		eval "discharge_cap_array=(${discharge_cap})"
		

fi



# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a devIds_array <<< $devIds
IFS="," read -a devTypeId_array <<< $devTypeId


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetDevFiveMinutes\e[0m connection \e[42mOK\e[0m"
		getDevFiveMinutes_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetDevFiveMinutes\e[0m connection \e[41mError\e[0m"
		getDevFiveMinutes_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(date -d @$curent_time_actually)
echo "Time of your Request to API: "$curent_time_of_request


# if we have String inverter
if [[ $success == "true"  ]] && [[  $2 == 1  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%H:%M" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		if [[ ! ${inverter_state_array[$c]} == null  ]];
		then	
			printf "	Inverter status: "
			#decimal number to hexdecimal
			local hex=$( printf "%x" ${inverter_state_array[$c]} );
			#echo $hex
			#function to check inverter status
			inverter_state $hex
			echo ""			
		fi
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"				
		fi
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"				
		fi
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"				
		fi
		if [[ ! ${a_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase A voltage: "${a_u_array[$c]}" V"				
		fi
		if [[ ! ${b_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase B voltage: "${b_u_array[$c]}" V"				
		fi
		if [[ ! ${c_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase C voltage: "${c_u_array[$c]}" V"				
		fi
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase A current: "${a_i_array[$c]}" A"				
		fi
		if [[ ! ${b_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase B current: "${b_i_array[$c]}" A"				
		fi
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase C current: "${c_i_array[$c]}" A"				
		fi
		if [[ ! ${efficiency_array[$c]} == null  ]];
		then	
			echo -e "	Inverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %"				
		fi
		if [[ ! ${temperature_array[$c]} == null  ]];
		then	
			echo -e "	Device internal temperature: "${temperature_array[$c]}" °C"				
		fi
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			echo -e "	Power factor: "${power_factor_array[$c]}			
		fi
		if [[ ! ${elec_freq_array[$c]} == null  ]];
		then	
			echo -e "	Grid frequency: "${elec_freq_array[$c]}" Hz"			
		fi
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			echo -e "	Active power: "${active_power_array[$c]}" Kw"			
		fi
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Output reactive power: "${reactive_power_array[$c]}" Kvar"			
		fi
		if [[ ! ${day_cap_array[$c]} == null  ]];
		then	
			echo -e "	Daily energy: "${day_cap_array[$c]}" Kwh"			
		fi
				if [[ ! ${mppt_power_array[$c]} == null  ]];
		then	
			echo -e "	MPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw"			
		fi
		if [[ ! ${pv1_u_array[$c]} == null  ]];
		then	
			echo -e "	PV1 input voltage: "${pv1_u_array[$c]}" V"			
		fi
		if [[ ! ${pv2_u_array[$c]} == null  ]];
		then	
			echo -e "	PV2 input voltage: "${pv2_u_array[$c]}" V"			
		fi
		if [[ ! ${pv3_u_array[$c]} == null  ]];
		then	
			echo -e "	PV3 input voltage: "${pv3_u_array[$c]}" V"			
		fi
		if [[ ! ${pv4_u_array[$c]} == null  ]];
		then	
			echo -e "	PV4 input voltage: "${pv4_u_array[$c]}" V"	
		fi		
		if [[ ! ${pv5_u_array[$c]} == null  ]];
		then	
			echo -e "	PV5 input voltage: "${pv5_u_array[$c]}" V"			
		fi
		if [[ ! ${pv6_u_array[$c]} == null  ]];
		then	
			echo -e "	PV6 input voltage: "${pv6_u_array[$c]}" V"			
		fi
		if [[ ! ${pv7_u_array[$c]} == null  ]];
		then	
			echo -e "	PV7 input voltage: "${pv7_u_array[$c]}" V"			
		fi
		if [[ ! ${pv8_u_array[$c]} == null  ]];
		then	
			echo -e "	PV8 input voltage: "${pv8_u_array[$c]}" V"			
		fi
		if [[ ! ${pv9_u_array[$c]} == null  ]];
		then	
			echo -e "	PV9 input voltage: "${pv9_u_array[$c]}" V"			
		fi
		if [[ ! ${pv10_u_array[$c]} == null  ]];
		then	
			echo -e "	PV10 input voltage: "${pv10_u_array[$c]}" V"			
		fi
		if [[ ! ${pv11_u_array[$c]} == null  ]];
		then	
			echo -e "	PV11 input voltage: "${pv11_u_array[$c]}" V"			
		fi
		if [[ ! ${pv12_u_array[$c]} == null  ]];
		then	
			echo -e "	PV12 input voltage: "${pv12_u_array[$c]}" V"			
		fi
		if [[ ! ${pv13_u_array[$c]} == null  ]];
		then	
			echo -e "	PV13 input voltage: "${pv13_u_array[$c]}" V"			
		fi
		if [[ ! ${pv14_u_array[$c]} == null  ]];
		then	
			echo -e "	PV14 input voltage: "${pv14_u_array[$c]}" V"			
		fi
		if [[ ! ${pv15_u_array[$c]} == null  ]];
		then	
			echo -e "	PV15 input voltage: "${pv15_u_array[$c]}" V"			
		fi
		if [[ ! ${pv16_u_array[$c]} == null  ]];
		then	
			echo -e "	PV16 input voltage: "${pv16_u_array[$c]}" V"			
		fi
		if [[ ! ${pv17_u_array[$c]} == null  ]];
		then	
			echo -e "	PV17 input voltage: "${pv17_u_array[$c]}" V"			
		fi
		if [[ ! ${pv18_u_array[$c]} == null  ]];
		then	
			echo -e "	PV18 input voltage: "${pv18_u_array[$c]}" V"			
		fi
		if [[ ! ${pv19_u_array[$c]} == null  ]];
		then	
			echo -e "	PV19 input voltage: "${pv19_u_array[$c]}" V"			
		fi
		if [[ ! ${pv20_u_array[$c]} == null  ]];
		then	
			echo -e "	PV20 input voltage: "${pv20_u_array[$c]}" V"			
		fi
		if [[ ! ${pv21_u_array[$c]} == null  ]];
		then	
			echo -e "	PV21 input voltage: "${pv21_u_array[$c]}" V"			
		fi
		if [[ ! ${pv22_u_array[$c]} == null  ]];
		then	
			echo -e "	PV22 input voltage: "${pv22_u_array[$c]}" V"			
		fi
		if [[ ! ${pv23_u_array[$c]} == null  ]];
		then	
			echo -e "	PV23 input voltage: "${pv23_u_array[$c]}" V"			
		fi
		if [[ ! ${pv24_u_array[$c]} == null  ]];
		then	
			echo -e "	PV24 input voltage: "${pv24_u_array[$c]}" V"			
		fi
				if [[ ! ${pv1_i_array[$c]} == null  ]];
		then	
			echo -e "	PV1 input current: "${pv1_i_array[$c]}" A"			
		fi
		if [[ ! ${pv2_i_array[$c]} == null  ]];
		then	
			echo -e "	PV2 input current: "${pv2_i_array[$c]}" A"			
		fi
		if [[ ! ${pv3_i_array[$c]} == null  ]];
		then	
			echo -e "	PV3 input current: "${pv3_i_array[$c]}" A"			
		fi
		if [[ ! ${pv4_i_array[$c]} == null  ]];
		then	
			echo -e "	PV4 input current: "${pv4_i_array[$c]}" A"			
		fi
		if [[ ! ${pv5_i_array[$c]} == null  ]];
		then	
			echo -e "	PV5 input current: "${pv5_i_array[$c]}" A"			
		fi
		if [[ ! ${pv6_i_array[$c]} == null  ]];
		then	
			echo -e "	PV6 input current: "${pv6_i_array[$c]}" A"			
		fi
		if [[ ! ${pv7_i_array[$c]} == null  ]];
		then	
			echo -e "	PV7 input current: "${pv7_i_array[$c]}" A"			
		fi
		if [[ ! ${pv8_i_array[$c]} == null  ]];
		then	
			echo -e "	PV8 input current: "${pv8_i_array[$c]}" A"			
		fi
		if [[ ! ${pv9_i_array[$c]} == null  ]];
		then	
			echo -e "	PV9 input current: "${pv9_i_array[$c]}" A"			
		fi
		if [[ ! ${pv10_i_array[$c]} == null  ]];
		then	
			echo -e "	PV10 input current: "${pv10_i_array[$c]}" A"			
		fi
		if [[ ! ${pv11_i_array[$c]} == null  ]];
		then	
			echo -e "	PV11 input current: "${pv11_i_array[$c]}" A"			
		fi
		if [[ ! ${pv12_i_array[$c]} == null  ]];
		then	
			echo -e "	PV12 input current: "${pv12_i_array[$c]}" A"			
		fi
		if [[ ! ${pv13_i_array[$c]} == null  ]];
		then	
			echo -e "	PV13 input current: "${pv13_i_array[$c]}" A"			
		fi
		if [[ ! ${pv14_i_array[$c]} == null  ]];
		then	
			echo -e "	PV14 input current: "${pv14_i_array[$c]}" A"			
		fi
		if [[ ! ${pv15_i_array[$c]} == null  ]];
		then	
			echo -e "	PV15 input current: "${pv15_i_array[$c]}" A"			
		fi
		if [[ ! ${pv16_i_array[$c]} == null  ]];
		then	
			echo -e "	PV16 input current: "${pv16_i_array[$c]}" A"			
		fi
		if [[ ! ${pv17_i_array[$c]} == null  ]];
		then	
			echo -e "	PV17 input current: "${pv17_i_array[$c]}" A"			
		fi
		if [[ ! ${pv18_i_array[$c]} == null  ]];
		then	
			echo -e "	PV18 input current: "${pv18_i_array[$c]}" A"			
		fi
		if [[ ! ${pv19_i_array[$c]} == null  ]];
		then	
			echo -e "	PV19 input current: "${pv19_i_array[$c]}" A"			
		fi
		if [[ ! ${pv20_i_array[$c]} == null  ]];
		then	
			echo -e "	PV20 input current: "${pv20_i_array[$c]}" A"			
		fi
		if [[ ! ${pv21_i_array[$c]} == null  ]];
		then	
			echo -e "	PV21 input current: "${pv21_i_array[$c]}" A"			
		fi
		if [[ ! ${pv22_i_array[$c]} == null  ]];
		then	
			echo -e "	PV22 input current: "${pv22_i_array[$c]}" A"			
		fi
		if [[ ! ${pv23_i_array[$c]} == null  ]];
		then	
			echo -e "	PV23 input current: "${pv23_i_array[$c]}" A"			
		fi
		if [[ ! ${pv24_i_array[$c]} == null  ]];
		then	
			echo -e "	PV24 input current: "${pv24_i_array[$c]}" A"			
		fi
		if [[ ! ${total_cap_array[$c]} == null  ]];
		then	
			echo -e "	Cumulative energy: "${total_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${open_time_array[$c]} == null  ]];
		then	
			local startup_time=$(date -d @${open_time_array[$c]})	
			echo -e "	Inverter last startup time: "$startup_time					
		fi
		if [[ ! ${close_time_array[$c]} == null  ]];
		then	
			local shutdown_time=$(date -d @${close_time_array[$c]})
			echo -e "	Inverter last shutdown time: "$shutdown_time		
		fi
		if [[ ! ${mppt_total_cap_array[$c]} == null  ]];
		then	
			echo -e "	Total DC input energy: "${mppt_total_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_1_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 1 DC cumulative energy: "${mppt_1_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_2_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 2 DC cumulative energy: "${mppt_2_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_3_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 3 DC cumulative energy: "${mppt_3_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_4_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 4 DC cumulative energy: "${mppt_4_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_5_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 5 DC cumulative energy: "${mppt_5_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_6_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 6 DC cumulative energy: "${mppt_6_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_7_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 7 DC cumulative energy: "${mppt_7_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_8_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 8 DC cumulative energy: "${mppt_8_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_9_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 9 DC cumulative energy: "${mppt_9_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_10_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 10 DC cumulative energy: "${mppt_10_cap_array[$c]}" Kwh"			
		fi
		echo ""
		
		#special for checking if inverter is disconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is disconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi



# if we have Residential inverter
if [[ $success == "true"  ]] && [[  $2 == 38  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		
		if [[ ! ${inverter_state_array[$c]} == null  ]];
		then	
			printf "	Inverter status: "
			#decimal number to hexdecimal
			local hex=$( printf "%x" ${inverter_state_array[$c]} );
			#echo $hex
			#function to check inverter status
			inverter_state $hex
			echo ""			
		fi
		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"				
		fi		
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"				
		fi		
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"				
		fi		
		if [[ ! ${a_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase A voltage: "${a_u_array[$c]}" V"				
		fi		
		if [[ ! ${b_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase B voltage: "${b_u_array[$c]}" V"				
		fi		
		if [[ ! ${c_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase C voltage: "${c_u_array[$c]}" V"				
		fi		
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			echo -e "	Phase A current: "${a_i_array[$c]}" A"				
		fi		
		if [[ ! ${b_i_array[$c]} == null  ]];
		then	
			echo -e "	Phase B current: "${b_i_array[$c]}" A"				
		fi		
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			echo -e "	Phase C current: "${c_i_array[$c]}" A"				
		fi		
		if [[ ! ${efficiency_array[$c]} == null  ]];
		then	
			echo -e "	Inverter conversion efficiency (manufacturer): "${efficiency_array[$c]}" %"				
		fi		
		if [[ ! ${temperature_array[$c]} == null  ]];
		then	
			echo -e "	Inverter internal temperature: "${temperature_array[$c]}" °C"				
		fi		
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			echo -e "	Power factor: "${power_factor_array[$c]}			
		fi		
		if [[ ! ${elec_freq_array[$c]} == null  ]];
		then	
			echo -e "	Grid frequency: "${elec_freq_array[$c]}" Hz"			
		fi		
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			echo -e "	Active power: "${active_power_array[$c]}" Kw"			
		fi		
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Reactive output power: "${reactive_power_array[$c]}" Kvar"			
		fi		
		if [[ ! ${day_cap_array[$c]} == null  ]];
		then	
			echo -e "	Yield today: "${day_cap_array[$c]}" Kwh"			
		fi		
		if [[ ! ${mppt_power_array[$c]} == null  ]];
		then	
			echo -e "	MPPT (Maximum Power Point Tracking) total input power: "${mppt_power_array[$c]}" Kw"			
		fi		
		if [[ ! ${pv1_u_array[$c]} == null  ]];
		then	
			echo -e "	PV1 input voltage: "${pv1_u_array[$c]}" V"			
		fi		
		if [[ ! ${pv2_u_array[$c]} == null  ]];
		then	
			echo -e "	PV2 input voltage: "${pv2_u_array[$c]}" V"			
		fi		
		if [[ ! ${pv3_u_array[$c]} == null  ]];
		then	
			echo -e "	PV3 input voltage: "${pv3_u_array[$c]}" V"			
		fi		
		if [[ ! ${pv4_u_array[$c]} == null  ]];
		then	
			echo -e "	PV4 input voltage: "${pv4_u_array[$c]}" V"	
		fi		
		if [[ ! ${pv5_u_array[$c]} == null  ]];
		then	
			echo -e "	PV5 input voltage: "${pv5_u_array[$c]}" V"			
		fi
		if [[ ! ${pv6_u_array[$c]} == null  ]];
		then	
			echo -e "	PV6 input voltage: "${pv6_u_array[$c]}" V"			
		fi
		if [[ ! ${pv7_u_array[$c]} == null  ]];
		then	
			echo -e "	PV7 input voltage: "${pv7_u_array[$c]}" V"			
		fi
		if [[ ! ${pv8_u_array[$c]} == null  ]];
		then	
			echo -e "	PV8 input voltage: "${pv8_u_array[$c]}" V"			
		fi
		if [[ ! ${pv1_i_array[$c]} == null  ]];
		then	
			echo -e "	PV1 input current: "${pv1_i_array[$c]}" A"			
		fi
		if [[ ! ${pv2_i_array[$c]} == null  ]];
		then	
			echo -e "	PV2 input current: "${pv2_i_array[$c]}" A"			
		fi
		if [[ ! ${pv3_i_array[$c]} == null  ]];
		then	
			echo -e "	PV3 input current: "${pv3_i_array[$c]}" A"			
		fi
		if [[ ! ${pv4_i_array[$c]} == null  ]];
		then	
			echo -e "	PV4 input current: "${pv4_i_array[$c]}" A"			
		fi
		if [[ ! ${pv5_i_array[$c]} == null  ]];
		then	
			echo -e "	PV5 input current: "${pv5_i_array[$c]}" A"			
		fi
		if [[ ! ${pv6_i_array[$c]} == null  ]];
		then	
			echo -e "	PV6 input current: "${pv6_i_array[$c]}" A"			
		fi
		if [[ ! ${pv7_i_array[$c]} == null  ]];
		then	
			echo -e "	PV7 input current: "${pv7_i_array[$c]}" A"			
		fi
		if [[ ! ${pv8_i_array[$c]} == null  ]];
		then	
			echo -e "	PV8 input current: "${pv8_i_array[$c]}" A"			
		fi
		if [[ ! ${total_cap_array[$c]} == null  ]];
		then	
			echo -e "	Total yield: "${total_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${open_time_array[$c]} == null  ]];
		then	
			local startup_time=$(date -d @${open_time_array[$c]})	
			echo -e "	Inverter last startup time: "$startup_time					
		fi
		if [[ ! ${close_time_array[$c]} == null  ]];
		then	
			local shutdown_time=$(date -d @${close_time_array[$c]})
			echo -e "	Inverter last shutdown time: "$shutdown_time		
		fi
		if [[ ! ${mppt_1_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 1 DC total energy: "${mppt_1_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_2_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 2 DC total energy: "${mppt_2_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_3_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 3 DC total energy: "${mppt_3_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${mppt_4_cap_array[$c]} == null  ]];
		then	
			echo -e "	MPPT 4 DC total energy: "${mppt_4_cap_array[$c]}" Kwh"			
		fi

		
		done
	done

fi


# device is EMI
if [[ $success == "true"  ]] && [[ $2 == 10  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do				
		if [[ ! ${temperature_array[$c]} == null  ]];
		then	
			echo -e "	Temperature: "${temperature_array[$c]}" °C"				
		fi			
		if [[ ! ${pv_temperature_array[$c]} == null  ]];
		then	
			echo -e "	PV temperature: "${pv_temperature_array[$c]}" °C"				
		fi	
		if [[ ! ${wind_speed_array[$c]} == null  ]];
		then	
			echo -e "	Wind speed: "${wind_speed_array[$c]}" m/s"				
		fi	
		if [[ ! ${wind_direction_array[$c]} == null  ]];
		then	
			echo -e "	Wind direction: "${wind_direction_array[$c]}" Degree"				
		fi	
		if [[ ! ${radiant_total_array[$c]} == null  ]];
		then	
			echo -e "	Daily irradiation: "${radiant_total_array[$c]}" MJ/m 2"				
		fi	
		if [[ ! ${radiant_line_array[$c]} == null  ]];
		then	
			echo -e "	Irradiance: "${radiant_line_array[$c]}" W/m 2"				
		fi	
		if [[ ! ${horiz_radiant_line_array[$c]} == null  ]];
		then	
			echo -e "	Horizontal irradiance: "${horiz_radiant_line_array[$c]}" W/m 2"				
		fi	
		if [[ ! ${horiz_radiant_total_array[$c]} == null  ]];
		then	
			echo -e "	Horizontal irradiation: "${horiz_radiant_total_array[$c]}" MJ/m 2"				
		fi
		done
	done

fi


# device is Grid meter
if [[ $success == "true"  ]] && [[ $2 == 17  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do				

		if [[ ! ${ab_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid AB voltage: "${ab_u_array[$c]}" V"				
		fi
		if [[ ! ${bc_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid BC voltage: "${bc_u_array[$c]}" V"				
		fi
		if [[ ! ${ca_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid CA voltage: "${ca_u_array[$c]}" V"				
		fi
		if [[ ! ${a_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase A voltage (AC output): "${a_u_array[$c]}" V"				
		fi
		if [[ ! ${b_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase B voltage (AC output): "${b_u_array[$c]}" V"				
		fi
		if [[ ! ${c_u_array[$c]} == null  ]];
		then	
			echo -e "	Phase C voltage (AC output): "${c_u_array[$c]}" V"				
		fi
		if [[ ! ${a_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase A current (IA): "${a_i_array[$c]}" A"				
		fi
		if [[ ! ${b_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase B current (IB): "${b_i_array[$c]}" A"				
		fi
		if [[ ! ${c_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid phase C current (IC): "${c_i_array[$c]}" A"				
		fi
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			echo -e "	Active power: "${active_power_array[$c]}" Kw"		
		fi
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			echo -e "	Power factor: "${power_factor_array[$c]}			
		fi
		if [[ ! ${active_cap_array[$c]} == null  ]];
		then	
			echo -e "	Active energy (forward active energy): "${active_cap_array[$c]}" kWh"			
		fi
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Reactive power: "${reactive_power_array[$c]}" Kvar"			
		fi
		if [[ ! ${reverse_active_cap_array[$c]} == null  ]];
		then	
			echo -e "	Reverse active energy: "${reverse_active_cap_array[$c]}" Kwh"			
		fi
		if [[ ! ${forward_reactive_cap_array[$c]} == null  ]];
		then	
			echo -e "	Forward reactive energy: "${forward_reactive_cap_array[$c]}" Kwh"			
		fi		
		if [[ ! ${reverse_reactive_cap_array[$c]} == null  ]];
		then	
			echo -e "	Reverse reactive energy: "${reverse_reactive_cap_array[$c]}" Kwh"			
		fi			
		if [[ ! ${active_power_a_array[$c]} == null  ]];
		then	
			echo -e "	Active power PA: "${active_power_a_array[$c]}" Kw"			
		fi		
		if [[ ! ${active_power_b_array[$c]} == null  ]];
		then	
			echo -e "	Active power PB: "${active_power_b_array[$c]}" Kw"			
		fi		
		if [[ ! ${active_power_c_array[$c]} == null  ]];
		then	
			echo -e "	Active power PC: "${active_power_c_array[$c]}" Kw"			
		fi		
		if [[ ! ${reactive_power_a_array[$c]} == null  ]];
		then	
			echo -e "	Reactive power QA: "${reactive_power_a_array[$c]}" kVar"			
		fi	
		if [[ ! ${reactive_power_b_array[$c]} == null  ]];
		then	
			echo -e "	Reactive power QB: "${reactive_power_ab_array[$c]}" kVar"			
		fi
		if [[ ! ${reactive_power_c_array[$c]} == null  ]];
		then	
			echo -e "	Reactive power QC: "${reactive_power_c_array[$c]}" kVar"			
		fi
		if [[ ! ${total_apparent_power_array[$c]} == null  ]];
		then	
			echo -e "	Total apparent power: "${total_apparent_power_array[$c]}" kVA"			
		fi
		if [[ ! ${grid_frequency_array[$c]} == null  ]];
		then	
			echo -e "	Grid frequency: "${grid_frequency_array[$c]}" Hz"			
		fi
		if [[ ! ${reverse_active_peak_array[$c]} == null  ]];
		then	
			echo -e "	Reverse active energy (peak): "${reverse_active_peak_array[$c]}" Kwh"			
		fi
		if [[ ! ${reverse_active_power_array[$c]} == null  ]];
		then	
			echo -e "	Reverse active energy (shoulder): "${reverse_active_power_array[$c]}" Kwh"			
		fi
		if [[ ! ${reverse_active_valley_array[$c]} == null  ]];
		then	
			echo -e "	Reverse active energy (off-peak): "${reverse_active_valley_array[$c]}" Kwh"			
		fi
		if [[ ! ${reverse_active_top_array[$c]} == null  ]];
		then	
			echo -e "	Reverse active energy (sharp): "${reverse_active_top_array[$c]}" Kwh"			
		fi
		if [[ ! ${positive_active_peak_array[$c]} == null  ]];
		then	
			echo -e "	Forward active energy (peak): "${positive_active_peak_array[$c]}" Kwh"			
		fi
		if [[ ! ${positive_active_power_array[$c]} == null  ]];
		then	
			echo -e "	Forward active energy (shoulder): "${positive_active_power_array[$c]}" Kwh"			
		fi
		if [[ ! ${positive_active_valley_array[$c]} == null  ]];
		then	
			echo -e "	Forward active energy (off-peak): "${positive_active_valley_array[$c]}" Kwh"			
		fi
		if [[ ! ${positive_active_top_array[$c]} == null  ]];
		then	
			echo -e "	Forward active energy (sharp): "${positive_active_top_array[$c]}" Kwh"			
		fi	
		if [[ ! ${reverse_reactive_peak_array[$c]} == null  ]];
		then	
			echo -e "	Reverse reactive energy (peak): "${reverse_reactive_peak_array[$c]}" KVar"			
		fi
		if [[ ! ${reverse_reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Reverse reactive energy (shoulder): "${reverse_reactive_power_array[$c]}" KVar"			
		fi
		if [[ ! ${reverse_reactive_valley_array[$c]} == null  ]];
		then	
			echo -e "	Reverse reactive energy (off-peak): "${reverse_reactive_valley_array[$c]}" KVar"			
		fi
		if [[ ! ${reverse_reactive_top_array[$c]} == null  ]];
		then	
			echo -e "	Reverse reactive energy (sharp): "${reverse_reactive_top_array[$c]}" KVar"			
		fi
		if [[ ! ${positive_reactive_peak_array[$c]} == null  ]];
		then	
			echo -e "	Forward reactive energy (peak): "${positive_reactive_peak_array[$c]}" KVar"			
		fi
		if [[ ! ${positive_reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Forward reactive energy (shoulder): "${positive_reactive_power_array[$c]}" KVar"			
		fi
		if [[ ! ${positive_reactive_valley_array[$c]} == null  ]];
		then	
			echo -e "	Forward reactive energy (off-peak): "${positive_reactive_valley_array[$c]}" KVar"			
		fi
		if [[ ! ${positive_reactive_top_array[$c]} == null  ]];
		then	
			echo -e "	Forward reactive energy (sharp): "${positive_reactive_top_array[$c]}" KVar"			
		fi

		done
	done

fi


# device is Power Sensor
if [[ $success == "true"  ]] && [[ $2 == 47  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
			
		if [[ ! ${meter_status_array[$c]} == null  ]];
		then	
			if [[ ${meter_status_array[$c]} == 0  ]];
			then
			meter_status="Offline"
			elif [[ ${meter_status_array[$c]} == 1  ]];
			then
			meter_status="Normal"
			else
			meter_status="Unknow"
			fi
			echo -e "	Meter status: "$meter_status
		fi
		if [[ ! ${meter_u_array[$c]} == null  ]];
		then	
			echo -e "	Grid voltage: "${meter_u_array[$c]}" V"				
		fi
		if [[ ! ${meter_i_array[$c]} == null  ]];
		then	
			echo -e "	Grid current: "${meter_i_array[$c]}" A"				
		fi
		if [[ ! ${active_power_array[$c]} == null  ]];
		then	
			echo -e "	Active power: "${active_power_array[$c]}" W"				
		fi
		if [[ ! ${reactive_power_array[$c]} == null  ]];
		then	
			echo -e "	Reactive power: "${reactive_power_array[$c]}" Var"				
		fi
		if [[ ! ${power_factor_array[$c]} == null  ]];
		then	
			echo -e "	Power factor: "${power_factor_array[$c]}				
		fi
		if [[ ! ${grid_frequency_array[$c]} == null  ]];
		then	
			echo -e "	Grid frequency: "${grid_frequency_array[$c]}" Hz"				
		fi
		if [[ ! ${active_cap_array[$c]} == null  ]];
		then	
			echo -e "	Active power (forward active energy): "${active_cap_array[$c]}" kWh"				
		fi
		if [[ ! ${reverse_active_cap_array[$c]} == null  ]];
		then	
			echo -e "	Rective power (Reverse active energy): "${reverse_active_cap_array[$c]}" kWh"				
		fi
		done
	done

fi


# device is Battery (only LG batteries are supported)
if [[ $success == "true"  ]] && [[ $2 == 39  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every 5 minutes data from day: \e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every 5 minutes
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do				
		
		if [[ ! ${battery_status_array[$c]} == null  ]];
		then		
			if [[ ${battery_status_array[$c]} == 0  ]];
			then
			battery_status="Offline"
			elif [[ ${battery_status_array[$c]} == 1  ]];
			then
			battery_status="Standby"
			elif [[ ${battery_status_array[$c]} == 2  ]];
			then
			battery_status="Running"
			elif [[ ${battery_status_array[$c]} == 3  ]];
			then
			battery_status="Faulty"
			elif [[ ${battery_status_array[$c]} == 4  ]];
			then
			battery_status="Hibernation"
			else
			battery_status="Unknow"
			fi
			echo -e "	Meter status: "$battery_status			
		fi
		if [[ ! ${max_charge_power_array[$c]} == null  ]];
		then	
			echo -e "	Maximum charge power: "${max_charge_power_array[$c]}" W"				
		fi
		if [[ ! ${max_discharge_power_array[$c]} == null  ]];
		then	
			echo -e "	Maximum discharge power: "${max_discharge_power_array[$c]}" W"				
		fi
		if [[ ! ${ch_discharge_power_array[$c]} == null  ]];
		then	
			echo -e "	Charge/Discharge power: "${ch_discharge_power_array[$c]}" W"				
		fi
		if [[ ! ${busbar_u_array[$c]} == null  ]];
		then	
			echo -e "	Battery voltage: "${busbar_u_array[$c]}" V"				
		fi
		if [[ ! ${battery_soc_array[$c]} == null  ]];
		then	
			echo -e "	Battery state of charge (SOC): "${battery_soc_array[$c]}" %"				
		fi
		if [[ ! ${battery_soh_array[$c]} == null  ]];
		then	
			echo -e "	Battery state of health (SOH): "${battery_soh_array[$c]}" Hz"				
		fi
		if [[ ! ${ch_discharge_model_array[$c]} == null  ]];
		then	
			if [[ ${ch_discharge_model_array[$c]} == 0  ]];
			then
			ch_discharge_model="None"
			elif [[ ${ch_discharge_model_array[$c]} == 1  ]];
			then
			ch_discharge_model="Forced charge/discharge"
			elif [[ ${ch_discharge_model_array[$c]} == 2  ]];
			then
			ch_discharge_model="time-of-use price"
			elif [[ ${ch_discharge_model_array[$c]} == 3  ]];
			then
			ch_discharge_model="Fixed charge/discharge"
			elif [[ ${ch_discharge_model_array[$c]} == 4  ]];
			then
			ch_discharge_model="Automatic charge/discharge"
			else
			ch_discharge_model="Unknow"
			fi
			echo -e "	Charge/Discharge mode: "$ch_discharge_model				
		fi
		if [[ ! ${charge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Charging capacity: "${charge_cap_array[$c]}" kWh"				
		fi
		if [[ ! ${discharge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Discharging capacity: "${discharge_cap_array[$c]}" kWh"				
		fi
		
		done
	done

fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevFiveMinutes
		
fi

echo ""


}

function getDevKpiDay {


# Request to API getKpiStationYear
local getDevKpiDay=$(printf '{"devIds": "'$1'", "devTypeId": "'$2'", "collectTime": '$3'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevKpiDay  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#echo $getDevKpiDay | jq

local success=$(echo ''$getDevKpiDay''  | jq '.success' )
local failCode=$(echo ''$getDevKpiDay''  | jq '.failCode' )
local message=$(echo ''$getDevKpiDay''  | jq '.message' )

#we have String inverter
if [[ $2 == 1  ]];
then	

local devId=$(echo ''$getDevKpiDay''  | jq '.data[].devId' )
	local collectTime_every_day=$(echo ''$getDevKpiDay''  | jq '.data[].collectTime' )	
		local installed_capacity=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.perpower_ratio' )			 

local data_getDevKpiDay=$(echo ''$getDevKpiDay''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiDay''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiDay''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiDay''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiDay''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_day})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"


#Battery (only LG batteries are supported)
elif [[ $2 == 39  ]];
then
local devId=$(echo ''$getDevKpiDay''  | jq '.data[].devId' )
	local collectTime_every_day=$(echo ''$getDevKpiDay''  | jq '.data[].collectTime' )
		local charge_cap=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.charge_cap' )
		local discharge_cap=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.discharge_cap' )
		local charge_time=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.charge_time' )
		local discharge_time=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.discharge_time' )

local data_getDevKpiDay=$(echo ''$getDevKpiDay''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiDay''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiDay''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiDay''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiDay''  | jq '.devTypeId' )
	
#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"


		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_day})"
		eval "charge_cap_array=(${charge_cap})"
		eval "discharge_cap_array=(${discharge_cap})"
		eval "charge_time_array=(${charge_time})"
		eval "discharge_time_array=(${discharge_time})"

#we have Residential inverter
elif [[ $2 == 38  ]];
then
local devId=$(echo ''$getDevKpiDay''  | jq '.data[].devId' )
	local collectTime_every_day=$(echo ''$getDevKpiDay''  | jq '.data[].collectTime' )
		local installed_capacity=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiDay''  | jq '.data[].dataItemMap.perpower_ratio' )

local data_getDevKpiDay=$(echo ''$getDevKpiDay''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiDay''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiDay''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiDay''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiDay''  | jq '.devTypeId' )
	
#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_day})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"

fi
	

# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a devIds_array <<< $devIds
IFS="," read -a devTypeId_array <<< $devTypeId


#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetDevKpiDay\e[0m connection \e[42mOK\e[0m"
		getDevKpiDay_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetDevKpiDay\e[0m connection \e[41mError\e[0m"
		getDevKpiDay_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually


# if we have String inverter
if [[ $success == "true"  ]] && [[  $2 == 1  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every Day data from month: \e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi

		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi

# if we have Battery (only LG batteries are supported)
if [[ $success == "true"  ]] && [[  $2 == 39  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every Day data from month: \e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then	
			
				
		if [[ ! ${charge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Charging capacity: "${charge_cap_array[$c]}" kWh"				
		fi
	 	if [[ ! ${discharge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Discharging capacity: "${discharge_cap_array[$c]}" kWh"				
		fi	
		if [[ ! ${charge_time_array[$c]} == null  ]];
		then	
			echo -e "	Charging duration: "${charge_time_array[$c]}" h"				
		fi
		if [[ ! ${discharge_time_array[$c]} == null  ]];
		then	
			echo -e "	Discharge duration: "${discharge_time_array[$c]}" h"				
		fi
		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi

#if we have Residential inverter
if [[ $success == "true"  ]] && [[  $2 == 38  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every Day data from month: \e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%d %B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi
		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi
# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevKpiDay
		
fi

echo ""


}

function getDevKpiMonth {


# Request to API getKpiStationYear
local getDevKpiMonth=$(printf '{"devIds": "'$1'", "devTypeId": "'$2'", "collectTime": '$3'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevKpiMonth  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#echo $getDevKpiMonth | jq

local success=$(echo ''$getDevKpiMonth''  | jq '.success' )
local failCode=$(echo ''$getDevKpiMonth''  | jq '.failCode' )
local message=$(echo ''$getDevKpiMonth''  | jq '.message' )

#we have String inverter
if [[ $2 == 1  ]];
then	

local devId=$(echo ''$getDevKpiMonth''  | jq '.data[].devId' )
	local collectTime_every_Month=$(echo ''$getDevKpiMonth''  | jq '.data[].collectTime' )	
		local installed_capacity=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.perpower_ratio' )
			 

local data_getDevKpiMonth=$(echo ''$getDevKpiMonth''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiMonth''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiMonth''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiMonth''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiMonth''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Month})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"

#we have Battery (only LG batteries are supported)
elif [[ $2 == 39  ]];
then

local devId=$(echo ''$getDevKpiMonth''  | jq '.data[].devId' )
	local collectTime_every_Month=$(echo ''$getDevKpiMonth''  | jq '.data[].collectTime' )
		local charge_cap=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.charge_cap' )
		local discharge_cap=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.discharge_cap' )
		local charge_time=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.charge_time' )
		local discharge_time=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.discharge_time' )

local data_getDevKpiMonth=$(echo ''$getDevKpiMonth''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiMonth''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiMonth''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiMonth''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiMonth''  | jq '.devTypeId' )
	
#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Month})"
		eval "charge_cap_array=(${charge_cap})"
		eval "discharge_cap_array=(${discharge_cap})"
		eval "charge_time_array=(${charge_time})"
		eval "discharge_time_array=(${discharge_time})"
		
#we have Smart Residential inverter
elif [[ $2 == 38  ]];			
then	

local devId=$(echo ''$getDevKpiMonth''  | jq '.data[].devId' )
	local collectTime_every_Month=$(echo ''$getDevKpiMonth''  | jq '.data[].collectTime' )	
		local installed_capacity=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiMonth''  | jq '.data[].dataItemMap.perpower_ratio' )
			 

local data_getDevKpiMonth=$(echo ''$getDevKpiMonth''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiMonth''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiMonth''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiMonth''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiMonth''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Month})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"

fi

# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a devIds_array <<< $devIds
IFS="," read -a devTypeId_array <<< $devTypeId



#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetDevKpiMonth\e[0m connection \e[42mOK\e[0m"
		getDevKpiMonth_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetDevKpiMonth\e[0m connection \e[41mError\e[0m"
		getDevKpiMonth_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually

# if we have String inverter
if [[ $success == "true"  ]] && [[  $2 == 1  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every month from year: \e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi

		echo ""
		
		#special for checking if inverter is disconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done
	
fi

# if we have Battery (only LG batteries are supported)
if [[ $success == "true"  ]] && [[  $2 == 39  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every month from year: \e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
					
				
		if [[ ! ${charge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Charging capacity: "${charge_cap_array[$c]}" kWh"				
		fi
	 	if [[ ! ${discharge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Discharging capacity: "${discharge_cap_array[$c]}" kWh"				
		fi	
		if [[ ! ${charge_time_array[$c]} == null  ]];
		then	
			echo -e "	Charging duration: "${charge_time_array[$c]}" h"				
		fi
		if [[ ! ${discharge_time_array[$c]} == null  ]];
		then	
			echo -e "	Discharge duration: "${discharge_time_array[$c]}" h"				
		fi
		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi

#if we have Residential inverter
if [[ $success == "true"  ]] && [[  $2 == 38  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		echo -e "	Every month from year: \e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[0]::-3}))"\e[0m"
		echo ""
		
		#loop for every day
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		echo -e "	\e[1m"$(date +"%B %Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi
		
		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done

fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevKpiMonth
		
fi

echo ""


}

function getDevKpiYear {


# Request to API getKpiStationYear
local getDevKpiYear=$(printf '{"devIds": "'$1'", "devTypeId": "'$2'", "collectTime": '$3'}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getDevKpiYear  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')

#echo $getDevKpiYear| jq

local success=$(echo ''$getDevKpiYear''  | jq '.success' )
local failCode=$(echo ''$getDevKpiYear''  | jq '.failCode' )
local message=$(echo ''$getDevKpiYear''  | jq '.message' )


local data_getDevKpiYear=$(echo ''$getDevKpiYear''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiYear''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiYear''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiYear''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiYear''  | jq '.devTypeId' )
	
	
#we have String inverter
if [[ $2 == 1  ]];
then	

local devId=$(echo ''$getDevKpiYear''  | jq '.data[].devId' )
	local collectTime_every_Year=$(echo ''$getDevKpiYear''  | jq '.data[].collectTime' )	
		local installed_capacity=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.perpower_ratio' )
			 

local data_getDevKpiYear=$(echo ''$getDevKpiYear''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiYear''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiYear''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiYear''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiYear''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Year})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"

#we have Battery (only LG batteries are supported)
elif [[ $2 == 39  ]];
then
local devId=$(echo ''$getDevKpiYear''  | jq '.data[].devId' )
	local collectTime_every_Year=$(echo ''$getDevKpiYear''  | jq '.data[].collectTime' )
		local charge_cap=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.charge_cap' )
		local discharge_cap=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.discharge_cap' )
		local charge_time=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.charge_time' )
		local discharge_time=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.discharge_time' )

local data_getDevKpiYear=$(echo ''$getDevKpiYear''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiYear''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiYear''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiYear''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiYear''  | jq '.devTypeId' )
	
#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"


		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Year})"
		eval "charge_cap_array=(${charge_cap})"
		eval "discharge_cap_array=(${discharge_cap})"
		eval "charge_time_array=(${charge_time})"
		eval "discharge_time_array=(${discharge_time})"
	
#we have Residential inverter
elif [[ $2 == 38  ]];			
then	

local devId=$(echo ''$getDevKpiYear''  | jq '.data[].devId' )
	local collectTime_every_Year=$(echo ''$getDevKpiYear''  | jq '.data[].collectTime' )	
		local installed_capacity=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.installed_capacity' )		 
		local product_power=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.product_power' )		 
		local perpower_ratio=$(echo ''$getDevKpiYear''  | jq '.data[].dataItemMap.perpower_ratio' )
			 

local data_getDevKpiYear=$(echo ''$getDevKpiYear''  | jq '.params' )
	local currentTime=$(echo ''$data_getDevKpiYear''  | jq '.currentTime' )
	local collectTime=$(echo ''$data_getDevKpiYear''  | jq '.collectTime' )
	local devIds=$(echo ''$data_getDevKpiYear''  | jq '.devIds' )
	local devTypeId=$(echo ''$data_getDevKpiYear''  | jq '.devTypeId' )

#removing " on begining and end
local devIds="$(echo "$devIds" | tr -d '"')"

		# Conversion of long variable string to array
		eval "devId_array=(${devId})"
		eval "collectTime_array=(${collectTime_every_Year})"
		eval "installed_capacity_array=(${installed_capacity})"
		eval "product_power_array=(${product_power})"
		eval "perpower_ratio_array=(${perpower_ratio})"

fi


# Here comma is our delimiter value to array of stations codes given by user as a parameter in question
IFS="," read -a devIds_array <<< $devIds
IFS="," read -a devTypeId_array <<< $devTypeId




#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetDevKpiYear\e[0m connection \e[42mOK\e[0m"
		getDevKpiYear_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetDevKpiYear\e[0m connection \e[41mError\e[0m"
		getDevKpiYear_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	if [[ ! $message =~ "null"  ]];
	then
		if [ ! -z "$DIALOG" ];
			then
				info_for_dialog_screen=$info_for_dialog_screen"\nOptional message: " $message
			else		
				echo "Optional message: " $message
		fi
	fi
fi


local curent_time_actually=$(echo ${currentTime::-3})
local curent_time_of_request=$(echo ${collectTime::-3})
local difference_in_secounds=$(( $curent_time_actually-$curent_time_of_request ))

local curent_time_of_request=$(date -d @$curent_time_of_request)
echo "Time of your Request to API: "$curent_time_of_request

echo "Response time: "$difference_in_secounds" s"
#local curent_time_actually=$(date -d @$curent_time_actually)
#echo "Actuall time: "$curent_time_actually


# if we have String inverter
if [[ $success == "true"  ]] && [[  $2 == 1  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		
		#loop for every year
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		if [[ ${collectTime_array[$c]} == "0"  ]];
		then	
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime::-3}))"\e[0m"
		else
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		fi
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi

		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done
	
fi

# if we Battery (only LG batteries are supported)
if [[ $success == "true"  ]] && [[  $2 == 39  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		
		#loop for every year
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		if [[ ${collectTime_array[$c]} == "0"  ]];
		then	
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime::-3}))"\e[0m"
		else
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		fi
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${charge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Charging capacity: "${charge_cap_array[$c]}" kWh"				
		fi
	 	if [[ ! ${discharge_cap_array[$c]} == null  ]];
		then	
			echo -e "	Discharging capacity: "${discharge_cap_array[$c]}" kWh"				
		fi	
		if [[ ! ${charge_time_array[$c]} == null  ]];
		then	
			echo -e "	Charging duration: "${charge_time_array[$c]}" h"				
		fi
		if [[ ! ${discharge_time_array[$c]} == null  ]];
		then	
			echo -e "	Discharging duration: "${discharge_time_array[$c]}" h"				
		fi
		echo ""
		
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
			
		#end of for loop for presentation data every 5minutes
		done

	done
	
fi

# if we have Residential inverter
if [[ $success == "true"  ]] && [[  $2 == 38  ]];
	then
	
	echo ""
	echo "Numbers of Devices to check: "${#devIds_array[@]}
	echo ""

	
	for (( a=0; a<=((${#devIds_array[@]}-1)); a++ )) 
	do
	
		echo -e "\e[93m \c" 
		Device_type_ID ${devTypeId_array[$a]}
		echo -e "\e[0m ID: "${devId_array[$a]}
		echo ""
		
		#loop for every year
		for (( c=0; c<=((${#collectTime_array[@]}-1)); c++ )) 
		do
		

		#local collectTimeActually=$(echo ${collectTime_array[$c]::-3})
		if [[ ${collectTime_array[$c]} == "0"  ]];
		then	
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime::-3}))"\e[0m"
		else
			echo -e "	\e[1m"$(date +"%Y" -d @$(echo ${collectTime_array[$c]::-3}))"\e[0m"
		fi
		
		#special loop  for checking if inverter is disconnected
		#if [[ ! $hex == "0"  ]];
		#then
		
				
		if [[ ! ${installed_capacity_array[$c]} == null  ]];
		then	
			echo -e "	Installed capacity: "${installed_capacity_array[$c]}" kWp"				
		fi
	 	if [[ ! ${product_power_array[$c]} == null  ]];
		then	
			echo -e "	Yield: "${product_power_array[$c]}" kWh"				
		fi	
		if [[ ! ${perpower_ratio_array[$c]} == null  ]];
		then	
			echo -e "	Specific energy (kWh/kWp): "${perpower_ratio_array[$c]}" h"				
		fi

		echo ""
			
		#special for checking if inverter is diconected 
		#else
		#	echo -e "	No any Real-time data when device is disconected!"
		
		#special loop finish for checking if inverter is diconected 
		#fi
		
		#end of for loop for presentation data every 5minutes
		done

	done
	
fi

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getDevKpiYear
		
fi

echo ""


}


function getAlarmList {


# Request to API getAlarmList
local getAlarmList=$(printf '{"stationCodes": "'$1'", "beginTime":'$2', "endTime":'$3', "language":"'$4'", "types":"'$7'", "devTypes":"'$8'", "levels":"'$6'", "status":"'$5'"}'| http  --follow --timeout 3600 POST https://eu5.fusionsolar.huawei.com/thirdData/getAlarmList  XSRF-TOKEN:''$xsrf_token''  Content-Type:'application/json'  Cookie:'web-auth=true; XSRF-TOKEN='$xsrf_token'')


#echo $getAlarmList | jq

local success=$(echo ''$getAlarmList''  | jq '.success' )
local buildCode=$(echo ''$getAlarmList''  | jq '.buildCode' )
local failCode=$(echo ''$getAlarmList''  | jq '.failCode' )
local message=$(echo ''$getAlarmList''  | jq '.message' )
local parameters=$(echo ''$getAlarmList''  | jq '.parms' )
	
	local stationCode=$(echo ''$getAlarmList''  | jq '.data[].stationCode' )
	local alarmName=$(echo ''$getAlarmList''  | jq '.data[].alarmName' )
	local devName=$(echo ''$getAlarmList''  | jq '.data[].devName' )
	local repairSuggestion=$(echo ''$getAlarmList''  | jq '.data[].repairSuggestion' )
	local esnCode=$(echo ''$getAlarmList''  | jq '.data[].esnCode' )
	local devTypeId=$(echo ''$getAlarmList''  | jq '.data[].devTypeId' )
	local causeId=$(echo ''$getAlarmList''  | jq '.data[].causeId' )
	local alarmCause=$(echo ''$getAlarmList''  | jq '.data[].alarmCause' )
	local alarmType=$(echo ''$getAlarmList''  | jq '.data[].alarmType' )
	local raiseTime=$(echo ''$getAlarmList''  | jq '.data[].raiseTime' )
	local alarmId=$(echo ''$getAlarmList''  | jq '.data[].alarmId' )
	local recoverDate=$(echo ''$getAlarmList''  | jq '.data[].recoverDate' )
	local stationName=$(echo ''$getAlarmList''  | jq '.data[].stationName' )
	local level=$(echo ''$getAlarmList''  | jq '.data[].lev' )
	local status=$(echo ''$getAlarmList''  | jq '.data[].status' )

#removing " on begining and end
local buildCode="$(echo "$buildCode" | tr -d '"')"

		# Conversion of long variable string to array
		eval "stationCode_array=(${stationCode})"
		eval "alarmName_array=(${alarmName})"
		eval "devName_array=(${devName})"
		eval "repairSuggestion_array=(${repairSuggestion})"
		eval "esnCode_array=(${esnCode})"
		eval "devTypeId_array=(${devTypeId})"
		eval "causeId_array=(${causeId})"
		eval "alarmCause_array=(${alarmCause})"
		eval "alarmType_array=(${alarmType})"
		eval "raiseTime_array=(${raiseTime})"
		eval "alarmId_array=(${alarmId})"
		eval "recoverDate_array=(${recoverDate})"
		eval "stationName_array=(${stationName})"
		eval "level_array=(${level})"
		eval "status_array=(${status})"

#echo "Request success or failure flag: " $success
if [[ $success == "true"  ]];
	then	
		echo ""
		echo -e "API \e[4mgetAlarmList\e[0m connection \e[42mOK\e[0m"
		getAlarmList_connection=true
elif [[ $success == "false" ]];
	then
		echo ""
		echo -e "API \e[4mgetAlarmList\e[0m connection \e[41mError\e[0m"
		getAlarmList_connection=false
else
	echo ""
	echo -e "\e[41mNetwork Error :(\e[0m" 
	#program stops
	exit
fi

#echo "Error code: " $failCode " (0: Normal)"
# we call to function with errors list
Error_Codes_List $failCode

#echo "Optional message: " $message
if [[ ! $message == "\"\""  ]];
then	
	echo "Optional message: " $message
fi


if [[ $success == "true"  ]];
then	
	echo "Build Code: "$buildCode
fi


local curent_time_actually=$(echo ${curent_time::-3})

local curent_time_of_request=$(date -d @$curent_time_actually)
echo "Time of your Request to API: "$curent_time_of_request

	echo ""
	echo "Numbers of Alarms: "${#stationCode_array[@]}
	echo ""

	
	for (( c=0; c<=((${#stationCode_array[@]}-1)); c++ )) 
	do
	

		echo -e "	\e[93m\c"
		echo -e ${alarmName_array[$c]}"\e[0m"

				
		if [[ ! ${stationCode_array[$c]} == null  ]];
		then	
			echo -e "	Plant ID: "${stationCode_array[$c]}
		fi
		if [[ ! ${stationName_array[$c]} == null  ]];
		then	
			echo -e "	Plant name: "${stationName_array[$c]}
		fi
		
		if [[ ! ${devName_array[$c]} == null  ]];
		then	
			echo -e "	Device name: "${devName_array[$c]}
		fi
		if [[ ! ${esnCode_array[$c]} == null  ]];
		then	
			echo -e "	Device SN: "${esnCode_array[$c]}
		fi
		if [[ ! ${devTypeId_array[$c]} == null  ]];
		then	
			echo -e "	Device type ID: \c" 
			Device_type_ID ${devTypeId_array[$c]}
			echo -e ""
			
		fi
		if [[ ! ${level_array[$c]} == null  ]];
		then	
			if [ ${alarmType_array[$c]} == 1 ]
			then
			local severity="critical"
			elif [ ${alarmType_array[$c]} == 2 ]
			then
			local severity="major"
			elif [ ${alarmType_array[$c]} == 3 ]
			then
			local severity="minor"
			elif [ ${alarmType_array[$c]} == 4 ]
			then
			local severity="warning"
			else
			local severity="unknow"
			fi
			echo -e "	Severity: "$severity
		fi
		if [[ ! ${alarmId_array[$c]} == null  ]];
		then	
			echo -e "	Alarm ID: "${alarmId_array[$c]}
		fi
		if [[ ! ${alarmName_array[$c]} == null  ]];
		then	
			echo -e "	Alarm name: "${alarmName_array[$c]}
		fi
		if [[ ! ${alarmType_array[$c]} == null  ]];
		then	
			if [ ${alarmType_array[$c]} == 1 ]
			then
			local alarm_type="transposition signal"
			elif [ ${alarmType_array[$c]} == 2 ]
			then
			local alarm_type="exception alarm"			
			elif [ ${alarmType_array[$c]} == 3 ]
			then
			local alarm_type="protection event"				
			elif [ ${alarmType_array[$c]} == 4 ]
			then
			local alarm_type="notification status"
			elif [ ${alarmType_array[$c]} == 5 ]
			then
			local alarm_type="alarm information"
			else
			local alarm_type="Unknow"
			fi		
			echo -e "	Alarm type: "$alarm_type
		fi
		if [[ ! ${status_array[$c]} == null  ]];
		then	
			if [ ${status_array[$c]} == 1 ]
			then
			local alarm_status="not handled (active)"
			elif [ ${status_array[$c]} == 2 ]
			then
			local alarm_status="acknowledged (by a user)"			
			elif [ ${status_array[$c]} == 3 ]
			then
			local alarm_status="being handled (transferred to a defect ticket)"				
			elif [ ${status_array[$c]} == 4 ]
			then
			local alarm_status="handled (defect handling has ended)"
			elif [ ${status_array[$c]} == 5 ]
			then
			local alarm_status="cleared (by a user)"
			elif [ ${status_array[$c]} == 6 ]
			then
			local alarm_status="cleared (automatically by the device)"
			else
			local alarm_status="Unknow"
			fi
			echo -e "	Alarm status: "$alarm_status
		fi

		if [[ ! ${causeId_array[$c]} == null  ]];
		then	
			echo -e "	Cause ID: "${causeId_array[$c]}
		fi
		if [[ ! ${alarmCause_array[$c]} == null  ]];
		then	
			echo -e "	Alarm cause: \n\n"${alarmCause_array[$c]}"\n"
		fi

		if [[ ! ${raiseTime_array[$c]} == null  ]];
		then	
			echo -e "	Occurrence time: "$(date -d @${raiseTime_array[$c]::-3})
		fi
		if [[ ! ${recoverDate_array[$c]} == null  ]];
		then	
			echo -e "	Recovery time: "$(date -d @${recoverDate_array[$c]::-3})
		fi
		if [[ ! ${repairSuggestion_array[$c]} == null  ]];
		then	
			echo -e "	Handling suggestion: \n\n"${repairSuggestion_array[$c]}"\n"
		fi
		echo ""
		


	done

# in case of error
if [[ $success == "false"  ]];
	then
	#fuction which works with connection error	
	in_case_of_error_with_connection_to_API $getAlarmList
		
fi

echo ""


}

