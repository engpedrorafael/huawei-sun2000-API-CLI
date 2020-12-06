# huawei-sun2000-API-CLI

 [![GitHub license](https://img.shields.io/github/license/BlazejosP/huawei-sun2000-API-CLI)](https://github.com/BlazejosP/huawei-sun2000-API-CLI/blob/master/LICENSE)
 [![GitHub issues](https://img.shields.io/github/issues/BlazejosP/huawei-sun2000-API-CLI)](https://github.com/BlazejosP/huawei-sun2000-API-CLI/issues)
![Maintenance](https://img.shields.io/maintenance/yes/2020)

Huawei sun2000-(3KTL-10KTL)-M0 all models comand line bash API for download data from their FusionSolarApp web service. To use this tool you need an acount in their service and then request developer account. That all mean that you need Huawei sun2000 https://solar.huawei.com/eu/products series PV inverter configured already with their cloud service or someone who give you acess to cloud service related with his Huawei device.

To use this script you need account on Huawei FusionSolar https://eu5.fusionsolar.huawei.com and developer privilege.

Contact service team at eu_inverter_support@huawei.com to create an openAPI account for your plant. in email like this:

Email Template
-
Hi, I hereby request an openAPI user account to access the data from my inverter(s) through the new #FusionSolar API:

System name: <--here data--> 

Username: <--here data--> 

Plant Name: <--here data--> 

SN Inverter: <--here data-->

Device Sun2000-(from 3KTL to 10KTL meaby also others)-M0
-
Device itself must be equipped with Smart Dongle there are two types: 

Smart Dongle-4G (sends data through cellular network -> to internet -> and then stright to cloud service)

SmartDongle-WLAN-FE (sends data with use of user lan or wlan -> through user getway -> internet -> to cloud service)

Whatever dongle is in use there must be an connection to internet if not cloud service simple don't recieve new data. 

![Huawei-sun2000](pictures/3-10-FROUNT-Dongle.png)

Installation
-
This is tool for login and get data from Huawei FusionSolar https://eu5.fusionsolar.huawei.com
This tool use official FusionSolar API described here https://forum.huawei.com/enterprise/en/communicate-with-fusionsolar-through-an-openapi-account/thread/591478-100027 by manufacturer. Data from official API are refreshed every 1h that is why we also use unofficial API called "Kiosk Mode" to grab especially power production every 5 minutes. 

You must have installed on your linux tools like curl, jq, httpie, grep, mosquitto_pub on debian and similar systems that is necessary done this with

sudo apt-get install curl

sudo apt-get install jq

sudo apt-get install grep

sudo apt-get install httpie

sudo apt-get install mosquitto-clients (if you use MQTT sending option)

On other linux distributions check used package system but that are standard linux command line tools so should be avaiable without problem if are not installed already. 

Usage
-
There are two files


<b>fusionsolarapp.sh</b> - which using official Huawei API data are refreshed every 1 hour on server when inverter works so in cron just configure starting of this script around two-three minutes after full hour. Crontab example:
```
4 5-22 * * *            /home/WhateverFolder/fusionsolarapp.sh
```
<b>kioskmode.sh</b> - which use unoficial API related to "Kiosk Mode" here data are refreshed every 5 minutes on server so in cron configure this script to pull data every 5 minutes during sunlight. Crontab example:
```
*/5 5-22 * * *          /home/WhateverFolder/huawei-sun2000-API-CLI/kioskmode.sh`
```

![Kioskmode](pictures/kioskmode.png)
