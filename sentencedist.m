function D = sentencedist(Vp,Vq)

[Mp,Np] = size(Vp)
[Mq,Nq] = size(Vq)

D = 0
for m = 1:Mp
    Dtmp = Inf;
    for n =1:Mq
        Dtmp = min([Dtmp,sqrt( sum((Vp(m,:) - Vq(n,:)).^2))] );
    end
    D = D + Dtmp;
end

