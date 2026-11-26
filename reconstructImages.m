%now part 4 represent each image using the first d = 20 features
%identified with PCA. What is the average approximation error of this
%representation? Repeat this step with d = 50, 70, 100. Pick one of the
%training images and plot the original image along with the reconstruction
%for each value of d.


function reconstructImages(X, U, mu, imageSize, features)

A = X-mu;

%plot the original image 
originalImage = X(:,1);
originalImage = reshape(originalImage, imageSize);
figure;
subplot(1,length(features)+1,1);
imagesc(originalImage, [0 255]);
colormap gray;
axis image;
title('Original Image');

%reconstruct images using the different numbers of features 
for i = 1:length(features)
    d = features(i);
    %select the principal components
    Ud = U(:,1:d);
    %calculate the feature values
    C = Ud' * A;
    % reconstruct the images
    Xd = Ud * C + mu;
    %calculate the average approximation error
    difference = X - Xd;
    numerator = sum(difference.^2, 1);
    denominator = sum(X.^2, 1);
    errors = 100 * numerator ./ denominator;
    averageError = mean(errors);
    overallError = 100*sum(numerator)/sum(denominator);
    %print the results
    fprintf('%d features: %.4f%% average error\n', d, averageError);
    fprintf('%d features: %.4f%% overall error\n', d, overallError);
    % Select the first reconstructed image
    reconstructedImage = Xd(:,1);
    reconstructedImage = reshape(reconstructedImage, imageSize);

    %plot the reconstructed image
    subplot(1,length(features)+1,i+1);
    imagesc(reconstructedImage, [0 255]);
    colormap gray;
    axis image;
    title(sprintf('%d Features', d));

end


end







