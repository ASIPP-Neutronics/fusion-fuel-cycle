model frame
  Modelica.Blocks.Math.Gain TBR(k = 1.06)  annotation(
    Placement(transformation(origin = {-77, -101}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Blocks.Sources.Constant N(k = 0.019125)  annotation(
    Placement(transformation(origin = {-106, -100}, extent = {{-10, -10}, {10, 10}})));
  bzcore breeding_zone annotation(
    Placement(transformation(origin = {-31, -106}, extent = {{-17, -17}, {17, 17}})));
  TES tes annotation(
    Placement(transformation(origin = {22, -122}, extent = {{-16, -16}, {16, 16}})));
  Heat_exchanger heat_exchanger annotation(
    Placement(transformation(origin = {38, -44}, extent = {{-24, -24}, {24, 24}})));
  Divertor divertor annotation(
    Placement(transformation(origin = {-50, -56}, extent = {{-20, -20}, {20, 20}})));
  WDS wds annotation(
    Placement(transformation(origin = {111, -81}, extent = {{-15, -15}, {15, 15}})));
  CPS cps annotation(
    Placement(transformation(origin = {120, -26}, extent = {{-18, -18}, {18, 18}})));
  FW fw annotation(
    Placement(transformation(origin = {-52, -6}, extent = {{-18, -18}, {18, 18}})));
  ISS iss annotation(
    Placement(transformation(origin = {122, 64}, extent = {{22, -22}, {-22, 22}}, rotation = -0)));
  SDS sds annotation(
    Placement(transformation(origin = {14, 68}, extent = {{26, -26}, {-26, 26}})));
  VP vp annotation(
    Placement(transformation(origin = {14, 122}, extent = {{-16, -16}, {16, 16}})));
  TEP tep annotation(
    Placement(transformation(origin = {118, 122}, extent = {{-18, -18}, {18, 18}})));
equation
  connect(N.y, TBR.u) annotation(
    Line(points = {{-95, -100}, {-93.5, -100}, {-93.5, -101}, {-88, -101}}, color = {0, 0, 127}));
  connect(TBR.y, breeding_zone.from_source) annotation(
    Line(points = {{-67.1, -101}, {-53.1, -101}, {-53.1, -100}, {-51.1, -100}, {-51.1, -99}}, color = {0, 0, 127}));
  connect(tes.to_BZ, breeding_zone.from_TES) annotation(
    Line(points = {{39.92, -125.84}, {49.92, -125.84}, {49.92, -143.84}, {-51.08, -143.84}, {-51.08, -111.84}}, color = {0, 0, 127}));
  connect(breeding_zone.to_HEx, heat_exchanger.from_BZ) annotation(
    Line(points = {{-11.96, -99.54}, {-1.96, -99.54}, {-1.96, -31.54}, {9.04, -31.54}}, color = {0, 0, 127}));
  connect(divertor.to_HEx, heat_exchanger.from_Divertor) annotation(
    Line(points = {{-27.6, -55.2}, {10.4, -55.2}, {10.4, -58.2}}, color = {0, 0, 127}));
  connect(heat_exchanger.to_Divertor, divertor.from_HEx) annotation(
    Line(points = {{64.88, -49.76}, {80.88, -49.76}, {80.88, 22.24}, {-101.12, 22.24}, {-101.12, -57.76}, {-73.12, -57.76}}, color = {0, 0, 127}));
  connect(heat_exchanger.to_WDS, wds.from_HEx) annotation(
    Line(points = {{64.88, -38.72}, {93.88, -38.72}, {93.88, -73.72}}, color = {0, 0, 127}));
  connect(heat_exchanger.to_CPS, cps.from_HEx) annotation(
    Line(points = {{64.88, -30.56}, {99.88, -30.56}, {99.88, -17.56}}, color = {0, 0, 127}));
  connect(breeding_zone.to_TES, tes.from_BZ) annotation(
    Line(points = {{-11.96, -110.08}, {3.04, -110.08}, {3.04, -114.08}}, color = {0, 0, 127}));
  connect(fw.to_HEx, heat_exchanger.from_FW) annotation(
    Line(points = {{-31.84, -5.64}, {-13.84, -5.64}, {-13.84, -45.64}, {10.16, -45.64}}, color = {0, 0, 127}));
  connect(heat_exchanger.to_FW, fw.from_HEx) annotation(
    Line(points = {{64.88, -58.4}, {72.88, -58.4}, {72.88, 15.6}, {-95.12, 15.6}, {-95.12, -6.4}, {-73.12, -6.4}}, color = {0, 0, 127}));
  connect(cps.to_FW, fw.from_CPS) annotation(
    Line(points = {{140.16, -24.92}, {150.16, -24.92}, {150.16, 25.08}, {-105.84, 25.08}, {-105.84, -16.92}, {-73.84, -16.92}}, color = {0, 0, 127}));
  connect(cps.to_Divertor, divertor.from_CPS) annotation(
    Line(points = {{140.16, -32.84}, {160.16, -32.84}, {160.16, 31.16}, {-107.84, 31.16}, {-107.84, -68.84}, {-73.84, -68.84}}, color = {0, 0, 127}));
  connect(wds.to_ISS, iss.from_WDS) annotation(
    Line(points = {{128, -80}, {172, -80}, {172, 60}, {148, 60}}, color = {0, 0, 127}));
  connect(tes.to_ISS, iss.from_TES) annotation(
    Line(points = {{40, -114}, {178, -114}, {178, 48}, {148, 48}}, color = {0, 0, 127}));
  connect(cps.to_ISS, iss.from_CPS) annotation(
    Line(points = {{140, -16}, {182, -16}, {182, 72}, {148, 72}}, color = {0, 0, 127}));
  connect(iss.to_WDS, wds.from_ISS) annotation(
    Line(points = {{98, 58}, {76, 58}, {76, -86}, {94, -86}}, color = {0, 0, 127}));
  connect(iss.to_SDS, sds.from_ISS) annotation(
    Line(points = {{96, 76}, {44, 76}, {44, 68}}, color = {0, 0, 127}));
  connect(sds.to_Divertor, divertor.from_plasma) annotation(
    Line(points = {{-15, 56}, {-112, 56}, {-112, -46}, {-74, -46}}, color = {0, 0, 127}));
  connect(sds.to_FW, fw.from_plasma) annotation(
    Line(points = {{-15, 69}, {-98, 69}, {-98, 6}, {-74, 6}}, color = {0, 0, 127}));
  connect(tep.to_ISS, iss.from_TEP) annotation(
    Line(points = {{138, 122}, {166, 122}, {166, 80}, {148, 80}}, color = {0, 0, 127}));
  connect(sds.to_VP, vp.from_SDS) annotation(
    Line(points = {{-16, 82}, {-26, 82}, {-26, 122}, {-6, 122}}, color = {0, 0, 127}));
  connect(vp.to_TEP, tep.from_VP) annotation(
    Line(points = {{32, 122}, {96, 122}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0}, preserveAspectRatio = true, initialScale = 0)), 
    uses(Modelica(version = "4.0.0")), 
  Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0}, preserveAspectRatio = true, initialScale = 0)), 
  version =                                                                                                                                                                                                                                                                          "", experiment(Algorithm = Dassl, NumberOfIntervals = 2000, StartTime = 0, StopTime = 500, Tolerance = 0.0001), __MWORKS(ContinueSimConfig(SaveContinueFile = "false", SaveBeforeStop = "false", NumberBeforeStop = 1, FixedContinueInterval = "false", ContinueIntervalLength = 500, ContinueTimeVector)));
end frame;