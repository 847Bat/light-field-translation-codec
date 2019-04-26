function loc = block_predictor_coder(domain, refs, prec)
%PREDICTOR Summary of this function goes here
%   Detailed explanation goes here

[n, ~, ~] = size(domain);
[o, ~, ~] = size(refs);

f_refs = zeros(size(refs));
for i=1:o
    f_refs(i,:,:) = fft2(squeeze(refs(i,:,:)));
end

loc = zeros(n, o, 2);
for i=1:n
    crt = squeeze(domain(i,:,:));
    f_crt = fft2(crt);
    for k=1:o
%             R = squeeze(f_refs(k,:,:));
%             T = f_crt;
%             cross = abs(ifft2(R.*conj(T)./abs(R.*conj(T))));
%             
%             ma = max(cross(:));
%             [t1, t2] = find(cross==ma,1,'first');
%             loc(i,k,:) = [t1 t2];

        loc(i,k,:) = find_translation(f_crt,squeeze(f_refs(k,:,:)),prec);
    end
end

end

