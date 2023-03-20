file = 'chest_xray/train/NORMAL';
file_list = dir(fullfile(file, '*.jpeg'));

%Resize to 30% Bigger
for i = 1:600
    % Read the image
    file_name = fullfile(file, file_list(i).name);
    img = imread(file_name);

    % Resize the image
    resized_img = imresize(img, 1.3);

    % Save the resized image to the output folder
    output_file_name = fullfile(file, ['AUG' file_list(i).name]);
    imwrite(resized_img, output_file_name, 'jpg');
end

%Flip Top-Bottom
for i = 1:600
    % Read the image
    file_name = fullfile(file, file_list(i).name);
    img = imread(file_name);

    % Resize the image
    resized_img = flipud(img);

    % Save the resized image to the output folder
    output_file_name = fullfile(file, ['AUG2' file_list(i).name]);
    imwrite(resized_img, output_file_name, 'jpg');
end

%Rotate Image by 20%
for i = 601:1200
    % Read the image
    file_name = fullfile(file, file_list(i).name);
    img = imread(file_name);

    % Resize the image
    resized_img = imrotate(img, 20);

    % Save the resized image to the output folder
    output_file_name = fullfile(file, ['AUG' file_list(i).name]);
    imwrite(resized_img, output_file_name, 'jpg');
end

%Flip Images L-R
for i = 1201:length(file_list)
    % Read the image
    file_name = fullfile(file, file_list(i).name);
    img = imread(file_name);

    % Resize the image
    resized_img = fliplr(img);

    % Save the resized image to the output folder
    output_file_name = fullfile(file, ['AUG' file_list(i).name]);
    imwrite(resized_img, output_file_name, 'jpg');
end
