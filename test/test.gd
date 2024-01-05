#gdscript
class_name ClassTest extends Node

## Dictionary of test names and results
var results = {}

## Print test results
@export var verbose = true

## Run all tests and update results
func run():
	return {}

## Call run() and print results
func print_report():
	run()
	if results.size() == 0:
		print("❔ No tests ran")
		return
	print(
		"✅" if results.values().all(func(x): return x) else "❌",
		" ", results.values().count(true), "/", results.size(), " tests passed."
	)

func compare(
	## Actual value
	actual,
	## Expected value
	expected,
	## Name of test
	test_name
):
	if verbose: print("\n", "------", results.size(), ": ", test_name, "------")
	results[test_name] = actual == expected
	if !verbose: return
	print(
		"✅ passed" if results[test_name] else "❌ failed"
	)
	print(
		"\n🟢 expected: \n", expected,
		"\n🔴 actual: \n", actual
	)
