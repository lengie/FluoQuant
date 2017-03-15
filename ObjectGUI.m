function varargout = ObjectGUI(varargin)
%{
Written 6/14/11 by Liana Engie, Joint Science Department of the Claremont
Colleges.

ObjectGUI is a user interface (created in GUIDE) to quantify fluorescent images.
Users quantify the fluorescence in an image by using a mask to differentiate
objects and finding their ratios (using brightness:area of each object).

Outputs:
-Excel spreadsheet with numbers for each object (optional) and brightness
density ratio of pairs of objects.
%}

% OBJECTGUI M-file for ObjectGUI.fig
%      OBJECTGUI, by itself, creates a new OBJECTGUI or raises the existing
%      singleton*.
%
%      H = OBJECTGUI returns the handle to a new OBJECTGUI or the handle to
%      the existing singleton*.
%
%      OBJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJECTGUI.M with the given input arguments.
%
%      OBJECTGUI('Property','Value',...) creates a new OBJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ObjectGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ObjectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ObjectGUI

% Last Modified by GUIDE v2.5 27-Jun-2011 10:52:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ObjectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ObjectGUI_OutputFcn, ...
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


% --- Executes just before ObjectGUI is made visible.
function ObjectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ObjectGUI (see VARARGIN)

% Choose default command line output for ObjectGUI
handles.output = hObject;
handles.scaled_invisible = 0;
handles.save = 0;

%Update handles structure
guidata(hObject, handles);

% UIWAIT makes ObjectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ObjectGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Threshold_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold_edit as text
%        str2double(get(hObject,'String')) returns contents of Threshold_edit as a double

%store the contents of Threshold_edit as a string. if the string
%is not a number then input will be empty
input = str2num(strtrim(get(hObject,'String')));

if (isempty(input))
    set(hObject,'String','0')
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Threshold_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scaled_checkbox.
function scaled_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to scaled_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of scaled_checkbox

global scaled_invisible

if (get(hObject,'Value') == get(hObject,'Max'))
    % imagesc
    check = true;
else
    % imread
    check = false;
end

handles.scaled_invisible = check;
guidata(hObject, handles);



function image_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to image_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of image_name_edit as text
%        str2double(get(hObject,'String')) returns contents of image_name_edit as a double

input = str2num(strtrim(get(hObject,'String')));

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


% --- Executes on button press in display_label_checkbox.
function display_label_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to display_label_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display_label_checkbox

L = handles.L;
num = handles.num; %should get index instead, maybe

s = regionprops(L, 'Centroid');
hold on
for k = 1:numel(s)
    c = s(k).Centroid;
    cc = text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'Color','b');
end
hold off
        
if (get(hObject,'Value') == get(hObject,'Max'))
    %it is checked
    set(c,'Visible','on'); %don't think this is working
else
    %unchecked
    set(c,'Visible','off');
end

guidata(hObject, handles); 

% --- Executes on button press in Process_pushbutton.
function Process_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Process_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

opengl software 

global scaled_invisible
scaled_invisible = handles.scaled_invisible; %seems like it's working now...

global save
save = handles.save;

remove = str2double(get(handles.remove_edit,'String'));

colormap('gray');
MaskThreshold = get(handles.Threshold_edit,'String');
MaskThreshold = str2num(MaskThreshold);

a = strtrim(get(handles.image_name_edit,'String'));
aa = imread(a);
iscolor = size(aa);
if length(iscolor) == 3 %it is three or two colors
    bw = rgb2gray(aa); 
else
    bw = aa; %it is already black and white
end
if scaled_invisible == true;
        imagesc(bw);
else
        imshow(bw);
end
imshow(bw);
%title('Black and white image, with mask')
    
% Generate the mask
mask = true(size(bw));
m = find(bw<=MaskThreshold);
mask(m) = false;
% Making the False Color Mask
mask2 = zeros(size(mask));
mask2(mask) = 0.3; %opacity set here
yellow = cat(3,255*ones(size(bw)),255*ones(size(bw)),zeros(size(bw)));
hold on
h = imshow(yellow); 
hold off
set(h,'AlphaData',mask2);

%labeling
global L
global num
mask = imfill(mask,'holes');
[L,num] = bwlabel(mask); %8-connected objects
handles.L = L;
handles.num = num;

%Luminescence and Area
NucInt = [];
NucArea = [];
index = [];

