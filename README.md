# Medical-Imaging-Project-1

Requirements:
MATLAB 2022B
  - Deep Learning Toolbox
  - Statistics and Machine Learning Toolbox
  - Parallel Computing Toolbox
 
 The data is not included (available @ https://www.kaggle.com/datasets/paultimothymooney/chest-xray-pneumonia) should have the 'AugmentNormalImages.m' script run on it - this will add ~2000 additional 
 images to the NORMAL training dataset. 
 
 To retrain the CNN, simply run the 'Network_Train_and_Save.m' script and specify a name for the .mat file to be generated. For use of ImageNet weights 
 load 'mobileNetV2_imgnet.mat'. 
 
 All metrics can be obtained in the 'Testing_Net.m' script - simply load 'scratch_network5.mat' for the non-imagenet weights or 
 'scratch_network8img.mat' for imagenet. 
