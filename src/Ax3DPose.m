classdef Ax3DPose
    properties
        I; % starting points indices
        J; % ending points indices
        L; % Left indicator
        R; % right indicator
        ax; % axis (handler)
        plots; % Lines
        lcolor = 'g'; % color of left part of the body
        rcolor = 'r'; % color of right part of the body
        mcolor = 'k'; % color of middle part of the body
    end
    methods
        function obj = Ax3DPose(ax, init)
            obj.ax = ax;
            obj.I = [1,3,4,4,3,3,7,8,9,10,5,6,13,14,15,16];
            obj.J = [2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
            obj.L = [0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
            obj.R = [0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
            %
            vals = init;
            obj.plots = [];
            %
            for i = 1:length(obj.I)
                x = [vals(obj.I(i),1) vals(obj.J(i),1)];
                y = [vals(obj.I(i),2) vals(obj.J(i),2)];
                z = [vals(obj.I(i),3) vals(obj.J(i),3)];
                if obj.L(obj.J(i)) == 1
                    c = obj.lcolor;
                elseif obj.R(obj.J(i)) == 1
                    c = obj.rcolor;
                else
                    c = obj.mcolor;
                end
                obj.plots = [obj.plots plot3(obj.ax,x,y,z,c,'Linewidth',4.0)];
            end
            % CLAV TO HEAD
            x = [0.5*(vals(1,1)+vals(2,1)) vals(3,1)];
            y = [0.5*(vals(1,2)+vals(2,2)) vals(3,2)];
            z = [0.5*(vals(1,3)+vals(2,3)) vals(3,3)];
            obj.plots = [obj.plots plot3(obj.ax,x,y,z,'k-','Linewidth',4.0)];
        end
        function update(obj,xyz)
            cla(obj.ax);
            for i = 1:length(obj.I)
                x = [xyz(obj.I(i),1) xyz(obj.J(i),1)];
                y = [xyz(obj.I(i),2) xyz(obj.J(i),2)];
                z = [xyz(obj.I(i),3) xyz(obj.J(i),3)];
                if obj.L(obj.J(i)) == 1
                    c = obj.lcolor;
                elseif obj.R(obj.J(i)) == 1
                    c = obj.rcolor;
                else
                    c = obj.mcolor;
                end
                obj.plots = [obj.plots plot3(obj.ax,x,y,z,c,'Linewidth',4.0)];
            end
            % CLAV TO HEAD
            x = [0.5*(xyz(1,1)+xyz(2,1)) xyz(3,1)];
            y = [0.5*(xyz(1,2)+xyz(2,2)) xyz(3,2)];
            z = [0.5*(xyz(1,3)+xyz(2,3)) xyz(3,3)];
            obj.plots = [obj.plots plot3(obj.ax,x,y,z,'k-','Linewidth',4.0)];
        end
   end
end