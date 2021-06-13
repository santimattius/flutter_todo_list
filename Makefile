.PHONY: clean localize all check_env

runner watch:
	flutter packages pub run build_runner watch

runner build:
	flutter packages pub run build_runner build


