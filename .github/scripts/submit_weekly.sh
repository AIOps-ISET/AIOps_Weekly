#!/bin/bash

MondayDate=`date "+%Y.%m.%d" --date "6 days ago"`
FridayDate=`date "+%Y.%m.%d" --date "2 days ago"`

directoryName="$MondayDate-$FridayDate"
directoryRootName=`date "+%Y.%m" --date "6 days ago"`
fileName="$directoryRootName/$directoryName/template.md"
fileCopyName="$directoryRootName/$directoryName/template_copy.md"

cp "$fileName" "$fileCopyName"

markdownAttachmentResult=`sed -n '/^\[.\+/p' $fileName`
readarray -t markdownAttachment <<< "$markdownAttachmentResult"

markdownAttachmentLineNumberResult=`sed -n '/^\[.\+/=' $fileName`
readarray -t markdownAttachmentLineNumber <<< "$markdownAttachmentLineNumberResult"

attachmentNumber="${#markdownAttachment[@]}"

declare -a attachments
declare -a attachmentCopy
declare -a attachmentToAddToGit

for i in `seq 1 "$attachmentNumber"`; do
  let j=i-1
  subStringLeft=${markdownAttachment[j]#*(}
  attachments[$j]=${subStringLeft%)*}
done

if [[ ! -z "$markdownAttachmentResult" ]] ;then
  for i in `seq 1 "$attachmentNumber"`; do
    let j=i-1
    if [[ ! -e "$directoryRootName/$directoryName/${attachments[j]}" ]]; then
      echo "The attachment file doesn't exist"
      exit 1
    fi
    subStringLeft=${markdownAttachment[j]#*[}
    attachmentCopy[$j]="[$i.${subStringLeft%]*}]($i.${attachments[j]})"
    sed -i "${markdownAttachmentLineNumber[j]}c ${attachmentCopy[j]}" "$fileCopyName"
    attachmentToAddToGit[$j]=$i.${attachments[j]}
    cp -r "$directoryRootName/$directoryName/${attachments[j]}" "$directoryRootName/$directoryName/$i.${attachments[j]}"
  done
fi

outputFileName="$directoryRootName/$directoryName/0.$directoryName.docx"
/bin/pandoc --reference-doc=./Template/custom-reference.docx "$fileCopyName" -o "$outputFileName"

cd "$directoryRootName/$directoryName"

/bin/zip "$directoryName"AIOps周报.zip "${attachmentToAddToGit[@]}" "0.$directoryName.docx"

echo "WEEKLY_PATH="$directoryRootName/$directoryName"" >> $GITHUB_ENV
echo "WEEKLY_NAME="$directoryName"AIOps周报.zip" >> $GITHUB_ENV

git config user.name 'github-actions[bot]'
git config user.email 'github-actions[bot]@users.noreply.github.com'
git add "$directoryName"AIOps周报.zip
git commit -m '[automated commit] Submit weekly'
git push
