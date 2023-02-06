#!/bin/bash

WEEKLY_LOG="weekly.log"

MondayDate=`date "+%Y.%m.%d"`
FridayDate=`date "+%Y.%m.%d" --date "-4 days ago"`

MondayDateSplitArray=(${MondayDate//./ })
FridayDateSplitArray=(${FridayDate//./ })

directoryName="$MondayDate-$FridayDate"

directoryRootName=`date "+%Y.%m"`

if [[ -e "$directoryRootName/$directoryName/template.md" ]]; then
  echo "The file already exists, exit"
  exit 1
fi

mkdir -p "$directoryRootName/$directoryName"

cp Template/template.md "$directoryRootName/$directoryName"

fileName="$_/template.md"

week=`sed -n '3p' "${WEEKLY_LOG}"`

sed -i "2c title: '第${week}周工作汇报'" "$fileName"

let week=week+1
sed -i "3c ${week}" "${WEEKLY_LOG}"

markdownDate="${MondayDateSplitArray[0]}年\
${MondayDateSplitArray[1]}月\
${MondayDateSplitArray[2]}日-\
${FridayDateSplitArray[0]}年\
${FridayDateSplitArray[1]}月\
${FridayDateSplitArray[2]}日"

sed -i "3c date: '${markdownDate}'" "$fileName"
