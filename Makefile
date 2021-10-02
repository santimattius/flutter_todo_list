.PHONY: clean localize all check_env

watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

build:
	flutter packages pub run build_runner build


