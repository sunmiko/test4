#echo "Testing using heroku-buildpack-run"
#shunit2-2.1.6/src/shunit2 tests/test_wordcount.sh

echo "Testing git clone"
# rm -rf label-service
# git clone https://svc-l10n:Globalization_123456@github.com/Localization/label-service.git
if [ -d "shunit2" ]; then rm -rf shunit2; fi
git clone https://svc-l10n:Globalization_123456@github.com/Localization/shunit2.git
pwd
ls

### find latest commit hash
hash=$(echo $(git log --no-merges --pretty=format:'%h' -n 1 HEAD))
echo
echo "Commit: $hash"

#find latest changed files
IFS=$'\n';
changed=$(git diff-tree --no-commit-id --name-only -r $hash)
echo "Files:"
echo $changed
echo

shunit2/shunit2-2.1.6/src/shunit2 shunit2/tests/test_walkthrough_helptray.sh
