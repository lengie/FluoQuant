function varargout = LineProfileGUI(varargin)
% LINEPROFILEGUI M-file for LineProfileGUI.fig
%      LINEPROFILEGUI, by itself, creates a new LINEPROFILEGUI or raises the existing
%      singleton*.
%
%      H = LINEPROFILEGUI returns the handle to a new LINEPROFILEGUI or the handle to
%      the existing singleton*.
%
%      LINEPROFILEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINEPROFILEGUI.M with the given input arguments.
%
%      LINEPROFILEGUI('Property','Value',...) creates a new LINEPROFILEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LineProfileGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LineProfileGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LineProfileGUI

% Last Modified by GUIDE v2.5 27-May-2011 14:50:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LineProfileGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LineProfileGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LineProfileGUI is made visible.
function LineProfileGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LineProfileGUI (see VARARGIN)

% Choose default command line output for LineProfileGUI
handles.output = hObject;

set(hObject,'toolbar','figure');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LineProfileGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LineProfileGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Reset Line.
function reset_push_Callback(hObject, eventdata, handles)
% hObject    handle to reset_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2,'reset')

axes(handles.axes1)
a = get(handles.image_name_edit,'String');
aa = imread(a);
imagesc(aa)

hold on
polygon=ginput2;
polygon=floor(polygon);
h=plot([polygon(:,1)],[polygon(:,2)], 'Color','y');
hold off

line_scan=[]; %creating the empty list

for count=1:length(polygon(:,1))-1

  x1=polygon(count,1);
  y1=polygon(count,2);
  x2=polygon(count+1,1);
  y2=polygon(count+1,2);

  %points for the segmented lines
  xpoints = linspace(x1,x2);
  n = max(size(xpoints));
  
  ypoints = linspace(y1,y2,n); %match up the points
  xpoints = floor(xpoints);
  ypoints = floor(ypoints);
  
  for j = 1:n
    brightness = aa(ypoints(:,j),xpoints(:,j)); %switch x and y
    line_scan = [line_scan, brightness];
  end 
  
end
  
plot(handles.axes2,line_scan) %now switching to axes2

guidata(hObject, handles); %updates the handles



function image_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to image_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of image_name_edit as text
%        str2double(get(hObject,'String')) returns contents of image_name_edit as a double

input = str2num(get(hObject,'String'));

guidata(hObject, handles); %updates the handles

% --- Executes during object creation, after setting all properties.
function image_name_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in plot_image_push.
function plot_image_push_Callback(hObject, eventdata, handles)
% hObject    handle to plot_image_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%selects axes1 as the current axes, so that 
%Matlab knows where to plot the data
axes(handles.axes1)

%Plot the image
a = get(handles.image_name_edit,'String');
aa = imread(a); colormap('jet');
imagesc(aa) %I use colormap('jet') to make it easier to see

%sets the line
hold on
polygon=ginput2;
polygon=floor(polygon);
h=plot([polygon(:,1)],[polygon(:,2)], 'Color','y');
hold off

line_scan=[]; %creating the empty list

for count=1:length(polygon(:,1))-1

  x1=polygon(count,1);
  y1=polygon(count,2);
  x2=polygon(count+1,1);
  y2=polygon(count+1,2);

  %points for the segmented lines
  xpoints = linspace(x1,x2);
  n = max(size(xpoints));
  
  ypoints = linspace(y1,y2,n); %match up the points
  xpoints = floor(xpoints);
  ypoints = floor(ypoints);
  
  for j = 1:n
    brightness = aa(ypoints(:,j),xpoints(:,j)); %switch x and y
    line_scan = [line_scan, brightness];
  end 
  
end
  
plot(handles.axes2,line_scan) %now switching to axes2

guidata(hObject, handles); %updates the handles

