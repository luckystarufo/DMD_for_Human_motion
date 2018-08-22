function vis_pts_series(X,Y)
    if nargin == 1
        X = real(X);
        for i = 1:6
            j1 = (i-1)*3+1;
            j2 = (i-1)*3+19;
            j3 = (i-1)*3+37;
            figure; hold on;
            subplot(3,3,1); plot(X(j1,:),'r-','Linewidth',2.0);
            title('X','Fontsize',18);
            subplot(3,3,2); plot(X(j2,:),'g-','Linewidth',2.0);
            title('Y','Fontsize',18);
            subplot(3,3,3); plot(X(j3,:),'b-','Linewidth',2.0);
            title('Z','Fontsize',18);
            subplot(3,3,4); plot(X(j1+1,:),'r-','Linewidth',2.0);
            subplot(3,3,5); plot(X(j2+1,:),'g-','Linewidth',2.0);
            subplot(3,3,6); plot(X(j3+1,:),'b-','Linewidth',2.0);
            subplot(3,3,7); plot(X(j1+2,:),'r-','Linewidth',2.0);
            subplot(3,3,8); plot(X(j2+2,:),'g-','Linewidth',2.0);
            subplot(3,3,9); plot(X(j3+2,:),'b-','Linewidth',2.0);
            pause; close;
        end
    elseif nargin == 2
        X = real(X); Y = real(Y);
        T = min(size(X,2),size(Y,2));
        for i = 1:6
            j1 = (i-1)*3+1;
            j2 = (i-1)*3+19;
            j3 = (i-1)*3+37;
            figure; hold on;
            subplot(3,3,1); plot(1:T,X(j1,:),'r-',1:T,Y(j1,:),'k--','Linewidth',2.0);
            title('X','Fontsize',18);
            subplot(3,3,2); plot(1:T,X(j2,:),'g-',1:T,Y(j2,:),'k--','Linewidth',2.0);
            title('Y','Fontsize',18);
            subplot(3,3,3); plot(1:T,X(j3,:),'b-',1:T,Y(j3,:),'k--','Linewidth',2.0);
            title('Z','Fontsize',18);
            subplot(3,3,4); plot(1:T,X(j1+1,:),'r-',1:T,Y(j1+1,:),'k--','Linewidth',2.0);
            subplot(3,3,5); plot(1:T,X(j2+1,:),'g-',1:T,Y(j2+1,:),'k--','Linewidth',2.0);
            subplot(3,3,6); plot(1:T,X(j3+1,:),'b-',1:T,Y(j3+1,:),'k--','Linewidth',2.0);
            subplot(3,3,7); plot(1:T,X(j1+2,:),'r-',1:T,Y(j1+2,:),'k--','Linewidth',2.0);
            subplot(3,3,8); plot(1:T,X(j2+2,:),'g-',1:T,Y(j2+2,:),'k--','Linewidth',2.0);
            subplot(3,3,9); plot(1:T,X(j3+2,:),'b-',1:T,Y(j3+2,:),'k--','Linewidth',2.0);
            pause; close;
        end
    else
        error('At most 2 inputs!');
    end
end
