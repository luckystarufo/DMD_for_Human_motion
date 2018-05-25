function [mu, Phi] = dmd(X, Y, truncate)
    if truncate == 0
        mu = [];
        Phi = [];
    else
        r = truncate;
        %
        [U,S,V] = svd(X,'econ');
        Ur = U(:,1:r);
        Sr = S(1:r,1:r);
        Vr = V(:,1:r);
        % 
        Atilde = Ur'*Y*Vr/Sr;
        [W,D] = eig(Atilde);
        mu = diag(D); % frequencies
        Phi = Y*Vr/Sr*W; % DMD modes
    end
end