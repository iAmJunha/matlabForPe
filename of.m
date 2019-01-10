function oddv = of(x)
%odd교점 찾기위한 함수
global lambda nf ns h %전역변수 사용 선언함
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-x.^2);
gamma=sqrt(beta.^2-k^2*ns^2);

oddv = cot(x.*h./2)+gamma./x;
