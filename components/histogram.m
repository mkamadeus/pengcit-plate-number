classdef histogram < matlab.ui.componentcontainer.ComponentContainer
    %HISTOGRAM Summary of this class goes here
    %   Detailed explanation goes here
    %   Load it with appdesigner.customcomponent.configureMetadata('./components/histogram.m');
    
    properties
        Values1 = zeros(1, 256)
        Values2 = zeros(1, 256)
        Values3 = zeros(1, 256)
        HistType = HistogramType.Color
    end
    
    properties (Access = private,Transient,NonCopyable)
        HistGrid         matlab.ui.container.GridLayout
        Axes3            matlab.ui.control.UIAxes
        Axes2            matlab.ui.control.UIAxes
        Axes1            matlab.ui.control.UIAxes
    end   
    
    methods (Access = protected) 
        function setup(obj) 
            % Create App1HistGrid
            obj.HistGrid = uigridlayout(obj);
            obj.HistGrid.ColumnWidth = {'1x'};
            obj.HistGrid.RowHeight = {'1x', '1x', '1x'}; 

            % Create App1Axes1
            obj.Axes1 = uiaxes(obj.HistGrid);
            title(obj.Axes1, 'Title')
            xlabel(obj.Axes1, 'X')
            ylabel(obj.Axes1, 'Y')
            zlabel(obj.Axes1, 'Z')
            obj.Axes1.Title.String = "Red";
            obj.Axes1.Layout.Row = 1;
            obj.Axes1.Layout.Column = 1;
            obj.Axes1.XLimMode = 'manual';
            obj.Axes1.XLim = [0 256];
            obj.Axes1.XTick = 0:32:256;

            % Create App1Axes2
            obj.Axes2 = uiaxes(obj.HistGrid);
            title(obj.Axes2, 'Title')
            xlabel(obj.Axes2, 'X')
            ylabel(obj.Axes2, 'Y')
            zlabel(obj.Axes2, 'Z')
            obj.Axes2.Title.String = "Green";
            obj.Axes2.Layout.Row = 2;
            obj.Axes2.Layout.Column = 1;
            obj.Axes2.XLimMode = 'manual';
            obj.Axes2.XLim = [0 256];
            obj.Axes2.XTick = 0:32:256;

            % Create App1Axes3
            obj.Axes3 = uiaxes(obj.HistGrid);
            title(obj.Axes3, 'Title')
            xlabel(obj.Axes3, 'X')
            ylabel(obj.Axes3, 'Y')
            zlabel(obj.Axes3, 'Z')
            obj.Axes3.Title.String = "Blue";
            obj.Axes3.Layout.Row = 3;
            obj.Axes3.Layout.Column = 1;
            obj.Axes3.XLimMode = 'manual';
            obj.Axes3.XLim = [0 256];
            obj.Axes3.XTick = 0:32:256;
        end 

        function update(obj)
           
        end
    end

    methods (Access = public)
        function refresh(obj)
            % Update Axes 1 Values
            if max(obj.Values1(:)) ~= 0
                x = 0:(size(obj.Values1, 2)-1);
                y = obj.Values1;
                area(obj.Axes1, x, y);
                obj.Axes1.XTick = 0:32:256;
            else
                cla(obj.Axes1);
            end

            % Update Axes 2 Values
            if max(obj.Values2(:)) ~= 0
                x = 0:(size(obj.Values2, 2)-1);
                y = obj.Values2;
                area(obj.Axes2, x, y);
                obj.Axes2.XTick = 0:32:256;
            else
                cla(obj.Axes2);
            end

            % Update Axes 3 Values
            if max(obj.Values3(:)) ~= 0
                x = 0:(size(obj.Values3, 2)-1);
                y = obj.Values3;
                area(obj.Axes3, x, y);
                obj.Axes3.XTick = 0:32:256;
            else
                cla(obj.Axes3);
            end
            
            % Update histogram count
            if obj.HistType == HistogramType.Color
                obj.HistGrid.RowHeight = {'1x', '1x', '1x'};
                obj.Axes1.Title.String = "Red";
                obj.Axes2.Visible = true;
                obj.Axes3.Visible = true;
            else
                obj.HistGrid.RowHeight = {'1x', '0x', '0x'};
                obj.Axes1.Title.String = "Gray";
                obj.Axes2.Visible = false;
                obj.Axes3.Visible = false;
            end

            drawnow();
        end
    end
end
