%%
%soru1
close all;
writing = imread('Soru1.tif');
figure;subplot(1,2,1);imshow(writing);title('original image');

se = strel('square',2);%Defining Structural element: Square and width of 2 pixels
writingClosed = imclose(writing,se);%%applying closing process with structural element
connectedComponent = bwconncomp(writingClosed,8);%%Finding connected components with '8' connectivity
connectedComponent
subplot(1,2,2);imshow(writingClosed);title(['Processed image,',num2str(connectedComponent.NumObjects),' char in image']);

%%
%soru2
close all;
meat = imread('Soru2.tif');
figure;subplot(2,2,1);imshow(meat);title('original image');

thresholdValue = 0.7906;
meatThresholded = im2bw(meat,thresholdValue); %%Apply Thresholding to image.
subplot(2,2,2);imshow(meatThresholded);title(['Thresholded image, Threshold Value: ',num2str(thresholdValue)]);

se = strel('square',5);%%define 5x5 structural element
meatEroded = imerode(meatThresholded,se);%%Apply Erosion to image

meatConnectedComponent = bwconncomp(meatEroded,8);%%Find connected components with 8 adjacency
meatConnectedComponent

subplot(2,2,3);imshow(meatEroded);title(['Eroded image,',num2str(meatConnectedComponent.NumObjects),' Bones in the Meat!']);