%% Project 3 - Code Start

clear;
clc;
close all;

%% Part 1 - Loading the Images 
%Download the image dataset and load all images corresponding to the first
%13 subjects
dataFolder = fullfile('eigenfaces-dataset', 'unpadded');
numSubjects = 13;
trainingImages = [];
labels = [];

for subj = 1:numSubjects
    imageFiles = dir(fullfile(dataFolder,sprintf('subject%02d*.pgm', subj)));
    for k = 1:length(imageFiles)
        img = imread(fullfile(dataFolder, imageFiles(k).name));
        trainingImages = [trainingImages, double(img(:))];
        labels = [labels; subj];
    end
end

imageSize = size(img);

%% Part 2 - Centering the data matrix
%Running Step 2 the center matrix script 

X = trainingImages;
[A, mu] = centerImages(X);

%% Part 3 - Computing the PCA, errrors, and storage reduction for 90% recovery 

fprintf('\nPart 3: PCA and Storage Reduction\n');
[U, S, V, singularValues] = computePCA(A, X, mu);

%% Part 4 - Reconstructing the images 

fprintf('\nPart 4: Training Images\n');
features = [20, 50, 70, 100];
reconstructImages(X, U, mu, imageSize, features);

%% Part 5 - Loading the testing images 

fprintf('\nPart 5: Testing Images\n');
TestImages = [];
for subj = 14:15
    imageFiles = dir(fullfile(dataFolder,sprintf('subject%02d*.pgm', subj)));
    for k = 1:length(imageFiles)
        img = imread(fullfile(dataFolder, imageFiles(k).name));
        TestImages = [TestImages, double(img(:))];
    end
end

Xtest = TestImages;
features = 50;
reconstructImages(Xtest, U, mu, imageSize, features);

%% Part 6 - using subject15rotated 
fprintf('\nPart 6: Rotated Image\n');

rotatedImage = imread('subject15rotated.jpeg');
Xrotated = double(rotatedImage(:));
features = 50;
reconstructImages(Xrotated, U, mu, imageSize, features);



   