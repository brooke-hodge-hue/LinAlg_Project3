%%Project 3 - Code Start

%Download the image dataset and load all images corresponding to the first
%13 subjects
dataFolder = 'eigenfaces-dataset';
numSubjects = 13;
trainingImages = [];
labels = [];

for subj = 1:numSubjects
    subjFolder = fullfile(dataFolder, sprintf('s%d', subj));
    imageFiles = dir(fullfile(subjFolder, '*.pgm'));
    
    for k = 1:length(imageFiles)
        img = imread(fullfile(subjFolder, imageFiles(k).name));
        trainingImages = [trainingImages, double(img(:))];
        labels = [labels; subj];
    end
end

   