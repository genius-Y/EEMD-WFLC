clear;
rot =load('E:\work\test\gesture.txt');
figure('Number', 'off', 'Name', 'rot');
hold on;
plot(rot(:,1), 'r');
plot(rot(:,2), 'g');
plot(rot(:,3), 'b');
xlabel('sample');
ylabel('g');
title('accg');
legend('X', 'Y', 'Z');