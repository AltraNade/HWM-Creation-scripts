---- this script recquires the following input OBJ shapes
-- head=zero.obj
-- head-BlowNostril.obj
-- head-BrowOutV+Frown+RaiseBrowIn.obj
-- head-BrowOutV+RaiseBrowIn.obj
-- head-BrowOutV.obj
-- head-CheekV+PuckerLips.obj
-- head-CheekV+SmileFull.obj
-- head-CheekV+SneerNose.obj
-- head-CheekV.obj
-- head-ClenchJaw.obj
-- head-CloseLidLo.obj
-- head-CloseLidUp.obj
-- head-CompressLips+RaiseChin.obj
-- head-CompressLips.objf
-- head-DeflateCheek.obj
-- head-Dimple+FunnelLips.obj
-- head-Dimple+OpenLips+PuckerLips.obj
-- head-Dimple+OpenLips.obj
-- head-Dimple+PuckerLips.obj
-- head-Dimple.obj
-- head-Frown+RaiseBrowIn.obj
-- head-Frown+WrinkleNose.obj
-- head-Frown.obj
-- head-FunnelLips+OpenJaw.obj
-- head-FunnelLips.obj
-- head-InflateCheek.obj
-- head-InnerSquint.obj
-- head-JutJaw.obj
-- head-JutUpperLip+RaiseChin.obj
-- head-JutUpperLip.obj
-- head-LipCnrTwst+OpenUpperLip+SuckLipLo.obj
-- head-LipCnrTwst.obj
-- head-OpenJaw+OpenLips.obj
-- head-OpenJaw+OpenLowerLip+OpenUpperLip+Platysmus+SmileFull.obj
-- head-OpenJaw+OpenLowerLip+OpenUpperLip.obj
-- head-OpenJaw+PuckerLips.obj
-- head-OpenJaw.obj
-- head-OpenLips+PuckerLips.obj
-- head-OpenLips+SmileFull.obj
-- head-OpenLips.obj
-- head-OpenLowerLip+OpenUpperLip+Platysmus+SmileFull.obj
-- head-OpenLowerLip+OpenUpperLip.obj
-- head-OpenLowerLip+SuckLipLo.obj
-- head-OpenLowerLip.obj
-- head-OpenUpperLip+SuckLipUp.obj
-- head-OpenUpperLip.obj
-- head-OuterSquint+InnerSquint.obj
-- head-OuterSquint.obj
-- head-Platysmus.obj
-- head-PressNose.obj
-- head-PuckerLips+PuffLips.obj
-- head-PuckerLips+RaiseChin+SneerNose.obj
-- head-PuckerLips+RaiseChin.obj
-- head-PuckerLips.obj
-- head-PuffLips.obj
-- head-RaiseBrowIn.obj
-- head-RaiseChin.obj
-- head-SELECT-Jaw.obj
-- head-SELECT-JawEffect.obj
-- head-SELECT-Skull.obj
-- head-SELECT-centerLine.obj
-- head-SELECT-eyeInnerCorner.obj
-- head-SELECT-eyeOuterCorner.obj
-- head-SELECT-eyes.obj
-- head-SELECT-lipContacts.obj
-- head-SELECT-loLip.obj
-- head-SELECT-mouth.obj
-- head-SELECT-mouthCorner.obj
-- head-SELECT-socket.obj
-- head-SELECT-throat.obj
-- head-SELECT-upLip.obj
-- head-ScalpBack.obj
-- head-ScalpForward.obj
-- head-SmileFlat.obj
-- head-SmileFull.obj
-- head-SmileSharp.obj
-- head-SneerNose.obj
-- head-SuckJaw.obj
-- head-SuckLipLo.obj
-- head-SuckLipUp.obj
-- head-SuckNostril.obj
-- head-WrinkleNose.obj
-- 
-------------------------------------------------------------------------------

-- build the variables for selection, as currently some of the select shapes are "SELECT-eyes" and some are "SELECT-eyes
gSEL_centerLine 	= "SELECT-centerLine";
gSEL_eyeInnerCorner	= "SELECT-eyeInnerCorner";
gSEL_eyeOuterCorner	= "SELECT-eyeOuterCorner";
gSEL_eyes			= "SELECT-eyes";
gSEL_jaw			= "SELECT-jaw";
gSEL_jawEffect		= "SELECT-jawEffect";
gSEL_loLip			= "SELECT-loLip";
gSEL_mouthCorner	= "SELECT-mouthCorner";
gSEL_skull			= "SELECT-skull";
gSEL_throat			= "SELECT-throat";
gSEL_upLip			= "SELECT-upLip";

if selectSeparator then
	gSEL_centerLine 	= "SELECT" .. selectSeparator .. "centerLine";
	gSEL_eyeInnerCorner	= "SELECT" .. selectSeparator .. "eyeInnerCorner";
	gSEL_eyeOuterCorner	= "SELECT" .. selectSeparator .. "eyeOuterCorner";
	gSEL_eyes			= "SELECT" .. selectSeparator .. "eyes";
	gSEL_jaw			= "SELECT" .. selectSeparator .. "jaw";
	gSEL_jawEffect		= "SELECT" .. selectSeparator .. "jawEffect";
	gSEL_loLip			= "SELECT" .. selectSeparator .. "loLip";
	gSEL_mouthCorner	= "SELECT" .. selectSeparator .. "mouthCorner";
	gSEL_skull			= "SELECT" .. selectSeparator .. "skull";
	gSEL_throat			= "SELECT" .. selectSeparator .. "throat";
	gSEL_upLip			= "SELECT" .. selectSeparator .. "upLip";
end

