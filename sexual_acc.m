result = cat(1, girl_result, boy_result);
res_label(1:length(Glist)) = "GIRL";
res_label(length(Glist)+1:length(Blist)+length(Glist)) = "BOY";
res_label = categorical(res_label);
res_label = res_label';
acc=sum(result==res_label)/numel(res_label);
disp(acc);