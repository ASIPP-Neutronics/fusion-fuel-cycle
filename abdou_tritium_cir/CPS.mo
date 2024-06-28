model CPS
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_HEx annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 52}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_ISS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_FW annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_Divertor annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -38}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 240 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real sigma = 0.0001 "sigma";
  parameter Real to_ISS_fraction = 0.95;
  parameter Real to_Divertor_fraction = 0.4;  
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = from_HEx - (1 + sigma) * I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_ISS = to_ISS_fraction * outflow;
  to_Divertor = (1 - to_ISS_fraction) * to_Divertor_fraction * outflow;
  to_FW = (1 - to_ISS_fraction) * (1 - to_Divertor_fraction) * outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-37, 102}, extent = {{-71, -64}, {4, -36}}, textString = "HEx"), Text(origin = {88, -96}, extent = {{-85, 42}, {4, 74}}, textString = "Divertor"), Text(origin = {104, -2}, extent = {{-85, 42}, {4, 74}}, textString = "ISS"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "CPS"), Text(origin = {106, -52}, extent = {{-85, 42}, {4, 74}}, textString = "FW")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end CPS;