--------------------------------------
--            upperface             --
--------------------------------------
if upperFaceSwitch then
		
	-- create CheekV-OuterSquint
	ResetState();
	SetState ( "OuterSquint" );
	Select( "ALL" );
	Add( "CheekV", 1.0 );
	Select( gSEL_eyes );
	GrowSelection (3);
	Interp( "OuterSquint" , 1.0, 1.25, "SPIKE" );
	SaveDelta( "CheekV-OuterSquint" );
	
	-- create CheekV-InnerSquint
	ResetState();
	SetState ( "CheekV" );
	Select( "ALL" );
	Add( "InnerSquint", 1.0 );
	Select( "InnerSquint" );
	Interp( "InnerSquint" , 0.1, .5, "SPIKE" );
	SaveDelta( "CheekV-InnerSquint" );
	
	-- create CheekV-InnerSquint-OuterSquint
	ResetState();
	SetState ( "InnerSquint-OuterSquint" );
	Select( "ALL" );
	Add( "CheekV", 1.0 );
	Select( "CloseLidUp" );
	Interp( "InnerSquint-OuterSquint" , 1 , .5, "SPIKE" );
	Select( gSEL_eyes );
	GrowSelection (4);
	Interp( "InnerSquint-OuterSquint" , 1.0, 1.25, "SPIKE" );
	SaveDelta( "CheekV-InnerSquint-OuterSquint" );
	
	-- create BrowOutV-InnerSquint
	ResetState();
	SetState ( "InnerSquint" );
	Select( "BrowOutV" );
	Interp( "BrowOutV" , 1 , 0.5, "SPIKE" );
	Select( gSEL_eyes );
	GrowSelection ( 3 ) ;
	Select( "ADD" , "CheekV" );
	Select( "SUBTRACT", "BrowOutV" );
	Interp( "InnerSquint" , 1 , 0.25, "SPIKE" );
	Select( "CloseLidLo" );
	Interp( "InnerSquint" , 1);
	SaveDelta( "BrowOutV-InnerSquint" );
	
	-- create BrowOutV-OuterSquint
	ResetState();
	SetState ( "OuterSquint" );
	Select( "ALL" );
	Add( "BrowOutV", 1.0 );
	Select( "InnerSquint-OuterSquint" );
	ShrinkSelection( 4 );
	Interp( "OuterSquint", 1 , .22, "SPIKE" );
	SaveDelta( "BrowOutV-OuterSquint" );
	
	-- create BrowOutV-InnerSquint-OuterSquint
	ResetState();
	SetState ( "InnerSquint-OuterSquint" );
	Select( "ALL" );
	Add( "BrowOutV", 1.0 );
	Select ("BrowOutV");
	ShrinkSelection( 1 );
	Interp( "BrowOutV-InnerSquint", 1 , .5, "SPIKE" );
	Select( "InnerSquint-OuterSquint" );
	ShrinkSelection( 4 );
	Interp( "InnerSquint-OuterSquint", 1 , .22, "SPIKE" );
	Select( "OuterSquint" );
	Interp( "InnerSquint-OuterSquint", .35 , 1, "SPIKE" );
	SaveDelta( "BrowOutV-InnerSquint-OuterSquint" );
	
	-- create RaiseBrowIn-InnerSquint
	ResetState();
	SetState ( "RaiseBrowIn" );
	Select( "ALL" );
	Add( "InnerSquint", 1.0 );
	Select( "InnerSquint");
	ShrinkSelection( 2 );
	Interp( "InnerSquint", 1 , .3, "SPIKE" );
	SaveDelta( "RaiseBrowIn-InnerSquint" );

	
	-- create CloseLidLo-CheekV
	ResetState();
	SetState ( "CloseLidLo" );
	Select( "ALL" );
	Add( "CheekV", 1.0 );
	Select( "CloseLidUp" );
	GrowSelection( 2 );
	Interp( "CloseLidLo", 1 , .2, "SPIKE" );
	SaveDelta( "CloseLidLo-CheekV" );
	
	-- create CloseLidUp-RaiseBrowIn
	ResetState();
	SetState ( "RaiseBrowIn" );
	Select( "CloseLidUp" );
	Interp( "CloseLidUp", 1.0 );
	SaveDelta( "CloseLidUp-RaiseBrowIn" );
	
	-- create CloseLidLo-OuterSquint
	ResetState();
	SetState ( "OuterSquint" );
	Select( "CloseLidUp" );
	Interp( "CloseLidUp", 1.0 );
	Select ( gSEL_eyeOuterCorner);
	GrowSelection ( 3 );
	Interp( "OuterSquint", .25 , .15, "SPIKE" );
	SaveDelta( "CloseLidUp-OuterSquint" );
	
	-- create CloseLidUp-InnerSquint
	ResetState();
	SetState ( "InnerSquint" );
	Select( "CloseLidUp" );
	Interp( "CloseLidUp", 1.0 );
	SaveDelta( "CloseLidUp-InnerSquint" );
	
	-- create CloseLidUp-InnerSquint-OuterSquint
	ResetState();
	SetState ( "InnerSquint-OuterSquint" );
	Select( "ALL" );
	Add( "CloseLidUp", 0.5 );
	Select( gSEL_eyes );
	GrowSelection ( 1);
	Select( "INTERSECT", "CloseLidUp" );
	Interp( "CloseLidUp", 1 );
	Select( gSEL_eyeOuterCorner );
	Interp( "InnerSquint-OuterSquint", 1, 0.5, "STRAIGHT" );
	SaveDelta( "CloseLidUp-InnerSquint-OuterSquint" );
	
	-- create InnerSquint-OuterSquint-RaiseBrowIn
	ResetState();
	SetState ( "InnerSquint-OuterSquint" );
	Select ( "ALL");
	Add( "RaiseBrowIn", 1 );
	SaveDelta( "InnerSquint-OuterSquint-RaiseBrowIn" );
	
	-- create CloseLidUp-InnerSquint-OuterSquint-RaiseBrowIn
	ResetState();
	SetState ( "InnerSquint-OuterSquint-RaiseBrowIn" );
	Select ( gSEL_eyes);
	GrowSelection(1);
	Interp( "CloseLidUp-InnerSquint-OuterSquint", 1.0, .25, "SPIKE" );
	SaveDelta( "CloseLidUp-InnerSquint-OuterSquint-RaiseBrowIn" );
	
	-- create BrowOutV-CloseLidUp
	ResetState();
	SetState ( "BrowOutV" );
	Select( gSEL_eyes );
	GrowSelection (2);
	Interp( "CloseLidUp", 1.0, 0.25, "SPIKE" );
	SaveDelta( "BrowOutV-CloseLidUp" );
	
	-- create BrowOutV-Frown
	ResetState();
	SetState( "BrowOutV" );
	Select( gSEL_centerLine);
	GrowSelection ( 2 );
	Interp( "Frown", 1.0, 1.3, "SPIKE" );
	SaveDelta( "BrowOutV-Frown" );
	
	-- create BrowOutV-CloseLidUp-RaiseBrowIn
	ResetState();
	SetState ( "BrowOutV-RaiseBrowIn" );
	Select( gSEL_eyes );
	GrowSelection (2);
	Interp( "CloseLidUp", 1.0, 0.1, "SPIKE" );
	SaveDelta( "BrowOutV-CloseLidUp-RaiseBrowIn" );
	
	-- create BrowOutV-CloseLidUp-Frown
	ResetState();
	SetState ( "BrowOutV-Frown" );
	Select( gSEL_eyes );
	GrowSelection (2);
	Interp( "CloseLidUp", 1.0, 0.1, "SPIKE" );
	Select( gSEL_eyeOuterCorner );
	GrowSelection ( 3);
	Interp( "BrowOutV-CloseLidUp", 1.0, 0.25, "SPIKE" );
	SaveDelta( "BrowOutV-CloseLidUp-Frown" );
	
	-- create InnerSquint-SneerNose
	ResetState();
	SetState ( "InnerSquint" );
	Select( "ALL" );
	Add( "SneerNose", 1.0 );
	Select( gSEL_eyes );
	GrowSelection( 1 );
	Interp( "InnerSquint" , 1.0, .25, "STRAIGHT" );
	Select( gSEL_eyeInnerCorner );
	GrowSelection( 3 );
	Interp( "InnerSquint" , 1.0, .25, "STRAIGHT" );	
	SaveDelta( "InnerSquint-SneerNose" );
	
	-- create InnerSquint-OuterSquint-SneerNose
	ResetState();
	SetState( "InnerSquint-OuterSquint" );
	Select( "ALL");
	Add( "SneerNose", 1.0 );
	Select( gSEL_eyes);
	GrowSelection ( 2 );
	Interp( "InnerSquint-OuterSquint", 1.0, 0.25, "STRAIGHT" );
	Select( gSEL_eyeInnerCorner );
	GrowSelection( 3 );
	Interp( "InnerSquint-SneerNose" , 1.0, .25, "STRAIGHT" );	
	SaveDelta( "InnerSquint-OuterSquint-SneerNose" );
	
	-- create CheekV-InnerSquint
	ResetState();
	SetState( "InnerSquint" );
	Select( "ALL");
	Add( "CheekV", 1.0 );
	Select( gSEL_eyes);
	GrowSelection ( 2 );
	Interp( "InnerSquint", 1.0, 0.2, "SPIKE" );
	SaveDelta( "CheekV-InnerSquint" );

