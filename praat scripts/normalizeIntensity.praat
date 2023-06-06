form Open textgrids and wav files
	comment Directory
	sentence Dir_name /Users/willclapp/Desktop/denoise_tutorial/audio/low_pass/high-pass/denoised/dereverb/EQ/
	sentence Out_dir /Users/willclapp/Desktop/denoise_tutorial/audio/low_pass/high-pass/denoised/dereverb/EQ/normalized/
endform

Create Strings as file list: "fileList", dir_name$ + "*.wav"
numFiles = Get number of strings



for x to numFiles
	selectObject: "Strings fileList"
	sound$ = Get string: x
	sound = Read from file: dir_name$ + sound$
	sound$ = replace$(sound$, ".wav", "", 0)
	Scale intensity: 65
	Save as 24-bit WAV file: out_dir$ + sound$ + ".wav"
endfor

