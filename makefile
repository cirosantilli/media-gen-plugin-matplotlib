#compiles all *.py files into *.svg files
#
#if you put a makefile called `makefile-local` in the same dir as this,
#its commands are called after this file. You can use this as a hook
#for more complicated make rules that don't fit into the 1 file generates
#1 image supported by this makefile

override CC 		:= python shared.py
override ERASE_MSG := 'DONT PUT ANYTHING IMPORTANT IN THOSE DIRECTORIES SINCE `make clean` ERASES THEM!!!'
override FLAGS 		?=
override ID 		?=
override IN_DIR 	?= in/
override IN_EXT 	?= .py
override OUT_DIR 	?= out/
override OUT_EXT 	?= .png
override HOOKED_MAKEFILE	?= makefile-local
override RUN_NOEXT 	?= a 			#basename without extension of file to view (with firefox, okular, etc.)

export

.PHONY: all mkdir firefox okular clean

INS 		:= $(wildcard $(IN_DIR)*$(IN_EXT))
INS_NODIR 	:= $(notdir $(INS))
OUTS_NODIR	:= $(patsubst %$(IN_EXT),%$(OUT_EXT),$(INS_NODIR))
OUTS		:= $(addprefix $(OUT_DIR),$(OUTS_NODIR))

all: mkdir $(OUTS)
	@echo 'OUTPUT    FILES WERE BE PUT INTO: $(OUT_DIR)'
	@echo $(ERASE_MSG)
	if [ -f $(HOOKED_MAKEFILE) ]; then make -f $(HOOKED_MAKEFILE); fi

$(OUT_DIR)%$(OUT_EXT): $(IN_DIR)%$(IN_EXT) shared.py
	$(CC) $< $(FLAGS)

clean:
	rm -r "$(OUT_DIR)"
	@echo "REMOVED DIRS: $(OUT_DIR)"
	@echo $(ERASE_MSG)

mkdir:
	mkdir -p "$(OUT_DIR)"
	@echo $(ERASE_MSG)
