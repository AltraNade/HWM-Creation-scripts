# HWM-Creation-scripts
This is a collection of lua and bat files to help speed up creating corrective shapes for the flexes of your character models for SFM/Garry's Mod!

-- HOW TO USE --

-- SETUP --

Place the folder "hwmcompiling" into the folder "SourceFilmmaker/game/sdktools".
<img width="533" height="210" alt="image" src="https://github.com/user-attachments/assets/42b40b40-107e-41f3-9877-5034584013f6" />


Set up dmxedit for use. Open the SFM SDK and click the mod you are using. It should then overwrite the VProject and set up dmxedit for use.
<img width="337" height="481" alt="image" src="https://github.com/user-attachments/assets/14b75327-447a-48f1-aedd-85d001513697" />
<img width="354" height="197" alt="image" src="https://github.com/user-attachments/assets/3b9ab286-eff2-4fb0-8cad-2e74488799bd" />
<img width="794" height="551" alt="image" src="https://github.com/user-attachments/assets/8b6dff86-5f75-4d9f-a7d4-6c80a75a05d8" />



-- BLENDER --

In Blender, create the shape keys for your head. Import the file "SourceFilmmaker/game/sdktools/lua/reference_heads/tf_movies.dmx" as a reference for shape keys, including selection groups (labelled with "SELECT-"). Create a slider for "SELECT-Tongue" as well.

Add sliders for "TongueV", "TongueCurlUp", "TongueCurlDown", "TongueWide", "TongueNarrow", "TongueFunnel", "TongueLeft", "TongueRight", "TongueOut" and "TongueBack".

Make sure the corrective shapes are seperated with hyphens "-" instead of underscores "_" (This is because dmxedit will automatically convert corrective shapes to relative if seperated by underscores, we want to keep them in absolute state for now).

Export the head with the name "head_abs.dmx".

-- CORRECTIVES --

Place "head_abs.dmx" into the folder "cor_input".
<img width="641" height="232" alt="image" src="https://github.com/user-attachments/assets/45f2bb6e-3363-4b0f-855d-cce4005a9aca" />

Double click "HWM_Correctors_Conversion.bat" and run.

A new dmx file should be generated named "head_abs_cor.dmx" in the folder "cor_output".

-- BLENDER ADJUSTMENTS --

Import "head_abs_cor.dmx" into blender 4.5 and make adjustments to the new shape keys.

Create a new script in blender and copy the text from the file "rename_shapekeys"

Select the adjusted head mesh and run the script. All the hyphens "-" will be replaced by underscores "_" except for sliders with "SELECT-". (This will make the final pass in dmxedit convert the correctives to a relative state!)

Export the adjusted head with the name "head_abs_cor_final.dmx"

-- FINAL PASS --

Place "head_abs_cor_final.dmx" into the folder "final_input".
<img width="641" height="232" alt="image" src="https://github.com/user-attachments/assets/83575c4f-1439-47bc-a02d-8cb23dd154b6" />

Double click "HWM_final_Conversion.bat" and run.

A new dmx file should be generated named "head_final.dmx" in the folder "final_output" (It should have wrinklemap information along with calculated normals for all flexes).

Rename "head_final.dmx" to whatever your QC file needs. That's it!
