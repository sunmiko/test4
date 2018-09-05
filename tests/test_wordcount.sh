#!/bin/bash
#
# Usage: shunit2 test_mobile.sh
# Example: shunit2-2.1.6/src/shunit2 tests/test_wordcount.sh

test_Android_title_limit_50() {
	test_result=0
	for f in `find files -type f | grep title.txt`; do
        count=`tr -d "\n\r" < $f| wc -m`
        if [[ $count -gt 50 ]]; then
            echo "$f is" $count "characters long"
            test_result=1
        fi
    done

	assertEquals "Testing PlayStore title.txt character limit of 50" '0' "${test_result}"

	if [ $test_result -eq 0 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
}
