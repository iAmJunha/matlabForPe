%matrix test
clear all;

kmax =15000
%k�� �����÷� ������ ���� ���� �׸��⸸ �ϸ� ok
rts=[];
for i = 1:100:kmax
    rt = fzero(@(x)f(x),i);
    if rt > 0 && f(rt+0.001) <0.00000001 %ź��Ʈ�� 
        rts = union(rts,rt)
    end
end





