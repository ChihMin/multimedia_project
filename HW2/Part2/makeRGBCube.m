% Problem 2a

clear all; close all; clc;

%% Define Vertices
topVerts = [ 0 1 0; 0 1 1; 1 1 1; 1 1 0];
topVertIndex = [ 1 2 3 4 ];
botVerts = [ 0 0 0; 0 0 1; 1 0 1; 1 0 0];
botVertIndex = [ 5 6 7 8 ];

verts = [ topVerts; botVerts ];

%% Define Colors (Your efforts here)
vertColors = verts;

%% Empty faces list
faces = [];

%% Side faces (Your efforts here)
A = [1 2 3 4];
B = [5 8 7 6];
C = [1 5 6 2];
D = [3 7 8 4];
E = [2 6 7 3];
F = [1 4 8 5];
faces_index = [A; B; C; D; E; F];

for vertI = 1 : 6
	for vertJ = 2:3
        faceVert1 = faces_index(vertI, 1);
        faceVert2 = faces_index(vertI, vertJ);
        faceVert3 = faces_index(vertI, vertJ + 1);
        faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
    end
end

%% Write to .obj File
writeColorObj( 'RGBCube.obj', verts, vertColors, faces );

%%
% Problem 2b

numOfVert = 100; %12 for Visualization, 60 in practice
vertsPolarAngle = linspace(0, 2 * pi, numOfVert+1);
vertsColorAngle = linspace(0 ,1, numOfVert+1);
vertsX = cos(vertsPolarAngle);
vertsY = sin(vertsPolarAngle);

faces = [];
verts = [0 0 1];
colors = [0 0 1];
for i = 1:numOfVert, 
    verts = [verts; vertsX(i) vertsY(i) 1];
    colors = [colors; vertsColorAngle(i) 1 1];
end

[h, w] = size(verts);
for i = 2:h,
    if i == h,
        faces = [faces; 1 i mod(i+1, h)+1];
        continue;
    end
    faces = [faces; 1 i i+1]; 
end

verts = [verts; 0 0 0];
colors = [colors; 0 0 0];
for i = 1:numOfVert,
    verts = [verts; vertsX(i) vertsY(i) 0];
    colors = [colors; vertsColorAngle(i) 1 0];
end

[h1, w1] = size(verts);
for i = h+2:h1,
    if i == h1,
        faces = [faces; i mod(i+1, h1)+h+2 h+1];
        continue;
    end
    faces = [faces; i i+1 h+1]; 
end

rgb_colors = hsv2rgb(colors);

writeColorObj( 'RGBCilindar.obj', verts, rgb_colors, faces );

