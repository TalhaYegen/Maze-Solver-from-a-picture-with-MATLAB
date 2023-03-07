function maze_solve()
    [filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg,*.png,*.bmp)'}); %Maze's image is asked to user
    maze = imread(fullfile(pathname, filename)); %image is turned into matrix
    maze_bw = im2bw(maze); %matrix is change 255-0 to 1-0
    [y,x] = size(maze_bw); %its (maze_bw) size info is stored in x&y
    columns = find(any(diff(maze_bw,1,2) ~= 0, 1)); %for column compression same columns are detected
    rows = find(any(diff(maze_bw,1,1) ~= 0, 2)); %for row compression same rows are detected
    stepMatrix = maze_bw(:,[columns, x]); %columns are compressed
    maze_compressed = stepMatrix([rows; y], :); %also rows are compressed
    maze_solved = bwmorph(maze_compressed, 'spur', Inf); %search for "help bwmorph" in matlab
    %PRINTS;
    subplot(2,2,1); imshow(maze_bw); title('MAZE')
    subplot(2,2,2); imshow(maze_compressed); title('COMPRESSED MAZE')
    subplot(2,2,3); imshow(1-maze_solved); title('SOLUTION')
end