-- Set the game mod to be tf_movies - all actors live in the tf_movies mod
vs.SetGame( "usermod" );
-- Load the base mesh
Load( "../sdktools/hwmcompiling/cor_input/head_abs.dmx" );

-- Generate corrective flexes.
dofile( "../sdktools/hwmcompiling/lua/correctives_generator.lua" );
ResetState();

Save( "../sdktools/hwmcompiling/cor_output/head_abs_cor.dmx" );