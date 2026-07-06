# HWM-Creation-scripts
This is a collection of lua and bat files to help speed up creating corrective shapes for the flexes of your character models for SFM/Garry's Mod

-- HOW TO USE --

Set up dmxedit for use. Open the SFM SDK and click the mod you are using. It should then overwrite the VProject and set up dmxedit for use.

In Blender, create the shape keys for your head. Make sure the corrective shapes are seperated with hyphens "-" instead of underscores "_" (This is because dmxedit will automatically convert corrective shapes to relative if seperated by underscores, we want to keep them in absolute state for now).

Export the head with the name "head_abs.dmx".

Place "head_abs.dmx" (in absolute state instead of relative) into the folder "cor_input".

Double click "HWM_Correctors_Conversion.bat" and run.

A new dmx file should be generated named "head_abs_cor.dmx" in the folder "cor_output".

Import "head_abs_cor.dmx" into blender 4.5 and make adjustments to the new shape keys.

Create a new script in blender with the following text:
