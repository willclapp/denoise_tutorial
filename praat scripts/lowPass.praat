form Open textgrids and wav files
	comment Directory where the files are:
	sentence Dir_name /Users/willclapp/Desktop/denoise_tutorial/audio/
	comment Directory where the files should be saved:
	sentence Out_dir /Users/willclapp/Desktop/denoise_tutorial/audio/low_pass/
endform

Create Strings as file list: "fileList", dir_name$ + "*.wav"
numFiles = Get number of strings



for x to numFiles
	selectObject: "Strings fileList"
	sound$ = Get string: x
	sound = Read from file: dir_name$ + sound$
	sound$ = replace$(sound$, ".wav", "", 0)
	Filter (pass Hann band): 0, 12000, 300
	Save as WAV file: out_dir$ + sound$ + ".wav"
endfor

