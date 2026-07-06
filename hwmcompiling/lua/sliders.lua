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

-- Converting CloseLid to CloseLidLo_CloseLidUp.

	ResetState();
	SetState( "CloseLids" );
	Select( "ALL" );
	Add( "CloseLids", 1.0 );
	SaveDelta( "CloseLidLo_CloseLidUp" );
	ResetState();
	DeleteDelta( "CloseLids" );

-- group face controls

GroupControls( "CloseLid", "CloseLidLo", "CloseLidUp" );
GroupControls( "BrowInV", "WrinkleNose", "RaiseBrowIn" );
GroupControls( "NoseV", "PressNose", "SneerNose" );
GroupControls( "NostrilFlare", "SuckNostril", "BlowNostril" );
GroupControls( "CheekH", "DeflateCheek", "InflateCheek" );
GroupControls( "JawD", "SuckJaw", "JutJaw" );
GroupControls( "JawH", "SlideJawR", "SlideJawL" );
GroupControls( "JawV", "ClenchJaw", "OpenJaw" );
GroupControls( "LipsV", "CompressLips", "OpenLips" );
GroupControls( "LipUpV", "JutUpperLip", "OpenUpperLip" );
GroupControls( "LipLoV", "RaiseChin", "OpenLowerLip" );
GroupControls( "Smile", "SmileFlat", "SmileFull", "SmileSharp" );
GroupControls( "FoldLipUp", "SuckLipUp", "FunnelLipUp" );
GroupControls( "FoldLipLo", "SuckLipLo", "FunnelLipLo" );
GroupControls( "ScalpD", "ScalpBack", "ScalpForward" );
GroupControls( "TongueH", "TongueLeft", "TongueRight" );
GroupControls( "TongueCurl", "TongueCurlUp", "TongueCurlDown" );
GroupControls( "TongueD", "TongueBack", "TongueOut" );
GroupControls( "TongueWidth", "TongueNarrow", "TongueWide" );

GroupControls( "ZipLips", "ZipLip00", "ZipLip25", "ZipLip50", "ZipLip75", "ZipLip100" );


-- reorder controls
ReorderControls(
	"CloseLid", 
	"InnerSquint", 
	"OuterSquint", 
	"BrowInV", 
	"BrowOutV", 
	"Frown", 
	"NoseV", 
	"NostrilFlare", 
	"CheekV", 
	"CheekH", 
	"JawD", 
	"JawH", 
	"JawV", 
	"LipsV", 
	"LipUpV", 
	"LipLoV", 
	"Smile", 
	"Platysmus", 
	"FoldLipUp", 
	"FoldLipLo", 
	"PuckerLipUp", 
	"PuckerLipLo", 
	"LipCnrTwst", 
	"Dimple", 
	"PuffLipUp", 
	"PuffLipLo", 
	"ScalpD", 
	"TongueD", 
	"TongueH", 
	"TongueV", 
	"TongueCurl", 
	"TongueFunnel", 
	"TongueWidth",
	"ZipLips"
);


SetEyelidControl("CloseLid", true );

-- setup stereo controls
SetStereoControl("CloseLid", true );
SetStereoControl("InnerSquint", true );
SetStereoControl("OuterSquint", true );
SetStereoControl("BrowInV", true );
SetStereoControl("BrowOutV", true );
SetStereoControl("Frown", true );
SetStereoControl("NoseV", true );
SetStereoControl("NostrilFlare", true );
SetStereoControl("CheekV", true );
SetStereoControl("CheekH", true );
SetStereoControl("JawD", false );
SetStereoControl("JawH", false );
SetStereoControl("JawV", false );
SetStereoControl("LipsV", true );
SetStereoControl("LipUpV", true );
SetStereoControl("LipLoV", true );
SetStereoControl("Smile", true );
SetStereoControl("Platysmus", true );
SetStereoControl("FoldLipUp", true );
SetStereoControl("FoldLipLo", true );
SetStereoControl("PuckerLipUp", true );
SetStereoControl("PuckerLipLo", true );
SetStereoControl("LipCnrTwst", true );
SetStereoControl("Dimple", true );
SetStereoControl("PuffLipUp", true );
SetStereoControl("PuffLipLo", true );
SetStereoControl("ScalpD", true );
SetStereoControl("TongueV", false );
SetStereoControl("TongueH", false );
SetStereoControl("TongueCurl", false );
SetStereoControl("TongueD", false );
SetStereoControl("ZipLips", true );

