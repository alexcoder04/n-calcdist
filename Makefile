
NAME = calcdist
TEMP_LUA = out.lua
OUT_FILE = $(NAME).tns

all: clean build upload

build:
	sol -a build .
	luna $(TEMP_LUA) $(OUT_FILE)

devBuild:
	SOL_USE_LOCAL_LIB=1 SOL_LOCAL_LIB_PATH="$(HOME)/Repos/sol-lib" sol -a build .
	luna $(TEMP_LUA) $(OUT_FILE)

clean:
	$(RM) $(TEMP_LUA) $(OUT_FILE)

upload:
	PATH="/media/secret/alex/.local/bin:$(PATH)" uploadnspire $(OUT_FILE)
