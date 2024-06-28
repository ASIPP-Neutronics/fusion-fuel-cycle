model Heat_exchanger
  Modelica.Blocks.Interfaces.RealOutput loss;
  Modelica.Blocks.Interfaces.RealOutput outflow;
  Modelica.Blocks.Interfaces.RealInput from_BZ annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_Divertor annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, -62}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput from_FW annotation(
    Placement(transformation(origin = {-122, -38}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-119, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput to_CPS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_WDS annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_FW annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput to_Divertor annotation(
    Placement(transformation(origin = {112, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, -24}, extent = {{-10, -10}, {10, 10}})));
  parameter Real T = 10/36 "mean residence time";
  parameter Real loss_per = 6.4e-6 "loss per I";
  parameter Real sigma = 0.0001 "sigma";
  parameter Real WDS_fraction = 0.0001;
  parameter Real FW_fraction = 0.6;
  parameter Real CPS_fraction = 0.01;
  Real I(start=0) "tritium storage in the Heat_exchanger";
equation
  der(I) = (from_BZ + from_Divertor + from_FW) - (1 + sigma) * I/T - loss_per * I;
  outflow = I/T;
  loss = loss_per * I;
  to_FW = FW_fraction * outflow;
  to_WDS = WDS_fraction * outflow;
  to_CPS = CPS_fraction * outflow;
  to_Divertor = (1 - WDS_fraction - FW_fraction - CPS_fraction) * outflow;
annotation(
    Icon(graphics = {Line(origin = {-100, -100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, 100}, points = {{0, 0}, {200, 0}}, color = {0, 0, 127}), Line(origin = {-100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Line(origin = {100, -100}, points = {{0, 0}, {0, 200}}, color = {0, 0, 127}), Text(origin = {-42, 100}, extent = {{-54, -50}, {3, -28}}, textString = "BZ"), Text(origin = {95, -75}, extent = {{-66, 37}, {3, 65}}, textString = "Divertor"), Text(origin = {101, 16}, extent = {{-72, 31}, {3, 54}}, textString = "CPS"), Text(origin = {-1, -117}, extent = {{-71, 11}, {71, -11}}, textString = "Heat Exchanger"), Text(origin = {-30, -8}, extent = {{-60, -64}, {3, -36}}, textString = "Divertor"), Text(origin = {-37, 38}, extent = {{-63, -50}, {4, -28}}, textString = "FW"), Text(origin = {107, -24}, extent = {{-80, 31}, {3, 54}}, textString = "WDS"), Text(origin = {100, -92}, extent = {{-75, 25}, {4, 44}}, textString = "FW")}
        ),        
    uses(Modelica(version = "4.0.0")));
end Heat_exchanger;
