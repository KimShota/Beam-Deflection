%------------------------------------------------------------------------%
% Name: Shota Matsumoto, Student Number: sm11745
%Date: May 10, 2024
%Program: CPE 3rd Assignment
%Description: This program computes deflection of the beam by considering
%multiple variables and plots the graph of function.
%------------------------------------------------------------------------%

%Prompting the user for individual input and performing validation
L = input('Enter the length of the beam (L)');
while L <= 0
   L = input('Invalid input. Please enter a valid input: ');
end
x = input('Enter the distance from the left end: ');
while x <= 0 || x >= L
   x = input('Invalid input. Please enter a valid input: ')
end
P = input('Enter the load (P): ');
while P <= 0
   P = input('Invalid input. Please enter a valid input: ');
end
a = input('Enter the location where the load P is applied (a): ');
while a <= 0 || a >= L || a == x
   a = input('Invalid input. Please enter a valid input: ');
end
E = input('Enter the Youngs modulus of the beam material (E): ');
while E <= 0
    E = input('Invalid input. Please enter a valid input: ');
end
I = input('Enter the second moment of area (I): ');
while I <= 0
   I = input('Invalid input. Please enter a valid input: ');
end

%Assigning the value for b
b = L - a;

%Conditional Statement which specifies which formula to use
if x > 0 && x < a
   V = ((P*b/(6*E*I*L))*((-L^2+b^2)*x+x.^3));
elseif x > a && x < L
   V = ((P*b/(6*E*I*L))*((-L^2+b^2)*x+x.^3-(L/b)*(x-a).^3));
end
%Display all the inputs and outputs with explanation for each
fprintf('Your Inputs:\n');
fprintf('x = %.2f (distance from left end \n', x);
fprintf('L = %.2f (length of the beam \n', L);
fprintf('P = %.2f (Load) \n', P);
fprintf('a = %.2f (Location where the load P is applied) \n', P);
fprintf('E = %.2f (Youngs modulus of the beam material) \n', E);
fprintf('I = %.4f (Second moment of area) \n', I);
fprintf('The calculated deflection is %.4f\n', V);

%Defining deflection functions for x < a and x > a
deflection1 = @(x) ((P*b/(6*E*I*L))*((-L^2+b^2)*x+x.^3));
deflection2 = @(x) ((P*b/(6*E*I*L))*((-L^2+b^2)*x+x.^3-(L/b)*(x-a).^3));

% Plotting the deflection along the beam as a continuous distance from the
% left datum
fplot(deflection1, [0 a]); % Deflection function for x < a
hold on;
fplot(deflection2, [a L]); % Deflection function for x >= a
hold off;

xlabel('Distance from the left end of the beam');
ylabel('Deflection (negative sign denotes downward direction');
title('Deflection of the beam');
legend('Deflection for x < a', 'Deflection for x >= a', 'Location', 'best');
grid on;