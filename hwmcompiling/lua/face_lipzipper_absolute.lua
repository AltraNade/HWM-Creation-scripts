---- this script recquires the following input OBJ shapes

gSEL_centerLine 	= "SELECT-centerLine";
gSEL_lipcontacts	= "SELECT-lipcontacts";

if selectSeparator then
	gSEL_centerLine 	= "SELECT" .. selectSeparator .. "centerLine";
	gSEL_lipcontacts	= "SELECT" .. selectSeparator .. "lipcontacts";
end

--------------------------------------
--            ZipLip             --
--------------------------------------


-- define lipzipper function
function CreateZipLips( deltaList, baseReferenceShape) 

	-- do the inner loop
	for i,ZipperTarget in ipairs( deltaList ) do
		ResetState();
		Select ("ALL");
		SetState ( ZipperTarget );
		SaveDelta( ZipperTarget .. "-ZipLip00" );
		
		ResetState();
		Select ("ALL");
		SetState ( ZipperTarget );
		Select( gSEL_lipcontacts);
		Interp( (baseReferenceShape) , 1, 1.5, "SPIKE" );
		SaveDelta( ZipperTarget .. "-ZipLip100" );
		
		ResetState();
		Select ("ALL");
		SetState ( ZipperTarget .. "-ZipLip100" );
		Select( gSEL_centerLine);
		Interp( ZipperTarget , 1, 0.5, "SPIKE" );
		SaveDelta( ZipperTarget .. "-ZipLip75" );
		
		ResetState();
		Select ("ALL");
		SetState ( ZipperTarget .. "-ZipLip100" );
		Select( gSEL_centerLine);
		GrowSelection( 1) ;
		Interp( ZipperTarget , 1, 0.5, "SPIKE" );
		SaveDelta( ZipperTarget .. "-ZipLip50" );
		
		ResetState();
		Select ("ALL");
		SetState ( ZipperTarget .. "-ZipLip100" );
		Select( gSEL_centerLine);
		GrowSelection( 2) ;
		Interp( ZipperTarget , 1, 0.5, "SPIKE" );
		SaveDelta( ZipperTarget .. "-ZipLip25" );
	end
end

-- define empty ziplip controls.
Select ("ALL");
ResetState();
SaveDelta( "ZipLip00" );
SaveDelta( "ZipLip25" );
SaveDelta( "ZipLip50" );
SaveDelta( "ZipLip75" );
SaveDelta( "ZipLip100" );

-- define combinations that will use ziplips from relative bases.
TargetList = {
	"OpenLips",
	"OpenUpperLip",
	"OpenLowerLip",
	"OpenLowerLip-OpenUpperLip",
	"OpenLips-OpenLowerLip",
	"SneerNose",
	"OpenLips-OpenUpperLip"
};
CreateZipLips( TargetList, "base");

TargetList = {
	"OpenLowerLip-OpenUpperLip-SmileFull",
	"OpenUpperLip-SmileFull",
	"OpenLowerLip-SmileFull",
	"OpenLips-SmileFull",
	"OpenLips-OpenLowerLip-SmileFull",
	"OpenLips-OpenUpperLip-SmileFull",
	"SmileFull"
};
CreateZipLips( TargetList, "SmileFull");

TargetList = {
	"OpenJaw",
	"OpenJaw-OpenLips",
	"OpenJaw-OpenLowerLip",
	"OpenJaw-OpenUpperLip",
	"OpenJaw-OpenLips-OpenLowerLip",
	"OpenJaw-OpenLips-OpenUpperLip",
	"OpenJaw-OpenLowerLip-OpenUpperLip"
	
};
CreateZipLips( TargetList, "OpenJaw");

TargetList = {
	"PuckerLipLo-PuckerLipUp",
	"OpenLips-PuckerLipLo-PuckerLipUp",
	"OpenJaw-PuckerLipUp",
	"OpenJaw-PuckerLipLo",
	"OpenJaw-PuckerLipLo-PuckerLipUp",
	"OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp",
	"OpenJaw-OpenLips-PuckerLipLo",
	"OpenJaw-OpenLips-PuckerLipUp"
};
CreateZipLips( TargetList, "OpenJaw-PuckerLipLo-PuckerLipUp");

TargetList = {
	"PuckerLipLo-PuckerLipUp",
	"OpenLips-PuckerLipLo-PuckerLipUp"
};
CreateZipLips( TargetList, "PuckerLipLo-PuckerLipUp");

--TargetList = {
--
--	"OpenJaw",
--	"OpenLips",
--	"PuckerLipLo",
--	"PuckerLipUp",
--	"OpenJaw_OpenLips",
--	"OpenJaw_PuckerLipLo",
--	"OpenJaw_PuckerLipUp",
--	"OpenLips_PuckerLipLo",
--	"OpenLips_PuckerLipUp",
--	"PuckerLipLo_PuckerLipUp",
--	"OpenJaw_OpenLips_PuckerLipLo",
--	"OpenJaw_OpenLips_PuckerLipUp",
--	"OpenJaw_PuckerLipLo_PuckerLipUp",
--	"OpenLips_PuckerLipLo_PuckerLipUp",
--	"OpenJaw_OpenLips_PuckerLipLo_PuckerLipUp"

--};
--CreateZipLips( TargetList, "OpenJaw_OpenLips_PuckerLipLo_PuckerLipUp");




-- group controls
GroupControls( "ZipLips", "ZipLip00", "ZipLip25", "ZipLip50", "ZipLip75", "ZipLip100" );

-- make ziplip control into left and right sides.
SetStereoControl("ZipLips", true );

ComputeNormals();











