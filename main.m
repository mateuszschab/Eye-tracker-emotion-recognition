clc
% clear all
close('all')

LPD = table2array(User0fixations(:,21));
RPD = table2array(User0fixations(:,26));
time = table2array(User0fixations(:,4));

start = 0;
for i =1:height(time)
    if time(i,1) > 6
        start = time(i,1)

        break
    else
        continue
    end
end

Scene = (10:1:40);
SceneTime = (start:10:height(LPD));

scene_name = ["LPD","RPD","Scena 1","Scena 2","Scena 3","Scena 4","Scena 5","Scena 6","END"];

figure()

plot(time(:,1), LPD(:,1));
hold on;

plot(time, RPD);
hold on;

for i =1:1:6
plot(SceneTime(1,i),Scene(:),'black.')
hold on;
end

plot(SceneTime(1,7),Scene(:),'black|')
hold on;

xlabel('Czas [s]');
ylabel('Średnica źrenicy [px]');
title('Zmiana średnicy w czasie eksperymentu');
legend(scene_name);


examples = ["Obraz1.jpg","Obraz2.jpg","Obraz3.jpg", "Obraz4.jpg", "Obraz5.jpg", "Obraz6.jpg"];

for i=1:width(examples)
    img_rgb = imread(examples(i));
    img_lum(1,i) = mean2(rgb2gray(img_rgb))
end

