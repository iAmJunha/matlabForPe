%matrix test
clear all;

kmax =15000
%k¸¦ ¼­ºêÇÃ·Ô °¹¼ö·Î º¸°í ÀÌÁ¦ ±×¸®±â¸¸ ÇÏ¸é ok
rts=[];
for i = 1:100:kmax
    rt = fzero(@(x)f(x),i);
    if rt > 0 && f(rt+0.001) <0.00000001 %ÅºÁ¨Æ®°ª 
        rts = union(rts,rt)
    end
end





