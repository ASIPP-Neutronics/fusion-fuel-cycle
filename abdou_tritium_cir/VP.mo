model VP
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_SDS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_TEP annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 0}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 1/6 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real sigma = 0.0001 "sigma";
  Real I(start=0) "tritium storage in the bz";
equation
  der(I) = from_SDS - (1 + sigma) * I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_TEP = outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-35, 52}, extent = {{-71, -64}, {4, -36}}, textString = "SDS"), Text(origin = {104, -56}, extent = {{-85, 42}, {4, 74}}, textString = "TEP"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "VP")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end VP;
