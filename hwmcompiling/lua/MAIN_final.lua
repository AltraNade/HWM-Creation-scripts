-- Set the game mod to be tf_movies - all actors live in the tf_movies mod
vs.SetGame( "usermod" );
-- Load the base mesh
Load( "../sdktools/hwmcompiling/final_input/head_abs_cor_final.dmx" );

-- Generate sliders.
dofile( "../sdktools/hwmcompiling/lua/sliders.lua" );
ResetState();

Save( "../sdktools/hwmcompiling/final_output/head_final.dmx" );