%% data processing
girl_list = dir('female\*.jpg');
girl_path = 'female\';

boy_list = dir('male\*.jpg');
boy_path = 'male\';

for s=1:length(girl_list)
    img = imread([girl_path ,girl_list(s).name]); %讀檔
    res_img = imresize(img,[128 128]); %改成128*128
    girl_cell(s) = (num2cell(res_img,[1 2 3])); %將1.2.3維的值放入cell
    GLABEL(s)="GIRL";
end

for s=1:length(boy_list)
    img = imread([boy_path ,boy_list(s).name]);
    res_img = imresize(img,[128 128]);
    boy_cell(s) = (num2cell(res_img,[1 2 3]));
    BLABEL(s)="BOY";
end

LABEL = cat(2, GLABEL, BLABEL);
LABEL = LABEL';
CELL = cat(2, girl_cell, boy_cell);
CELL = CELL';

trainActivity=categorical(LABEL);
trainingData = table(CELL);
trainingData.activity = categorical(trainActivity);

%% traning
layers = [imageInputLayer([128 128 3])
            convolution2dLayer(3, 3)
            reluLayer
            maxPooling2dLayer([2 2], 'Stride', 1)
            fullyConnectedLayer(2)
            softmaxLayer
            classificationLayer()];
        
options = trainingOptions('sgdm','MaxEpochs',40, ...
	'InitialLearnRate',0.00005 ,'Plots', 'training-progress');

convnet = trainNetwork(trainingData, layers, options);
save 
