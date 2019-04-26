%% boy
Blist = dir('test\male\*.jpg');
Bpath = 'test\male\';

for s=1:length(Blist)
    Btest_img = imread([Bpath ,Blist(s).name]); %讀檔
    Btest_res_img = imresize(Btest_img,[128 128]); %改成128*128
    Btest_cell(s) = (num2cell(Btest_res_img,[1 2 3])); %將1.2.3維的值放入cell
end
Btest_cell = Btest_cell';
BtestingData = table(Btest_cell);
boy_result = classify(convnet,BtestingData);
%% girl
Glist = dir('test\female\*.jpg');
Gpath = 'test\female\';

for s=1:length(Glist)
    Gtest_img = imread([Gpath ,Glist(s).name]); %讀檔
    Gtest_res_img = imresize(Gtest_img,[128 128]); %改成128*128
    Gtest_cell(s) = (num2cell(Gtest_res_img,[1 2 3])); %將1.2.3維的值放入cell
end
Gtest_cell = Gtest_cell';
GtestingData = table(Gtest_cell);
girl_result = classify(convnet,GtestingData);