for i = 1:num
    rc = find(L==i); %index of elements %THIS TAKES 15 SECONDS
    if length(rc) >= remove
        index = [index; i];
        NucArea = [NucArea; length(rc)];
        NucInt = [NucInt; sum(sum(bw(rc)))];
    end
end

listbox_data = [index, NucArea, NucInt]; 
listbox_data = num2str(listbox_data); 
%size(listbox_data)
%listbox_data = ['Object Number, Size(Pixels), Brightness';listbox_data];
set(handles.listbox1, 'String', listbox_data); 

captured = get(handles.date_captured_edit,'String');
processed = get(handles.date_processed_edit,'String');

if save ==1
    values = {captured, processed, 'Object label', 'Pixel Area', 'Intensity'};
    for j = 1:length(listbox_data)
        for k = 1:3
            values{j+1,k} = listbox_data(j,k);
        end
    end
    file_name = strcat(a(1:length(a)-4),'_Processed.xls');
    xlswrite(file_name,values);
end


guidata(hObject, handles);

% --- Executes on button press in save_xls_checkbox.
function save_xls_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to save_xls_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of save_xls_checkbox
global save

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.save = 1;
else
    handles.save = 0;
end

guidata(hObject, handles);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1




% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in take_ratios_push.
function take_ratios_push_Callback(hObject, eventdata, handles)
% hObject    handle to take_ratios_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

L = handles.L;
listbox = str2num(get(handles.listbox1,'String'));
handles.finished = 0; 

values = {'Object 1','Object 2','Ratio'};

guidata(hObject, handles);
while handles.finished == 0;
    drawnow;
    [x,y,] = ginput(2);
    x = floor(x);
    y = floor(y);
    fir = L(y(1),x(1));
    s = size(array);
    values{s(1),1} = fir;
    sec = L(y(2),x(2));
    values{s(1),2} = sec;
    %should plot a dot or something
    index1 = find(listbox(:,1)==fir)
    index2 = find(listbox(:,1)==sec)
    d1 = listbox(index1,3)/listbox(index1,2) %brightness over area
    d2 = listbox(index2,3)/listbox(index2,2)
    ratio = d1/d2
    values{s(1),3} = ratio;
    handles = guidata(hObject); %update handles
end

file_name = strcat(a(1:length(a)-4),'_Processed.xls');
xlswrite(file_name,values,'Ratios');

%ex = exists(file_name,'files');
%if ex == 1 %yes
%    
%    xlswrite(file_name,values,'Ratios');
%else %no
%    captured = get(handles.date_captured_edit,'String');
%    processed = get(handles.date_processed_edit,'String');
%    
%    xlswrite(file_name,values,'Ratios');
%end


% --- Executes on button press in done_push.
function done_push_Callback(hObject, eventdata, handles)
% hObject    handle to done_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.finished = 1;
guidata(hObject, handles);

function date_captured_edit_Callback(hObject, eventdata, handles)
% hObject    handle to date_captured_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date_captured_edit as text
%        str2double(get(hObject,'String')) returns contents of date_captured_edit as a double

%checks to see if input is empty. if so, default Date_captured_edit to
%'yy_mm_dd'
if (isempty(get(hObject,'String')))
    set(hObject,'String','yy_mm_dd')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function date_captured_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_captured_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function date_processed_edit_Callback(hObject, eventdata, handles)
% hObject    handle to date_processed_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date_processed_edit as text
%        str2double(get(hObject,'String')) returns contents of date_processed_edit as a double

%checks to see if input is empty. if so, default Date_processed_edit to
%'yy_mm_dd'
if (isempty(get(hObject,'String')))
    set(hObject,'String','yy_mm_dd')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function date_processed_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_processed_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function remove_edit_Callback(hObject, eventdata, handles)
% hObject    handle to remove_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of remove_edit as text
%        str2double(get(hObject,'String')) returns contents of remove_edit
%        as a double

input = str2num(strtrim(get(hObject,'String')));

if (isempty(input))
    set(hObject,'String','0')
end

guidata(hObject, handles); 

% --- Executes during object creation, after setting all properties.
function remove_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to remove_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function save_push_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

threshold = strtrim(get(handles.Threshold_edit,'String'));
a = get(handles.image_name_edit, 'String');

F = getframe(handles.axes1);  % Only want to get axes
imwrite(F.cdata,strcat(a(1:length(a)-4),'_thresh_',threshold,'.png'));

guidata(hObject, handles);

