%Load Dataset needed
%===============================
test_imds = imageDatastore("chest_xray/test", ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
arg_test = augmentedImageDatastore([224 224],test_imds,'ColorPreprocessing','gray2rgb');

test_imds_normal = imageDatastore("chest_xray/test/NORMAL/", ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
arg_test_normal = augmentedImageDatastore([224 224],test_imds,'ColorPreprocessing','gray2rgb');
%===============================

%Load Network to perform testing
load('scratch_network8img.mat')

%Perform classification and calculate accuracy 
[YPred,probs] = classify(tNet,arg_test);
accuracy = mean(YPred == test_imds.Labels);
disp(accuracy)

%Display Example Cases and Calculate GradCAM for examples
%EXAMPLES
idx = randperm(numel(test_imds_normal.Files),9);
figure
for i = 1:9
    subplot(3,3,i)
    I = readimage(test_imds_normal,idx(i));
    
    imshow(I)
    label = YPred(idx(i));
    title((string(label) + ", " + num2str(100*max(probs(idx(i),:)),3) + "%"));
    if label == test_imds.Labels(idx(i))
        ylabel("CORRECT")
    else
        ylabel("INCORRECT")
    end
end

%GradCAM
figure
for i = 1:9
    subplot(3,3,i)
    I = readimage(test_imds_normal,idx(i));
    I = imresize(I,[224 224]);
    I = 255 * repmat(uint8(I), 1, 1, 3); %Create RGB Input
    
    imshow(I)
    label = YPred(idx(i));

    scoreMap = gradCAM(tNet,I,label);
    hold on

    imagesc(scoreMap,'AlphaData',0.5)
    colormap jet

    title((string(label) + ", " + num2str(100*max(probs(idx(i),:)),3) + "%"));
    if label == test_imds.Labels(idx(i))
        ylabel("CORRECT")
    else
        ylabel("INCORRECT")
    end
end

%Generate Confusion Matrix
figure
this = confusionchart(test_imds.Labels,YPred);
