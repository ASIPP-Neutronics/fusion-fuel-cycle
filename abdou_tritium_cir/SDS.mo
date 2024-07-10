model SDS
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_ISS annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-117, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_VP annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_FW annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_Divertor annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -48}, extent = {{-10, -10}, {10, 10}})));
  parameter Real N = 0.019125 "mean residence time";
  parameter Real fb = 0.1 "mean residence time";
  parameter Real nf = 0.5 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real to_FW_fraction = 0.0001;
  parameter Real to_Divertor_fraction = 0.0001;
  Real I(start=4.5) "tritium storage in the bz";
equation
  der(I) = from_ISS - N/fb/nf - loss_per * I;
  outflow = N/fb/nf;
  loss = loss_per * I;
  to_FW = to_FW_fraction * outflow;
  to_Divertor = to_Divertor_fraction * outflow;
  to_VP = (1 - to_Divertor_fraction - to_FW_fraction - fb*nf) * outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {107, 114}, extent = {{-71, -64}, {4, -36}}, textString = "VP"), Text(origin = {110, -54}, extent = {{-85, 42}, {4, 74}}, textString = "FW"), Text(origin = {-26, -56}, extent = {{-85, 42}, {4, 74}}, textString = "ISS"), Text(origin = {1, -116}, extent = {{-39, 10}, {39, -10}}, textString = "SDS"), Text(origin = {90, -102}, extent = {{-85, 42}, {4, 74}}, textString = "Divertor")}
        ),
        
    uses(Modelica(version = "4.0.0")));
end SDS;
