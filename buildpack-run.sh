#echo "Testing using heroku-buildpack-run"
#shunit2-2.1.6/src/shunit2 tests/test_wordcount.sh

echo "Testing git clone"
rm -rf label-service
git clone https://svc-l10n:Globalization_123456@github.com/Localization/label-service.git
