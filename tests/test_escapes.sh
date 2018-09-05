#!/bin/bash
#
# Usage: shunit2 test_walkthrough_helptray.sh

test_Salesforce1() {
	# startSkipping
	test_result=0
	for f in `find In-App-User-Experience -name '*.properties'`; do
		if grep -q 'Salesforce1' $f ; then
			echo "file name: $f"
			grep 'Salesforce1' $f
			test_result=1
		fi
	done

	assertEquals "Testing usage of Salesforce1" '0' "${test_result}"

	if [ $test_result -eq 0 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
	# endSkipping
}

test_Walkthrough_escapes_exclaimation_marks() {
	test_result=1
	for f in `find In-App-User-Experience -name "walkthroughs-*.properties"`; do
		if grep -q ".*[^\\]\!.*" $f ; then
			echo "file name: $f"
			grep ".*[^\\]\!.*" $f
			test_result=0
		fi
	done

	assertEquals "Testing escape of exclaimation marks in Walkthrough" '1' "${test_result}"

	if [ $test_result -eq 1 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
}

test_Walkthrough_escapes_colons() {
	test_result=1
	for f in `find In-App-User-Experience -name "walkthroughs-*.properties"`; do
		if grep -q ".*[^\\]\:.*" $f ; then
			echo "file name: $f"
			grep ".*[^\\]\:.*" $f
			test_result=0
		fi
	done

	assertEquals "Testing escape of colons in Walkthrough" '1' "${test_result}"

	if [ $test_result -eq 1 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
}

test_HelpTray_dont_escapes_exclaimation_marks() {
	test_result=1
	for f in `find In-App-User-Experience -name "contextual-help-*.properties"`; do
		if grep -q "\\\!" $f ; then
			echo "file name: $f"
			grep "\\\!" $f
			test_result=0
		fi
	done

	assertEquals "Testing no escape of exclaimation marks in HelpTray" '1' "${test_result}"

	if [ $test_result -eq 1 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
}

test_HelpTray_dont_escapes_colons() {
	test_result=1
	for f in `find In-App-User-Experience -name "contextual-help-*.properties"`; do
		if grep -q "\\\:" $f ; then
			echo "file name: $f"
			grep "\\\:" $f
			test_result=0
		fi
	done

	assertEquals "Testing no escape of colons in HelpTray" '1' "${test_result}"

	if [ $test_result -eq 1 ] ; then
		echo "test result: PASS"
	else
		echo  "test result: FAIL"
	fi
	echo "===================================================================================================="
}