-- add control dominators
AddDominationRule( { "BrowOutV" }, { "WrinkleNose"} );
AddDominationRule( { "FunnelLipLo" }, { "PuffLipLo"} );
AddDominationRule( { "FunnelLipLo" }, { "PuffLipUp"} );
AddDominationRule( { "FunnelLipUp" }, { "PuffLipLo"} );
AddDominationRule( { "FunnelLipUp" }, { "PuffLipUp"} );
AddDominationRule( { "LipCnrTwst" }, { "Dimple"} );
AddDominationRule( { "OpenJaw" }, { "InflateCheek"} );
AddDominationRule( { "OpenLips" }, { "PuffLipLo"} );
AddDominationRule( { "OpenLips" }, { "PuffLipUp"} );
AddDominationRule( { "OpenLowerLip" }, { "CompressLips"} );
AddDominationRule( { "OpenLowerLip" }, { "FunnelLipLo"} );
AddDominationRule( { "OpenLowerLip" }, { "PuffLipLo"} );
AddDominationRule( { "OpenLowerLip" }, { "PuffLipUp"} );
AddDominationRule( { "OpenLowerLip", "OpenUpperLip" }, { "OpenLips"} );
AddDominationRule( { "OpenUpperLip" }, { "CompressLips"} );
AddDominationRule( { "OpenUpperLip" }, { "FunnelLipUp"} );
AddDominationRule( { "OpenUpperLip" }, { "PuffLipLo"} );
AddDominationRule( { "OpenUpperLip" }, { "PuffLipUp"} );
AddDominationRule( { "Platysmus" }, { "FunnelLipLo"} );
AddDominationRule( { "Platysmus" }, { "FunnelLipUp"} );
AddDominationRule( { "Platysmus" }, { "LipCnrTwst"} );
AddDominationRule( { "Platysmus" }, { "PuckerLipLo"} );
AddDominationRule( { "Platysmus" }, { "PuckerLipUp"} );
AddDominationRule( { "PuckerLipLo" }, { "SmileFlat"} );
AddDominationRule( { "PuckerLipLo" }, { "SmileFull"} );
AddDominationRule( { "PuckerLipLo" }, { "SmileSharp"} );
AddDominationRule( { "PuckerLipLo" }, { "SuckLipLo"} );
AddDominationRule( { "PuckerLipLo",	"OpenJaw" }, { "FunnelLipLo"} );
AddDominationRule( { "PuckerLipUp" }, { "SmileFlat"} );
AddDominationRule( { "PuckerLipUp" }, { "SmileFull"} );
AddDominationRule( { "PuckerLipUp" }, { "SmileSharp"} );
AddDominationRule( { "PuckerLipUp" }, { "SuckLipUp"} );
AddDominationRule( { "PuckerLipUp", "OpenJaw" }, { "FunnelLipUp"} );
AddDominationRule( { "SmileFull" }, { "InflateCheek"} );
AddDominationRule( { "SmileFull" }, { "SuckLipUp"} );

dofile( vs.GameDir() .. "../sdktools/lua/face_wrinkleScales.lua" );

ComputeNormals();
ComputeWrinkles();

--  generate wrinkle weights maps for the teeth to stop them from glowing.
dofile( vs.GameDir() .. "../sdktools/lua/face_wrinkleTeeth.lua" );


-- create wrinkle deltas for glowing tongue
ResetState();
SetState( "SELECT-tongue" ) ;
ComputeWrinkle( "OpenJaw", 1 );
DeleteDelta( "SELECT-tongue" );

--  cleanup
dofile( vs.GameDir() .. "../sdktools/lua/face_cleanup.lua" );