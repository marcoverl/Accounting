#!/bin/bash
if [ $# -lt 2 ]
then
        echo "Insert time range YYYY/MM YYYY/MM" 
        echo "Example : $0 2015/11 2017/8"
        exit
fi
start=$1
end=$2
echo
echo HTC Platform KPIs:
echo Number of jobs submitted=$(python accounting.py -i https://accounting.egi.eu/egi/htc/njobs/SITE/VO/$start/$end/custom-enmr.eu/onlyinfrajobs/CSV 2>/dev/null | grep Total | grep -v'enmr.eu' | cut -d',' -f3)
echo Normalized CPU Hours used=$(python accounting.py -i https://accounting.egi.eu/egi/htc/normcpu-hour/SITE/VO/$start/$end/custom-enmr.eu/onlyinfrajobs/CSV 2>/dev/null  | grep Total | grep -v'enmr.eu' | cut -d',' -f3)
echo
echo Cloud Platform KPIs:
echo Number of VMs run=$(python accounting.py -i https://accounting.egi.eu/egi/cloud/number_of_virtual_machines/SITE/VO/$start/$end/custom-enmr.eu/onlyinfrajobs/CSV 2>/dev/null | grep Total | grep -v'enmr.eu' | cut -d',' -f3)
echo Wall Time Hours used=$(python accounting.py -i https://accounting.egi.eu/egi/cloud/sum_elap-hour/SITE/VO/$start/$end/custom-enmr.eu/onlyinfrajobs/CSV 2>/dev/null | grep Total | grep -v'enmr.eu' | cut -d',' -f3)
#echo Wall Time Hours used=$(python accounting.py -i https://accounting.egi.eu/egi/cloud/sum_elap_processors/SITE/VO/$start/$end/custom-enmr.eu/onlyinfrajobs/CSV 2>/dev/null | grep Total | grep -v'enmr.eu' | cut -d',' -f3)
echo

