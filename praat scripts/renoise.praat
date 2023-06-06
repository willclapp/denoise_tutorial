form Open textgrids and wav files
	comment Directory
	sentence Dir_name /Users/willclapp/Desktop/denoise_tutorial/audio/low_pass/high-pass/denoised/dereverb/EQ/
	sentence Out_dir /Users/willclapp/Desktop/denoise_tutorial/audio/low_pass/high-pass/denoised/dereverb/EQ/normalized/renoised/
	sentence Noise_file /Users/willclapp/Desktop/denoise_tutorial/praat scripts/noise.wav
endform

Create Strings as file list: "fileList", dir_name$ + "*.wav"
numFiles = Get number of strings

noise = Read from file: noise_file$

for x to numFiles
	selectObject: "Strings fileList"
	sound$ = Get string: x
	sound = Read from file: dir_name$ + sound$
	sound$ = replace$(sound$, ".wav", "", 0)
	selectObject: sound
	soundDur = Get total duration
	selectObject: noise
	noisePart = Extract part: 0, soundDur, "rectangular", 1, "no"
	selectObject: noisePart
	Scale intensity: 25
	plusObject: sound
	combinedStereo = Combine to stereo
	combinedMono = Convert to mono
	Save as WAV file: out_dir$ + sound$ + ".wav"
	removeObject: sound, noisePart, combinedStereo, combinedMono
endfor

removeObject: "Strings fileList", noise