end


--------------------------------------
--            lowerface             --
--------------------------------------

if lowerFaceSwitch then
	
	-- create control split PuckerLipUp from PuckerLips
	ResetState();
	SetState( "PuckerLips" );
	Select( gSEL_loLip);
	Interp( base, 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 1) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( base, 1.0, .75, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "PuckerLipUp" );
	
	-- create control split PuckerLipLo from PuckerLips
	ResetState();
	SetState( "PuckerLips" );
	Select( gSEL_upLip);
	Interp( base, 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( base, 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "PuckerLipLo" );
	
	-- create combination PuckerLips
	ResetState();
	SetState( "PuckerLips" );
	SaveDelta( "PuckerLipLo-PuckerLipUp" );
	
	-- create combination OpenJaw-PuckerLipUp
	ResetState();
	SetState( "OpenJaw-PuckerLips" );
	Select( gSEL_loLip);
	Interp( "OpenJaw", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "OpenJaw-PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "OpenJaw", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenJaw-PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "OpenJaw-PuckerLipUp" );
	
	-- create combination OpenJaw-PuckerLipLo
	ResetState();
	SetState( "OpenJaw-PuckerLips" );
	Select( gSEL_upLip);
	Interp( "OpenJaw", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "OpenJaw-PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "OpenJaw", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenJaw-PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "OpenJaw-PuckerLipLo" );
	
	-- create combination OpenJaw-PuckerLipLo-PuckerLipUp
	ResetState();
	SetState( "OpenJaw-PuckerLips" );
	SaveDelta( "OpenJaw-PuckerLipLo-PuckerLipUp" );
	
	-- create combination OpenLips-PuckerLipUp
	ResetState();
	SetState( "OpenLips-PuckerLips" );
	Select( gSEL_loLip);
	Interp( "OpenLips", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "OpenLips-PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "OpenLips", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenLips-PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "OpenLips-PuckerLipUp" );
	
	-- create combination OpenLips-PuckerLipLo
	ResetState();
	SetState( "OpenLips-PuckerLips" );
	Select( gSEL_upLip);
	Interp( "OpenLips", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "OpenLips-PuckerLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "OpenLips", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenLips-PuckerLips", 0.5, 1, "SPIKE");
	SaveDelta( "OpenLips-PuckerLipLo" );
	
	-- create combination split OpenLips-PuckerLipLo-PuckerLipUp
	ResetState();
	SetState( "OpenLips-PuckerLips" );
	SaveDelta( "OpenLips-PuckerLipLo-PuckerLipUp" );
		

	-- create combination OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp
	ResetState();
	SetState( "OpenLips-PuckerLipLo-PuckerLipUp" );
	Select( "ALL" );
	Add ( "OpenJaw", 1 );
	Select( "ALL" );
	Interp( "OpenJaw-PuckerLips", 0.5 );
	SaveDelta( "OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp" );
	

	
	-- create combination OpenJaw-OpenLips-PuckerLipLo
	ResetState();
	SetState( "OpenJaw-OpenLips" );
	Select( gSEL_loLip);
	Interp( "OpenJaw-PuckerLips", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "OpenJaw-OpenLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 4) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp", 0.5, 3, "SPIKE");
	SaveDelta( "OpenJaw-OpenLips-PuckerLipLo" );
	
	-- create combination OpenJaw-OpenLips-PuckerLipUp
	ResetState();
	SetState( "OpenJaw-OpenLips" );
	Select( gSEL_upLip);
	Interp( "OpenJaw-PuckerLips", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "OpenJaw-OpenLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 4) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "OpenJaw-OpenLips-PuckerLipLo-PuckerLipUp", 0.5, 3, "SPIKE");
	SaveDelta( "OpenJaw-OpenLips-PuckerLipUp" );
	
	-- create combo split Dimple-PuckerLipLo
	ResetState();
	SetState( "PuckerLipLo" );
	Select( "ALL" );
	Add( "Dimple", 0.25 );
	SaveDelta( "Dimple-PuckerLipLo" );
	
	-- create combo split Dimple-PuckerLipLo
	ResetState();
	SetState( "PuckerLipUp" );
	Select( "ALL" );
	Add( "Dimple", 0.25 );
	SaveDelta( "Dimple-PuckerLipUp" );
	
	-- create combo split Dimple-PuckerLipLo
	ResetState();
	SetState( "PuckerLips" );
	Select( "ALL" );
	Add( "Dimple", 0.33 );
	SaveDelta( "Dimple-PuckerLipLo-PuckerLipUp" );
	
	
	-- create combo split Dimple-OpenLips-PuckerLipLo-PuckerLipUp
	ResetState();
	SetState( "Dimple-OpenLips-PuckerLips" );
	SaveDelta( "Dimple-OpenLips-PuckerLipLo-PuckerLipUp" );
	
	
	-- create control split FunnelLipUp from FunnelLips 
	ResetState();
	SetState( "FunnelLips" );
	Select( gSEL_loLip);
	Interp( base, 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "FunnelLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( base, 1.0, .75, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "FunnelLips", 0.25, 1.5, "SPIKE");
	SaveDelta( "FunnelLipUp" );
	
	-- create control split FunnelLipLo from FunnelLips
	ResetState();
	SetState( "FunnelLips" );
	Select( gSEL_upLip);
	Interp( base, 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "FunnelLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 3) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( base, 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "FunnelLips", 0.25, 1, "SPIKE");
	SaveDelta( "FunnelLipLo" );
	
	-- create combination split FunnelLips
	ResetState();
	SetState( "FunnelLips" );
	SaveDelta( "FunnelLipLo-FunnelLipUp" );
	
	-- create combo split Dimple-FunnelLipLo
	ResetState();
	SetState( "Dimple-FunnelLips" );
	Select( gSEL_upLip);
	Interp( "Dimple", 1.0, 0.5, "SPIKE" );
	SaveDelta( "Dimple-FunnelLipLo" );
	
	-- create combo split Dimple-FunnelLipUp
	ResetState();
	SetState( "Dimple-FunnelLips" );
	Select( gSEL_loLip);
	Interp( "Dimple", 1.0, 0.5, "SPIKE" );
	SaveDelta( "Dimple-FunnelLipUp" );
	
	-- create combo split Dimple-FunnelLipLo-FunnelLipUp
	ResetState();
	SetState( "Dimple-FunnelLips" );
	SaveDelta( "Dimple-FunnelLipLo-FunnelLipUp" );
	
	-- create combination OpenJaw-FunnelLipUp
	ResetState();
	SetState( "FunnelLips-OpenJaw" );
	Select( gSEL_loLip);
	Interp( "OpenJaw", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_upLip);
	Interp( "FunnelLips-OpenJaw", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "OpenJaw", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "FunnelLips-OpenJaw", 0.5, 1, "SPIKE");
	SaveDelta( "OpenJaw-FunnelLipUp" );
	
	-- create combination OpenJaw-FunnelLipLo
	ResetState();
	SetState( "FunnelLips-OpenJaw" );
	Select( gSEL_upLip);
	Interp( "OpenJaw", 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "FunnelLips-OpenJaw", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "OpenJaw", 1.0, .5, "STRAIGHT");
	Select( gSEL_mouthCorner);
	Interp( "FunnelLips-OpenJaw", 0.5, 0.5, "SPIKE");
	SaveDelta( "OpenJaw-FunnelLipLo" );
	
	-- create combination OpenJaw-FunnelLipLo-FunnelLipUp
	ResetState();
	SetState( "FunnelLips-OpenJaw" );
	SaveDelta( "OpenJaw-FunnelLipLo-FunnelLipUp" );
	
	
	-- create control split PuffLipUp from PuffLips
	ResetState();
	SetState( "PuffLips" );
	Select( gSEL_loLip);
	Interp( base, 1.0);
	Select( gSEL_upLip);
	Interp( "PuffLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 1) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( base, 1.0, .75, "STRAIGHT");
	Select( gSEL_loLip);
	Interp( base, 1.0);
	SaveDelta( "PuffLipUp" );
	
	-- create control split PuffLipLo from PuffLips
	ResetState();
	SetState( "PuffLips" );
	Select( gSEL_upLip);
	Interp( base, 1.0, 2.0, "STRAIGHT" );
	Select( gSEL_loLip);
	Interp( "PuffLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( base, 1.0, .5, "STRAIGHT");
	Select( gSEL_upLip);
	Interp( base, 1.0);

	Select( "PressNose");
	Interp( base, 1.0);
	SaveDelta( "PuffLipLo" );

	-- create control split PuffLipLo from PuffLips
	SetState( "PuffLips" );
	SaveDelta( "PuffLipUp-PuffLipLo" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipLo" );
	Select( gSEL_loLip);
	Interp( "PuckerLips-PuffLips", 1.0);
	Select( gSEL_centerLine);
	GrowSelection( 2) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "PuckerLipLo", 1.0, .5, "STRAIGHT");
	SaveDelta( "PuckerLipLo-PuffLipLo" );	
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipLo" );
	Select( "ALL");
	Add ( "PuffLipUp", 1.0 );
	SaveDelta( "PuckerLipLo-PuffLipUp" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipUp" );
	Select( "ALL");
	Add ( "PuffLipLo", 1.0 );
	SaveDelta( "PuckerLipUp-PuffLipLo" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipLo-PuckerLipUp" );
	Select( "ALL");
	Add ( "PuffLipUp", 1.0 );
	Select( gSEL_centerLine);
	GrowSelection( 2 ) ;
	Select( "INTERSECT", gSEL_upLip);
	Interp( "PuckerLips-PuffLips", 1.0, 1.5, "SPIKE");
	Select( gSEL_centerLine);
	GrowSelection( 2 ) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "PuckerLipLo-PuckerLipUp", 1.0, 0.5, "DOME");
	SaveDelta( "PuckerLipLo-PuckerLipUp-PuffLipUp" );
	
	-- split PuckerLips-PuffLips into upper combination
	ResetState();
	SetState( "PuckerLipUp" );
	Select( gSEL_upLip);
	Interp( "PuckerLips-PuffLips", 1.0, 0.75, "STRAIGHT" );
	Select( gSEL_centerLine);
	GrowSelection( 1) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "PuckerLipUp", 1.0, .75, "STRAIGHT");
	Select( "ALL");
	Interp( "PuckerLips-PuffLips", .3 );
	Select( gSEL_loLip);
	Interp( "PuckerLipLo-PuckerLipUp-PuffLipUp", .5 );
	SaveDelta( "PuckerLipUp-PuffLipUp" );
	
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipLo-PuckerLipUp" );
	Select( "ALL");
	Add ( "PuffLipLo", 1.0 );
	Select( gSEL_centerLine);
	GrowSelection( 2 ) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "PuckerLips-PuffLips", 1.0, 1.5, "SPIKE");
	SaveDelta( "PuckerLipLo-PuckerLipUp-PuffLipLo" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipUp-PuffLipUp" );
	Select( "ALL");
	Add ( "PuffLipLo", 1.0 );
	SaveDelta( "PuckerLipUp-PuffLipUp-PuffLipLo" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLipLo-PuffLipLo" );
	Select( "ALL");
	Add ( "PuffLipUp", 1.0 );
	SaveDelta( "PuckerLipLo-PuffLipLo-PuffLipUp" );
	
	-- split PuckerLips-PuffLips into lower combination
	ResetState();
	SetState( "PuckerLips-PuffLips" );
	SaveDelta( "PuckerLipLo-PuckerLipUp-PuffLipLo-PuffLipUp" );
	
	-- rename combination PuckerLips-RaiseChin-SneerNose
	ResetState();
	SetState( "PuckerLips-RaiseChin-SneerNose" );
	SaveDelta( "PuckerLipUp-RaiseChin-SneerNose" );
	
	-- rename combination PuckerLips-RaiseChin
	ResetState();
	SetState( "PuckerLips-RaiseChin" );
	SaveDelta( "PuckerLipUp-RaiseChin" );
	
	-- OpenLips-OpenUpperLip
	ResetState();
	SetState( "OpenUpperLip" );
	Select( gSEL_centerLine);
	GrowSelection( 3 ) ;
	Select( "INTERSECT", gSEL_loLip);
	Interp( "OpenLips", 1.0, .15, "STRAIGHT");
	SaveDelta( "OpenLips-OpenUpperLip" );
	
	-- OpenLips-OpenLowerLip
	ResetState();
	SetState( "OpenLowerLip" );
	Select( gSEL_upLip);
	Interp( "OpenLips", 1.0, .25, "STRAIGHT");
	SaveDelta( "OpenLips-OpenLowerLip" );

	-- create combination OpenJaw-OpenLips-OpenUpperLip
	ResetState();
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_loLip);
	GrowSelection( 3) ;
	Select( "ADD", gSEL_throat);
	Interp( "OpenJaw-OpenLips", 1.0, 2.5, "DOME" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_upLip);
	GrowSelection( 3) ;	
	Interp( "OpenJaw-OpenLowerLip-OpenUpperLip", 1.0, 1.5, "DOME" );
	SaveDelta( "OpenJaw-OpenLips-OpenUpperLip" );
		
	-- create combination OpenJaw-OpenLips-OpenLowerLip
	ResetState();
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_upLip);
	GrowSelection( 3) ;
	Select( "ADD", "BlowNostril");
	Interp( "OpenJaw-OpenLips", 1.0, 2.5, "DOME" );
	SaveDelta( "OpenJaw-OpenLips-OpenLowerLip" );
	
	-- create OpenJaw-OpenUpperLip
	ResetState();
	SetState( "OpenJaw-OpenLips-OpenUpperLip" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_loLip);
	GrowSelection( 3) ;
	Interp( "OpenJaw", 1.0, 1.5, "SPIKE" );
	SaveDelta( "OpenJaw-OpenUpperLip" );

	-- create OpenJaw-OpenLowerLip
	ResetState();
	SetState( "OpenJaw-OpenLips-OpenLowerLip" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_upLip);
	GrowSelection( 3) ;
	Interp( "OpenJaw", 1.0, 2, "BELL" );
	Select( gSEL_centerLine);
	Select( "INTERSECT", gSEL_loLip);
	GrowSelection( 3 ) ;
	Interp( "OpenJaw-OpenLowerLip-OpenUpperLip", .75, .08, "bell" );
	GrowSelection( 2) ;
	Interp( "OpenJaw-OpenLowerLip-OpenUpperLip", 0.5 );
	SaveDelta( "OpenJaw-OpenLowerLip" );
	
	
	-- OpenUpperLip-Platysmus
	ResetState();
	SetState( "OpenUpperLip");
	Select ( "ALL" );
	Select ( "SUBTRACT", "OpenUpperLip" );
	Add ( "Platysmus", 1.0, 1.0, "Spike" );
	Select ( gSEL_mouthCorner );
	GrowSelection ( 2 ); 
	Interp ( "Platysmus", 1.0, 1.5, "STRAIGHT" ) ;
	Select( gSEL_upLip);
	Select ( "INTERSECT", gSEL_centerLine );
	Interp( "OpenUpperLip", 1, 2.5, "STRAIGHT");
	Select( gSEL_loLip);
	Interp ( "Platysmus", 1.0 ) ;
	SaveDelta( "OpenUpperLip-Platysmus" );
	
	-- OpenLowerLip-Platysmus
	ResetState();
	SetState( "OpenLowerLip");
	Select ( "ALL" );
	Add ( "Platysmus", 1);
	Select( gSEL_loLip);
	Interp( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1);
	Select ( gSEL_mouthCorner );
	Interp ( "Platysmus", 1.0, 2.0, "spike") ;
	SaveDelta( "OpenLowerLip-Platysmus" );
	
	-- OpenLowerLip-OpenUpperLip-Platysmus
	ResetState();
	SetState( "OpenUpperLip-Platysmus");
	Select( gSEL_loLip);
	Interp( "OpenLowerLip-Platysmus", 1);
	Select ( gSEL_mouthCorner );
	Interp( "OpenLowerLip-Platysmus", 1);
	GrowSelection ( 2 ); 
	Interp( "OpenLowerLip-Platysmus", 0.5);
	SaveDelta( "OpenLowerLip-OpenUpperLip-Platysmus" );
	
	-- OpenUpperLip-SmileFull
	ResetState();
	SetState( "SmileFull" );
	Select( gSEL_upLip);
	Add ( "OpenUpperLip", 1);
	Select ( gSEL_mouthCorner );
	Interp ( "SmileFull", 1.0, .5, "STRAIGHT" ) ;
	Select( gSEL_upLip);
	Select( "Add", "SneerNose");
	Interp( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1);
	Select( gSEL_loLip);
	GrowSelection( 2 );
	Interp( "SmileFull", 1);	
	SaveDelta( "OpenUpperLip-SmileFull" );
	
	-- OpenLowerLip-SmileFull
	ResetState();
	SetState( "SmileFull" );
	Select ( gSEL_loLip );
	Select( "INTERSECT", gSEL_centerLine);
	GrowSelection ( 1 ) ;
	Add ( "OpenLowerLip", 1, 1, "BELL");
	Select( gSEL_loLip);
	Interp( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", .25, 2, "SPIKE");
	Select( gSEL_upLip);
	Interp( "SmileFull", 1 );
	SaveDelta( "OpenLowerLip-SmileFull" )
	
	-- OpenLowerLip-OpenUpperLip-SmileFull
	ResetState();
	SetState( "OpenLowerLip-SmileFull" );
	Select ("All");
	Select( gSEL_upLip);
	Select( "Add", "SneerNose");
	Interp( "OpenUpperLip-SmileFull", 1 );
	SaveDelta( "OpenLowerLip-OpenUpperLip-SmileFull" );
	Select ( gSEL_loLip );
	Select( "INTERSECT", gSEL_centerLine);
	GrowSelection ( 4 ) ;
	Interp( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.33, 0.75, "DOME");
	Select ( gSEL_loLip );
	Select( "INTERSECT", gSEL_centerLine);
	Interp( "OpenLowerLip-OpenUpperLip-SmileFull", 1, 0.5, "SPIKE");
	Select( gSEL_mouthCorner);
	Interp( "OpenUpperLip-SmileFull", 0.33, 2, "BELL" );
	SaveDelta( "OpenLowerLip-OpenUpperLip-SmileFull" );
	
	
	-- OpenLips-OpenUpperLip-SmileFull
	ResetState();
	SetState( "OpenUpperLip-SmileFull" );
	Select( gSEL_loLip);
	Interp( "OpenLips-SmileFull", 1.0);
	Select( gSEL_mouthCorner);
	Interp( "OpenLips-SmileFull", 1.0);
	Select( gSEL_mouthCorner);
	Interp( "OpenUpperLip-SmileFull", 1.0, 1.0, "STRAIGHT");		
	SaveDelta( "OpenLips-OpenUpperLip-SmileFull" );
	
	-- OpenLips-OpenLowerLip-SmileFull
	ResetState();
	SetState( "OpenLowerLip-SmileFull" );
	Select( gSEL_upLip);
	Interp( "OpenLips-SmileFull", 1.0);
	Select( gSEL_mouthCorner);
	Interp( "OpenLips-SmileFull", 1.0);
	Select( gSEL_mouthCorner);
	Interp( "OpenLowerLip-SmileFull", 1.0, 1.0, "STRAIGHT");		
	SaveDelta( "OpenLips-OpenLowerLip-SmileFull" );
	
	
	-- SmileFull-Platysmus
	ResetState();
	SetState( "SmileFull" );
	Select( "ALL");
	Interp ("Platysmus", 0.5 );
	SaveDelta( "SmileFull-Platysmus" );
	
	-- Platysmus-RaiseChin
	ResetState();
	SetState( "Platysmus" );
	Select( "ALL");
	Add ("RaiseChin", 1 );
	Select ( gSEL_mouthCorner );
	GrowSelection ( 3 );
	Interp ( "Platysmus", 1.0, 0.6, "SPIKE" ) ;
	SaveDelta( "Platysmus-RaiseChin" );
	
	-- JutUpperLip-Platysmus-RaiseChin
	ResetState();
	SetState( "JutUpperLip-RaiseChin" );
	Select ("ALL");
	Add ("Platysmus", 1 );
	Select ( gSEL_mouthCorner );
	GrowSelection ( 2 );
	Interp ( "Platysmus", 1.0, 0.4, "SPIKE" ) ;
	Select ("ALL" );
	Interp ( "JutUpperLip-RaiseChin", .2 ) ;
	Interp ( "Platysmus", .2 ) ;
	SaveDelta( "JutUpperLip-Platysmus-RaiseChin" );
	
	-- OpenUpperLip-SmileFull-Platysmus
	ResetState();
	SetState( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull" );
	Select( gSEL_loLip);
	Interp ( "SmileFull-Platysmus", 1.0, 1.3, "SPIKE" ) ;
	SaveDelta( "OpenUpperLip-SmileFull-Platysmus" );
	
	-- OpenLowerLip-SmileFull-Platysmus
	ResetState();
	SetState( "SmileFull-Platysmus" );
	Select( gSEL_loLip);
	Interp ( "OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1.0, 1, "STRAIGHT" ) ;
	Select( gSEL_upLip);
	Interp ( "SmileFull-Platysmus", 1.0, 0.9, "STRAIGHT" ) ;
	Select ( gSEL_mouthCorner );
	GrowSelection ( 1 );
	Interp ( "SmileFull-Platysmus", 0.3, 0.1, "DOME" ) ;
	SaveDelta( "OpenLowerLip-SmileFull-Platysmus" );
	
	-- OpenJaw-Platysmus
	ResetState();
	SetState( "OpenJaw");
	Add ( "Platysmus" , 1.0 );
	Select ( gSEL_upLip );
	Select( "INTERSECT", gSEL_centerLine);
	Interp ( "OpenJaw", 0.75, 3.0, "DOME" ) ;
	SaveDelta( "OpenJaw-Platysmus" );
	
	-- OpenJaw-OpenLowerLip-Platysmus
	ResetState();
	SetState( "OpenJaw-Platysmus");
	Select ( gSEL_loLip );
	Select ( "Add", gSEL_throat );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1.0 )
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1.0, 1.5, "SPIKE" )
	Select ( gSEL_upLip );	
	GrowSelection ( 2 ) ;
	Interp ( "OpenJaw-Platysmus", 1.0)	
	SaveDelta( "OpenJaw-OpenLowerLip-Platysmus" );
	
	-- OpenJaw-SmileFull
	ResetState();
	SetState( "OpenJaw");
	Select ( "ALL" );
	Add ( "SmileFull" , 1.0 );
	SaveDelta( "OpenJaw-SmileFull" );
	
	-- OpenJaw-Platysmus-SmileFull
	ResetState();
	SetState( "SmileFull-Platysmus");
	Select ( "ALL" );
	Add ( "OpenJaw" , 1.0 );
	SaveDelta( "OpenJaw-Platysmus-SmileFull" );
	
	-- OpenJaw-OpenLowerLip-SmileFull
	ResetState();
	SetState( "OpenLowerLip-SmileFull");
	Select ( "ALL" );
	Add ( "OpenJaw" , 1.0 );
	Select ( gSEL_loLip );	
	Interp ( "OpenJaw-OpenLowerLip", 0.25, 0.5, "STRAIGHT" )
	SaveDelta( "OpenJaw-OpenLowerLip-SmileFull" );
	Select ( gSEL_centerLine);
	Select ( "SUBTRACT", gSEL_upLip );	
	Interp ( "OpenJaw-OpenLowerLip", 0.75, 3, "STRAIGHT" )
	Select ( gSEL_loLip);
	Select ( "ADD", gSEL_throat );	
	GrowSelection ( 1 );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip", 0.5, 1, "SPIKE");
	Select ( gSEL_upLip);
	Select ( "ADD", "SneerNose" );	
	Interp ( "OpenJaw-SmileFull" , 1.0);
	SaveDelta( "OpenJaw-OpenLowerLip-SmileFull" );
	
	-- OpenJaw-OpenUpperLip-SmileFull
	ResetState();	
	SetState( "OpenJaw-SmileFull" );
	Select ( gSEL_upLip);
	Select ( "ADD", "SneerNose" );	
	Interp ( "OpenUpperLip-SmileFull" , 1.0, 1.0, "SPIKE" );
	Select ( gSEL_loLip);
	GrowSelection ( 2 );
	Interp ( "OpenJaw-SmileFull", 1.0 )
	Select ( gSEL_mouthCorner);
	Interp ( "SmileFull", 1, 3, "SPIKE" )	
	Select ( gSEL_upLip);
	Select ( "ADD", "SneerNose" );	
	Interp ( "OpenUpperLip-SmileFull" , 1.0);
	SaveDelta( "OpenJaw-OpenUpperLip-SmileFull" );
	
	
	-- OpenJaw-OpenLowerLip-OpenUpperLip-SmileFull
	ResetState();
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull");
	Select ( gSEL_loLip );	
	Select ( "Add", gSEL_throat);
	Interp ( "OpenJaw-OpenLowerLip-SmileFull", 1, 3, "SPIKE" )	
	Select ( gSEL_mouthCorner);
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.5, 2, "STRAIGHT" )	;
	Interp ( "OpenJaw-OpenLowerLip-SmileFull", 0.5, 2, "STRAIGHT" )	;
	Select ( "CheekV");
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", .75, 1.75, "SPIKE" );	
	Select ( gSEL_loLip);
	Select ( "ADD", gSEL_throat );	
	GrowSelection ( 3 );
	Interp ( "OpenJaw-OpenLowerLip-SmileFull", 1);
	GrowSelection ( 1 );
	Interp ( "OpenJaw-OpenLowerLip-SmileFull", 0.5);
	Select ( gSEL_mouthCorner);
	Interp ( "OpenLowerLip-OpenUpperLip-SmileFull", 1, 2, "SPIKE" )	
	Select ( gSEL_upLip );
	Select ( "ADD", "SneerNose" );	
	Interp ( "OpenJaw-OpenUpperLip-SmileFull", 1.0, 0.5, "SPIKE" );
	Select ( "All" );
	Interp( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.35);
	SaveDelta( "OpenJaw-OpenLowerLip-OpenUpperLip-SmileFull" );
	
	
	-- OpenJaw-OpenLowerLip-SmileFull-Platysmus
	ResetState();
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull");
	Select ( gSEL_upLip );	
	Select ( "ADD", "SneerNose" );	
	Select ( "ADD", "CheekV" );	
	Select ( "ADD", gSEL_mouthCorner );			
	Interp ( "OpenJaw-Platysmus-SmileFull", 1.0 );
	GrowSelection ( 1 );
	Interp ( "OpenJaw-Platysmus-SmileFull", 0.5 );
	SaveDelta( "OpenJaw-OpenLowerLip-SmileFull-Platysmus" );

	
	-- OpenJaw-OpenUpperLip-Platysmus
	ResetState();
	Select ( "All" );
	SetState( "OpenJaw-OpenUpperLip");
	Select ( gSEL_throat);
	GrowSelection ( 2 );
	Interp ( "OpenJaw-Platysmus", 1.0, 3.0, "SPIKE");
	Select ( gSEL_centerLine);
	Select ( "SUBTRACT", gSEL_loLip );	
	Interp ( "OpenJaw-OpenUpperLip", 1.0, 0.5, "DOME");	
	SaveDelta( "OpenJaw-OpenUpperLip-Platysmus" );
	
	-- OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus
	ResetState();
	SetState( "OpenJaw-OpenLowerLip-Platysmus");
	Select ( gSEL_upLip );	
	Select ( "ADD", "SneerNose" );	
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip", 1.0 );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip", 1.0, 2.0, "STRAIGHT" );
	Select ( "All" );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.33);
	Select ( gSEL_mouthCorner);
	GrowSelection ( 2 );
	Interp ( "OpenJaw-Platysmus", 0.33, 1, "STRAIGHT");
	Select ( gSEL_throat);
	GrowSelection ( 2 );	
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 1, 2.75, "STRAIGHT" );	
	Select ( gSEL_mouthCorner);
	Select ( gSEL_upLip);	
	Interp ( "OpenJaw-OpenUpperLip-Platysmus", 0.5, 2.0, "DOME" );	
	SaveDelta( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus" );
	
	-- OpenJaw-OpenUpperLip-SmileFull-Platysmus
	ResetState();
	Select ( "All" );
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull");
	Select ( gSEL_loLip);
	Select ( "Add", gSEL_throat);
	Interp ( "OpenJaw-Platysmus-SmileFull", 1.0, 2.0, "STRAIGHT");	
	SaveDelta( "OpenJaw-OpenUpperLip-SmileFull-Platysmus" );
	

	
	-- create SlideJawL.
	ResetState();
	Select ( "All" );
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull");
	Select ( gSEL_jawEffect);
	Select ( "Add", gSEL_loLip);
	Select ( "Add", gSEL_jaw);	
	Translate( 0.4, 0, 0, 1.5, "BELL" ); 
	Select ( gSEL_skull );
	Interp ( "base", 1.0 );
	Select ( gSEL_upLip );
	Select ( "ADD", "SneerNose" );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.5, .2, "SPIKE");
	Select ( "SneerNose" );	
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", .8, .3, "SPIKE");	
	Select ( "All" );
	AddCorrected ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", -1.0);	
	SaveDelta( "SlideJawL" );
	
	-- create SlideJawR.
	ResetState();
	Select ( "All" );
	SetState( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull");
	Select ( gSEL_jawEffect);
	Select ( "Add", gSEL_loLip);
	Select ( "Add", gSEL_jaw);	
	Translate( -0.4, 0, 0, 1.5, "BELL" ); 
	Select ( gSEL_skull);
	Interp ( "base", 1.0);
	Select ( gSEL_upLip);
	Select ( "ADD", "SneerNose" );
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", 0.5, .2, "SPIKE");
	Select ( "SneerNose" );	
	Interp ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", .8, .3, "SPIKE");	
	Select ( "All" );
	AddCorrected ( "OpenJaw-OpenLowerLip-OpenUpperLip-Platysmus-SmileFull", -1.0);	
	SaveDelta( "SlideJawR" );

	-- create combination CheekV-PuckerLips-RaiseChin
	ResetState();
	SetState( "PuckerLips-RaiseChin" );
	Select ("ALL");
	Add ( "CheekV", 1.0 );
	if upperFaceSwitch then
		Select( gSEL_eyes );
		GrowSelection (4);
		Interp( "CheekV" , 1.0, 3, "SPIKE" );
	end
	SaveDelta( "CheekV-PuckerLipUp-RaiseChin" );
	
	-- CompressLips-JutUpperLip-RaiseChin
	ResetState();
	SetState( "JutUpperLip-RaiseChin" );
	Select ("ALL");
	Add ( "CompressLips", 0.75 );
	SaveDelta( "CompressLips-JutUpperLip-RaiseChin" );
	
	DeleteDelta( "PuckerLips" );
	DeleteDelta( "OpenJaw-PuckerLips" );
	DeleteDelta( "OpenLips-PuckerLips" );
	DeleteDelta( "Dimple-OpenLips-PuckerLips" );
	DeleteDelta( "FunnelLips" );
	DeleteDelta( "FunnelLips-OpenJaw" );
	DeleteDelta( "Dimple-FunnelLips" );
	DeleteDelta( "Dimple-PuckerLips" );
	DeleteDelta( "PuckerLips-PuffLips" );
	DeleteDelta( "PuckerLips-RaiseChin-SneerNose" );
	DeleteDelta( "PuckerLips-RaiseChin" );

end