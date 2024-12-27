{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 164.0, 100.0, 687.0, 729.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 6,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 751.0, 191.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 299.0, 276.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 50.0, 150.0, 145.0, 49.0 ],
									"text" : "spat5.osc.route /speakers/aed /speakers/directions/aed"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-39",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-40",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 176.0, 276.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-38", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"order" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"order" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 342.0, 201.0, 135.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p message filter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 475.0, 58.0, 194.0, 22.0 ],
					"text" : "-16.34 3.419398 3.266667"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 342.0, 24.0, 99.0, 22.0 ],
					"text" : "r ctrl-source-aed"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 32.0, 219.0, 70.0, 22.0 ],
					"text" : "mc.pack~ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "multichannelsignal", "" ],
					"patching_rect" : [ 32.0, 264.0, 252.0, 45.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"text" : "spat5.spat~ @inputs 1 @internals 8 @outputs 16 @initwith \"/panning/type hoa3d, /decoding/type passthrough\" @mc 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 32.0, 687.0, 54.0, 22.0 ],
					"text" : "mc.dac~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 6,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 119.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 60.0, 22.0 ],
									"text" : "loadmess"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"linecount" : 12,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 136.0, 270.0, 169.0 ],
									"text" : "/speakers/xyz -1.229 0.521 2.754 1.126 0.539 2.748 0.412 2.385 2.761 2.339 -0.196 2.69 -0.243 -1.406 2.64 -2.235 1.259 2.75 1.012 3.527 1.37 -1.757 3.547 1.435 -3.44 0.899 1.595 -3.471 -1.908 1.567 -1.116 -3.719 1 2.39 -3.733 1.035 3.432 -0.967 1.48 3.44 1.933 1.49 -0.62 3.534 0 2.329 3.526 0 3.422 0.499 0 3.442 -2.444 0 1.421 -3.77 0 -2.317 -3.723 0 -3.435 -0.514 0 -3.461 2.909 0 -0.375 3.712 -0.93 -3.614 3.253 -1.11 -3.629 -1.227 -1.115 -0.553 -3.747 -1.23 3.606 -1.861 -1.12 3.623 2.151 -1.11"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-50",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 365.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-25", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 382.0, 95.0, 95.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p speaker setup"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 342.0, 58.0, 131.0, 22.0 ],
					"text" : "/source/1/aed $1 $2 $3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 32.0, 24.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 32.0, 47.0, 144.0, 22.0 ],
					"text" : "/title \"Source 1\", /gain -30"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "live.button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 310.0, 95.0, 21.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "on" ],
							"parameter_longname" : "live.button[2]",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "live.button",
							"parameter_type" : 2
						}

					}
,
					"varname" : "live.button"
				}

			}
