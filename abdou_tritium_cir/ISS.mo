model ISS
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_TEP annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 76}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_CPS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 32}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_WDS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -18}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_TES annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -72}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_SDS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {114, 54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_WDS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -24}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 3.5 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real sigma = 0.0001 "sigma";
  parameter Real to_SDS_fraction = 0.9;
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = (from_TEP + from_CPS + from_WDS + from_TES) - (1 + sigma) * I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_SDS = to_SDS_fraction * outflow;
  to_WDS = (1 - to_SDS_fraction) * outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-37, 130}, extent = {{-71, -64}, {4, -36}}, textString = "TEP"), Text(origin = {104, -84}, extent = {{-85, 42}, {4, 74}}, textString = "WDS"), Text(origin = {104, -2}, extent = {{-85, 42}, {4, 74}}, textString = "SDS"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "ISS"), Text(origin = {-37, 88}, extent = {{-71, -64}, {4, -36}}, textString = "CPS"), Text(origin = {-39, -18}, extent = {{-71, -64}, {4, -36}}, textString = "TES"), Text(origin = {-37, 34}, extent = {{-71, -64}, {4, -36}}, textString = "WDS")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end ISS;
