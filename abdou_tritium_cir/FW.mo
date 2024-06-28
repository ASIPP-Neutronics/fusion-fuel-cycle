model FW
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_plasma annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 64}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_HEx annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 2}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_CPS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -56}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_HEx annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 2}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 10/36 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = (from_plasma + from_HEx + from_CPS) - I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_HEx = outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-33, 54}, extent = {{-71, -64}, {4, -36}}, textString = "HEx"), Text(origin = {110, -50}, extent = {{-85, 42}, {4, 74}}, textString = "HEx"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "FW"), Text(origin = {-39, -8}, extent = {{-71, -64}, {4, -36}}, textString = "CPS"), Text(origin = {-23, 118}, extent = {{-71, -64}, {4, -36}}, textString = "plasma")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end FW;
