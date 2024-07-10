model Divertor "Divertor system"
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_plasma annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 52}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_CPS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -62}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_HEx annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -8}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_HEx annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 10/36 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = (from_plasma + from_HEx + from_CPS) - I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_HEx = outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-19, 108}, extent = {{-71, -64}, {4, -36}}, textString = "plasma"), Text(origin = {99, -45}, extent = {{-66, 37}, {3, 65}}, textString = "HEx"), Text(origin = {-1, -117}, extent = {{-71, 11}, {71, -11}}, textString = "Divertor"), Text(origin = {-32, -8}, extent = {{-60, -64}, {3, -36}}, textString = "CPS"), Text(origin = {-33, 48}, extent = {{-71, -64}, {4, -36}}, textString = "HEx")}
        ),        
    uses(Modelica(version = "4.0.0")));
end Divertor;
