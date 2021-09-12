function ver3
%--------------------------------------------
% Modify the path accordingly
addpath('D:\Y3S2\FYP_ver_6\Code_MATLAB\GA\');
addpath('D:\Y3S2\FYP_ver_6\Code_MATLAB\DPSO\');
addpath('D:\Y3S2\FYP_ver_6\Code_MATLAB\FN\');
addpath('D:\Y3S2\FYP_ver_6\Code_MATLAB\GN\');
%--------------------------------------------
% Get User's Screensize
r = groot;
r.Units = 'normalized';
pos = get(r, 'Screensize');
%--------------------------------------------
% Background Colour
%Background_Color = [255/255 217/255 181/255];
Background_Color = 'White';
Font_Name = 'Segoe UI Light';
Background_Color3 = [52/255, 162/255, 196/255];
%-------------------------------------------
%Global Displacement
Global_Displacement = 0.018;
%-------------------------------------------
% Create Figure
f = figure();
f.Visible = 'off';
f.Color = Background_Color;
f.WindowState = 'Fullscreen';
f.Position = pos;
f.MenuBar =  'none';
f.ToolBar = 'auto';
rotate3d on;
ax = gca;
ax.Visible = 'off';
%------------------------------------------
% Main Header
Header_X = 0.02;
Header_Y = 0.93;
Main_Header = uicontrol(f);
Main_Header.Style = 'text';
Main_Header.BackgroundColor = Background_Color;
Main_Header.String = "Dynamic Social Network Clustering Application :";
Main_Header.Units = 'normalized';
Main_Header.Position = [Header_X+Global_Displacement,Header_Y,.4,.042];
Main_Header.FontName = Font_Name;
Main_Header.FontSize = 21;
Main_Header.HorizontalAlignment =  'left';
% Sub Header
Sub_Header = uicontrol(f);
Sub_Header.Style = 'text';
Sub_Header.BackgroundColor = Background_Color;
Sub_Header.String = "Exploring various algorithms to overcome the clustering problem";
Sub_Header.Units = 'normalized';
Sub_Header.Position = [Header_X+Global_Displacement,Header_Y-0.04,.4,.03];
Sub_Header.FontName = Font_Name;
Sub_Header.FontSize = 14;
Sub_Header.HorizontalAlignment =  'left';
% %-------------------------------------------
% Display Graphs for different Algorithms
% Display for Graph for GA
Graph_Y = .45;
Graph_X_Displacement = .013;
Display_Graph_GA = axes(f);
Display_Graph_GA.Units = 'normalized';
Display_Graph_GA.Position = [.05-Graph_X_Displacement+Global_Displacement,Graph_Y,.15,.2];
get_Dataset(Display_Graph_GA,'bitcoinalpha','1',false);
% Display for Graph for DPSO
Display_Graph_DPSO = axes(f);
Display_Graph_DPSO.Units = 'normalized';
Display_Graph_DPSO.Position = [.3-Graph_X_Displacement+Global_Displacement,Graph_Y,.15,.2];
get_Dataset(Display_Graph_DPSO,'bitcoinalpha','1',false);
% Display for Graph for GN
Display_Graph_GN = axes(f);
Display_Graph_GN.Units = 'normalized';
Display_Graph_GN.Position = [.55-Graph_X_Displacement+Global_Displacement,Graph_Y,.15,.2];
get_Dataset(Display_Graph_GN,'bitcoinalpha','1',false);
% Display for Graph for FN
Display_Graph_FN = axes(f);
Display_Graph_FN.Units = 'normalized';
Display_Graph_FN.Position = [.8-Graph_X_Displacement+Global_Displacement,Graph_Y,.15,.2];
get_Dataset(Display_Graph_FN,'bitcoinalpha','1',false);
% %-------------------------------------------
% Text for the Graphs
% Text for GA Graph
Text_Graph_Y = .8;
Text_Graph_X_Displacement = .025;
Text_Graph_GA = uicontrol(f);
Text_Graph_GA.Style = 'text';
Text_Graph_GA.BackgroundColor = Background_Color;
Text_Graph_GA.String = "GA";
Text_Graph_GA.Units = 'normalized';
Text_Graph_GA.Position = [.05-Text_Graph_X_Displacement+Global_Displacement,Text_Graph_Y,.03,.04];
Text_Graph_GA.FontName = Font_Name;
Text_Graph_GA.FontSize = 21;
Text_Graph_GA.HorizontalAlignment =  'left';
% Text for DPSO Graph
Text_Graph_DPSO = uicontrol(f);
Text_Graph_DPSO.Style = 'text';
Text_Graph_DPSO.BackgroundColor = Background_Color;
Text_Graph_DPSO.String = "DPSO";
Text_Graph_DPSO.Units = 'normalized';
Text_Graph_DPSO.Position = [.3-Text_Graph_X_Displacement+Global_Displacement,Text_Graph_Y,.05,.04];
Text_Graph_DPSO.FontName = Font_Name;
Text_Graph_DPSO.FontSize = 21;
Text_Graph_DPSO.HorizontalAlignment =  'left';
% Text for GN Graph
Text_Graph_GN = uicontrol(f);
Text_Graph_GN.Style = 'text';
Text_Graph_GN.BackgroundColor = Background_Color;
Text_Graph_GN.String = "GN";
Text_Graph_GN.Units = 'normalized';
Text_Graph_GN.Position = [.55-Text_Graph_X_Displacement+Global_Displacement,Text_Graph_Y,.03,.04];
Text_Graph_GN.FontName = Font_Name;
Text_Graph_GN.FontSize = 21;
Text_Graph_GN.HorizontalAlignment =  'left';
% Text for FN Graph
Text_Graph_FN = uicontrol(f);
Text_Graph_FN.Style = 'text';
Text_Graph_FN.BackgroundColor = Background_Color;
Text_Graph_FN.String = "FN";
Text_Graph_FN.Units = 'normalized';
Text_Graph_FN.Position = [.8-Text_Graph_X_Displacement+Global_Displacement,Text_Graph_Y,.03,.04];
Text_Graph_FN.FontName = Font_Name;
Text_Graph_FN.FontSize = 21;
Text_Graph_FN.HorizontalAlignment =  'left';
% %-------------------------------------------
% Information for GA
Background_Color2 = [235/255, 244/255, 247/255];
Text_Information_Y = .7;
Text_Information_X_Displacement = -.01;
Text_Information_FontSize = 10;
Text_Information_GA = uicontrol(f);
Text_Information_GA.Style = 'text';
Text_Information_GA.BackgroundColor = Background_Color2;
Text_Information_GA.HorizontalAlignment =  'left';
Text_Information_GA.String = "Genetic Algorithm (GA) applies the concept of natural selection, derived from Darwin's Theory of Evolution to solve problems";
Text_Information_GA.Units = 'normalized';
Text_Information_GA.Position = [.04+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.17,.08];
Text_Information_GA.FontName = Font_Name;
Text_Information_GA.FontSize = Text_Information_FontSize;
% Information for DPSO
Text_Information_DPSO = uicontrol(f);
Text_Information_DPSO.Style = 'text';
Text_Information_DPSO.BackgroundColor = Background_Color2;
Text_Information_DPSO.HorizontalAlignment =  'left';
Text_Information_DPSO.String = "Discrete Particle Swarm Optimization (DPSO) applies the concept of the flocking behaviour of birds";
Text_Information_DPSO.Units = 'normalized';
Text_Information_DPSO.Position = [.29+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.17,.08];
Text_Information_DPSO.FontName = Font_Name;
Text_Information_DPSO.FontSize = Text_Information_FontSize;
% Information for GN
Text_Information_GN = uicontrol(f);
Text_Information_GN.Style = 'text';
Text_Information_GN.BackgroundColor = Background_Color2;
Text_Information_GN.HorizontalAlignment =  'left';
Text_Information_GN.String = "Girvan-Newman Algorithm (GN) detects communities by progressively removing edges from the original network";
Text_Information_GN.Units = 'normalized';
Text_Information_GN.Position = [.54+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.17,.08];
Text_Information_GN.FontName = Font_Name;
Text_Information_GN.FontSize = Text_Information_FontSize;
% Information for FN
Text_Information_FN = uicontrol(f);
Text_Information_FN.Style = 'text';
Text_Information_FN.BackgroundColor = Background_Color2;
Text_Information_FN.HorizontalAlignment =  'left';
Text_Information_FN.String = "Fast Network Algorithm (FN) operates on a different principles from that of the GN but produces qualitatively similar results";
Text_Information_FN.Units = 'normalized';
Text_Information_FN.Position = [.79+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.17,.08];
Text_Information_FN.FontName = Font_Name;
Text_Information_FN.FontSize = Text_Information_FontSize;
% %-------------------------------------------
Font_Size_Header = 14;
Font_Size_Text = 14;
% Header for GA time
Displacement_GA_Header_X_Axis = 0.12;
GA_Header_X_Axis = 0.025;
GA_Header_Time = uicontrol(f);
GA_Header_Time.Style = 'text';
GA_Header_Time.BackgroundColor = Background_Color;
GA_Header_Time.HorizontalAlignment =  'left';
GA_Header_Time.String = "Time Taken:";
GA_Header_Time.Units = 'normalized';
GA_Header_Time.Position = [GA_Header_X_Axis+Global_Displacement,0.3,.1,.04];
GA_Header_Time.FontName = Font_Name;
GA_Header_Time.FontSize = Font_Size_Header;
% Text for GA time
GA_Text_Time = uicontrol(f);
GA_Text_Time.Style = 'text';
GA_Text_Time.BackgroundColor = Background_Color;
GA_Text_Time.HorizontalAlignment =  'left';
GA_Text_Time.String = "<Empty>";
GA_Text_Time.Units = 'normalized';
GA_Text_Time.Position = [GA_Header_X_Axis + Displacement_GA_Header_X_Axis+Global_Displacement,0.3,.1,.04];
GA_Text_Time.FontName = Font_Name;
GA_Text_Time.FontSize = Font_Size_Text;
% Header for GA modularity
GA_Header_Modularity = uicontrol(f);
GA_Header_Modularity.Style = 'text';
GA_Header_Modularity.BackgroundColor = Background_Color;
GA_Header_Modularity.HorizontalAlignment =  'left';
GA_Header_Modularity.String = "Modularity";
GA_Header_Modularity.Units = 'normalized';
GA_Header_Modularity.Position = [GA_Header_X_Axis+Global_Displacement,0.27,.1,.04];
GA_Header_Modularity.FontName = Font_Name;
GA_Header_Modularity.FontSize = Font_Size_Header;
% Text for GA modularity
GA_Text_Modularity = uicontrol(f);
GA_Text_Modularity.Style = 'text';
GA_Text_Modularity.BackgroundColor = Background_Color;
GA_Text_Modularity.HorizontalAlignment =  'left';
GA_Text_Modularity.String = "<Empty>";
GA_Text_Modularity.Units = 'normalized';
GA_Text_Modularity.Position = [GA_Header_X_Axis + Displacement_GA_Header_X_Axis+Global_Displacement,0.27,.1,.04];
GA_Text_Modularity.FontName = Font_Name;
GA_Text_Modularity.FontSize = Font_Size_Text;
% Header for GA clusters
GA_Header_Cluster = uicontrol(f);
GA_Header_Cluster.Style = 'text';
GA_Header_Cluster.BackgroundColor = Background_Color;
GA_Header_Cluster.HorizontalAlignment =  'left';
GA_Header_Cluster.String = "Clusters";
GA_Header_Cluster.Units = 'normalized';
GA_Header_Cluster.Position = [GA_Header_X_Axis+Global_Displacement,0.24,.1,.04];
GA_Header_Cluster.FontName = Font_Name;
GA_Header_Cluster.FontSize = Font_Size_Header;
% Text for GA clusters
GA_Text_Cluster = uicontrol(f);
GA_Text_Cluster.Style = 'text';
GA_Text_Cluster.BackgroundColor = Background_Color;
GA_Text_Cluster.HorizontalAlignment =  'left';
GA_Text_Cluster.String = "<Empty>";
GA_Text_Cluster.Units = 'normalized';
GA_Text_Cluster.Position = [GA_Header_X_Axis + Displacement_GA_Header_X_Axis+Global_Displacement,0.24,.1,.04];
GA_Text_Cluster.FontName = Font_Name;
GA_Text_Cluster.FontSize = Font_Size_Text;
%-------------------------------------------
Displacement_DPSO_Header_X_Axis = 0.12;
DPSO_Header_X_Axis = 0.3-0.025;
% Header for DPSO time
DPSO_Header_Time = uicontrol(f);
DPSO_Header_Time.Style = 'text';
DPSO_Header_Time.BackgroundColor = Background_Color;
DPSO_Header_Time.HorizontalAlignment =  'left';
DPSO_Header_Time.String = "Time Taken";
DPSO_Header_Time.Units = 'normalized';
DPSO_Header_Time.Position = [DPSO_Header_X_Axis+Global_Displacement,0.3,.1,.04];
DPSO_Header_Time.FontName = Font_Name;
DPSO_Header_Time.FontSize = Font_Size_Header;
% Text for DPSO time
DPSO_Text_Time = uicontrol(f);
DPSO_Text_Time.Style = 'text';
DPSO_Text_Time.BackgroundColor = Background_Color;
DPSO_Text_Time.HorizontalAlignment =  'left';
DPSO_Text_Time.String = "<Empty>";
DPSO_Text_Time.Units = 'normalized';
DPSO_Text_Time.Position = [DPSO_Header_X_Axis + Displacement_DPSO_Header_X_Axis+Global_Displacement,0.3,.1,.04];
DPSO_Text_Time.FontName = Font_Name;
DPSO_Text_Time.FontSize = Font_Size_Text;
% Header for DPSO modularity
DPSO_Header_Modularity = uicontrol(f);
DPSO_Header_Modularity.Style = 'text';
DPSO_Header_Modularity.BackgroundColor = Background_Color;
DPSO_Header_Modularity.HorizontalAlignment =  'left';
DPSO_Header_Modularity.String = "Modularity";
DPSO_Header_Modularity.Units = 'normalized';
DPSO_Header_Modularity.Position = [DPSO_Header_X_Axis+Global_Displacement,0.27,.1,.04];
DPSO_Header_Modularity.FontName = Font_Name;
DPSO_Header_Modularity.FontSize = Font_Size_Header;
% Text for DPSO modularity
DPSO_Text_Modularity = uicontrol(f);
DPSO_Text_Modularity.Style = 'text';
DPSO_Text_Modularity.BackgroundColor = Background_Color;
DPSO_Text_Modularity.HorizontalAlignment =  'left';
DPSO_Text_Modularity.String = "<Empty>";
DPSO_Text_Modularity.Units = 'normalized';
DPSO_Text_Modularity.Position = [DPSO_Header_X_Axis + Displacement_DPSO_Header_X_Axis+Global_Displacement,0.27,.1,.04];
DPSO_Text_Modularity.FontName = Font_Name;
DPSO_Text_Modularity.FontSize = Font_Size_Text;
% Header for DPSO clusters
DPSO_Header_Cluster = uicontrol(f);
DPSO_Header_Cluster.Style = 'text';
DPSO_Header_Cluster.BackgroundColor = Background_Color;
DPSO_Header_Cluster.HorizontalAlignment =  'left';
DPSO_Header_Cluster.String = "Clusters";
DPSO_Header_Cluster.Units = 'normalized';
DPSO_Header_Cluster.Position = [DPSO_Header_X_Axis+Global_Displacement,0.24,.1,.04];
DPSO_Header_Cluster.FontName = Font_Name;
DPSO_Header_Cluster.FontSize = Font_Size_Header;
% Text for DPSO clusters
DPSO_Text_Cluster = uicontrol(f);
DPSO_Text_Cluster.Style = 'text';
DPSO_Text_Cluster.BackgroundColor = Background_Color;
DPSO_Text_Cluster.HorizontalAlignment =  'left';
DPSO_Text_Cluster.String = "<Empty>";
DPSO_Text_Cluster.Units = 'normalized';
DPSO_Text_Cluster.Position = [DPSO_Header_X_Axis + Displacement_DPSO_Header_X_Axis+Global_Displacement,0.24,.1,.04];
DPSO_Text_Cluster.FontName = Font_Name;
DPSO_Text_Cluster.FontSize = Font_Size_Text;
% %-----------------------------------------------------------
% % Header for GN time
Displacement_GN_Header_X_Axis = 0.12;
GN_Header_X_Axis = 0.55-0.025;
GN_Header_Time = uicontrol(f);
GN_Header_Time.Style = 'text';
GN_Header_Time.BackgroundColor = Background_Color;
GN_Header_Time.HorizontalAlignment =  'left';
GN_Header_Time.String = "Time Taken";
GN_Header_Time.Units = 'normalized';
GN_Header_Time.Position = [GN_Header_X_Axis+Global_Displacement,0.3,.1,.04];
GN_Header_Time.FontName = Font_Name;
GN_Header_Time.FontSize = Font_Size_Header;
% Text for GN time
GN_Text_Time = uicontrol(f);
GN_Text_Time.Style = 'text';
GN_Text_Time.BackgroundColor = Background_Color;
GN_Text_Time.HorizontalAlignment =  'left';
GN_Text_Time.String = "<Empty>";
GN_Text_Time.Units = 'normalized';
GN_Text_Time.Position = [GN_Header_X_Axis + Displacement_GN_Header_X_Axis+Global_Displacement,0.3,.1,.04];
GN_Text_Time.FontName = Font_Name;
GN_Text_Time.FontSize = Font_Size_Text;
% Header for GN modularity
GN_Header_Modularity = uicontrol(f);
GN_Header_Modularity.Style = 'text';
GN_Header_Modularity.BackgroundColor = Background_Color;
GN_Header_Modularity.HorizontalAlignment =  'left';
GN_Header_Modularity.String = "Modularity";
GN_Header_Modularity.Units = 'normalized';
GN_Header_Modularity.Position = [GN_Header_X_Axis+Global_Displacement,0.27,.1,.04];
GN_Header_Modularity.FontName = Font_Name;
GN_Header_Modularity.FontSize = Font_Size_Header;
% Text for GN modularity
GN_Text_Modularity = uicontrol(f);
GN_Text_Modularity.Style = 'text';
GN_Text_Modularity.BackgroundColor = Background_Color;
GN_Text_Modularity.HorizontalAlignment =  'left';
GN_Text_Modularity.String = "<Empty>";
GN_Text_Modularity.Units = 'normalized';
GN_Text_Modularity.Position = [GN_Header_X_Axis + Displacement_GN_Header_X_Axis+Global_Displacement,0.27,.1,.04];
GN_Text_Modularity.FontName = Font_Name;
GN_Text_Modularity.FontSize = Font_Size_Text;
% Header for GN clusters
GN_Header_Cluster = uicontrol(f);
GN_Header_Cluster.Style = 'text';
GN_Header_Cluster.BackgroundColor = Background_Color;
GN_Header_Cluster.HorizontalAlignment =  'left';
GN_Header_Cluster.String = "Clusters";
GN_Header_Cluster.Units = 'normalized';
GN_Header_Cluster.Position = [GN_Header_X_Axis+Global_Displacement,0.24,.1,.04];
GN_Header_Cluster.FontName = Font_Name;
GN_Header_Cluster.FontSize = Font_Size_Header;
% Text for GN clusters
GN_Text_Cluster = uicontrol(f);
GN_Text_Cluster.Style = 'text';
GN_Text_Cluster.BackgroundColor = Background_Color;
GN_Text_Cluster.HorizontalAlignment =  'left';
GN_Text_Cluster.String = "<Empty>";
GN_Text_Cluster.Units = 'normalized';
GN_Text_Cluster.Position = [GN_Header_X_Axis + Displacement_GN_Header_X_Axis+Global_Displacement,0.24,.1,.04];
GN_Text_Cluster.FontName = Font_Name;
GN_Text_Cluster.FontSize = Font_Size_Text;
% %-----------------------------------------------------------
% Header for FN time
Displacement_FN_Header_X_Axis = 0.12;
FN_Header_X_Axis = 0.8-0.025;
FN_Header_Time = uicontrol(f);
FN_Header_Time.Style = 'text';
FN_Header_Time.BackgroundColor = Background_Color;
FN_Header_Time.HorizontalAlignment =  'left';
FN_Header_Time.String = "Time Taken";
FN_Header_Time.Units = 'normalized';
FN_Header_Time.Position = [FN_Header_X_Axis+Global_Displacement,0.3,.1,.04];
FN_Header_Time.FontName = Font_Name;
FN_Header_Time.FontSize = Font_Size_Header;
% Text for FN time
FN_Text_Time = uicontrol(f);
FN_Text_Time.Style = 'text';
FN_Text_Time.BackgroundColor = Background_Color;
FN_Text_Time.HorizontalAlignment =  'left';
FN_Text_Time.String = "<Empty>";
FN_Text_Time.Units = 'normalized';
FN_Text_Time.Position = [FN_Header_X_Axis + Displacement_FN_Header_X_Axis+Global_Displacement,0.3,.1,.04];
FN_Text_Time.FontName = Font_Name;
FN_Text_Time.FontSize = Font_Size_Text;
% Header for FN modularity
FN_Header_Modularity = uicontrol(f);
FN_Header_Modularity.Style = 'text';
FN_Header_Modularity.BackgroundColor = Background_Color;
FN_Header_Modularity.HorizontalAlignment =  'left';
FN_Header_Modularity.String = "Modularity";
FN_Header_Modularity.Units = 'normalized';
FN_Header_Modularity.Position = [FN_Header_X_Axis+Global_Displacement,0.27,.1,.04];
FN_Header_Modularity.FontName = Font_Name;
FN_Header_Modularity.FontSize = Font_Size_Header;
% Text for FN modularity
FN_Text_Modularity = uicontrol(f);
FN_Text_Modularity.Style = 'text';
FN_Text_Modularity.BackgroundColor = Background_Color;
FN_Text_Modularity.HorizontalAlignment =  'left';
FN_Text_Modularity.String = "<Empty>";
FN_Text_Modularity.Units = 'normalized';
FN_Text_Modularity.Position = [FN_Header_X_Axis + Displacement_FN_Header_X_Axis+Global_Displacement,0.27,.1,.04];
FN_Text_Modularity.FontName = Font_Name;
FN_Text_Modularity.FontSize = Font_Size_Text;
% Header for FN clusters
FN_Header_Cluster = uicontrol(f);
FN_Header_Cluster.Style = 'text';
FN_Header_Cluster.BackgroundColor = Background_Color;
FN_Header_Cluster.HorizontalAlignment =  'left';
FN_Header_Cluster.String = "Clusters";
FN_Header_Cluster.Units = 'normalized';
FN_Header_Cluster.Position = [FN_Header_X_Axis+Global_Displacement,0.24,.1,.04];
FN_Header_Cluster.FontName = Font_Name;
FN_Header_Cluster.FontSize = Font_Size_Header;
% Text for FN clusters
FN_Text_Cluster = uicontrol(f);
FN_Text_Cluster.Style = 'text';
FN_Text_Cluster.BackgroundColor = Background_Color;
FN_Text_Cluster.HorizontalAlignment =  'left';
FN_Text_Cluster.String = "<Empty>";
FN_Text_Cluster.Units = 'normalized';
FN_Text_Cluster.Position = [FN_Header_X_Axis + Displacement_FN_Header_X_Axis+Global_Displacement,0.24,.1,.04];
FN_Text_Cluster.FontName = Font_Name;
FN_Text_Cluster.FontSize = Font_Size_Text;
%-------------------------------------------
% Displacement
Displacement_1 = 0.27;
% Slider for Choosing the t+# (Dynamic Models)
Slider_Models = uicontrol(f);
Slider_Models.Style = 'Slider';
Slider_Models.Units = 'normalized';
Slider_Models.Position = [Displacement_1+Global_Displacement-0.08,.02,.585,.05];
Slider_Models.SliderStep = [1/20, 0.05];
Slider_Models.Min = 1;
Slider_Models.Max = 20;
Slider_Models.Value = 1;
Slider_Models.Callback = @slider_value_Callback;
%-------------------------------------------
% Display Text for Slider
Text_Slider_Output = uicontrol(f);
Text_Slider_Output.Style = 'text';
%Text_Slider_Output.BackgroundColor = [111/255, 205/255, 232/255];
Text_Slider_Output.BackgroundColor = Background_Color3;
Text_Slider_Output.Units = 'normalized';
Text_Slider_Output.Position = [.365+Displacement_1+Global_Displacement+0.115,.1,.025,.042];
Text_Slider_Output.FontName = 'Segoe UI';
Text_Slider_Output.FontSize = 20;
Text_Slider_Output.FontWeight = 'bold';
Text_Slider_Output.ForegroundColor = 'White';
Text_Slider_Output.HorizontalAlignment =  'right';
Text_Slider_Output.String = 1;
%-------------------------------------------
% Display t+# for Slider
Text_Slider_Output2 = uicontrol(f);
Text_Slider_Output2.Style = 'text';
%Text_Slider_Output2.BackgroundColor = [111/255, 205/255, 232/255];
Text_Slider_Output2.BackgroundColor = Background_Color3;
Text_Slider_Output2.Units = 'normalized';
Text_Slider_Output2.Position = [.345+Displacement_1+Global_Displacement+0.115,.1,.025,.042];
Text_Slider_Output2.FontName = 'Segoe UI';
Text_Slider_Output2.FontSize = 20;
Text_Slider_Output2.FontWeight = 'bold';
Text_Slider_Output2.ForegroundColor = 'White';
Text_Slider_Output2.String = "t+";
%-------------------------------------------
% Text for Slider
Text_Slider = uicontrol(f);  
Text_Slider.Style = 'text';
Text_Slider.BackgroundColor = Background_Color3;
Text_Slider.Units = 'normalized';
Text_Slider.String = 'Dynamic Model';
Text_Slider.Position = [Displacement_1+Global_Displacement-0.08,.13,.15,.04];
Text_Slider.FontName = Font_Name;
Text_Slider.FontWeight = 'bold';
Text_Slider.ForegroundColor = 'White';
Text_Slider.HorizontalAlignment =  'left';
Text_Slider.FontSize = 20;
%-------------------------------------------
% Text2 for Slider
Text_Slider2 = uicontrol(f);  
Text_Slider2.Style = 'text';
Text_Slider2.BackgroundColor = Background_Color3;
Text_Slider2.Units = 'normalized';
Text_Slider2.String = 'From t+1 to t+20';
Text_Slider2.Position = [Displacement_1+Global_Displacement-0.08,.087,.15,.04];
Text_Slider2.FontName = Font_Name;
Text_Slider2.FontWeight = 'bold';
Text_Slider2.ForegroundColor = 'White';
Text_Slider2.HorizontalAlignment =  'left';
Text_Slider2.FontSize = 14;
%-------------------------------------------
% Dataset Header
Popup_Dataset_Header = uicontrol(f);  
Popup_Dataset_Header.Style = 'text';
Popup_Dataset_Header.BackgroundColor = Background_Color3;
Popup_Dataset_Header.Units = 'normalized';
Popup_Dataset_Header.String = 'Select Dataset';
Popup_Dataset_Header.Position = [.02+Global_Displacement,.13,.11,.04];
Popup_Dataset_Header.FontName = Font_Name;
Popup_Dataset_Header.FontWeight = 'bold';
Popup_Dataset_Header.ForegroundColor = 'White';
Popup_Dataset_Header.HorizontalAlignment =  'left';
Popup_Dataset_Header.FontSize = 18;
% Dataset Popup Menu
Popup_Dataset = uicontrol(f);
Popup_Dataset.Style = 'popupmenu';
Popup_Dataset.BackgroundColor = Background_Color;
Popup_Dataset.Units = 'normalized';
Popup_Dataset.Position = [.02+Global_Displacement,.07,.11,.05]; 
Popup_Dataset.String = {'BitcoinAlpha','BitcoinOTC','College','Email'};
Popup_Dataset.FontName = Font_Name;
Popup_Dataset.FontSize = 16;
Popup_Dataset.Callback = @select_Dataset;
%-------------------------------------------
% Execute Button
Button_Execute = uicontrol(f);
Button_Execute.Style = 'pushbutton';
Button_Execute.Units = 'normalized';
Button_Execute.Position = [.84+Global_Displacement,.055,.1,.08];
Button_Execute.String = 'Execute';
Button_Execute.BackgroundColor = [253/255 197/255 81/255];
Button_Execute.FontName = Font_Name;
Button_Execute.FontSize = 18;
Button_Execute.Callback = @execute_Algorithm_Callback;
%-------------------------------------------
A = imread('mg.jpg');
Button_Enlarge_Y = .36;
Displacement_Button_Enlarge = 0.25;
% Enlarge Button for GA
Button_Enlarge_GA = uicontrol(f);
Button_Enlarge_GA.Style = 'pushbutton';
Button_Enlarge_GA.Units = 'normalized';
Button_Enlarge_GA.Position = [.17+Global_Displacement,Button_Enlarge_Y,.018,.033];
Button_Enlarge_GA.CData = A;
Button_Enlarge_GA.BackgroundColor = Background_Color;
Button_Enlarge_GA.Callback = @enlarge_GA_Callback;
%-------------------------------------------
% Enlarge Button for DPSO
Button_Enlarge_DPSO = uicontrol(f);
Button_Enlarge_DPSO.Style = 'pushbutton';
Button_Enlarge_DPSO.Units = 'normalized';
Button_Enlarge_DPSO.Position = [.17+Displacement_Button_Enlarge+Global_Displacement,Button_Enlarge_Y,.018,.033];
Button_Enlarge_DPSO.CData = A;
Button_Enlarge_DPSO.BackgroundColor = Background_Color;
Button_Enlarge_DPSO.Callback = @enlarge_DPSO_Callback;
%-------------------------------------------
% Enlarge Button for GN
Button_Enlarge_GN = uicontrol(f);
Button_Enlarge_GN.Style = 'pushbutton';
Button_Enlarge_GN.Units = 'normalized';
Button_Enlarge_GN.Position = [.17+Displacement_Button_Enlarge*2+Global_Displacement,Button_Enlarge_Y,.018,.033];
Button_Enlarge_GN.CData = A;
Button_Enlarge_GN.BackgroundColor = Background_Color;
Button_Enlarge_GN.Callback = @enlarge_GN_Callback;
%-------------------------------------------
% Enlarge Button for FN
Button_Enlarge_FN = uicontrol(f);
Button_Enlarge_FN.Style = 'pushbutton';
Button_Enlarge_FN.Units = 'normalized';
Button_Enlarge_FN.Position = [.17+Displacement_Button_Enlarge*3+Global_Displacement,Button_Enlarge_Y,.018,.033];
Button_Enlarge_FN.CData = A;
Button_Enlarge_FN.BackgroundColor = Background_Color;
Button_Enlarge_FN.Callback = @enlarge_FN_Callback;
%-----------------------------------------------------
% Borders
t1 = annotation('textbox');
t1.FontSize = 12;
t1.Position = [.037+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.175,.087];
t1.BackgroundColor = Background_Color2;
t1.LineStyle = 'none';
t2 = annotation('textbox');
t2.FontSize = 12;
t2.Position = [.287+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.175,.087];
t2.BackgroundColor = Background_Color2;
t2.LineStyle = 'none';
t3 = annotation('textbox');
t3.FontSize = 12;
t3.Position = [.537+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.175,.087];
t3.BackgroundColor = Background_Color2;
t3.LineStyle = 'none';
t4 = annotation('textbox');
t4.FontSize = 12;
t4.Position = [.785+Text_Information_X_Displacement+Global_Displacement,Text_Information_Y,.175,.087];
t4.BackgroundColor = Background_Color2;
t4.LineStyle = 'none';
%-----------------------------------------------------
% Bottom Panel
t5 = annotation('textbox');
t5.FontSize = 12;
t5.Position = [0,0,1,.2];
t5.BackgroundColor = Background_Color3;
t5.LineStyle = 'none';
%--------------------------------
Dataset_Displacement = 0.025;
% Text for Different Datasets
Text_Datasets = uicontrol(f);
Text_Datasets.Style = 'text';
Text_Datasets.BackgroundColor = Background_Color2;
%Text_Datasets.ForegroundColor = Background_Color;
Text_Datasets.HorizontalAlignment =  'left';
Text_Datasets.String = "BitcoinAlpha/BitcoinOTC depict the clusters where users would most probably give each other good ratings.";
Text_Datasets.Units = 'normalized';
Text_Datasets.Position = [0.53+ Global_Displacement,0.91+Dataset_Displacement,.415,.025];
Text_Datasets.FontName = Font_Name;
Text_Datasets.FontSize = 10;

Text_Datasets_2 = uicontrol(f);
Text_Datasets_2.Style = 'text';
Text_Datasets_2.BackgroundColor = Background_Color2;
%Text_Datasets.ForegroundColor = Background_Color;
Text_Datasets_2.HorizontalAlignment =  'left';
Text_Datasets_2.String = "College depict the clusters where users would most probably have conversations with each other.";
Text_Datasets_2.Units = 'normalized';
Text_Datasets_2.Position = [0.53+ Global_Displacement,0.88+Dataset_Displacement,.415,.025];
Text_Datasets_2.FontName = Font_Name;
Text_Datasets_2.FontSize = 10;

Text_Datasets_3 = uicontrol(f);
Text_Datasets_3.Style = 'text';
Text_Datasets_3.BackgroundColor = Background_Color2;
%Text_Datasets.ForegroundColor = Background_Color;
Text_Datasets_3.HorizontalAlignment =  'left';
Text_Datasets_3.String = "Email depict the clusters where users would most probably email each other.";
Text_Datasets_3.Units = 'normalized';
Text_Datasets_3.Position = [0.53+ Global_Displacement,0.85+Dataset_Displacement,.415,.025];
Text_Datasets_3.FontName = Font_Name;
Text_Datasets_3.FontSize = 10;
%--------------------------------
% Padding for datasets
t6 = annotation('textbox');
t6.FontSize = 12;
t6.Position = [0.525+ Global_Displacement,0.845+Dataset_Displacement,.425,.1];
%t6.BackgroundColor = [111/255, 205/255, 232/255];
t6.BackgroundColor = Background_Color2;
t6.LineStyle = 'none';
%-------------------------------------------
% Make Figure Visible
f.Visible = 'on';

    function switch_dataset(str_dataset,val_dataset,value,bool)
        switch str_dataset{val_dataset}
            case 'BitcoinAlpha'
                get_Dataset(Display_Graph_GA,'bitcoinalpha',value,bool);
                get_Dataset(Display_Graph_DPSO,'bitcoinalpha',value,bool);
                get_Dataset(Display_Graph_GN,'bitcoinalpha',value,bool);
                get_Dataset(Display_Graph_FN,'bitcoinalpha',value,bool);
            case 'BitcoinOTC'
                get_Dataset(Display_Graph_GA,'bitcoinotc',value,bool);
                get_Dataset(Display_Graph_DPSO,'bitcoinotc',value,bool);
                get_Dataset(Display_Graph_GN,'bitcoinotc',value,bool);
                get_Dataset(Display_Graph_FN,'bitcoinotc',value,bool);                
            case 'College'
                get_Dataset(Display_Graph_GA,'college',value,bool);
                get_Dataset(Display_Graph_DPSO,'college',value,bool);
                get_Dataset(Display_Graph_GN,'college',value,bool);
                get_Dataset(Display_Graph_FN,'college',value,bool);
            case 'Email'
                get_Dataset(Display_Graph_GA,'email',value,bool);
                get_Dataset(Display_Graph_DPSO,'email',value,bool);
                get_Dataset(Display_Graph_GN,'email',value,bool);
                get_Dataset(Display_Graph_FN,'email',value,bool);
        end
    end

    function slider_value_Callback(source,eventdata)
        val = round(source.Value);
        Text_Slider_Output.String = val;
        
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;
        
        switch_dataset(str_dataset,val_dataset,value,false)
    end

    function select_Dataset(source,eventdata)
        str = source.String;
        val = source.Value;
        value = Text_Slider_Output.String;
        
        switch_dataset(str,val,value,false)
    end
    
    function get_Dataset(disp_graph,dataset,val,type)
        str1 = 'Datasets/';
        str2 = '_';
        str3 = '0.csv';
        filename = strcat(str1,dataset,str2,val,str3);
        adj_mat = csvread(filename);
        g = graph(adj_mat);       
        g = plot(disp_graph,g,'Layout','force3','NodeLabelMode','auto');
        if type == true
            c1 = execute_Algorithm(filename,disp_graph);
            identify_Clusters(c1,g); 
        end  
    end

    function c1 = execute_Algorithm(filename,disp_graph)
        String_Running = 'Running';
        if disp_graph == Display_Graph_GA
            GA_Text_Time.String = String_Running;
            GA_Text_Modularity.String = String_Running;
            GA_Text_Cluster.String = String_Running;
            drawnow;
            tic;
            [c,m,c1] = main_GA(filename);
            t = toc;
            GA_Text_Time.String = num2str(t);
            GA_Text_Modularity.String = num2str(m);
            GA_Text_Cluster.String = num2str(c);
            drawnow;
        elseif disp_graph == Display_Graph_DPSO
            DPSO_Text_Time.String = String_Running;
            DPSO_Text_Modularity.String = String_Running;
            DPSO_Text_Cluster.String = String_Running;
            drawnow;
            tic;
            [c,m,c1] = main_DPSO(filename);
            t = toc;
            DPSO_Text_Time.String = num2str(t);
            DPSO_Text_Modularity.String = num2str(m);
            DPSO_Text_Cluster.String = num2str(c);
            drawnow;
        elseif disp_graph == Display_Graph_GN
            GN_Text_Time.String = String_Running;
            GN_Text_Modularity.String = String_Running;
            GN_Text_Cluster.String = String_Running;
            drawnow;
            tic;
            [c,m,c1] = main_GN(filename);
            t = toc;
            GN_Text_Time.String = num2str(t);
            GN_Text_Modularity.String = num2str(m);
            GN_Text_Cluster.String = num2str(c);
            drawnow;
        elseif disp_graph == Display_Graph_FN
            FN_Text_Time.String = String_Running;
            FN_Text_Modularity.String = String_Running;
            FN_Text_Cluster.String = String_Running;
            drawnow;
            tic;
            [c,m,c1] = main_FN(filename);
            t = toc;
            FN_Text_Time.String = num2str(t);
            FN_Text_Modularity.String = num2str(m);
            FN_Text_Cluster.String = num2str(c);
            drawnow;
        end
    end
    
    function execute_Algorithm_Callback(source,eventdata)
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;
        
        switch_dataset(str_dataset,val_dataset,value,true)
    end
    
    function identify_Clusters(c1,g)
        max_clusters = max(c1);
        set_colours = get_Colours;
        for i=1:max_clusters
           highlight(g,find(c1==i),'MarkerSize',5,'NodeColor',set_colours(i,:));
        end
    end

    function set_colours = get_Colours
        j = 1;
        % main colours (no white)
        for r=0:1
            for g=0:1
                for b=0:1
                    if ((r==1 && g==1 && b==1) || (r==0 && g==0 && b==0))
                        continue
                    end
                        set_colours(j,:) = [r g b];
                        j = j + 1;
                end
            end
        end
        
        % all other colours
        for r=0:3
            for g=0:3
                for b=0:3
                    if (r==0 && g==0 && b==0)
                        continue
                    end
                    set_colours(j,:) = 0.25*[r g b];
                    j = j + 1;
                end
            end
        end
    end
    function enlarge_GA_Callback(source,eventdata)
        f2 = figure();
        f2.NumberTitle = 'off';
        f2.Visible = 'off';
        f2.WindowState = 'normal';
        f2.MenuBar =  'none';
        f2.ToolBar = 'auto';
        rotate3d on;

        Enlarge = axes(f2);
        Enlarge.Units = 'normalized';
        Enlarge.Position = [0.125,0.09,0.75,0.9];
        
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;     
        
        switch str_dataset{val_dataset}
            case 'BitcoinAlpha'
                dataset = 'bitcoinalpha';
                figure_name = 'Genetic Algorithm - BitcoinAlpha';
            case 'BitcoinOTC'
                dataset = 'bitcoinotc';
                figure_name = 'Genetic Algorithm - BitcoinOTC';
            case 'College'
                dataset = 'college';
                figure_name = 'Genetic Algorithm - College';
            case 'Email'
                dataset = 'email';
                figure_name = 'Genetic Algorithm - Email';
        end
        
        str1 = 'Datasets/';
        str2 = '_';
        str3 = '0.csv';
        
        filename = strcat(str1,dataset,str2,value,str3);
        adj_mat = csvread(filename);
        g = graph(adj_mat); 
        g = plot(Enlarge,g,'Layout','force3','NodeLabelMode','auto');
        
        tic;
        [c,m,c1] = main_GA(filename);
        t = toc;
        num2str(t)
        num2str(c)
        num2str(m)
        
        identify_Clusters(c1,g);
        
        % New Figure for Enlarged Graph
        f2.Name = figure_name;
        f2.Visible = 'on';
    end

    function enlarge_DPSO_Callback(source,eventdata)
        f2 = figure();
        f2.NumberTitle = 'off';
        f2.Visible = 'off';
        f2.WindowState = 'normal';
        f2.MenuBar =  'none';
        f2.ToolBar = 'auto';
        rotate3d on;

        Enlarge = axes(f2);
        Enlarge.Units = 'normalized';
        Enlarge.Position = [0.125,0.09,0.75,0.9];
        
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;     
        
        switch str_dataset{val_dataset}
            case 'BitcoinAlpha'
                dataset = 'bitcoinalpha';
                figure_name = 'Discrete Particle Swarm Optimization - BitcoinAlpha';
            case 'BitcoinOTC'
                dataset = 'bitcoinotc';
                figure_name = 'Discrete Particle Swarm Optimization - BitcoinOTC';
            case 'College'
                dataset = 'college';
                figure_name = 'Discrete Particle Swarm Optimization - College';
            case 'Email'
                dataset = 'email';
                figure_name = 'Discrete Particle Swarm Optimization - Email';
        end
        
        str1 = 'Datasets/';
        str2 = '_';
        str3 = '0.csv';
        
        filename = strcat(str1,dataset,str2,value,str3);
        adj_mat = csvread(filename);
        g = graph(adj_mat); 
        g = plot(Enlarge,g,'Layout','force3','NodeLabelMode','auto');
        
        tic;
        [c,m,c1] = main_DPSO(filename);
        t = toc;
        num2str(t)
        num2str(c)
        num2str(m)
        
        identify_Clusters(c1,g);
        
        % New Figure for Enlarged Graph
        f2.Name = figure_name;
        f2.Visible = 'on';
    end

    function enlarge_GN_Callback(source,eventdata)
        f2 = figure();
        f2.NumberTitle = 'off';
        f2.Visible = 'off';
        f2.WindowState = 'normal';
        f2.MenuBar =  'none';
        f2.ToolBar = 'auto';
        rotate3d on;

        Enlarge = axes(f2);
        Enlarge.Units = 'normalized';
        Enlarge.Position = [0.125,0.09,0.75,0.9];
        
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;     
        
        switch str_dataset{val_dataset}
            case 'BitcoinAlpha'
                dataset = 'bitcoinalpha';
                figure_name = 'Girvan-Newman Algorithm - BitcoinAlpha';
            case 'BitcoinOTC'
                dataset = 'bitcoinotc';
                figure_name = 'Girvan-Newman Algorithm - BitcoinOTC';
            case 'College'
                dataset = 'college';
                figure_name = 'Girvan-Newman Algorithm - College';
            case 'Email'
                dataset = 'email';
                figure_name = 'Girvan-Newman Algorithm - Email';
        end
        
        str1 = 'Datasets/';
        str2 = '_';
        str3 = '0.csv';
        
        filename = strcat(str1,dataset,str2,value,str3);
        adj_mat = csvread(filename);
        g = graph(adj_mat); 
        g = plot(Enlarge,g,'Layout','force3','NodeLabelMode','auto');
        
        tic;
        [c,m,c1] = main_GN(filename);
        t = toc;
        num2str(t)
        num2str(c)
        num2str(m)
        
        identify_Clusters(c1,g);
        
        % New Figure for Enlarged Graph
        f2.Name = figure_name;
        f2.Visible = 'on';
    end

    function enlarge_FN_Callback(source,eventdata)
        f2 = figure();
        f2.NumberTitle = 'off';
        f2.Visible = 'off';
        f2.WindowState = 'normal';
        %f2.Color = 'White';
        f2.MenuBar =  'none';
        f2.ToolBar = 'auto';
        rotate3d on;

        Enlarge = axes(f2);
        Enlarge.Units = 'normalized';
        Enlarge.Position = [0.125,0.09,0.75,0.9];
        
        str_dataset = Popup_Dataset.String;
        val_dataset = Popup_Dataset.Value;
        value = Text_Slider_Output.String;     
        
        switch str_dataset{val_dataset}
            case 'BitcoinAlpha'
                dataset = 'bitcoinalpha';
                figure_name = 'Fast Network Algorithm - BitcoinAlpha';
            case 'BitcoinOTC'
                dataset = 'bitcoinotc';
                figure_name = 'Fast Network Algorithm - BitcoinOTC';
            case 'College'
                dataset = 'college';
                figure_name = 'Fast Network Algorithm - College';
            case 'Email'
                dataset = 'email';
                figure_name = 'Fast Network Algorithm - Email';
        end
        
        str1 = 'Datasets/';
        str2 = '_';
        str3 = '0.csv';
        
        filename = strcat(str1,dataset,str2,value,str3);
        adj_mat = csvread(filename);
        g = graph(adj_mat); 
        g = plot(Enlarge,g,'Layout','force3','NodeLabelMode','auto');
        
        tic;
        [c,m,c1] = main_FN(filename);
        t = toc;
        num2str(t)
        num2str(c)
        num2str(m)
        
        identify_Clusters(c1,g);
        
        % New Figure for Enlarged Graph
        f2.Name = figure_name;
        f2.Visible = 'on';
    end
end
