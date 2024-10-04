  function bode(b,a,w)
  % b: coefficients du polynôme du numérateur [bn bn-1 ... b0]
  % a: coefficients du polynôme du dénominateur [am am-1 ... a0]
  % w: pulsations [wk wk-1 ... w0]
  %% Initialisation
  dima=size(a,2); % nombre de coefficients polynomiaux du dénominateur
  dimb=size(b,2); % nombre de coefficients polynomiaux du numérateur
  dimw=size(w,2); % nombre de pulsations du diagramme de Bode
  cw=sqrt(-1)*w;
  %% Calcul des données du diagramme de Bode
  for i=1:dimw
   % Valeur numérique du dénominateur à la pulsation w(i)
   den=0;
   for j=1:dima
   den=den+a(j)*cw(i)^(dima-j);
   end
   % Valeur numérique du numérateur à la pulsation w(i)
   num=0;
   for j=1:dimb
   num=num+b(j)*cw(i)^(dimb-j);
   end
   % Valeur numérique de la fraction
   G(i)=num/den;
  end
 %% Tracé du diagramme de Nyquist
figure
plot(real(G),imag(G))
ylabel('Partie imaginaire')
xlabel('Partie réelle')
hold on
plot(real(G(1)),imag(G(1)),'.r')
text(real(G(1)),imag(G(1)),'\color{red} \leftarrow \omega_{min}')
plot(cos([0:pi/180:2*pi]),sin([0:pi/180:2*pi]),'k:')
hold off
axis([-1 1 -1 1]*1.5)
axis equal
grid