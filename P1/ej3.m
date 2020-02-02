% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = bodyfat_dataset;
% Creaci�n de la red
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,"trainbfg");
% Divisi�n del conjunto de datos para entrenamiento, validaci�n y test
net.divideParam.trainRatio = 50/100;
net.divideParam.valRatio = 25/100;
net.divideParam.testRatio = 25/100;
% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
% Visualizaci�n de la red
view(net)