, 			{
				"box" : 				{
					"data" : 					{
						"/source/number" : 1,
						"/source/1/visible" : 1,
						"/source/1/editable" : 1,
						"/source/1/select" : 0,
						"/source/1/hidewhenmute" : 0,
						"/source/1/aed" : [ -16.323848724365234, 3.420000076293945, 3.266666650772095 ],
						"/source/1/constraint/circular" : 0,
						"/source/1/coordinates/visible" : 1,
						"/source/1/orientation/mode" : "default",
						"/source/1/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/source/1/orientation/visible" : 1,
						"/source/1/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/source/1/proportion" : 100.0,
						"/source/1/color" : [ 0.490196079015732, 1.0, 0.0, 1.0 ],
						"/source/1/image" : "none",
						"/source/1/label" : "1",
						"/source/1/label/visible" : 1,
						"/source/1/label/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/source/1/label/justification" : "centred",
						"/source/1/vumeter/visible" : 0,
						"/source/1/vumeter/level" : -60.0,
						"/source/1/aperture" : 80.0,
						"/source/1/aperture/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/source/1/radius/visible" : 0,
						"/source/1/history/visible" : 0,
						"/source/1/history/size" : 100,
						"/source/1/history/color" : [ 0.490196079015732, 1.0, 0.0, 1.0 ],
						"/source/1/history/thickness" : 1.0,
						"/speaker/number" : 28,
						"/speakers/aed" : [ -67.026847839355469, 64.140403747558594, 3.060456991195679, 64.420234680175781, 65.568717956542969, 3.018261194229126, 9.800909042358398, 48.761825561523438, 3.671660423278809, 94.789993286132812, 48.893215179443359, 3.570075273513794, -170.19439697265625, 61.610050201416016, 3.000914096832275, -60.606960296630859, 46.99114990234375, 3.760692119598389, 16.009740829467773, 20.473957061767578, 3.916729927062988, -26.351430892944336, 19.926998138427734, 4.21040153503418, -75.354042053222656, 24.160854339599609, 3.896899700164795, -118.7974853515625, 21.584867477416992, 4.2595534324646, -163.2965087890625, 14.442313194274902, 4.009541034698486, 147.371170043945312, 13.143108367919922, 4.551770687103271, 105.735710144042969, 22.54206657409668, 3.860584497451782, 60.667556762695312, 20.686916351318359, 4.217841625213623, -9.950627326965332, 0.0, 3.587973833084106, 33.445632934570312, 0.0, 4.225744724273682, 81.703536987304688, 0.0, 3.45819091796875, 125.376747131347656, 0.0, 4.221433162689209, 159.347412109375, 0.0, 4.028913021087646, -148.104034423828125, 0.0, 4.38511323928833, -98.5103759765625, 0.0, 3.473243474960327, -49.952663421630859, 0.0, 4.521150588989258, -5.768660545349121, -13.996872901916504, 3.845057725906372, -48.009284973144531, -12.859240531921387, 4.987494945526123, -108.680892944335938, -16.228193283081055, 3.989786386489868, -171.6046142578125, -17.990945816040039, 3.982300519943237, 117.29754638671875, -15.429760932922363, 4.2096266746521, 59.302104949951172, -14.758881568908691, 4.357181549072266 ],
						"/speaker/1/visible" : 1,
						"/speaker/1/editable" : 0,
						"/speaker/1/select" : 0,
						"/speaker/1/aed" : [ -67.026847839355469, 64.140403747558594, 3.060456991195679 ],
						"/speaker/1/constraint/circular" : 0,
						"/speaker/1/coordinates/visible" : 1,
						"/speaker/1/orientation/mode" : "default",
						"/speaker/1/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/1/orientation/visible" : 0,
						"/speaker/1/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/1/proportion" : 100.0,
						"/speaker/1/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/1/image" : "none",
						"/speaker/1/label" : "1",
						"/speaker/1/label/visible" : 1,
						"/speaker/1/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/1/label/justification" : "centred",
						"/speaker/1/vumeter/visible" : 0,
						"/speaker/1/vumeter/level" : -60.0,
						"/speaker/2/visible" : 1,
						"/speaker/2/editable" : 0,
						"/speaker/2/select" : 0,
						"/speaker/2/aed" : [ 64.420234680175781, 65.568717956542969, 3.018261194229126 ],
						"/speaker/2/constraint/circular" : 0,
						"/speaker/2/coordinates/visible" : 1,
						"/speaker/2/orientation/mode" : "default",
						"/speaker/2/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/2/orientation/visible" : 0,
						"/speaker/2/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/2/proportion" : 100.0,
						"/speaker/2/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/2/image" : "none",
						"/speaker/2/label" : "2",
						"/speaker/2/label/visible" : 1,
						"/speaker/2/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/2/label/justification" : "centred",
						"/speaker/2/vumeter/visible" : 0,
						"/speaker/2/vumeter/level" : -60.0,
						"/speaker/3/visible" : 1,
						"/speaker/3/editable" : 0,
						"/speaker/3/select" : 0,
						"/speaker/3/aed" : [ 9.800909042358398, 48.761825561523438, 3.671660423278809 ],
						"/speaker/3/constraint/circular" : 0,
						"/speaker/3/coordinates/visible" : 1,
						"/speaker/3/orientation/mode" : "default",
						"/speaker/3/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/3/orientation/visible" : 0,
						"/speaker/3/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/3/proportion" : 100.0,
						"/speaker/3/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/3/image" : "none",
						"/speaker/3/label" : "3",
						"/speaker/3/label/visible" : 1,
						"/speaker/3/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/3/label/justification" : "centred",
						"/speaker/3/vumeter/visible" : 0,
						"/speaker/3/vumeter/level" : -60.0,
						"/speaker/4/visible" : 1,
						"/speaker/4/editable" : 0,
						"/speaker/4/select" : 0,
						"/speaker/4/aed" : [ 94.789993286132812, 48.893215179443359, 3.570075273513794 ],
						"/speaker/4/constraint/circular" : 0,
						"/speaker/4/coordinates/visible" : 1,
						"/speaker/4/orientation/mode" : "default",
						"/speaker/4/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/4/orientation/visible" : 0,
						"/speaker/4/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/4/proportion" : 100.0,
						"/speaker/4/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/4/image" : "none",
						"/speaker/4/label" : "4",
						"/speaker/4/label/visible" : 1,
						"/speaker/4/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/4/label/justification" : "centred",
						"/speaker/4/vumeter/visible" : 0,
						"/speaker/4/vumeter/level" : -60.0,
						"/speaker/5/visible" : 1,
						"/speaker/5/editable" : 0,
						"/speaker/5/select" : 0,
						"/speaker/5/aed" : [ -170.19439697265625, 61.610050201416016, 3.000914096832275 ],
						"/speaker/5/constraint/circular" : 0,
						"/speaker/5/coordinates/visible" : 1,
						"/speaker/5/orientation/mode" : "default",
						"/speaker/5/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/5/orientation/visible" : 0,
						"/speaker/5/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/5/proportion" : 100.0,
						"/speaker/5/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/5/image" : "none",
						"/speaker/5/label" : "5",
						"/speaker/5/label/visible" : 1,
						"/speaker/5/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/5/label/justification" : "centred",
						"/speaker/5/vumeter/visible" : 0,
						"/speaker/5/vumeter/level" : -60.0,
						"/speaker/6/visible" : 1,
						"/speaker/6/editable" : 0,
						"/speaker/6/select" : 0,
						"/speaker/6/aed" : [ -60.606960296630859, 46.99114990234375, 3.760692119598389 ],
						"/speaker/6/constraint/circular" : 0,
						"/speaker/6/coordinates/visible" : 1,
						"/speaker/6/orientation/mode" : "default",
						"/speaker/6/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/6/orientation/visible" : 0,
						"/speaker/6/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/6/proportion" : 100.0,
						"/speaker/6/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/6/image" : "none",
						"/speaker/6/label" : "6",
						"/speaker/6/label/visible" : 1,
						"/speaker/6/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/6/label/justification" : "centred",
						"/speaker/6/vumeter/visible" : 0,
						"/speaker/6/vumeter/level" : -60.0,
						"/speaker/7/visible" : 1,
						"/speaker/7/editable" : 0,
						"/speaker/7/select" : 0,
						"/speaker/7/aed" : [ 16.009740829467773, 20.473957061767578, 3.916729927062988 ],
						"/speaker/7/constraint/circular" : 0,
						"/speaker/7/coordinates/visible" : 1,
						"/speaker/7/orientation/mode" : "default",
						"/speaker/7/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/7/orientation/visible" : 0,
						"/speaker/7/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/7/proportion" : 100.0,
						"/speaker/7/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/7/image" : "none",
						"/speaker/7/label" : "7",
						"/speaker/7/label/visible" : 1,
						"/speaker/7/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/7/label/justification" : "centred",
						"/speaker/7/vumeter/visible" : 0,
						"/speaker/7/vumeter/level" : -60.0,
						"/speaker/8/visible" : 1,
						"/speaker/8/editable" : 0,
						"/speaker/8/select" : 0,
						"/speaker/8/aed" : [ -26.351430892944336, 19.926998138427734, 4.21040153503418 ],
						"/speaker/8/constraint/circular" : 0,
						"/speaker/8/coordinates/visible" : 1,
						"/speaker/8/orientation/mode" : "default",
						"/speaker/8/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/8/orientation/visible" : 0,
						"/speaker/8/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/8/proportion" : 100.0,
						"/speaker/8/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/8/image" : "none",
						"/speaker/8/label" : "8",
						"/speaker/8/label/visible" : 1,
						"/speaker/8/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/8/label/justification" : "centred",
						"/speaker/8/vumeter/visible" : 0,
						"/speaker/8/vumeter/level" : -60.0,
						"/speaker/9/visible" : 1,
						"/speaker/9/editable" : 0,
						"/speaker/9/select" : 0,
						"/speaker/9/aed" : [ -75.354042053222656, 24.160854339599609, 3.896899700164795 ],
						"/speaker/9/constraint/circular" : 0,
						"/speaker/9/coordinates/visible" : 1,
						"/speaker/9/orientation/mode" : "default",
						"/speaker/9/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/9/orientation/visible" : 0,
						"/speaker/9/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/9/proportion" : 100.0,
						"/speaker/9/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/9/image" : "none",
						"/speaker/9/label" : "9",
						"/speaker/9/label/visible" : 1,
						"/speaker/9/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/9/label/justification" : "centred",
						"/speaker/9/vumeter/visible" : 0,
						"/speaker/9/vumeter/level" : -60.0,
						"/speaker/10/visible" : 1,
						"/speaker/10/editable" : 0,
						"/speaker/10/select" : 0,
						"/speaker/10/aed" : [ -118.7974853515625, 21.584867477416992, 4.2595534324646 ],
						"/speaker/10/constraint/circular" : 0,
						"/speaker/10/coordinates/visible" : 1,
						"/speaker/10/orientation/mode" : "default",
						"/speaker/10/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/10/orientation/visible" : 0,
						"/speaker/10/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/10/proportion" : 100.0,
						"/speaker/10/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/10/image" : "none",
						"/speaker/10/label" : "10",
						"/speaker/10/label/visible" : 1,
						"/speaker/10/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/10/label/justification" : "centred",
						"/speaker/10/vumeter/visible" : 0,
						"/speaker/10/vumeter/level" : -60.0,
						"/speaker/11/visible" : 1,
						"/speaker/11/editable" : 0,
						"/speaker/11/select" : 0,
						"/speaker/11/aed" : [ -163.2965087890625, 14.442313194274902, 4.009541034698486 ],
						"/speaker/11/constraint/circular" : 0,
						"/speaker/11/coordinates/visible" : 1,
						"/speaker/11/orientation/mode" : "default",
						"/speaker/11/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/11/orientation/visible" : 0,
						"/speaker/11/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/11/proportion" : 100.0,
						"/speaker/11/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/11/image" : "none",
						"/speaker/11/label" : "11",
						"/speaker/11/label/visible" : 1,
						"/speaker/11/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/11/label/justification" : "centred",
						"/speaker/11/vumeter/visible" : 0,
						"/speaker/11/vumeter/level" : -60.0,
						"/speaker/12/visible" : 1,
						"/speaker/12/editable" : 0,
						"/speaker/12/select" : 0,
						"/speaker/12/aed" : [ 147.371170043945312, 13.143108367919922, 4.551770687103271 ],
						"/speaker/12/constraint/circular" : 0,
						"/speaker/12/coordinates/visible" : 1,
						"/speaker/12/orientation/mode" : "default",
						"/speaker/12/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/12/orientation/visible" : 0,
						"/speaker/12/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/12/proportion" : 100.0,
						"/speaker/12/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/12/image" : "none",
						"/speaker/12/label" : "12",
						"/speaker/12/label/visible" : 1,
						"/speaker/12/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/12/label/justification" : "centred",
						"/speaker/12/vumeter/visible" : 0,
						"/speaker/12/vumeter/level" : -60.0,
						"/speaker/13/visible" : 1,
						"/speaker/13/editable" : 0,
						"/speaker/13/select" : 0,
						"/speaker/13/aed" : [ 105.735710144042969, 22.54206657409668, 3.860584497451782 ],
						"/speaker/13/constraint/circular" : 0,
						"/speaker/13/coordinates/visible" : 1,
						"/speaker/13/orientation/mode" : "default",
						"/speaker/13/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/13/orientation/visible" : 0,
						"/speaker/13/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/13/proportion" : 100.0,
						"/speaker/13/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/13/image" : "none",
						"/speaker/13/label" : "13",
						"/speaker/13/label/visible" : 1,
						"/speaker/13/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/13/label/justification" : "centred",
						"/speaker/13/vumeter/visible" : 0,
						"/speaker/13/vumeter/level" : -60.0,
						"/speaker/14/visible" : 1,
						"/speaker/14/editable" : 0,
						"/speaker/14/select" : 0,
						"/speaker/14/aed" : [ 60.667556762695312, 20.686916351318359, 4.217841625213623 ],
						"/speaker/14/constraint/circular" : 0,
						"/speaker/14/coordinates/visible" : 1,
						"/speaker/14/orientation/mode" : "default",
						"/speaker/14/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/14/orientation/visible" : 0,
						"/speaker/14/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/14/proportion" : 100.0,
						"/speaker/14/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/14/image" : "none",
						"/speaker/14/label" : "14",
						"/speaker/14/label/visible" : 1,
						"/speaker/14/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/14/label/justification" : "centred",
						"/speaker/14/vumeter/visible" : 0,
						"/speaker/14/vumeter/level" : -60.0,
						"/speaker/15/visible" : 1,
						"/speaker/15/editable" : 0,
						"/speaker/15/select" : 0,
						"/speaker/15/aed" : [ -9.950627326965332, 0.0, 3.587973833084106 ],
						"/speaker/15/constraint/circular" : 0,
						"/speaker/15/coordinates/visible" : 1,
						"/speaker/15/orientation/mode" : "default",
						"/speaker/15/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/15/orientation/visible" : 0,
						"/speaker/15/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/15/proportion" : 100.0,
						"/speaker/15/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/15/image" : "none",
						"/speaker/15/label" : "15",
						"/speaker/15/label/visible" : 1,
						"/speaker/15/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/15/label/justification" : "centred",
						"/speaker/15/vumeter/visible" : 0,
						"/speaker/15/vumeter/level" : -60.0,
						"/speaker/16/visible" : 1,
						"/speaker/16/editable" : 0,
						"/speaker/16/select" : 0,
						"/speaker/16/aed" : [ 33.445632934570312, 0.0, 4.225744724273682 ],
						"/speaker/16/constraint/circular" : 0,
						"/speaker/16/coordinates/visible" : 1,
						"/speaker/16/orientation/mode" : "default",
						"/speaker/16/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/16/orientation/visible" : 0,
						"/speaker/16/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/16/proportion" : 100.0,
						"/speaker/16/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/16/image" : "none",
						"/speaker/16/label" : "16",
						"/speaker/16/label/visible" : 1,
						"/speaker/16/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/16/label/justification" : "centred",
						"/speaker/16/vumeter/visible" : 0,
						"/speaker/16/vumeter/level" : -60.0,
						"/speaker/17/visible" : 1,
						"/speaker/17/editable" : 0,
						"/speaker/17/select" : 0,
						"/speaker/17/aed" : [ 81.703536987304688, 0.0, 3.45819091796875 ],
						"/speaker/17/constraint/circular" : 0,
						"/speaker/17/coordinates/visible" : 1,
						"/speaker/17/orientation/mode" : "default",
						"/speaker/17/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/17/orientation/visible" : 0,
						"/speaker/17/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/17/proportion" : 100.0,
						"/speaker/17/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/17/image" : "none",
						"/speaker/17/label" : "17",
						"/speaker/17/label/visible" : 1,
						"/speaker/17/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/17/label/justification" : "centred",
						"/speaker/17/vumeter/visible" : 0,
						"/speaker/17/vumeter/level" : -60.0,
						"/speaker/18/visible" : 1,
						"/speaker/18/editable" : 0,
						"/speaker/18/select" : 0,
						"/speaker/18/aed" : [ 125.376747131347656, 0.0, 4.221433162689209 ],
						"/speaker/18/constraint/circular" : 0,
						"/speaker/18/coordinates/visible" : 1,
						"/speaker/18/orientation/mode" : "default",
						"/speaker/18/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/18/orientation/visible" : 0,
						"/speaker/18/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/18/proportion" : 100.0,
						"/speaker/18/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/18/image" : "none",
						"/speaker/18/label" : "18",
						"/speaker/18/label/visible" : 1,
						"/speaker/18/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/18/label/justification" : "centred",
						"/speaker/18/vumeter/visible" : 0,
						"/speaker/18/vumeter/level" : -60.0,
						"/speaker/19/visible" : 1,
						"/speaker/19/editable" : 0,
						"/speaker/19/select" : 0,
						"/speaker/19/aed" : [ 159.347412109375, 0.0, 4.028913021087646 ],
						"/speaker/19/constraint/circular" : 0,
						"/speaker/19/coordinates/visible" : 1,
						"/speaker/19/orientation/mode" : "default",
						"/speaker/19/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/19/orientation/visible" : 0,
						"/speaker/19/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/19/proportion" : 100.0,
						"/speaker/19/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/19/image" : "none",
						"/speaker/19/label" : "19",
						"/speaker/19/label/visible" : 1,
						"/speaker/19/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/19/label/justification" : "centred",
						"/speaker/19/vumeter/visible" : 0,
						"/speaker/19/vumeter/level" : -60.0,
						"/speaker/20/visible" : 1,
						"/speaker/20/editable" : 0,
						"/speaker/20/select" : 0,
						"/speaker/20/aed" : [ -148.104034423828125, 0.0, 4.38511323928833 ],
						"/speaker/20/constraint/circular" : 0,
						"/speaker/20/coordinates/visible" : 1,
						"/speaker/20/orientation/mode" : "default",
						"/speaker/20/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/20/orientation/visible" : 0,
						"/speaker/20/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/20/proportion" : 100.0,
						"/speaker/20/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/20/image" : "none",
						"/speaker/20/label" : "20",
						"/speaker/20/label/visible" : 1,
						"/speaker/20/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/20/label/justification" : "centred",
						"/speaker/20/vumeter/visible" : 0,
						"/speaker/20/vumeter/level" : -60.0,
						"/speaker/21/visible" : 1,
						"/speaker/21/editable" : 0,
						"/speaker/21/select" : 0,
						"/speaker/21/aed" : [ -98.5103759765625, 0.0, 3.473243474960327 ],
						"/speaker/21/constraint/circular" : 0,
						"/speaker/21/coordinates/visible" : 1,
						"/speaker/21/orientation/mode" : "default",
						"/speaker/21/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/21/orientation/visible" : 0,
						"/speaker/21/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/21/proportion" : 100.0,
						"/speaker/21/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/21/image" : "none",
						"/speaker/21/label" : "21",
						"/speaker/21/label/visible" : 1,
						"/speaker/21/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/21/label/justification" : "centred",
						"/speaker/21/vumeter/visible" : 0,
						"/speaker/21/vumeter/level" : -60.0,
						"/speaker/22/visible" : 1,
						"/speaker/22/editable" : 0,
						"/speaker/22/select" : 0,
						"/speaker/22/aed" : [ -49.952663421630859, 0.0, 4.521150588989258 ],
						"/speaker/22/constraint/circular" : 0,
						"/speaker/22/coordinates/visible" : 1,
						"/speaker/22/orientation/mode" : "default",
						"/speaker/22/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/22/orientation/visible" : 0,
						"/speaker/22/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/22/proportion" : 100.0,
						"/speaker/22/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/22/image" : "none",
						"/speaker/22/label" : "22",
						"/speaker/22/label/visible" : 1,
						"/speaker/22/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/22/label/justification" : "centred",
						"/speaker/22/vumeter/visible" : 0,
						"/speaker/22/vumeter/level" : -60.0,
						"/speaker/23/visible" : 1,
						"/speaker/23/editable" : 0,
						"/speaker/23/select" : 0,
						"/speaker/23/aed" : [ -5.768660545349121, -13.996872901916504, 3.845057725906372 ],
						"/speaker/23/constraint/circular" : 0,
						"/speaker/23/coordinates/visible" : 1,
						"/speaker/23/orientation/mode" : "default",
						"/speaker/23/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/23/orientation/visible" : 0,
						"/speaker/23/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/23/proportion" : 100.0,
						"/speaker/23/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/23/image" : "none",
						"/speaker/23/label" : "23",
						"/speaker/23/label/visible" : 1,
						"/speaker/23/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/23/label/justification" : "centred",
						"/speaker/23/vumeter/visible" : 0,
						"/speaker/23/vumeter/level" : -60.0,
						"/speaker/24/visible" : 1,
						"/speaker/24/editable" : 0,
						"/speaker/24/select" : 0,
						"/speaker/24/aed" : [ -48.009284973144531, -12.859240531921387, 4.987494945526123 ],
						"/speaker/24/constraint/circular" : 0,
						"/speaker/24/coordinates/visible" : 1,
						"/speaker/24/orientation/mode" : "default",
						"/speaker/24/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/24/orientation/visible" : 0,
						"/speaker/24/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/24/proportion" : 100.0,
						"/speaker/24/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/24/image" : "none",
						"/speaker/24/label" : "24",
						"/speaker/24/label/visible" : 1,
						"/speaker/24/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/24/label/justification" : "centred",
						"/speaker/24/vumeter/visible" : 0,
						"/speaker/24/vumeter/level" : -60.0,
						"/speaker/25/visible" : 1,
						"/speaker/25/editable" : 0,
						"/speaker/25/select" : 0,
						"/speaker/25/aed" : [ -108.680892944335938, -16.228193283081055, 3.989786386489868 ],
						"/speaker/25/constraint/circular" : 0,
						"/speaker/25/coordinates/visible" : 1,
						"/speaker/25/orientation/mode" : "default",
						"/speaker/25/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/25/orientation/visible" : 0,
						"/speaker/25/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/25/proportion" : 100.0,
						"/speaker/25/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/25/image" : "none",
						"/speaker/25/label" : "25",
						"/speaker/25/label/visible" : 1,
						"/speaker/25/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/25/label/justification" : "centred",
						"/speaker/25/vumeter/visible" : 0,
						"/speaker/25/vumeter/level" : -60.0,
						"/speaker/26/visible" : 1,
						"/speaker/26/editable" : 0,
						"/speaker/26/select" : 0,
						"/speaker/26/aed" : [ -171.6046142578125, -17.990945816040039, 3.982300519943237 ],
						"/speaker/26/constraint/circular" : 0,
						"/speaker/26/coordinates/visible" : 1,
						"/speaker/26/orientation/mode" : "default",
						"/speaker/26/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/26/orientation/visible" : 0,
						"/speaker/26/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/26/proportion" : 100.0,
						"/speaker/26/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/26/image" : "none",
						"/speaker/26/label" : "26",
						"/speaker/26/label/visible" : 1,
						"/speaker/26/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/26/label/justification" : "centred",
						"/speaker/26/vumeter/visible" : 0,
						"/speaker/26/vumeter/level" : -60.0,
						"/speaker/27/visible" : 1,
						"/speaker/27/editable" : 0,
						"/speaker/27/select" : 0,
						"/speaker/27/aed" : [ 117.29754638671875, -15.429760932922363, 4.2096266746521 ],
						"/speaker/27/constraint/circular" : 0,
						"/speaker/27/coordinates/visible" : 1,
						"/speaker/27/orientation/mode" : "default",
						"/speaker/27/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/27/orientation/visible" : 0,
						"/speaker/27/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/27/proportion" : 100.0,
						"/speaker/27/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/27/image" : "none",
						"/speaker/27/label" : "27",
						"/speaker/27/label/visible" : 1,
						"/speaker/27/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/27/label/justification" : "centred",
						"/speaker/27/vumeter/visible" : 0,
						"/speaker/27/vumeter/level" : -60.0,
						"/speaker/28/visible" : 1,
						"/speaker/28/editable" : 0,
						"/speaker/28/select" : 0,
						"/speaker/28/aed" : [ 59.302104949951172, -14.758881568908691, 4.357181549072266 ],
						"/speaker/28/constraint/circular" : 0,
						"/speaker/28/coordinates/visible" : 1,
						"/speaker/28/orientation/mode" : "default",
						"/speaker/28/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/28/orientation/visible" : 0,
						"/speaker/28/lookat/xyz" : [ 0.0, 0.0, 0.0 ],
						"/speaker/28/proportion" : 100.0,
						"/speaker/28/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speaker/28/image" : "none",
						"/speaker/28/label" : "28",
						"/speaker/28/label/visible" : 1,
						"/speaker/28/label/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/speaker/28/label/justification" : "centred",
						"/speaker/28/vumeter/visible" : 0,
						"/speaker/28/vumeter/level" : -60.0,
						"/stereo/number" : 0,
						"/subwoofer/number" : 0,
						"/listener/visible" : 1,
						"/listener/editable" : 0,
						"/listener/select" : 0,
						"/listener/aed" : [ 90.0, 0.0, 0.0 ],
						"/listener/constraint/circular" : 0,
						"/listener/coordinates/visible" : 1,
						"/listener/orientation/mode" : "default",
						"/listener/orientation" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/listener/orientation/visible" : 0,
						"/listener/lookat/xyz" : [ 0.0, 1.0, 0.0 ],
						"/listener/proportion" : 100.0,
						"/listener/color" : [ 0.0, 0.0, 0.0, 0.0 ],
						"/listener/headphones/visible" : 0,
						"/multi/number" : 0,
						"/microphone/number" : 0,
						"/eigenmike/number" : 0,
						"/format" : "aed",
						"/background/color" : [ 0.709803938865662, 0.709803938865662, 0.709803938865662, 1.0 ],
						"/backgroundimage/file" : "none",
						"/backgroundimage/visible" : 1,
						"/backgroundimage/opacity" : 100.0,
						"/backgroundimage/scale" : 100.0,
						"/backgroundimage/angle" : 0.0,
						"/backgroundimage/offset/xy" : [ 0.0, 0.0 ],
						"/backgroundimage/quality" : "medium",
						"/display/zoom" : 44.312393188476562,
						"/display/offset/xyz" : [ 0.0, 0.0, 0.0 ],
						"/display/zoom/lock" : 0,
						"/axis/visible" : 1,
						"/axis/label/visible" : 1,
						"/axis/origin/visible" : 1,
						"/axis/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/axis/thickness" : 2.0,
						"/grid/visible" : 1,
						"/grid/mode" : "circular",
						"/grid/spacing" : 1.0,
						"/grid/line/number" : 30,
						"/grid/angulardivisions/number" : 8,
						"/grid/angulardivisions/visible" : 1,
						"/grid/dashed" : 0,
						"/grid/color" : [ 1.0, 1.0, 1.0, 0.501960813999176 ],
						"/grid/thickness" : 1.0,
						"/grid/unitcircle/visible" : 1,
						"/grid/unitcircle/color" : [ 0.501960813999176, 0.501960813999176, 0.501960813999176, 0.239215686917305 ],
						"/grid/unitcircle/radius" : 1.0,
						"/legend/visible" : 1,
						"/legend/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/legend/unit" : "meters",
						"/emphasis/source" : 1,
						"/emphasis/stereo" : 1,
						"/emphasis/speaker" : 0,
						"/emphasis/microphone" : 0,
						"/ruler/visible" : 0,
						"/ruler/color" : [ 1.0, 1.0, 1.0, 1.0 ],
						"/ruler/unit" : "meters",
						"/hoa/number" : 0,
						"/anchor/number" : 0,
						"/phone/number" : 0,
						"/area/number" : 0,
						"/path/number" : 0,
						"/speakerhull/visible" : 0,
						"/speakerhull/color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"/speakerhull/fill" : 0,
						"/speakerhull/fill/color" : [ 0.0, 0.0, 0.0, 0.298039227724075 ],
						"/settings/visible" : 0,
						"/settings/editable" : 1,
						"/layout" : "single",
						"/source/1/pres" : 59.299999237060547,
						"/source/1/warm" : 30.0,
						"/source/1/bril" : 30.0,
						"/source/1/prer" : 48.0,
						"/source/1/revp" : 34.0,
						"/source/1/env" : 24.0,
						"/source/1/axis/params" : [ 0.000000000000003, 0.000000000000002, 0.000000000000002, 0.000000000000002, 177.0, 5657.0 ],
						"/source/1/axis/mute" : 0,
						"/source/1/axis/bypass" : 0,
						"/source/1/omni/params" : [ 0.000000000000003, 1.700000047683716, 0.000000000000002, -3.799999952316284, 177.0, 5657.0 ],
						"/source/1/omni/mute" : 0,
						"/source/1/omni/bypass" : 0,
						"/source/1/doppler" : 0,
						"/source/1/air" : 1,
						"/source/1/air/freq" : 10000.0,
						"/source/1/drop" : 6.0,
						"/source/1/drop/mode" : "log2",
						"/source/1/radius" : 1.0,
						"/source/1/room/destination" : 1,
						"/source/1/mute" : 0,
						"/source/1/solo" : 0,
						"/source/1/direct/mute" : 0,
						"/source/1/early/mute" : 0,
						"/source/1/cluster/mute" : 0,
						"/source/1/reverb/mute" : 0,
						"/source/1/early/width" : 30.0,
						"/source/1/early/shape" : 50.0,
						"/source/1/spread" : 0.0,
						"/source/1/panrev" : 0.0,
						"/source/1/lock" : 0,
						"/room/number" : 1,
						"/room/1/reverberance" : 36.400001525878906,
						"/room/1/heaviness" : 25.0,
						"/room/1/liveness" : 35.0,
						"/room/1/reverb/fl" : 250.0,
						"/room/1/reverb/fh" : 8000.0,
						"/room/1/reverb/air" : 1,
						"/room/1/reverb/air/freq" : 10000.0,
						"/room/1/reverb/infinite" : 0,
						"/room/1/reverb/roomsize" : 540.0,
						"/room/1/early/min" : 15.909999847412109,
						"/room/1/early/max" : 20.639999389648438,
						"/room/1/early/distr" : 0.600000023841858,
						"/room/1/cluster/min" : 22.079999923706055,
						"/room/1/cluster/max" : 38.959999084472656,
						"/room/1/cluster/distr" : 0.699999988079071,
						"/room/1/reverb/min" : 35.400001525878906,
						"/room/1/reverb/density" : 0.479999989271164,
						"/room/1/reverb/roomoffset" : 0.000000000000002,
						"/room/1/reverb/panrev" : 0.0,
						"/room/1/reverb/panrev/aed" : [ 0.0, 0.000000000000002, 1.0 ],
						"/room/1/mute" : 0,
						"/internals" : 8,
						"/viewer/visible" : 1,
						"/viewer/only" : 0,
						"/style" : "factors",
						"/usurp" : 0,
						"/window/title" : "Spat Oper",
						"/window/visible" : 0,
						"/window/moveable" : 1,
						"/window/resizable" : 1,
						"/window/enable" : 1,
						"/window/bounds" : [ 231, 290, 1050, 440 ],
						"/window/background/color" : [ 0.82745099067688, 0.82745099067688, 0.82745099067688, 1.0 ],
						"/window/opaque" : 1,
						"/window/titlebar" : 1,
						"/window/fullscreen" : 0,
						"/window/minimise" : 0,
						"/window/scale" : 100.0,
						"/window/rendering/engine" : "",
						"/window/rendering/fps/visible" : 0,
						"/window/floating" : 0,
						"/window/hidesondeactivate" : 0,
						"/window/buttons/close" : 1,
						"/window/buttons/minimise" : 1,
						"/window/buttons/maximise" : 1,
						"embed" : 1
					}
,
					"id" : "obj-8",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 342.0, 142.0, 135.0, 49.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"text" : "spat5.oper @initwith \"/source/number 1, /speaker/number 28\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"lastchannelcount" : 28,
					"maxclass" : "mc.live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "multichannelsignal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 32.0, 550.0, 202.0, 112.0 ],
					"relative" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "mc.live.gain~[1]",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "speakers",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"varname" : "mc.live.gain~[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "multichannelsignal", "" ],
					"patching_rect" : [ 32.0, 472.0, 202.0, 49.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"text" : "spat5.hoa.decoder~ @order 4 @dimension 3 @outputs 28 @mc 1 @initwith \"/powercompensation 1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"lastchannelcount" : 16,
					"maxclass" : "mc.live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "multichannelsignal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 32.0, 326.0, 116.0, 112.0 ],
					"relative" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "mc.live.gain~",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "hoa stream",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"varname" : "mc.live.gain~"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "spat5.input~.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 32.0, 77.0, 220.0, 120.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"order" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"order" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-41", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-18" : [ "live.button[2]", "live.button", 0 ],
			"obj-1::obj-1" : [ "live.menu", "live.menu", 0 ],
			"obj-1::obj-12::obj-4" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-182" : [ "spat_input_mute_button", "spat_input_mute_button", 0 ],
			"obj-1::obj-2" : [ "live.gain~", " ", 0 ],
			"obj-1::obj-26::obj-56" : [ "live.button[1]", "live.button[1]", 0 ],
			"obj-1::obj-26::obj-58" : [ "live.toggle[1]", "live.toggle[1]", 0 ],
			"obj-1::obj-26::obj-59" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-1::obj-43::obj-8" : [ "live.dial", "freq", 0 ],
			"obj-1::obj-46::obj-36" : [ "select folder[1]", "select folder", 0 ],
			"obj-1::obj-46::obj-70" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-1::obj-46::obj-8" : [ "live.drop", "live.drop", 0 ],
			"obj-1::obj-5::obj-12" : [ "live.button", "live.button", 0 ],
			"obj-3" : [ "mc.live.gain~", "hoa stream", 0 ],
			"obj-6" : [ "mc.live.gain~[1]", "speakers", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "spat5.hoa.decoder~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "spat5.input~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spat5/patchers",
				"patcherrelativepath" : "../../../../../Documents/Max 8/Packages/spat5/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "spat5.loop.png",
				"bootpath" : "~/Documents/Max 8/Packages/spat5/media/images",
				"patcherrelativepath" : "../../../../../Documents/Max 8/Packages/spat5/media/images",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "spat5.oper.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "spat5.osc.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "spat5.spat~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "C74:/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
