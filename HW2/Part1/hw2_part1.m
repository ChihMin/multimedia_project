clear all; close all; clc;
darkFigure();
catImage = im2double(imread('github_icon.png'));
[h, w, ~] = size(catImage);
imshow(catImage);

%% Mouse input
xlabel ('Select at most 200 points along the outline', 'FontName', '微軟正黑體', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(200);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '微軟正黑體', 'FontSize', 14);

%% Calculate Bㄚˇzier curve (Your efforts here)
outlineVertexList = ctrlPointList; %Enrich outlineVertexList
[pt_counts, ~] = size(outlineVertexList);

i = 0;
M = [-1 3 -3 1; 3 -6 3 0; -3 3 0 0; 1 0 0 0];
G = zeros(4, 2);
for i = 1:4,
    for j = 1:2,
        G(i, j) = ctrlPointList(i, j);
    end
end
syms t;
sample = linspace(0, 1, 40);
ansList = zeros(0, 2, 'double');
[~, sample_counts] = size(sample);

    for i = 1:sample_counts,
        t = sym(sample(i));
        T = [t.^3, t.^2, t.^1, 1];
        ans = (T * M) * G;
        ans = double(vpa(ans));
        ansList = [ansList; ans];
    end

outlineVertexList = ansList;
% ctrlPointList = ansList;

%% Draw and fill the polygon
drawAndFillPolygon( catImage, ctrlPointList, outlineVertexList, true, true, true ); %ctrlPointScattered, polygonPlotted, filled

