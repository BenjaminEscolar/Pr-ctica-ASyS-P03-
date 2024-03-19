%% Práctica 3: Señales en tiempo continuo
%
%
%% Materia: Análisis de señales y sistemas
% Grupo: 2MV3
%
%% Integrantes 
% Arias Lozano Benjamín Axel
%
% Decena Luna Emiliano Abdala
%
% Morales Rodríguez Francisco Jesús
%
% Soriano López Arón 
%
% Téllez Camacho Ian Joseph
%% 1. Reproducir la sección 1.11 del libro de Lathi (versión de clase).
%
%
%%
f = @(t) exp(-t).*cos(2*pi*t);
t = 0; 
f(t);
f(0);
t = (-2:2);
f(t);
plot(t,f(t));
xlabel('t');
ylabel('f(t)');
title("f(t) = e−t cos(2πt) for t = (-2:2).");
grid;
t = (-2:0.01:2);
f(t);
plot(t,f(t));
xlabel('t');
ylabel('f(t)');
title("f(t) = e−t cos(2πt) for t =  (-2:0.01:2).");
%% 2. Resuelve el problema 1.2-2 usando las herramientas del paso anterior.
% 
%
%%
syms t
x = piecewise(t<-4,0,-4<=t & t<0,-t,t>=0 & t<2, t,t>=2,0);
fplot(t,x)
xlabel('t');
ylabel('x( t )');
title('Figura P1.2-2');
grid on;

fplot(t+4,x)
xlabel('t');
ylabel('x( t - 4 )');
title('Insiso a)');
grid on;

fplot(t*1.5,x)
xlabel('t');
ylabel('x( t/1.5 )');
title('Insiso b)');
grid on;

fplot(t*-1,x)
xlabel('t');
ylabel('x( -t )');
title('Insiso c)');
grid on;

fplot((t/2)+4,x)
xlabel('t');
ylabel('x( 2t-4 )');
title('Insiso d)');
grid on;

fplot(2-t,x)
xlabel('t');
ylabel('x( 2-t )');
title('Insiso d)');
grid on;

%% 3. Resuelve el problema 1.11-1, los ejes deben mostrarse en el origen además de la edición de tu preferencia.
% 
%
%% 
% Definición de la función x(t)
x = @(t) 2.^(-t) .* cos(2*pi*t);

% Definición del intervalo de tiempo
t_min = 2*pi;
t_max = 4*pi;

% Cálculo de la parte impar de la función
x_odd = @(t) x(t) - x(-t);

% Generación de puntos para la gráfica
t = linspace(t_min, t_max, 1000);

% Gráfica de la parte impar de la función
figure;
plot(t, x_odd(t), 'b', 'LineWidth', 2);
grid on;
ylabel('x_o(t)');
title('Parte impar de la función x(t)');
xlabel('t');

% Agregar leyenda
legend('x_o(t) = 2^{-t}cos(2\pi t)u(t-\pi)', 'Location', 'best');

% Forzar que los ejes se crucen en el origen
axis([t_min, t_max, -1, 1]);

% Mostrar la gráfica
hold off;
%% 4. Construye la grafica de
%
%
%% 
sympref('HeavisideAtOrigin',1);
t = -10:0.01:10;
u= -100:0.1:100;
x = @(t) exp(t).*(1 + 1j*2*pi).*heaviside(-u);
y = @(t) real(2*x((-5-t)/2));
a = [0.5, 1, 2];
figure;
for i = 1:length(a)
    a1 = a(i);
    plot(real(x(t)), imag(x(a1*t)),'DisplayName', ['a = ', num2str(a1)])
    hold on;
end
xlabel('Re\{x(t)\}');
ylabel('Im\{x(at)\}');
title('Re\{x(t)\} y Im\{x(at)\}');
legend;
grid on;
%
%% 5. Resuelve el problema 1.11-3, agrega como inciso (e) la gráfica de $x(t)$ para $t\in[-10,10]$
%
%
%%
% Inciso a)
sympref('HeavisideAtOrigin',1);
t = -10:0.01:10;
u= -100:0.1:100;
x = @(t) exp(t).*(1 + 1j*2*pi).*heaviside(-u);
y = @(t) real(2*x((-5-t)/2));
a = [0.5, 1, 2];
figure;
for i = 1:length(a);
    a1 = a(i);
    plot(real(x(t)), imag(x(a1*t)),'DisplayName', ['a = ', num2str(a1)]);
    hold on;
end
xlabel('Re\{x(t)\}');
ylabel('Im\{x(at)\}');
title('Re\{x(t)\} y Im\{x(at)\}');
legend;
grid on;
%% inciso b)
figure;
plot(t, y(t), 'g');
xlabel('t');
ylabel('y(t)');
title('y(t)');
grid on;
discont = find(diff(y(t)) ~= 0);
t0 = t(discont);
disp(['T0 donde y(t) es discontinuo: ', num2str(t0)]);
%% Inciso c)
Ex = trapz(t, abs(x(t)).^2);

Ey = trapz(t, abs(y(t)).^2);

figure
plot(t, real(x(t)), 'b', t, imag(x(t)), 'r')
xlabel('t');
ylabel('x(t)');
title('Gráfica de x(t)');
legend('Parte real', 'Parte imaginaria')
%
%% 6. Construya una app que permita (consultar los ejemplos preconstruidos):
% 
% Gráficar señales en tiempo continuo reales, el usuario ingresa la definición de la señal en el formato especifico
% El usuario puede definir el intervalo de la gráfica
% El usuario puede seleccionar el tipo de transformación (horizontal, vertical o combinación) que desee realizar a la señal, la app deberá mostrar la gráfica de esta transformación.
% Se adjunta una imagen de la app a la práctica, y el archivo de la app.

ext= 'jpg';
im1= imread('app.jpeg');
imshow(im1)


