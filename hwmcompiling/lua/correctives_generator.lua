base = "base";

-- define what the separator is for selection, as currently some of the select shapes are "SELECT-eyes" and some are "SELECT_eyes
selectSeparator = "-";

-- flag what parts of the face are going to be compiled
upperFaceSwitch = true ;
lowerFaceSwitch = true ;

-- lock teeth and throat socket.
if lowerFaceSwitch then
--	dofile( vs.GameDir() .. "../sdktools/lua/face_lockJaw.lua" );
end

dofile( "../sdktools/hwmcompiling/lua/face_correctors_absolute.lua" );

dofile( "../sdktools/hwmcompiling/lua/face_lipzipper_absolute.lua" );