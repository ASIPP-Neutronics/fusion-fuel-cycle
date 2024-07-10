model TES "tritium extract system"
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_BZ annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 52}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_ISS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_BZ annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -24}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 24 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real sigma = 0.0001 "sigma";
  parameter Real outflow_fraction = 0.95;
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = from_BZ - (1 + sigma) * I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * T;
  to_ISS = outflow_fraction * outflow;
  to_BZ = (1 - outflow_fraction) * outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-41, 90}, extent = {{-71, -64}, {4, -36}}, textString = "BZ"), Text(origin = {104, -84}, extent = {{-85, 42}, {4, 74}}, textString = "BZ"), Text(origin = {104, -2}, extent = {{-85, 42}, {4, 74}}, textString = "ISS"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "TES")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end TES;
